Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66F35742F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:24:54 +0200 (CEST)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCrF-00010I-3y
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anoo@us.ibm.com>) id 1lUCgC-0002X5-3w
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:13:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anoo@us.ibm.com>) id 1lUCg7-0004yn-CT
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:13:27 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137I3hO7144983
 for <qemu-devel@nongnu.org>; Wed, 7 Apr 2021 14:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 in-reply-to : subject : to : cc : from : date : references : content-type
 : message-id; s=pp1; bh=4ZWpEk7VteQTppkwrHNgxXz9gPSMlN5Kn9/iR67lM9I=;
 b=YzR+R7BLXRhh3umNKb1jY2WaxPi6aIp0g+bY/K5kiVYD/eu1YtgzLpS2/HwJSysR++yE
 dvIeXBevfaxmZJfvxazVedPv5b9QVFpgYgKhSH8mBEC7rt/XUc+6ZOTxePA9QS0szawV
 Q3A1RHq9BA7IBVzUo/rr89CS47+rFGocb3qMyOl5N+QS5yZ8XJFfb88nj51wlZejPzAY
 jmF2+b9uFx8RJsvAsJutUHLGsk41frbIwQXGIXdDCclIpp+2iNjBEl+x0twIcqpYQ1vw
 a+hYo0L2KLwT5USBu40j2dEcT/Fc7xNyhWkocFnPVTjPmpjRS2LKXB8mzjaWzA6v8+Xk EQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvn0sgjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 14:13:16 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <qemu-devel@nongnu.org> from <anoo@us.ibm.com>;
 Wed, 7 Apr 2021 18:13:16 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 7 Apr 2021 18:13:14 -0000
Received: from us1a3-mail238.a3.dal06.isc4sb.com ([10.146.127.165])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2021040718131428-636958 ;
 Wed, 7 Apr 2021 18:13:14 +0000 
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-18-clg@kaod.org>
Subject: Re: [PATCH 17/24] aspeed: Remove swift-bmc machine
To: "=?ISO-8859-1?Q?C=E9dric_Le_Goater?=" <clg@kaod.org>
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Wed, 7 Apr 2021 13:13:13 -0500
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-18-clg@kaod.org>
X-KeepSent: F1F8B76A:481E9BDC-002586B0:0063EAE5;
 type=4; name=$KeepSent
X-Mailer: HCL Notes Build V1101FP2_10202020 SHF47 January 30, 2021
X-LLNOutbound: False
X-Disclaimed: 46603
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0C23DFF06C758f9e8a93df938690918c8FBB0C23DFF06C75"
Content-Disposition: inline
x-cbid: 21040718-2475-0000-0000-0000056480F6
X-IBM-SpamModules-Scores: BY=0.251817; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0; ST=0; TS=0; UL=0; ISC=; MB=0.000645
X-IBM-SpamModules-Versions: BY=3.00014940; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01526390; UDB=6.00825223; IPR=6.01308321; 
 MB=3.00036522; MTD=3.00000008; XFM=3.00000015; UTC=2021-04-07 18:13:15
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-22 14:28:52 - 6.00012377
x-cbparentid: 21040718-2476-0000-0000-0000DC9F84C1
Message-Id: <OFF1F8B76A.481E9BDC-ON002586B0.0063EAE5-862586B0.00641669@notes.na.collabserv.com>
X-Proofpoint-GUID: wR2qW17rLI5QSRChspohTd8d02rLmcWv
X-Proofpoint-ORIG-GUID: wR2qW17rLI5QSRChspohTd8d02rLmcWv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Received-SPF: pass client-ip=148.163.156.1; envelope-from=anoo@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 07 Apr 2021 14:22:59 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Adriana Kobylak <anoo@us.ibm.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0__=8FBB0C23DFF06C758f9e8a93df938690918c8FBB0C23DFF06C75
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1



"C=E9dric Le Goater" <clg@kaod.org> wrote on 04/07/2021 12:16:30 PM:

