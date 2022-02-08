Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FC4ACCC9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 01:30:58 +0100 (CET)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHEPJ-0007n8-Kq
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 19:30:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1nHENC-00076b-8G; Mon, 07 Feb 2022 19:28:46 -0500
Received: from rn-mailsvcp-ppex-lapp34.rno.apple.com ([17.179.253.43]:37240
 helo=rn-mailsvcp-ppex-lapp34.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1nHENA-0007O5-2o; Mon, 07 Feb 2022 19:28:45 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp34.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp34.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 2180PdVE005956; Mon, 7 Feb 2022 16:28:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=huhwa1y3BxXqmAIrDWOPTHzjkw32LTFZtlM+C9jw3zc=;
 b=De3Npgpd0qEX0uh7Ez1VCY073mz1gD/sOr6iIm4hjJKeFfpDUPM8hW2RVDtOYsjqCnsi
 ospMfhf9UNZH1abC0Z0t2XAeg70E0hRRwj2+qtf/dzeryvMxiHZqKlUhi9MYFXNRbfoA
 M62aj3ioV5cU5X06nSVi0vH6YfbX9EpjL8bYNIz4vaEiLc+DBAwJJwQ5wkp161ZQL/OA
 LLpXfUYuofHq8seEh5I/FBd/ZS/62nuKf8igdqAtIqtvJSGUHQ0ZMGEJnKOelvOqtr5k
 Ox+w0G+O7euEHMhHUVwFgloaqXEXu8bmzqfM11FBkbTSki4tEhJkXyz/50iwx3+JuVCA TA== 
Received: from rn-mailsvcp-mta-lapp04.rno.apple.com
 (rn-mailsvcp-mta-lapp04.rno.apple.com [10.225.203.152])
 by rn-mailsvcp-ppex-lapp34.rno.apple.com with ESMTP id 3e26b3wytx-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 07 Feb 2022 16:28:32 -0800
Received: from rn-mailsvcp-mmp-lapp01.rno.apple.com
 (rn-mailsvcp-mmp-lapp01.rno.apple.com [17.179.253.14])
 by rn-mailsvcp-mta-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R6Y00Y6KMNITLJ0@rn-mailsvcp-mta-lapp04.rno.apple.com>; 
 Mon, 07 Feb 2022 16:28:30 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp01.rno.apple.com by
 rn-mailsvcp-mmp-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R6Y01000MJEBL00@rn-mailsvcp-mmp-lapp01.rno.apple.com>; Mon,
 07 Feb 2022 16:28:30 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 36ada07b7a139d1d8d110642d73fd830
X-Va-E-CD: fd89d3783052dade148801820b896dbb
X-Va-R-CD: 485a7ed8f761bab8fae4eb7beaf2bd20
X-Va-CD: 0
X-Va-ID: 44595400-23c2-4f66-9a71-549af5bc6ba5
X-V-A: 
X-V-T-CD: 36ada07b7a139d1d8d110642d73fd830
X-V-E-CD: fd89d3783052dade148801820b896dbb
X-V-R-CD: 485a7ed8f761bab8fae4eb7beaf2bd20
X-V-CD: 0
X-V-ID: 88a020c6-0d33-4a0c-ab36-c3408f381404
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-07_07:2022-02-07,
 2022-02-07 signatures=0
Received: from smtpclient.apple ([17.149.232.253])
 by rn-mailsvcp-mmp-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R6Y00EG9MNHD200@rn-mailsvcp-mmp-lapp01.rno.apple.com>; Mon,
 07 Feb 2022 16:28:30 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
Message-id: <913E2F6B-AEBD-4DF6-9470-3AF34FE1E99D@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_48CC2DC7-17E9-4A1E-BD95-AE316A5D8C77"
MIME-version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] hvf: arm: Handle ID_AA64ISAR2_EL1 reads
Date: Mon, 07 Feb 2022 16:28:29 -0800
In-reply-to: <20220207225211.15281-1-agraf@csgraf.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Ivan Babrou <ivan@cloudflare.com>
To: Alexander Graf <agraf@csgraf.de>
References: <20220207225211.15281-1-agraf@csgraf.de>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-07_07:2022-02-07,
 2022-02-07 signatures=0
Received-SPF: pass client-ip=17.179.253.43; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp34.apple.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_48CC2DC7-17E9-4A1E-BD95-AE316A5D8C77
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Reviewed-by: Cameron Esfahani <dirty@apple.com <mailto:dirty@apple.com>>

Cameron

