Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED432FC868
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 04:05:54 +0100 (CET)
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l23of-0001AD-AR
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 22:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1l23nF-0000jN-HN
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:04:25 -0500
Received: from nwk-aaemail-lapp03.apple.com ([17.151.62.68]:50222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1l23nD-0004sT-Eo
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:04:25 -0500
Received: from pps.filterd (nwk-aaemail-lapp03.apple.com [127.0.0.1])
 by nwk-aaemail-lapp03.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 10K2tF3S034825; Tue, 19 Jan 2021 19:04:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=ykjdXFNm5LydRanBa5feMztCr9M8z9dg/UcGGF0l//c=;
 b=ZkPbVbAd/D766kCuyDAgk7VbLQAz6zbPYSdNYFCVKxOvI5FcyjKXVBz9nMe4zcSKFOBW
 uqKxr7Sue1i3X7QjZ8Z1oAq4JBIv6f2A/whBAx3lzIAD+XgM+ZMGwuhS0AX3Z65g60dE
 /lpWpjG6erprheHCl85W3wofGmo11Ce4HJk9U6E4Fn8vRJBs0tv8VMeJs83fDI8LAZ+a
 LwmLYZMYEv+eF8yqKJAa4a6PCroBP9lDQ2hYZX4V0v5wzcsIwe5VCU5mOqqHsAQ2+UQa
 DduH9NwYeeQNKzk6su40tYbUmnAqkLFptYUQ63Ck3YgiDz1L3hOgR/MDAfy0F9LlAPl1 WQ== 
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by nwk-aaemail-lapp03.apple.com with ESMTP id 3668r8k0aa-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 19 Jan 2021 19:04:20 -0800
Received: from rn-mailsvcp-mmp-lapp03.rno.apple.com
 (rn-mailsvcp-mmp-lapp03.rno.apple.com [17.179.253.16])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.7.20201203 64bit (built Dec  3
 2020)) with ESMTPS id <0QN700V5HPV4S470@rn-mailsvcp-mta-lapp03.rno.apple.com>; 
 Tue, 19 Jan 2021 19:04:16 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp03.rno.apple.com by
 rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.7.20201203 64bit (built Dec  3
 2020)) id <0QN700Y00PPFJN00@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Tue,
 19 Jan 2021 19:04:16 -0800 (PST)
X-Va-A: 
X-Va-T-CD: e1aed8c2df8699cbf816f93d3d4dacf8
X-Va-E-CD: 73f39b88ac49a6242b533b9ce41dce88
X-Va-R-CD: 4ce8a15b1214356ac3198b5769b838d6
X-Va-CD: 0
X-Va-ID: b6bf2bf4-96ec-46ad-a58c-cbd67983e7f9
X-V-A: 
X-V-T-CD: e1aed8c2df8699cbf816f93d3d4dacf8
X-V-E-CD: 73f39b88ac49a6242b533b9ce41dce88
X-V-R-CD: 4ce8a15b1214356ac3198b5769b838d6
X-V-CD: 0
X-V-ID: 0b507acb-f7e2-4087-b6a7-f4fd3f37bdbd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_15:2021-01-18,
 2021-01-19 signatures=0
Received: from smtpclient.apple (unknown [17.232.231.32])
 by rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.7.20201203 64bit (built Dec  3
 2020))
 with ESMTPSA id <0QN700JFPPV2XJ00@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Tue,
 19 Jan 2021 19:04:16 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
