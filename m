Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DDE336AA1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:24:37 +0100 (CET)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBwB-0002tk-K7
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@vmfacility.fr>)
 id 1lKBua-0002Kl-AG; Wed, 10 Mar 2021 22:22:56 -0500
Received: from db04.ivansoftware.com ([163.172.81.229]:51204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@vmfacility.fr>)
 id 1lKBuV-0003P2-Fe; Wed, 10 Mar 2021 22:22:55 -0500
Received: from [IPv6:2a01:cb19:19d:dd00:64ef:c955:8a97:71f6] (unknown
 [IPv6:2a01:cb19:19d:dd00:64ef:c955:8a97:71f6])
 by db04.ivansoftware.com (Postfix) with ESMTPSA id 1133BBE3F67;
 Thu, 11 Mar 2021 04:22:48 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at db04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vmfacility.fr;
 s=mail; t=1615432968;
 bh=1RAbMiGFOyA9lkEjZm9ELe2ImU4sDKhIOgEwHBa+tQc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B+ig1+pbBDgGaw6MEDgIGfc2kyQsmjKC7idzMy41rfuXw192u2MaQe0+UEhZoz0gt
 VKTqRri/s5titeSpRGcwSx4ui30jmpnMeE6aqsNVNtxmIU4BkxHUUsU904A0PFVVN2
 iOuTcfVvZRKu1NMlVmusdyZrv4Fyk16BVeJNHgbNyRTDyFDPRs9z367FJ3M6su86vi
 2GsPr+9kseztrtGcryV4nNBzdKfqxuzZynAKhaM+mT5Sfdw/ww8My67hx+BbwM/3oo
 JDhGicHl+6ThVl3iPcGcjrCNpqLJuaF9oMDqog+2MT/Iy1aVK1Yjtvo6x6PA7Ens0v
 n6Nx/WjNImn0g==
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
To: David Gibson <david@gibson.dropbear.id.au>
Cc: peter.maydell@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
 <503c3c5e-3dd2-adba-2d2c-2e5f8618fc3a@vmfacility.fr>
 <YEl2rC3TOetSiqh8@yekko.fritz.box>
From: Ivan Warren <ivan@vmfacility.fr>
Message-ID: <e6bee42f-661b-a5a6-bb45-0b93167fb227@vmfacility.fr>
Date: Thu, 11 Mar 2021 04:22:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEl2rC3TOetSiqh8@yekko.fritz.box>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms020903000306040207060607"
Received-SPF: pass client-ip=163.172.81.229; envelope-from=ivan@vmfacility.fr;
 helo=db04.ivansoftware.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a cryptographically signed message in MIME format.

--------------ms020903000306040207060607
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 3/11/2021 2:47 AM, David Gibson wrote:
>
> Sorry, I've forgotten this issue.  If you had a patch, can you resend
> it please.

Not mine.. (I reported it, but can't remember who sent it)...

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h

index 2609e4082e..4a05e4e544 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2396,8 +2396,8 @@ static inline void=20
cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 target_ulong *cs_base,=20
uint32_t *flags)
 =A0{
 =A0=A0=A0=A0 *pc =3D env->nip;
-=A0=A0=A0 *cs_base =3D 0;
-=A0=A0=A0 *flags =3D env->hflags;
+=A0=A0=A0 *cs_base =3D env->hflags;
+=A0=A0=A0 *flags =3D 0;
 =A0}

 =A0void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t excepti=