> From: "C=E9dric Le Goater" <clg@kaod.org>
> To: "Peter Maydell" <peter.maydell@linaro.org>
> Cc: "Andrew Jeffery" <andrew@aj.id.au>, "Joel Stanley"
> <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
> "C=E9dric Le Goater" <clg@kaod.org>, Adriana Kobylak/Austin/IBM@IBM
> Date: 04/07/2021 12:16 PM
> Subject: [PATCH 17/24] aspeed: Remove swift-bmc machine
>
> The SWIFT machine never came out of the lab and we already have enough
> AST2500 based OpenPower machines. Remove it.
>
> Cc: Adriana Kobylak <anoo@us.ibm.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
>  hw/arm/aspeed.c | 61 -------------------------------------------------
>  1 file changed, 61 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1cf5a15c8098..97dcca74feb4 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -110,17 +110,6 @@ struct AspeedMachineState {
>          SCU=5FHW=5FSTRAP=5FVGA=5FSIZE=5FSET(VGA=5F16M=5FDRAM) |
\
>          SCU=5FAST2500=5FHW=5FSTRAP=5FRESERVED1)
>
> -/* Swift hardware value: 0xF11AD206 */
> -#define SWIFT=5FBMC=5FHW=5FSTRAP1
(                                           \
> -        AST2500=5FHW=5FSTRAP1=5FDEFAULTS |
\
> -        SCU=5FAST2500=5FHW=5FSTRAP=5FSPI=5FAUTOFETCH=5FENABLE |
\
> -        SCU=5FAST2500=5FHW=5FSTRAP=5FGPIO=5FSTRAP=5FENABLE |
\
> -        SCU=5FAST2500=5FHW=5FSTRAP=5FUART=5FDEBUG |
\
> -        SCU=5FAST2500=5FHW=5FSTRAP=5FDDR4=5FENABLE |
\
> -        SCU=5FH=5FPLL=5FBYPASS=5FEN |
\
> -        SCU=5FAST2500=5FHW=5FSTRAP=5FACPI=5FENABLE |
\
> -        SCU=5FHW=5FSTRAP=5FSPI=5FMODE(SCU=5FHW=5FSTRAP=5FSPI=5FMASTER))
> -
>  #define G220A=5FBMC=5FHW=5FSTRAP1 (                                     =
 \