Message-id: <F4AF1D4E-5DC8-4F83-BB4B-6059A19C59B1@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_C20F662E-A896-4BD7-BA50-E47110B10754"
MIME-version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.6\))
Subject: Re: [PATCH v3] hvf: guard xgetbv call.
Date: Tue, 19 Jan 2021 19:04:14 -0800
In-reply-to: <X/6OJ7qk0W6bHkHQ@Hills-Mac-Pro.local>
To: Hill Ma <maahiuzeon@gmail.com>
References: <X/6OJ7qk0W6bHkHQ@Hills-Mac-Pro.local>
X-Mailer: Apple Mail (2.3654.80.0.2.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_15:2021-01-18,
 2021-01-19 signatures=0
Received-SPF: pass client-ip=17.151.62.68; envelope-from=dirty@apple.com;
 helo=nwk-aaemail-lapp03.apple.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: r.bolshakov@yadro.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_C20F662E-A896-4BD7-BA50-E47110B10754
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Reviewed-by: Cameron Esfahani <dirty@apple.com <mailto:dirty@apple.com>>

Cameron Esfahani
dirty@apple.com

> On Jan 12, 2021, at 10:07 PM, Hill Ma <maahiuzeon@gmail.com> wrote:
>=20
> This prevents illegal instruction on cpus do not support xgetbv.
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
> Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
> ---
> v3: addressed feedback.
> v2: xgetbv() modified based on feedback.
>=20
> target/i386/hvf/x86_cpuid.c | 34 ++++++++++++++++++++++------------
> 1 file changed, 22 insertions(+), 12 deletions(-)
>=20
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index a6842912f5..32b0d131df 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -27,15 +27,22 @@
> #include "vmx.h"
> #include "sysemu/hvf.h"
>=20
> -static uint64_t xgetbv(uint32_t xcr)
> +static bool xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
> {
> -    uint32_t eax, edx;
> +    uint32_t xcrl, xcrh;
>=20
> -    __asm__ volatile ("xgetbv"
> -                      : "=3Da" (eax), "=3Dd" (edx)
> -                      : "c" (xcr));
> +    if (cpuid_ecx & CPUID_EXT_OSXSAVE) {
> +        /*
> +         * The xgetbv instruction is not available to older versions =
of
> +         * the assembler, so we encode the instruction manually.
> +         */
> +        asm(".byte 0x0f, 0x01, 0xd0" : "=3Da" (xcrl), "=3Dd" (xcrh) : =
"c" (idx));
>=20
> -    return (((uint64_t)edx) << 32) | eax;
> +        *xcr =3D (((uint64_t)xcrh) << 32) | xcrl;
> +        return true;
> +    }
> +
> +    return false;
> }
>=20
> uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
> @@ -100,12 +107,15 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, =
uint32_t idx,
>         break;
>     case 0xD:
>         if (idx =3D=3D 0) {
> -            uint64_t host_xcr0 =3D xgetbv(0);
> -            uint64_t supp_xcr0 =3D host_xcr0 & (XSTATE_FP_MASK | =
XSTATE_SSE_MASK |
> -                                  XSTATE_YMM_MASK | =
XSTATE_BNDREGS_MASK |
> -                                  XSTATE_BNDCSR_MASK | =
XSTATE_OPMASK_MASK |
> -                                  XSTATE_ZMM_Hi256_MASK | =
XSTATE_Hi16_ZMM_MASK);
> -            eax &=3D supp_xcr0;
> +            uint64_t host_xcr0;
> +            if (xgetbv(ecx, 0, &host_xcr0)) {
> +                uint64_t supp_xcr0 =3D host_xcr0 & (XSTATE_FP_MASK |
> +                                  XSTATE_SSE_MASK | XSTATE_YMM_MASK |
> +                                  XSTATE_BNDREGS_MASK | =
XSTATE_BNDCSR_MASK |
> +                                  XSTATE_OPMASK_MASK | =
XSTATE_ZMM_Hi256_MASK |
> +                                  XSTATE_Hi16_ZMM_MASK);
> +                eax &=3D supp_xcr0;
> +            }
>         } else if (idx =3D=3D 1) {
>             hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
>             eax &=3D CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1;
> --=20
> 2.20.1 (Apple Git-117)
>=20


--Apple-Mail=_C20F662E-A896-4BD7-BA50-E47110B10754
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Reviewed-by: Cameron Esfahani &lt;<a =
href=3D"mailto:dirty@apple.com" class=3D"">dirty@apple.com</a>&gt;<div =
class=3D""><br class=3D""></div><div class=3D"">Cameron =
Esfahani</div><div class=3D""><a href=3D"mailto:dirty@apple.com" =
class=3D"">dirty@apple.com</a><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Jan =
12, 2021, at 10:07 PM, Hill Ma &lt;maahiuzeon@gmail.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">This prevents illegal instruction on cpus do not support =
xgetbv.<br class=3D""><br class=3D"">Buglink: =
https://bugs.launchpad.net/qemu/+bug/1758819<br class=3D"">Signed-off-by: =
Hill Ma &lt;maahiuzeon@gmail.com&gt;<br class=3D"">---<br class=3D"">v3: =
addressed feedback.<br class=3D"">v2: xgetbv() modified based on =
feedback.<br class=3D""><br class=3D""> target/i386/hvf/x86_cpuid.c | 34 =
++++++++++++++++++++++------------<br class=3D""> 1 file changed, 22 =
insertions(+), 12 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c<br =
class=3D"">index a6842912f5..32b0d131df 100644<br class=3D"">--- =
a/target/i386/hvf/x86_cpuid.c<br class=3D"">+++ =
b/target/i386/hvf/x86_cpuid.c<br class=3D"">@@ -27,15 +27,22 @@<br =
class=3D""> #include "vmx.h"<br class=3D""> #include "sysemu/hvf.h"<br =
class=3D""><br class=3D"">-static uint64_t xgetbv(uint32_t xcr)<br =
class=3D"">+static bool xgetbv(uint32_t cpuid_ecx, uint32_t idx, =
uint64_t *xcr)<br class=3D""> {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;uint32_t eax, edx;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;uint32_t xcrl, xcrh;<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;__asm__ volatile ("xgetbv"<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: "=3Da" (eax), "=3Dd"=
 (edx)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: "c" (xcr));<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;if (cpuid_ecx &amp; CPUID_EXT_OSXSAVE) =
{<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* The =
xgetbv instruction is not available to older versions of<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* the assembler, so we =
encode the instruction manually.<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;asm(".byte 0x0f, 0x01, 0xd0" : =
"=3Da" (xcrl), "=3Dd" (xcrh) : "c" (idx));<br class=3D""><br class=3D"">- =
&nbsp;&nbsp;&nbsp;return (((uint64_t)edx) &lt;&lt; 32) | eax;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*xcr =3D =
(((uint64_t)xcrh) &lt;&lt; 32) | xcrl;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return true;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;}<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;return false;<br class=3D""> }<br class=3D""><br =
class=3D""> uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t =
idx,<br class=3D"">@@ -100,12 +107,15 @@ uint32_t =
hvf_get_supported_cpuid(uint32_t func, uint32_t idx,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;break;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;case 0xD:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (idx =3D=3D 0) {<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t=
 host_xcr0 =3D xgetbv(0);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t=
 supp_xcr0 =3D host_xcr0 &amp; (XSTATE_FP_MASK | XSTATE_SSE_MASK |<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XSTATE_YMM_MASK | =
XSTATE_BNDREGS_MASK |<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XSTATE_BNDCSR_MASK | =
XSTATE_OPMASK_MASK |<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XSTATE_ZMM_Hi256_MASK =
| XSTATE_Hi16_ZMM_MASK);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;eax =
&amp;=3D supp_xcr0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint64_t=
 host_xcr0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(xgetbv(ecx, 0, &amp;host_xcr0)) {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;uint64_t supp_xcr0 =3D host_xcr0 &amp; (XSTATE_FP_MASK =
|<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XSTATE_SSE_MASK | =
XSTATE_YMM_MASK |<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XSTATE_BNDREGS_MASK | =
XSTATE_BNDCSR_MASK |<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XSTATE_OPMASK_MASK | =
XSTATE_ZMM_Hi256_MASK |<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XSTATE_Hi16_ZMM_MASK);<b=
r class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;eax &amp;=3D supp_xcr0;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} else if =
(idx =3D=3D 1) {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hv=
_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &amp;cap);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ea=
x &amp;=3D CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1;<br class=3D"">-- =
<br class=3D"">2.20.1 (Apple Git-117)<br class=3D""><br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_C20F662E-A896-4BD7-BA50-E47110B10754--