> On Feb 7, 2022, at 2:52 PM, Alexander Graf <agraf@csgraf.de> wrote:
>=20
> Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
> those reads trap into QEMU which handles them as faults.
>=20
> However, according to the ARMv8 spec (issue D17783), reads on this
> register in older ARMv8 revisions should be RES0. So let's treat it
> as such instead.
>=20
> Reported-by: Ivan Babrou <ivan@cloudflare.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
> target/arm/hvf/hvf.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 92ad0d29c4..045ec69c7c 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -54,6 +54,7 @@
> #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
> #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
> #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
> +#define SYSREG_ID_AA64ISAR2_EL1 SYSREG(3, 0, 0, 6, 2)
>=20
> #define WFX_IS_WFE (1 << 0)
>=20
> @@ -780,6 +781,10 @@ static int hvf_sysreg_read(CPUState *cpu, =
uint32_t reg, uint32_t rt)
>     case SYSREG_OSDLR_EL1:
>         /* Dummy register */
>         break;
> +    case SYSREG_ID_AA64ISAR2_EL1:
> +        /* We do not support any of the ISAR2 features yet */
> +        val =3D 0;
> +        break;
>     default:
>         cpu_synchronize_state(cpu);
>         trace_hvf_unhandled_sysreg_read(env->pc, reg,
> --=20
> 2.32.0 (Apple Git-132)
>=20


--Apple-Mail=_48CC2DC7-17E9-4A1E-BD95-AE316A5D8C77
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Reviewed-by: Cameron Esfahani &lt;<a =
href=3D"mailto:dirty@apple.com" class=3D"">dirty@apple.com</a>&gt;<div =
class=3D""><br class=3D""></div><div class=3D"">Cameron<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 7, 2022, at 2:52 PM, Alexander Graf &lt;<a =
href=3D"mailto:agraf@csgraf.de" class=3D"">agraf@csgraf.de</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Recent Linux versions added support to read ID_AA64ISAR2_EL1. =
On M1,<br class=3D"">those reads trap into QEMU which handles them as =
faults.<br class=3D""><br class=3D"">However, according to the ARMv8 =
spec (issue D17783), reads on this<br class=3D"">register in older ARMv8 =
revisions should be RES0. So let's treat it<br class=3D"">as such =
instead.<br class=3D""><br class=3D"">Reported-by: Ivan Babrou &lt;<a =
href=3D"mailto:ivan@cloudflare.com" =
class=3D"">ivan@cloudflare.com</a>&gt;<br class=3D"">Signed-off-by: =
Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de" =
class=3D"">agraf@csgraf.de</a>&gt;<br class=3D"">---<br class=3D""> =
target/arm/hvf/hvf.c | 5 +++++<br class=3D""> 1 file changed, 5 =
insertions(+)<br class=3D""><br class=3D"">diff --git =
a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c<br class=3D"">index =
92ad0d29c4..045ec69c7c 100644<br class=3D"">--- =
a/target/arm/hvf/hvf.c<br class=3D"">+++ b/target/arm/hvf/hvf.c<br =
class=3D"">@@ -54,6 +54,7 @@<br class=3D""> #define SYSREG_PMCEID1_EL0 =
&nbsp;&nbsp;&nbsp;SYSREG(3, 3, 9, 12, 7)<br class=3D""> #define =
SYSREG_PMCCNTR_EL0 &nbsp;&nbsp;&nbsp;SYSREG(3, 3, 9, 13, 0)<br class=3D"">=
 #define SYSREG_PMCCFILTR_EL0 &nbsp;SYSREG(3, 3, 14, 15, 7)<br =
class=3D"">+#define SYSREG_ID_AA64ISAR2_EL1 SYSREG(3, 0, 0, 6, 2)<br =
class=3D""><br class=3D""> #define WFX_IS_WFE (1 &lt;&lt; 0)<br =
class=3D""><br class=3D"">@@ -780,6 +781,10 @@ static int =
hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;case SYSREG_OSDLR_EL1:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Dummy register */<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;case SYSREG_ID_AA64ISAR2_EL1:<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* We do not =
support any of the ISAR2 features yet */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;val =3D 0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;default:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpu_synchronize_state(cpu)=
;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_hvf_unhandled_sysreg=
_read(env-&gt;pc, reg,<br class=3D"">-- <br class=3D"">2.32.0 (Apple =
Git-132)<br class=3D""><br class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_48CC2DC7-17E9-4A1E-BD95-AE316A5D8C77--