>          SCU=5FAST2500=5FHW=5FSTRAP=5FSPI=5FAUTOFETCH=5FENABLE |
\
>          SCU=5FAST2500=5FHW=5FSTRAP=5FGPIO=5FSTRAP=5FENABLE |
\
> @@ -465,35 +454,6 @@ static void romulus=5Fbmc=5Fi2c=5Finit(AspeedMachine=
State
*bmc)
>      i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 11=
),
> "ds1338", 0x32);
>  }
>
> -static void swift=5Fbmc=5Fi2c=5Finit(AspeedMachineState *bmc)
> -{
> -    AspeedSoCState *soc =3D &bmc->soc;
> -
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 3),
> "pca9552", 0x60);
> -
> -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 7),
> "tmp105", 0x48);
> -    /* The swift board expects a pca9551 but a pca9552 is compatible */
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 7),
> "pca9552", 0x60);
> -
> -    /* The swift board expects an Epson RX8900 RTC but a ds1338 is
> compatible */
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 8),
> "ds1338", 0x32);
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 8),
> "pca9552", 0x60);
> -
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 9),
> "tmp423", 0x4c);
> -    /* The swift board expects a pca9539 but a pca9552 is compatible */
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 9),
> "pca9552", 0x74);
> -
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 10=
),
> "tmp423", 0x4c);
> -    /* The swift board expects a pca9539 but a pca9552 is compatible */
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 10=
),
"pca9552",
> -                     0x74);
> -
> -    /* The swift board expects a TMP275 but a TMP105 is compatible */
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 12=
),
> "tmp105", 0x48);
> -    i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&soc->i2c, 12=
),
> "tmp105", 0x4a);
> -}
> -
>  static void sonorapass=5Fbmc=5Fi2c=5Finit(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc =3D &bmc->soc;
> @@ -796,23 +756,6 @@ static void
> aspeed=5Fmachine=5Fsonorapass=5Fclass=5Finit(ObjectClass *oc, void *data)
>          aspeed=5Fsoc=5Fnum=5Fcpus(amc->soc=5Fname);
>  };
>
> -static void aspeed=5Fmachine=5Fswift=5Fclass=5Finit(ObjectClass *oc, voi=
d *data)
> -{
> -    MachineClass *mc =3D MACHINE=5FCLASS(oc);
> -    AspeedMachineClass *amc =3D ASPEED=5FMACHINE=5FCLASS(oc);
> -
> -    mc->desc       =3D "OpenPOWER Swift BMC (ARM1176)";
> -    amc->soc=5Fname  =3D "ast2500-a1";
> -    amc->hw=5Fstrap1 =3D SWIFT=5FBMC=5FHW=5FSTRAP1;
> -    amc->fmc=5Fmodel =3D "mx66l1g45g";
> -    amc->spi=5Fmodel =3D "mx66l1g45g";
> -    amc->num=5Fcs    =3D 2;
> -    amc->i2c=5Finit  =3D swift=5Fbmc=5Fi2c=5Finit;
> -    mc->default=5Fram=5Fsize       =3D 512 * MiB;
> -    mc->default=5Fcpus =3D mc->min=5Fcpus =3D mc->max=5Fcpus =3D
> -        aspeed=5Fsoc=5Fnum=5Fcpus(amc->soc=5Fname);
> -};
> -
>  static void aspeed=5Fmachine=5Fwitherspoon=5Fclass=5Finit(ObjectClass *o=
c,
> void *data)
>  {
>      MachineClass *mc =3D MACHINE=5FCLASS(oc);
> @@ -903,10 +846,6 @@ static const TypeInfo aspeed=5Fmachine=5Ftypes[] =3D=
 {
>          .name          =3D MACHINE=5FTYPE=5FNAME("romulus-bmc"),
>          .parent        =3D TYPE=5FASPEED=5FMACHINE,
>          .class=5Finit    =3D aspeed=5Fmachine=5Fromulus=5Fclass=5Finit,
> -    }, {
> -        .name          =3D MACHINE=5FTYPE=5FNAME("swift-bmc"),
> -        .parent        =3D TYPE=5FASPEED=5FMACHINE,
> -        .class=5Finit    =3D aspeed=5Fmachine=5Fswift=5Fclass=5Finit,
>      }, {
>          .name          =3D MACHINE=5FTYPE=5FNAME("sonorapass-bmc"),
>          .parent        =3D TYPE=5FASPEED=5FMACHINE,
> --
> 2.26.3
>

--0__=8FBB0C23DFF06C758f9e8a93df938690918c8FBB0C23DFF06C75
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;C=E9dric Le Goater&quot; &lt;clg@=
kaod.org&gt; wrote on 04/07/2021 12:16:30 PM:<br><br>&gt; From: &quot;C=E9d=
ric Le Goater&quot; &lt;clg@kaod.org&gt;</font></tt><br><tt><font size=3D"2=
">&gt; To: &quot;Peter Maydell&quot; &lt;peter.maydell@linaro.org&gt;</font=
></tt><br><tt><font size=3D"2">&gt; Cc: &quot;Andrew Jeffery&quot; &lt;andr=
ew@aj.id.au&gt;, &quot;Joel Stanley&quot; <br>&gt; &lt;joel@jms.id.au&gt;, =
qemu-arm@nongnu.org, qemu-devel@nongnu.org, <br>&gt; &quot;C=E9dric Le Goat=
er&quot; &lt;clg@kaod.org&gt;, Adriana Kobylak/Austin/IBM@IBM</font></tt><b=
r><tt><font size=3D"2">&gt; Date: 04/07/2021 12:16 PM</font></tt><br><tt><f=
ont size=3D"2">&gt; Subject: [PATCH 17/24] aspeed: Remove swift-bmc machine=
</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; The SWIFT machine never =
came out of the lab and we already have enough<br>&gt; AST2500 based OpenPo=
wer machines. Remove it.<br>&gt; <br>&gt; Cc: Adriana Kobylak &lt;anoo@us.i=
bm.com&gt;<br>&gt; Signed-off-by: C=E9dric Le Goater &lt;clg@kaod.org&gt;</=
font></tt><br><br><tt><font size=3D"2">Reviewed-by: </font></tt><tt><font s=
ize=3D"2">Adriana Kobylak &lt;anoo@us.ibm.com&gt;</font></tt><br><tt><font =
size=3D"2"><br>&gt; ---<br>&gt; &nbsp;hw/arm/aspeed.c | 61 ----------------=
---------------------------------<br>&gt; &nbsp;1 file changed, 61 deletion=
s(-)<br>&gt; <br>&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>&gt=
; index 1cf5a15c8098..97dcca74feb4 100644<br>&gt; --- a/hw/arm/aspeed.c<br>=
&gt; +++ b/hw/arm/aspeed.c<br>&gt; @@ -110,17 +110,6 @@ struct AspeedMachin=
eState {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SCU=5FHW=5FSTRAP=5FVGA=
=5FSIZE=5FSET(VGA=5F16M=5FDRAM) | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;SCU=5FAST2500=5FHW=5FSTRAP=5FRESERVED1)<br>&gt; &nbsp;<br>&gt; -/* Swi=
ft hardware value: 0xF11AD206 */<br>&gt; -#define SWIFT=5FBMC=5FHW=5FSTRAP1=
 ( &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
\<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;AST2500=5FHW=5FSTRAP1=5FDEFAULTS | &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; - &nbsp; &nbsp; =
&nbsp; &nbsp;SCU=5FAST2500=5FHW=5FSTRAP=5FSPI=5FAUTOFETCH=5FENABLE | &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; -=
 &nbsp; &nbsp; &nbsp; &nbsp;SCU=5FAST2500=5FHW=5FSTRAP=5FGPIO=5FSTRAP=5FENA=
BLE | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;\<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;SCU=5FAST2500=5FHW=5FS=
TRAP=5FUART=5FDEBUG | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; - &nbsp; &nbs=
p; &nbsp; &nbsp;SCU=5FAST2500=5FHW=5FSTRAP=5FDDR4=5FENABLE | &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;\<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;SCU=5FH=5FPLL=5FBYPAS=
S=5FEN | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; \<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;SCU=5FAST2500=5FHW=5FSTRAP=5FA=
CPI=5FENABLE | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; - &nbsp; &nbsp; &nbsp=
; &nbsp;SCU=5FHW=5FSTRAP=5FSPI=5FMODE(SCU=5FHW=5FSTRAP=5FSPI=5FMASTER))<br>=
&gt; -<br>&gt; &nbsp;#define G220A=5FBMC=5FHW=5FSTRAP1 ( &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;SCU=5FAST2500=5FHW=5FSTRAP=5FSPI=5FAUTOFETCH=5FENABLE | &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;SCU=5FAST2500=5FHW=5FSTRAP=5FGPIO=5FSTRAP=5FENA=
BLE | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;\<br>&gt; @@ -465,35 +454,6 @@ static void romulus=5Fbmc=5Fi2=
c=5Finit(AspeedMachineState *bmc)<br>&gt; &nbsp; &nbsp; &nbsp;i2c=5Fslave=
=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 11), <br>&gt;=
 &quot;ds1338&quot;, 0x32);<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; -static =
