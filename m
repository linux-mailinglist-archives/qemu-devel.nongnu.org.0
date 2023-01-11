Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A528665174
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 03:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFQQu-00064S-VY; Tue, 10 Jan 2023 21:01:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pFQQs-00063p-Bk; Tue, 10 Jan 2023 21:01:38 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pFQQq-0004om-AR; Tue, 10 Jan 2023 21:01:37 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1442977d77dso14149518fac.6; 
 Tue, 10 Jan 2023 18:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QBkfVYfqlPfJcnDfSOq/e9bEqP9nbncJPHOU7EHucEQ=;
 b=cf7fxPQTVk1lOFRz6wmSuhYKhq0mmp9Ogj7L26SWyUA4XIqlDuLYDq1BU44Seebaat
 FPwkxvY20wL3vdUqr7k0pCgAe4CWF1Im+iLpra1+nU7Pwy/8ZQovX3ZvFuXjBRlL854T
 n5RzaRsnyN1eK0/zdG9bTBoYxXIIS84bfMoDzcMduYBXhP+QPTYvSG7Fukr7ZCLts2uE
 cig2xhBJfneIsuYUAVQjkpUVLzLR9wtks36bBQq70BsVLTWNVtcesR9pWQKBOih6f5QT
 6h6exlW0+WtxtynVDYrChhjiPtzshqQFfbu+GeQGPbmo/yqTT9gtQ3ZZn+ZD3PFfwDq2
 GUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QBkfVYfqlPfJcnDfSOq/e9bEqP9nbncJPHOU7EHucEQ=;
 b=l+xOoChx/RsAY1Jna+Vd0E/DEwYMGXwZaihy7LwEnTwM67cbiqo9bQLXcR8eHkNkDi
 Qdw2Y8rNlCCU5bhUxD8tchYN5AsH5J3UtEfVU05kjsaWoz73APTyZsU8L1He6USCs25p
 wRDKSRBkMClZ3MWRZJUNhT1hsGA75HrImj8kaGjNOuveIe7Ht7C6iUdsuJyh5dJmM4qE
 Llw9cJvKaWv1XEkn+s8rOznlcuR0bO9yrq5SoTFUiXGWAeQfbzv/K1+H54emar70+vut
 PSSQgtUdfPNBpKRwSg792hgT3YztXXg6UNhmg8UONr9ZZKuNbGW4l0cQAyW+Hw3aVbZV
 0iTw==
X-Gm-Message-State: AFqh2kqBEr5sya0zIxtoIZ/qKXBmgQONhA0rzaWIZnpNcy2pZSnVlMf5
 dgHWN9qiT1gZqvY6tYXSPcJfJWBQ3qxXeuDfGv0=
X-Google-Smtp-Source: AMrXdXu8wPH1Uddl9pGiolXRfNwQi+3RbDLaa58yYKUQMa4QdAHpZLdClQpY3q2PL4cRUKtaEDzp2pRVhJirmxYo8tw=
X-Received: by 2002:a05:6871:296:b0:143:db39:48f7 with SMTP id
 i22-20020a056871029600b00143db3948f7mr4059340oae.275.1673402493755; Tue, 10
 Jan 2023 18:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20230109055933.749233-1-cyruscyliu@gmail.com>
 <BN7PR12MB28017305AA1A9A0FD629F86EE6FF9@BN7PR12MB2801.namprd12.prod.outlook.com>
In-Reply-To: <BN7PR12MB28017305AA1A9A0FD629F86EE6FF9@BN7PR12MB2801.namprd12.prod.outlook.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 11 Jan 2023 10:01:22 +0800
Message-ID: <CAAKa2jkPZOnX8av4meU5CE9pMtCr5gRuw=ZE0zNo3-+9wsS4uA@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: fix overflow in
 xlnx_dp_aux_push_tx_fifo()
To: "Konrad, Frederic" <Frederic.Konrad@amd.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000034e48805f1f3611a"
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

--00000000000034e48805f1f3611a
Content-Type: text/plain; charset="UTF-8"

Dear Fred,

On Tue, Jan 10, 2023 at 9:57 PM Konrad, Frederic <Frederic.Konrad@amd.com>
wrote:

> Hi,
>
> > -----Original Message-----
> > From: qemu-devel-bounces+fkonrad=amd.com@nongnu.org
> <qemu-devel-bounces+fkonrad=amd.com@nongnu.org> On Behalf Of
> > Qiang Liu
> > Sent: 09 January 2023 07:00
> > To: qemu-devel@nongnu.org
> > Cc: Qiang Liu <cyruscyliu@gmail.com>; Alistair Francis <
> alistair@alistair23.me>; Edgar E. Iglesias <edgar.iglesias@gmail.com>;
> Peter
> > Maydell <peter.maydell@linaro.org>; open list:Xilinx ZynqMP and... <
> qemu-arm@nongnu.org>
> > Subject: [PATCH] hw/display/xlnx_dp: fix overflow in
> xlnx_dp_aux_push_tx_fifo()
> >
> > This patch checks if the s->tx_fifo is full.
> >
> > Fixes: 58ac482a66de ("introduce xlnx-dp")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1424
> > Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > ---
> >  hw/display/xlnx_dp.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> > index 972473d94f..617b394af2 100644
> > --- a/hw/display/xlnx_dp.c
> > +++ b/hw/display/xlnx_dp.c
> > @@ -854,7 +854,11 @@ static void xlnx_dp_write(void *opaque, hwaddr
> offset, uint64_t value,
> >          break;
> >      case DP_AUX_WRITE_FIFO: {
> >          uint8_t c = value;
> > -        xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> > +        if (fifo8_is_full(&s->tx_fifo)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "xlnx_dp: TX fifo is full");
> > +        } else {
> > +            xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> > +        }
>
> I'd rather move the check in xlnx_dp_aux_push_tx_fifo, like
> xlnx_dp_aux_pop_tx_fifo.
> Otherwise looks good to me.
>

Sounds fine. Let me resend a patch.

Best,
Qiang

--00000000000034e48805f1f3611a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Fred,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023 at 9:57 PM Konrad, Fre=
deric &lt;<a href=3D"mailto:Frederic.Konrad@amd.com">Frederic.Konrad@amd.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi,<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: qemu-devel-bounces+fkonrad=3D<a href=3D"mailto:amd.com@nongnu.or=
g" target=3D"_blank">amd.com@nongnu.org</a> &lt;qemu-devel-bounces+fkonrad=
=3D<a href=3D"mailto:amd.com@nongnu.org" target=3D"_blank">amd.com@nongnu.o=
rg</a>&gt; On Behalf Of<br>
&gt; Qiang Liu<br>
&gt; Sent: 09 January 2023 07:00<br>
&gt; To: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-de=
vel@nongnu.org</a><br>
&gt; Cc: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" target=3D"_b=
lank">cyruscyliu@gmail.com</a>&gt;; Alistair Francis &lt;<a href=3D"mailto:=
alistair@alistair23.me" target=3D"_blank">alistair@alistair23.me</a>&gt;; E=
dgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"=
_blank">edgar.iglesias@gmail.com</a>&gt;; Peter<br>
&gt; Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bla=
nk">peter.maydell@linaro.org</a>&gt;; open list:Xilinx ZynqMP and... &lt;<a=
 href=3D"mailto:qemu-arm@nongnu.org" target=3D"_blank">qemu-arm@nongnu.org<=
/a>&gt;<br>
&gt; Subject: [PATCH] hw/display/xlnx_dp: fix overflow in xlnx_dp_aux_push_=
tx_fifo()<br>
&gt; <br>
&gt; This patch checks if the s-&gt;tx_fifo is full.<br>
&gt; <br>
&gt; Fixes: 58ac482a66de (&quot;introduce xlnx-dp&quot;)<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/142=
4" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qem=
u/-/issues/1424</a><br>
&gt; Reported-by: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" tar=
get=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" t=
arget=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/display/xlnx_dp.c | 6 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c<br>
&gt; index 972473d94f..617b394af2 100644<br>
&gt; --- a/hw/display/xlnx_dp.c<br>
&gt; +++ b/hw/display/xlnx_dp.c<br>
&gt; @@ -854,7 +854,11 @@ static void xlnx_dp_write(void *opaque, hwaddr of=
fset, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DP_AUX_WRITE_FIFO: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t c =3D value;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 xlnx_dp_aux_push_tx_fifo(s, &amp;c, 1);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo8_is_full(&amp;s-&gt;tx_fifo)) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR, &quot;xlnx_dp: TX fifo is full&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xlnx_dp_aux_push_tx_fifo(s,=
 &amp;c, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
I&#39;d rather move the check in xlnx_dp_aux_push_tx_fifo, like xlnx_dp_aux=
_pop_tx_fifo.<br>
Otherwise looks good to me.<br></blockquote><div>=C2=A0</div><div>Sounds fi=
ne. Let me resend a patch.</div><div><br></div><div>Best,</div><div>Qiang</=
div><div>=C2=A0</div></div></div>

--00000000000034e48805f1f3611a--

