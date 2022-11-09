Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B5622E43
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 15:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osmKB-0000Bc-H5; Wed, 09 Nov 2022 09:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coc.cyqh@gmail.com>)
 id 1oshdq-0002PF-KT
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:45:06 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coc.cyqh@gmail.com>)
 id 1oshdm-0001GA-SR
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:45:06 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so19080274fac.6
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 01:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w6VgiskW4t6NN7nRcORIhBfO3WnuOcqc7NoGpjs5OP8=;
 b=OwOP7lg8Rj97Q9YdEqkut8ieyPNbtG6IgcTsxWuwRkZ8wk1pzCe/dTiCnkt6Ffj+2C
 hjDUoBvIIfjulix4UzlPEEaSZRdHyUELSZuybKpv4/A2qqGn/l5rObMioeVI+tebMyrl
 4Ggsydr3bu20voDL2A5K+3ZiHXiWsC7zMDunlBl9YpkVmqwlryAvKw1T6qsUzXEL557U
 2NaPtdEfExXwvsbT4GOJ+1mievVC4RbEIpSArFRCvPRi4VYMGbKCHpZBlacaZNFcynxZ
 dVnb3Fw+vYHr7+I/Dxrx4R9vru9lAXHrajbRVWUCMnrKF4TWHUv8PV222TsL0o59D09o
 38Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w6VgiskW4t6NN7nRcORIhBfO3WnuOcqc7NoGpjs5OP8=;
 b=YHO6H2IHJV5RLf+59asAFU7lJakRYF4wBynG8Gz6rzZ5SZT83u76DQBDqTTwzTxpXJ
 LwPMbEaQeWHiLGSfl6qluByMVKxwbRy3QRpZKBdnAQ6lNZ/NY0Sy7nuY51wbakmgGUkk
 gN7kjsSfQXvQOBcw6XiKLjbzwEeow1sUqyYY2EHeGEVvcYCaR/W9v3y5OuuGm0fGrFo4
 gwmGnGdrbVwbJ14wndgaXGJs+mVZ5/pU8aBuhrz8+98JmCj7Pe3qJuT60+poPWjXhGS5
 PgCBTV8I9P2VtG0spcb3r8CM+Letv0zSH44QDpj5K0Q2YbddBuZqXG5jONYpKUBPmzVo
 tLOw==
X-Gm-Message-State: ACrzQf0cJE/z+BAxDydweIiGuWw0njt9ZFE/spm4Gdl/dMiU6oVl4Q9F
 rYH0yhgKyAAgMGhkU2t5huyL+BFJ0fxF6rjzlKc=
X-Google-Smtp-Source: AMsMyM7iP6UdL2hUiq5p4k1aFy7FFcIPRjU5R2RQwp6Sy8qKJP2Cx/vgYgPc/5ApYqSaofNq6doc262in9FsUqEQ+qo=
X-Received: by 2002:a05:6870:a924:b0:136:faab:a730 with SMTP id
 eq36-20020a056870a92400b00136faaba730mr35228196oab.289.1667987101237; Wed, 09
 Nov 2022 01:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
 <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
 <CAEUhbmWjuKX06P1FAAujAh4uMeqaXTFi8SE-zujVYsKnpkmzAA@mail.gmail.com>
In-Reply-To: <CAEUhbmWjuKX06P1FAAujAh4uMeqaXTFi8SE-zujVYsKnpkmzAA@mail.gmail.com>
From: Siqi Chen <coc.cyqh@gmail.com>
Date: Wed, 9 Nov 2022 17:44:50 +0800
Message-ID: <CAJwEsV=kb3Cpnq=2ozpxBs7KGo916zOa64B5T1J_3uLjODNFwA@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org,
 philmd@linaro.org, 
 bin.meng@windriver.com, XRivenDell@outlook.com, ningqiang1@huawei.com
Content-Type: multipart/alternative; boundary="000000000000a8c6ee05ed0682a7"
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=coc.cyqh@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 09 Nov 2022 09:45:06 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000a8c6ee05ed0682a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