void swift=5Fbmc=5Fi2c=5Finit(AspeedMachineState *bmc)<br>&gt; -{<br>&gt; -=
 &nbsp; &nbsp;AspeedSoCState *soc =3D &amp;bmc-&gt;soc;<br>&gt; -<br>&gt; -=
 &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&amp;s=
oc-&gt;i2c, 3), <br>&gt; &quot;pca9552&quot;, 0x60);<br>&gt; -<br>&gt; - &n=
bsp; &nbsp;/* The swift board expects a TMP275 but a TMP105 is compatible *=
/<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fget=
=5Fbus(&amp;soc-&gt;i2c, 7), <br>&gt; &quot;tmp105&quot;, 0x48);<br>&gt; - =
&nbsp; &nbsp;/* The swift board expects a pca9551 but a pca9552 is compatib=
le */<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(aspeed=5Fi2c=5Fg=
et=5Fbus(&amp;soc-&gt;i2c, 7), <br>&gt; &quot;pca9552&quot;, 0x60);<br>&gt;=
 -<br>&gt; - &nbsp; &nbsp;/* The swift board expects an Epson RX8900 RTC bu=
t a ds1338 is <br>&gt; compatible */<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fc=
reate=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 8), <br>&gt; &quo=
t;ds1338&quot;, 0x32);<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple=
(aspeed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 8), <br>&gt; &quot;pca9552&quot=
;, 0x60);<br>&gt; -<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(as=
peed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 9), <br>&gt; &quot;tmp423&quot;, 0=
x4c);<br>&gt; - &nbsp; &nbsp;/* The swift board expects a pca9539 but a pca=
9552 is compatible */<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(=
aspeed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 9), <br>&gt; &quot;pca9552&quot;=
, 0x74);<br>&gt; -<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(asp=
eed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 10), <br>&gt; &quot;tmp423&quot;, 0=
x4c);<br>&gt; - &nbsp; &nbsp;/* The swift board expects a pca9539 but a pca=
9552 is compatible */<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(=
aspeed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 10), &quot;pca9552&quot;,<br>&gt=
; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0=
x74);<br>&gt; -<br>&gt; - &nbsp; &nbsp;/* The swift board expects a TMP275 =
but a TMP105 is compatible */<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=
=5Fsimple(aspeed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 12), <br>&gt; &quot;tm=
p105&quot;, 0x48);<br>&gt; - &nbsp; &nbsp;i2c=5Fslave=5Fcreate=5Fsimple(asp=
eed=5Fi2c=5Fget=5Fbus(&amp;soc-&gt;i2c, 12), <br>&gt; &quot;tmp105&quot;, 0=
x4a);<br>&gt; -}<br>&gt; -<br>&gt; &nbsp;static void sonorapass=5Fbmc=5Fi2c=
=5Finit(AspeedMachineState *bmc)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbs=
p;AspeedSoCState *soc =3D &amp;bmc-&gt;soc;<br>&gt; @@ -796,23 +756,6 @@ st=
atic void <br>&gt; aspeed=5Fmachine=5Fsonorapass=5Fclass=5Finit(ObjectClass=
 *oc, void *data)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aspeed=5Fsoc=5F=
