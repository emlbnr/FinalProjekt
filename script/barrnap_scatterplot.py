import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

#barrnap_B_longum = pd.read_csv('/Users/emelbiner/PycharmProjects/FinalProjekt/output/barrnap/B_longum_rrna.gff', sep='\t', header=None)
#df.columns = ['ID', 'quality', 'rRNA', 'start', 'final', 'direction', 'none', 'tag', 'defi']

barrnap_B_longum = pd.read_csv("/Users/emelbiner/PycharmProjects/FinalProjekt/output/barrnap/B_longum_rrna.gff", sep="\t", header=None,
                 names=list(range(0, 9)),
                 engine='python', quoting=3)
barrnap_B_longum.columns = ['ID', 'quality', 'rRNA', 'start', 'final', 'direction', 'none', 'tag', 'defi']

barrnap_B_longum.drop(0, inplace=True)

#sns.scatterplot(data=barrnap_B_longum.reset_index(), x='index', y='start', hue='final')
plt.scatter(df['start'], df['final'])
plt.xlabel('start')
plt.ylabel('final')

plt.show()
plt.savefig(barrnap_B_longum_scatterplot.png)