on);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0984ce637b..1eb2e1b0c6 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7879,47 +7879,37 @@ static void=20
ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 =A0{
 =A0=A0=A0=A0 DisasContext *ctx =3D container_of(dcbase, DisasContext, ba=
se);
 =A0=A0=A0=A0 CPUPPCState *env =3D cs->env_ptr;
+=A0=A0=A0 target_ulong hflags =3D ctx->base.tb->cs_base;
 =A0=A0=A0=A0 int bound;

 =A0=A0=A0=A0 ctx->exception =3D POWERPC_EXCP_NONE;
 =A0=A0=A0=A0 ctx->spr_cb =3D env->spr_cb;
-=A0=A0=A0 ctx->pr =3D msr_pr;
+=A0=A0=A0 ctx->pr =3D (hflags >> MSR_PR) & 1;
 =A0=A0=A0=A0 ctx->mem_idx =3D env->dmmu_idx;
-=A0=A0=A0 ctx->dr =3D msr_dr;
-#if !defined(CONFIG_USER_ONLY)
-=A0=A0=A0 ctx->hv =3D msr_hv || !env->has_hv_mode;
+=A0=A0=A0 ctx->dr =3D (hflags >> MSR_DR) & 1;
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+=A0=A0=A0 ctx->hv =3D (hflags >> MSR_HV) & 1;
 =A0#endif
 =A0=A0=A0=A0 ctx->insns_flags =3D env->insns_flags;
 =A0=A0=A0=A0 ctx->insns_flags2 =3D env->insns_flags2;
 =A0=A0=A0=A0 ctx->access_type =3D -1;
 =A0=A0=A0=A0 ctx->need_access_type =3D !mmu_is_64bit(env->mmu_model);
-=A0=A0=A0 ctx->le_mode =3D !!(env->hflags & (1 << MSR_LE));
+=A0=A0=A0 ctx->le_mode =3D (hflags >> MSR_LE) & 1;
 =A0=A0=A0=A0 ctx->default_tcg_memop_mask =3D ctx->le_mode ? MO_LE : MO_B=
E;
 =A0=A0=A0=A0 ctx->flags =3D env->flags;
 =A0#if defined(TARGET_PPC64)
-=A0=A0=A0 ctx->sf_mode =3D msr_is_64bit(env, env->msr);
+=A0=A0=A0 ctx->sf_mode =3D (hflags >> MSR_SF) & 1;
 =A0=A0=A0=A0 ctx->has_cfar =3D !!(env->flags & POWERPC_FLAG_CFAR);
 =A0#endif
 =A0=A0=A0=A0 ctx->lazy_tlb_flush =3D env->mmu_model =3D=3D POWERPC_MMU_3=
2B
 =A0=A0=A0=A0=A0=A0=A0=A0 || env->mmu_model =3D=3D POWERPC_MMU_601
 =A0=A0=A0=A0=A0=A0=A0=A0 || env->mmu_model & POWERPC_MMU_64;

-=A0=A0=A0 ctx->fpu_enabled =3D !!msr_fp;
-=A0=A0=A0 if ((env->flags & POWERPC_FLAG_SPE) && msr_spe) {
-=A0=A0=A0=A0=A0=A0=A0 ctx->spe_enabled =3D !!msr_spe;
-=A0=A0=A0 } else {
-=A0=A0=A0=A0=A0=A0=A0 ctx->spe_enabled =3D false;
-=A0=A0=A0 }
-=A0=A0=A0 if ((env->flags & POWERPC_FLAG_VRE) && msr_vr) {
-=A0=A0=A0=A0=A0=A0=A0 ctx->altivec_enabled =3D !!msr_vr;
-=A0=A0=A0 } else {
-=A0=A0=A0=A0=A0=A0=A0 ctx->altivec_enabled =3D false;
-=A0=A0=A0 }
-=A0=A0=A0 if ((env->flags & POWERPC_FLAG_VSX) && msr_vsx) {
-=A0=A0=A0=A0=A0=A0=A0 ctx->vsx_enabled =3D !!msr_vsx;
-=A0=A0=A0 } else {
-=A0=A0=A0=A0=A0=A0=A0 ctx->vsx_enabled =3D false;
-=A0=A0=A0 }
+=A0=A0=A0 ctx->fpu_enabled =3D (hflags >> MSR_FP) & 1;
+=A0=A0=A0 ctx->spe_enabled =3D (hflags >> MSR_SPE) & 1;
+=A0=A0=A0 ctx->altivec_enabled =3D (hflags >> MSR_VR) & 1;
+=A0=A0=A0 ctx->vsx_enabled =3D (hflags >> MSR_VSX) & 1;
+=A0=A0=A0 /* FIXME: This needs to be stored in env->hflags_nmsr. */
 =A0=A0=A0=A0 if ((env->flags & POWERPC_FLAG_SCV)
 =A0=A0=A0=A0=A0=A0=A0=A0 && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {=

 =A0=A0=A0=A0=A0=A0=A0=A0 ctx->scv_enabled =3D true;
@@ -7927,23 +7917,21 @@ static void=20
ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 =A0=A0=A0=A0=A0=A0=A0=A0 ctx->scv_enabled =3D false;
 =A0=A0=A0=A0 }
 =A0#if defined(TARGET_PPC64)
-=A0=A0=A0 if ((env->flags & POWERPC_FLAG_TM) && msr_tm) {
-=A0=A0=A0=A0=A0=A0=A0 ctx->tm_enabled =3D !!msr_tm;
-=A0=A0=A0 } else {
-=A0=A0=A0=A0=A0=A0=A0 ctx->tm_enabled =3D false;
-=A0=A0=A0 }
+=A0=A0=A0 ctx->tm_enabled =3D (hflags >> MSR_TM) & 1;
 =A0#endif
+=A0=A0=A0 /* FIXME: This needs to be stored in env->hflags_nmsr. */
 =A0=A0=A0=A0 ctx->gtse =3D !!(env->spr[SPR_LPCR] & LPCR_GTSE);
-=A0=A0=A0 if ((env->flags & POWERPC_FLAG_SE) && msr_se) {
-=A0=A0=A0=A0=A0=A0=A0 ctx->singlestep_enabled =3D CPU_SINGLE_STEP;
-=A0=A0=A0 } else {
-=A0=A0=A0=A0=A0=A0=A0 ctx->singlestep_enabled =3D 0;
-=A0=A0=A0 }
-=A0=A0=A0 if ((env->flags & POWERPC_FLAG_BE) && msr_be) {
-=A0=A0=A0=A0=A0=A0=A0 ctx->singlestep_enabled |=3D CPU_BRANCH_STEP;
-=A0=A0=A0 }
-=A0=A0=A0 if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
+
+=A0=A0=A0 ctx->singlestep_enabled =3D ((hflags >> MSR_SE) & 1 ? CPU_SING=
LE_STEP=20
: 0)
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | ((hflags >> MSR_BE) & 1 ? CPU_BRANCH_STEP=20
: 0);
+
+=A0=A0=A0 if ((hflags >> MSR_DE) & 1) {
 =A0=A0=A0=A0=A0=A0=A0=A0 ctx->singlestep_enabled =3D 0;
+=A0=A0=A0=A0=A0=A0=A0 /*
+=A0=A0=A0=A0=A0=A0=A0=A0 * FIXME: This needs to be stored in env->hflags=
_nmsr,
+=A0=A0=A0=A0=A0=A0=A0=A0 * probably overlapping MSR_SE/MSR_BE like we do=
 for
+=A0=A0=A0=A0=A0=A0=A0=A0 * MSR_LE and the ppc 601.
+=A0=A0=A0=A0=A0=A0=A0=A0 */
 =A0=A0=A0=A0=A0=A0=A0=A0 target_ulong dbcr0 =3D env->spr[SPR_BOOKE_DBCR0=
];
 =A0=A0=A0=A0=A0=A0=A0=A0 if (dbcr0 & DBCR0_ICMP) {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctx->singlestep_enabled |=3D CPU_SI=
NGLE_STEP;
@@ -7956,10 +7944,6 @@ static void=20
ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 =A0=A0=A0=A0 if (unlikely(ctx->base.singlestep_enabled)) {
 =A0=A0=A0=A0=A0=A0=A0=A0 ctx->singlestep_enabled |=3D GDBSTUB_SINGLE_STE=
P;
 =A0=A0=A0=A0 }



--------------ms020903000306040207060607
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CykwggURMIID+aADAgECAhABSzGLseyYaS5Q+y8WzDO3MA0GCSqGSIb3DQEBCwUAMIGWMQsw
CQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxm
b3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDcwNDAwMDAw
MFoXDTIyMDcwMzIzNTk1OVowIzEhMB8GCSqGSIb3DQEJARYSaXZhbkB2bWZhY2lsaXR5LmZy
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA16J+MNpaqIEV5b2WoLC+l2PP5n3W
CtXrhU04ursB8Ib+TIGaJQQigdKp2pX7xwY9F/h1vukcYHNxILOvpop8AYyFbCMwmh0r2vZs
hDpYA1adv7wGsL3tbV155FTk0RewY8//18CaQ/SwVMRiUtqwbsUlbHkHtQRm32r/Otpzjd4/
vcTshpsPRIcxEib2UMRP6WGjHurC4rd/3pcWlP/GsjA/aGNb9yaNunHBTJzVaqSeiwwYObco
sJi1199wNBePGrZK6WF3XumgA6++kTKEieJ6hSj2amTR80VaYIzKyjCu4SklI7+ouBL/8UsN
ljRrIL8sCLkyBlYjWYNsQR3ZbQIDAQABo4IByzCCAccwHwYDVR0jBBgwFoAUCcDy/AvalNtf
/ivfqJlCz8ngrQAwHQYDVR0OBBYEFEmwhbO6wfSTbflKHMQwSp7HWMGvMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjBABgNV
HSAEOTA3MDUGDCsGAQQBsjEBAgEBATAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28u
Y29tL0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEF
BQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JT
QUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGG
F2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMB0GA1UdEQQWMBSBEml2YW5Adm1mYWNpbGl0eS5m
cjANBgkqhkiG9w0BAQsFAAOCAQEAPXjOtK7xHfpAU3HUn5hIlaWUzkbaMI1R8tiefaJsHJks
4dkh/IqQhI+3yCjPybY38NP+ctwgpOZo7ARK/lLKo4+yooYs+5MrwCvP2Kw2RKPp+ZjhJIWX
DVcoVUxkONrVJH/VuTB3zeJDZ9nrODK9D3X1W2+8srQKgDjlx0sLYuBQEwNDEft9Ag9rL4/5
X1nlZJZbR8KWM0BxpHYTi7iGL2Gk8GE+beHDmyCAJHolkcs6G3GXwsp03hm300PGbEVsuWgA
5zHW90OSi/5CnrN15TaOC2yd9nRsobe5ajJAUjvCyVrl+tLmiM/KYJ24/R5Mb+CF6HhhiUa4
IwbWGZZbgzCCBhAwggP4oAMCAQICEE2ULBDUO+CUCcWBLTorBk8wDQYJKoZIhvcNAQEMBQAw
gYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkg
Q2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1
c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTE4MTEwMjAwMDAwMFoXDTMwMTIz
MTIzNTk1OVowgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIx
EDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1
U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0Ew
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDKPO2UCkH/3vlGuejWO+bakr8rEE6q
GryCvb4mHCkqKtLNnFCBP22ULvOXqGfV9eNKjkypdR8i0yW2sxpepwRIm4rx20rno0JKuriI
Mpoqr03E5cWapdfbM3wccaNDZvZe/S/Uvk2TUxA8oDX3F5ZBykYQYVRR3SQ36gejH4v1pXWu
N82IKPdsmTqQlo49ps+LbnTeef8hNfl7xZ8+cbDhW5nv0qGPVgGt/biTkR7WwtMewu2mIr06
MbiJBEF2rpn9OVXH+EYB7PmHfpsEkzGp0cul3AhSROpPyx7d53Q97ANyH/yQc+jl9mXm7UHR
5ymr+wM3/mwIbnYOz5BTk7kTAgMBAAGjggFkMIIBYDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA
4dibwJ3ysgNmyzAdBgNVHQ4EFgQUCcDy/AvalNtf/ivfqJlCz8ngrQAwDgYDVR0PAQH/BAQD
AgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwME
MBEGA1UdIAQKMAgwBgYEVR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0
cnVzdC5jb20vVVNFUlRydXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwdgYIKwYB
BQUHAQEEajBoMD8GCCsGAQUFBzAChjNodHRwOi8vY3J0LnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQWRkVHJ1c3RDQS5jcnQwJQYIKwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVz
dC5jb20wDQYJKoZIhvcNAQEMBQADggIBAEFEdQCrOcIV9d6OlW0ycWiMAN0X13ocEDiQyOOx
vRcxkfO244K0oX7GzCGHYaqRbklCszzNWVT4DZU/vYrLaeVEDUbCYg+Ci7vhNn9dNqscbzN0
xKBoOuRVjPPWDechU70geT3pXCxpwi8EXwl+oiz7xpYfY99JSs3E/piztTSxljHitcPr5yoW
r9lbkFR8KU3+uGTZ11BfKfuSSaRrZFBv133SeY0d2AqvB9Dj2ZDaFZA0OQkkhfAqNgDpVRH9
9lQV4JSKx0N7/QAEtMj6OF5dRXV6hhXuU3A0Eql4d0247oBpxvnfcmV95QfG8HP059hZSJe7
T2wwC+IzXVDQO4xnnvrQJ07ZWemxc/grFpgiG+o+pQxapF1bKftysi02Rl6uhdp5wbTeLeYz
t2SI9oKSChwGDQQFixtkNnxuwbdrTwvASwvViDPdIGzIQJrTBqriE5/9nzkXbDZmld8/7Dyr
iJ/A73RIZllX4dH8mHqsRpU8NEX8IQZWpHWGK5A5nVgvl7MxNfRlIvCvKZQTSnCL8oNqJgHX
m6zCB4gBwDonM8V/2kuQAUVazVA3I376eIWGwzjuqh3H88v7mNHzubLHm5h0ERCSQNz6UoHV
Zy3q5xeqbYSaxpDQz3lCNObL6sNaOQNh3DcyzqZJYTcGfuLlmC3AIteAAh7lbybJszYnMYIE
MjCCBC4CAQEwgaswgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0
ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UE
AxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwg
Q0ECEAFLMYux7JhpLlD7LxbMM7cwDQYJYIZIAWUDBAIBBQCgggJXMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDMxMTAzMjI0NVowLwYJKoZIhvcNAQkE
MSIEIM6xz1MOLs0Yufeo6dp9/chLy0hSvhG7SA59eTfT9mcBMGwGCSqGSIb3DQEJDzFfMF0w
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAw
DQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgbwGCSsGAQQBgjcQBDGB
rjCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4G
A1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0
aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQAUsx
i7HsmGkuUPsvFswztzCBvgYLKoZIhvcNAQkQAgsxga6ggaswgZYxCzAJBgNVBAYTAkdCMRsw
GQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoT
D1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRp
Y2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEAFLMYux7JhpLlD7LxbMM7cwDQYJKoZIhvcN
AQEBBQAEggEAgtD3OocQj2M6CNHtjBfhLbZFgFZiMsGAFGP4G11QZgS87IUrcJqKhEDs+Yoz
AWLZMGedMzjBJ3Y6Jb8d8gbaxyBrIoVX7DvT3o8ync0v+TJhxUrk09r8RSahLLvbrs465PCT
BrGnURLI7dpMgOPM2B5cniGPYhrNSyx8a111/aC3z0TPSJEHC0ygjTlAd8BfxRrj/bmQ+oSf
vo2JJUYUN66NlHRyoIxGODGrIX6ueyqZRq732pFcFJF5WqgAu/0M7rYXqN5YjcUoOmIMx5O3
fmys0qXNuww2O3Fxv1V8rHxtDwZQYd4JhkoETuGs3qfkvfF5v1ipHwezkwYWd74J2gAAAAAA
AA==
--------------ms020903000306040207060607--