num=5Fcpus(amc-&gt;soc=5Fname);<br>&gt; &nbsp;};<br>&gt; &nbsp;<br>&gt; -st=
atic void aspeed=5Fmachine=5Fswift=5Fclass=5Finit(ObjectClass *oc, void *da=
ta)<br>&gt; -{<br>&gt; - &nbsp; &nbsp;MachineClass *mc =3D MACHINE=5FCLASS(=
oc);<br>&gt; - &nbsp; &nbsp;AspeedMachineClass *amc =3D ASPEED=5FMACHINE=5F=
CLASS(oc);<br>&gt; -<br>&gt; - &nbsp; &nbsp;mc-&gt;desc &nbsp; &nbsp; &nbsp=
; =3D &quot;OpenPOWER Swift BMC (ARM1176)&quot;;<br>&gt; - &nbsp; &nbsp;amc=
-&gt;soc=5Fname &nbsp;=3D &quot;ast2500-a1&quot;;<br>&gt; - &nbsp; &nbsp;am=
c-&gt;hw=5Fstrap1 =3D SWIFT=5FBMC=5FHW=5FSTRAP1;<br>&gt; - &nbsp; &nbsp;amc=
-&gt;fmc=5Fmodel =3D &quot;mx66l1g45g&quot;;<br>&gt; - &nbsp; &nbsp;amc-&gt=
;spi=5Fmodel =3D &quot;mx66l1g45g&quot;;<br>&gt; - &nbsp; &nbsp;amc-&gt;num=
=5Fcs &nbsp; &nbsp;=3D 2;<br>&gt; - &nbsp; &nbsp;amc-&gt;i2c=5Finit &nbsp;=
=3D swift=5Fbmc=5Fi2c=5Finit;<br>&gt; - &nbsp; &nbsp;mc-&gt;default=5Fram=
=5Fsize &nbsp; &nbsp; &nbsp; =3D 512 * MiB;<br>&gt; - &nbsp; &nbsp;mc-&gt;d=
efault=5Fcpus =3D mc-&gt;min=5Fcpus =3D mc-&gt;max=5Fcpus =3D<br>&gt; - &nb=
sp; &nbsp; &nbsp; &nbsp;aspeed=5Fsoc=5Fnum=5Fcpus(amc-&gt;soc=5Fname);<br>&=
gt; -};<br>&gt; -<br>&gt; &nbsp;static void aspeed=5Fmachine=5Fwitherspoon=
=5Fclass=5Finit(ObjectClass *oc, <br>&gt; void *data)<br>&gt; &nbsp;{<br>&g=
t; &nbsp; &nbsp; &nbsp;MachineClass *mc =3D MACHINE=5FCLASS(oc);<br>&gt; @@=
 -903,10 +846,6 @@ static const TypeInfo aspeed=5Fmachine=5Ftypes[] =3D {<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.name &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;=3D MACHINE=5FTYPE=5FNAME(&quot;romulus-bmc&quot;),<br>&gt; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;.parent &nbsp; &nbsp; &nbsp; &nbsp;=3D TYPE=5FASPE=
ED=5FMACHINE,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.class=5Finit &nbsp=
; &nbsp;=3D aspeed=5Fmachine=5Fromulus=5Fclass=5Finit,<br>&gt; - &nbsp; &nb=
sp;}, {<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;.name &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;=3D MACHINE=5FTYPE=5FNAME(&quot;swift-bmc&quot;),<br>&gt; - &nbsp=
; &nbsp; &nbsp; &nbsp;.parent &nbsp; &nbsp; &nbsp; &nbsp;=3D TYPE=5FASPEED=
=5FMACHINE,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;.class=5Finit &nbsp; &nbsp=
;=3D aspeed=5Fmachine=5Fswift=5Fclass=5Finit,<br>&gt; &nbsp; &nbsp; &nbsp;}=
, {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.name &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;=3D MACHINE=5FTYPE=5FNAME(&quot;sonorapass-bmc&quot;),<br>&gt; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.parent &nbsp; &nbsp; &nbsp; &nbsp;=3D TYP=
E=5FASPEED=5FMACHINE,<br>&gt; -- <br>&gt; 2.26.3<br>&gt; <br></font></tt><B=
R>
</body></html>

--0__=8FBB0C23DFF06C758f9e8a93df938690918c8FBB0C23DFF06C75--