>This reproducer does not crash my QEMU. Am I missing anything?
I submitted the reproducer. Because the overflow is only one byte, it may
not be detected by the host's heap allocator.  Do you compile your qemu
with sanitizer?  This is my build configuration: "./configure
--target-list=3Dx86_64-softmmu --enable-sanitizers"

Thanks,
Siqi Chen.



Bin Meng <bmeng.cn@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=889=E6=97=A5=
=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> On Mon, Nov 7, 2022 at 7:08 PM Mauro Matteo Cascella
> <mcascell@redhat.com> wrote:
> >
> > On Mon, Nov 7, 2022 at 11:35 AM Mauro Matteo Cascella
> > <mcascell@redhat.com> wrote:
> > >
> > > Make sure to reset data_count if it's equal to (or exceeds) block_siz=
e.
> > > This prevents an off-by-one read / write when accessing s->fifo_buffe=
r
> > > in sdhci_read_dataport / sdhci_write_dataport, both called right afte=
r
> > > sdhci_buff_access_is_sequential.
> > >
> > > Fixes: CVE-2022-3872
> > > Reported-by: RivenDell <XRivenDell@outlook.com>
> > > Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> > > Reported-by: ningqiang <ningqiang1@huawei.com>
> > > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > > ---
> > >  hw/sd/sdhci.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > > index 306070c872..aa2fd79df2 100644
> > > --- a/hw/sd/sdhci.c
> > > +++ b/hw/sd/sdhci.c
> > > @@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCIState *=
s)
> > >  static inline bool
> > >  sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
> > >  {
> > > +    if (s->data_count >=3D (s->blksize & BLOCK_SIZE_MASK)) {
> > > +        s->data_count =3D 0;
> > > +    }
> > > +
> > >      if ((s->data_count & 0x3) !=3D byte_num) {
> > >          trace_sdhci_error("Non-sequential access to Buffer Data Port
> register"
> > >                            "is prohibited\n");
> > > --
> > > 2.38.1
> > >
> >
> > Reproducer:
> >
> > cat << EOF | ./qemu-system-x86_64 -machine accel=3Dqtest \
> > -nodefaults -drive if=3Dnone,index=3D0,file=3Dnull-co://,format=3Draw,i=
d=3Dmydrive
> \
> > -device sdhci-pci -device sd-card,drive=3Dmydrive -nographic -qtest std=
io
> > outl 0xcf8 0x80001004
> > outl 0xcfc 0x107
> > outl 0xcf8 0x80001010
> > outl 0xcfc 0xfebf1000
> > writel 0xfebf102c 0x7
> > writel 0xfebf1004 0x10200
> > writel 0xfebf100c 0x200000
> > writel 0xfebf1028 0x10000
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1020 0xdeadbeef
> > writel 0xfebf1004 0x200
> > writel 0xfebf100c 0x20
> > writel 0xfebf1028 0x20000
> > writel 0x00100000 0xfebf1021
> > writel 0xfebf1058 0x00100000
> > writel 0xfebf1028 0x8
> > writel 0xfebf100c 0x200011
> > writel 0xfebf1020 0xaabbccdd
> > EOF
> >
>
> This reproducer does not crash my QEMU. Am I missing anything?
>
> Regards,
> Bin
>

--000000000000a8c6ee05ed0682a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br><div>&gt;This reproducer does not crash my QEM=
U. Am I missing anything?</div></div>I submitted the reproducer. Because th=
e overflow is only one byte, it may not be detected by the host&#39;s heap =
allocator.=C2=A0 Do you compile your qemu with sanitizer?=C2=A0 This is my=
=C2=A0build configuration: &quot;./configure --target-list=3Dx86_64-softmmu=
 --enable-sanitizers&quot;<div><br></div><div>Thanks,</div><div>Siqi Chen.<=
br><div><div><br></div><div><br></div></div></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bin Meng &lt;<a href=3D"m=
ailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =E4=BA=8E2022=E5=B9=B4=
11=E6=9C=889=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=9A<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Mon, Nov 7, 2022 at 7:08 PM Mauro Matteo Cascella<br>
&lt;<a href=3D"mailto:mcascell@redhat.com" target=3D"_blank">mcascell@redha=
t.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Nov 7, 2022 at 11:35 AM Mauro Matteo Cascella<br>
&gt; &lt;<a href=3D"mailto:mcascell@redhat.com" target=3D"_blank">mcascell@=
redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Make sure to reset data_count if it&#39;s equal to (or exceeds) b=
lock_size.<br>
&gt; &gt; This prevents an off-by-one read / write when accessing s-&gt;fif=
o_buffer<br>
&gt; &gt; in sdhci_read_dataport / sdhci_write_dataport, both called right =
after<br>
&gt; &gt; sdhci_buff_access_is_sequential.<br>
&gt; &gt;<br>
&gt; &gt; Fixes: CVE-2022-3872<br>
&gt; &gt; Reported-by: RivenDell &lt;<a href=3D"mailto:XRivenDell@outlook.c=
om" target=3D"_blank">XRivenDell@outlook.com</a>&gt;<br>
&gt; &gt; Reported-by: Siqi Chen &lt;<a href=3D"mailto:coc.cyqh@gmail.com" =
target=3D"_blank">coc.cyqh@gmail.com</a>&gt;<br>
&gt; &gt; Reported-by: ningqiang &lt;<a href=3D"mailto:ningqiang1@huawei.co=
m" target=3D"_blank">ningqiang1@huawei.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Mauro Matteo Cascella &lt;<a href=3D"mailto:mcasce=
ll@redhat.com" target=3D"_blank">mcascell@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/sd/sdhci.c | 4 ++++<br>
&gt; &gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c<br>
&gt; &gt; index 306070c872..aa2fd79df2 100644<br>
&gt; &gt; --- a/hw/sd/sdhci.c<br>
&gt; &gt; +++ b/hw/sd/sdhci.c<br>
&gt; &gt; @@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCISta=
te *s)<br>
&gt; &gt;=C2=A0 static inline bool<br>
&gt; &gt;=C2=A0 sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byt=
e_num)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;data_count &gt;=3D (s-&gt;blksize &amp; =
BLOCK_SIZE_MASK)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;data_count =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ((s-&gt;data_count &amp; 0x3) !=3D byte_nu=
m) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_sdhci_error(&quot;Non-seq=
uential access to Buffer Data Port register&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;is prohibited\n&quot;);<br>
&gt; &gt; --<br>
&gt; &gt; 2.38.1<br>
&gt; &gt;<br>
&gt;<br>
&gt; Reproducer:<br>
&gt;<br>
&gt; cat &lt;&lt; EOF | ./qemu-system-x86_64 -machine accel=3Dqtest \<br>
&gt; -nodefaults -drive if=3Dnone,index=3D0,file=3Dnull-co://,format=3Draw,=
id=3Dmydrive \<br>
&gt; -device sdhci-pci -device sd-card,drive=3Dmydrive -nographic -qtest st=
dio<br>
&gt; outl 0xcf8 0x80001004<br>
&gt; outl 0xcfc 0x107<br>
&gt; outl 0xcf8 0x80001010<br>
&gt; outl 0xcfc 0xfebf1000<br>
&gt; writel 0xfebf102c 0x7<br>
&gt; writel 0xfebf1004 0x10200<br>
&gt; writel 0xfebf100c 0x200000<br>
&gt; writel 0xfebf1028 0x10000<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1020 0xdeadbeef<br>
&gt; writel 0xfebf1004 0x200<br>
&gt; writel 0xfebf100c 0x20<br>
&gt; writel 0xfebf1028 0x20000<br>
&gt; writel 0x00100000 0xfebf1021<br>
&gt; writel 0xfebf1058 0x00100000<br>
&gt; writel 0xfebf1028 0x8<br>
&gt; writel 0xfebf100c 0x200011<br>
&gt; writel 0xfebf1020 0xaabbccdd<br>
&gt; EOF<br>
&gt;<br>
<br>
This reproducer does not crash my QEMU. Am I missing anything?<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div>

--000000000000a8c6ee05ed0682a7--

