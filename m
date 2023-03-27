Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A7E6CAB9F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqOB-00082x-22; Mon, 27 Mar 2023 13:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pgqO8-00082h-OV
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:12:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pgqO5-0006vv-Sx
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:12:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id r11so9538327wrr.12
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679937124;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cqkzZJEl7/qe/O8J466bPKcuBIvlXvoUrtgOOgCX6r8=;
 b=aJd5aBoG37HYFehm51vNLgLJWJE5rW7PVR2eCMlnQyEfquAI4aPVaZ9f71X3LEUmtO
 mOA2ladTPbj/FkeH35U7qpVEGleGDdrazUGStwy017mCatbkOkmRKJZp5RgNIRxHmS8V
 wZnAJXwbbRuwG5IMmFgSSAdYc3dotTMX5++JA+vIpik8oTHlgmv5mi7QclKKI1TMOabx
 oTYBEJJtGKP0aCBaVhoW6sCteWAlxg4iAwJw2cnfkcfXAhRUj5h7wMAvGF2/tsL4baW1
 5ke7SjzPewH+KeIhKYTB/g8nmBL03935F5zoSBxpQO440waoWh52SUA7AvmPUxPSzhRz
 LOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679937124;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cqkzZJEl7/qe/O8J466bPKcuBIvlXvoUrtgOOgCX6r8=;
 b=UTlgNVuJ7e4aRS3gMw8gFPNOQeUDBBf75HO6wZY4Tv+BHGxIaSSQ8oPSC2ud+vN1rR
 cQPmQAItC3e2gRADqD9vTv4R7mNaHgiYtPhiPiBsXj6mjwIRbJ7BMJcYIob8dmTKyX4j
 ogCmX5ObkFL/xE67d3WICctOK9x7z+H8pmVCh5celqgVFGnBbtf+pNPLhRTpDwx0rcUM
 +3GCRDYBd6S8EtTH6WQvnV5VClxY1O/FkvFeC5n7dfsc5ONJirAvE8wBWtRssvrmsvfw
 ErAUytow219Mu3QapDN8t5510iNcxW2e9TvqXNTwK7N7EjrieiQfRMvvaY2sB+BEGSTT
 UnDg==
X-Gm-Message-State: AAQBX9cqk7BTNUM/AI50zIoJJ4BNR961XVbC8JV7i1bxWr5STnOJgsH6
 rUBrfqjYZGb+CjgcQiIgURFn49O5heaHDLak7lRiIw==
X-Google-Smtp-Source: AKy350aSHv/gjyYc+1BhS0lbjH/QgMcHJnWrKms+wgTtJKYAkTGgmLJ9/nXDhob0fYow081DdPZ2fnT3QVH+fpHfAjM=
X-Received: by 2002:adf:fc84:0:b0:2cf:f053:a32e with SMTP id
 g4-20020adffc84000000b002cff053a32emr2481854wrr.6.1679937124160; Mon, 27 Mar
 2023 10:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-5-wuhaotsh@google.com>
 <29f7e479-2e2c-a9d6-d5f1-440cdfce0cb7@kaod.org>
In-Reply-To: <29f7e479-2e2c-a9d6-d5f1-440cdfce0cb7@kaod.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 27 Mar 2023 10:11:50 -0700
Message-ID: <CAGcCb13gHDdO=hqo_UztH1=BOZVMbXNYKNKcdVEZmqT8gBuBmg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/ipmi: Refactor IPMI interface
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: minyard@acm.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org, 
 Joel Stanley <joel@jms.id.au>, Frederic Barrat <frederic.barrat@fr.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000088759905f7e4d70d"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=wuhaotsh@google.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--00000000000088759905f7e4d70d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Cedric

The naming scheme is suggested by Corey in a previous review:

https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02691.html

I originally kept "IpmIBmc" for the host side code talking to BMC but it
might also cause confusion as well. I'm not sure which name is the best
here. Maybe Corey can shed some light on this one? Thank you!

Best Regards,

On Mon, Mar 27, 2023 at 5:34=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:

> Hello Hao,
>
> On 3/25/23 00:09, Hao Wu wrote:
> > This patch refactors the IPMI interface so that it can be used by both
> > the BMC side and core-side simulation.
> >
> > Detail changes:
> > (1) Split IPMIInterface into IPMIInterfaceHost (for host side
> >      simulation) and IPMIInterfaceClient (for BMC side simulation).
> > (2) rename handle_rsp -> handle_msg so the name fits both BMC side and
> >      Core side.
> > (3) Add a new class IPMICore. This class represents a simulator/externa=
l
> >      connection for both BMC and Core side emulation.
> > (4) Change the original IPMIBmc to IPMIBmcHost, representing host side
> >      simulation.
> > (5) Add a new type IPMIBmcClient representing BMC side simulation.
> > (6) Appy the changes to  the entire IPMI library.
>
> 'IPMIBmcHost' is a BMC object model (internal or external) and
> 'IPMIBmcClient' is a host object model ?
>
> [ ... ]
>
> > @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor=
)
> >    * Instantiate the machine BMC. PowerNV uses the QEMU internal
> >    * simulator but it could also be external.
> >    */
> > -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> > +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)
> >   {
> >       Object *obj;
> >
> >       obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> >       qdev_realize(DEVICE(obj), NULL, &error_fatal);
> > -    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> > +    pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);
> >
> > -    return IPMI_BMC(obj);
> > +    return IPMI_BMC_HOST(obj);
>
> QEMU PowerNV machines model the host side of OpenPOWER systems which
> have an Aspeed SoC based BMC for management. The routine above creates
> an Aspeed *BMC* object model for the PowerNV *host* machine. I find
> 'IPMIBmcHost' confusing. It shouldn't have a 'Host' suffix I think.
>
> 'IPMIBmcClient' sounds ok, or 'IPMIBmcPeer' maybe.
>
> Thanks,
>
> C.
>
>

--00000000000088759905f7e4d70d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Cedric<div><br></div><div>The naming scheme is suggest=
ed by Corey in a previous review:</div><div><br></div><div><a href=3D"https=
://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02691.html">https://lis=
ts.gnu.org/archive/html/qemu-devel/2021-09/msg02691.html</a><br></div><div>=
<br></div><div>I originally kept &quot;IpmIBmc&quot; for the host side code=
 talking to BMC but it might also cause confusion as well. I&#39;m not sure=
 which name is the best here. Maybe Corey can shed some light on this one? =
Thank you!</div><div><br></div><div>Best Regards,</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 27, 2023=
 at 5:34=E2=80=AFAM C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.or=
g">clg@kaod.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hello Hao,<br>
<br>
On 3/25/23 00:09, Hao Wu wrote:<br>
&gt; This patch refactors the IPMI interface so that it can be used by both=
<br>
&gt; the BMC side and core-side simulation.<br>
&gt; <br>
&gt; Detail changes:<br>
&gt; (1) Split IPMIInterface into IPMIInterfaceHost (for host side<br>
&gt;=C2=A0 =C2=A0 =C2=A0 simulation) and IPMIInterfaceClient (for BMC side =
simulation).<br>
&gt; (2) rename handle_rsp -&gt; handle_msg so the name fits both BMC side =
and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Core side.<br>
&gt; (3) Add a new class IPMICore. This class represents a simulator/extern=
al<br>
&gt;=C2=A0 =C2=A0 =C2=A0 connection for both BMC and Core side emulation.<b=
r>
&gt; (4) Change the original IPMIBmc to IPMIBmcHost, representing host side=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 simulation.<br>
&gt; (5) Add a new type IPMIBmcClient representing BMC side simulation.<br>
&gt; (6) Appy the changes to=C2=A0 the entire IPMI library.<br>
<br>
&#39;IPMIBmcHost&#39; is a BMC object model (internal or external) and<br>
&#39;IPMIBmcClient&#39; is a host object model ?<br>
<br>
[ ... ]<br>
<br>
&gt; @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pno=
r)<br>
&gt;=C2=A0 =C2=A0 * Instantiate the machine BMC. PowerNV uses the QEMU inte=
rnal<br>
&gt;=C2=A0 =C2=A0 * simulator but it could also be external.<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt; -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)<br>
&gt; +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Object *obj;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_realize(DEVICE(obj), NULL, &amp;error_f=
atal);<br>
&gt; -=C2=A0 =C2=A0 pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);<br>
&gt; +=C2=A0 =C2=A0 pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 return IPMI_BMC(obj);<br>
&gt; +=C2=A0 =C2=A0 return IPMI_BMC_HOST(obj);<br>
<br>
QEMU PowerNV machines model the host side of OpenPOWER systems which<br>
have an Aspeed SoC based BMC for management. The routine above creates<br>
an Aspeed *BMC* object model for the PowerNV *host* machine. I find<br>
&#39;IPMIBmcHost&#39; confusing. It shouldn&#39;t have a &#39;Host&#39; suf=
fix I think.<br>
<br>
&#39;IPMIBmcClient&#39; sounds ok, or &#39;IPMIBmcPeer&#39; maybe.<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
</blockquote></div>

--00000000000088759905f7e4d70d--

