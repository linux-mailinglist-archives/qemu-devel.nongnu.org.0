Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803C3301BCA
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 13:21:58 +0100 (CET)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3eOz-0006u9-2P
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 07:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@vmfacility.fr>)
 id 1l3eM0-0005xu-IZ; Sun, 24 Jan 2021 07:18:52 -0500
Received: from db04.ivansoftware.com ([163.172.81.229]:42156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@vmfacility.fr>)
 id 1l3eLp-0001V3-3t; Sun, 24 Jan 2021 07:18:52 -0500
Received: from [IPv6:2a01:cb19:19d:dd00:64ef:c955:8a97:71f6] (unknown
 [IPv6:2a01:cb19:19d:dd00:64ef:c955:8a97:71f6])
 by db04.ivansoftware.com (Postfix) with ESMTPSA id 2BCF4BE4076;
 Sun, 24 Jan 2021 13:18:37 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at db04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vmfacility.fr;
 s=mail; t=1611490717;
 bh=4nkXpUsCTgACblxfVvg5kqgDzA8Exc1bOI6txNjOUc0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IiEwdwTrc6Q8VdRQzzOJpoBky9cio9XN7lziQQy/tjb/fa6rTDKpUwoLAMQUTTSNW
 Qi3X1gvHW10KS2irTvZmucRnNlAMk4KXwKlYuRoMOg3XzlRdnwpr8mDprftTctvKwV
 XtL21FNDUihaZL5jpV4XXUZyRNSZLcfKgGJEs2lM98p/FHRD+XHYOSORNk4jw4H0a/
 2G/W/mmityvaTYVp45xdMG73rPI8SzHYtl3qwDUY6GtsMgXUOXzv8vD9fFWLLDl/FF
 ULVW7ydDuEa44vWaANYXNZXfpNHQdQ9+wNknfeeuqTXyTog6/vZQ9u9biuvubN29Pr
 B0oVs3Ly1fA5A==
Subject: Re: [PATCH] target/ppc: Fix truncation of env->hflags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210124032422.2113565-1-richard.henderson@linaro.org>
From: Ivan Warren <ivan@vmfacility.fr>
Message-ID: <876b1a03-f01d-9449-a3ce-48b8fd263257@vmfacility.fr>
Date: Sun, 24 Jan 2021 13:18:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210124032422.2113565-1-richard.henderson@linaro.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms090805060503020202030407"
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a cryptographically signed message in MIME format.

--------------ms090805060503020202030407
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Richard,

Reviewed-by:=C2=A0 Ivan Warren=C2=A0 <ivan@vmfacility.fr>

Thanks a million !

--Ivan

On 1/24/2021 4:24 AM, Richard Henderson wrote:
> Use the cs_base field, because it happens to be the same
> size as hflags (and MSR, from which hflags is derived).
>
> In translate, extract most bits from a local hflags variable.
> Mark several cases where code generation is *not* derived from
> data stored within the hashed elements of the TranslationBlock.
>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Reported-by: Ivan Warren <ivan@vmfacility.fr>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/cpu.h       |  4 +--
>   target/ppc/translate.c | 64 ++++++++++++++++-------------------------=
-
>   2 files changed, 26 insertions(+), 42 deletions(-)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2609e4082e..4a05e4e544 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2396,8 +2396,8 @@ static inline void cpu_get_tb_cpu_state(CPUPPCSta=
te *env, target_ulong *pc,
>                                           target_ulong *cs_base, uint32=
_t *flags)
>   {
>       *pc =3D env->nip;
> -    *cs_base =3D 0;
> -    *flags =3D env->hflags;
> +    *cs_base =3D env->hflags;
> +    *flags =3D 0;
>   }
>  =20
>   void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t excepti=
on);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0984ce637b..1eb2e1b0c6 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7879,47 +7879,37 @@ static void ppc_tr_init_disas_context(DisasCont=
extBase *dcbase, CPUState *cs)
>   {
>       DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>       CPUPPCState *env =3D cs->env_ptr;
> +    target_ulong hflags =3D ctx->base.tb->cs_base;
>       int bound;
>  =20
>       ctx->exception =3D POWERPC_EXCP_NONE;
>       ctx->spr_cb =3D env->spr_cb;
> -    ctx->pr =3D msr_pr;
> +    ctx->pr =3D (hflags >> MSR_PR) & 1;
>       ctx->mem_idx =3D env->dmmu_idx;
> -    ctx->dr =3D msr_dr;
> -#if !defined(CONFIG_USER_ONLY)
> -    ctx->hv =3D msr_hv || !env->has_hv_mode;
> +    ctx->dr =3D (hflags >> MSR_DR) & 1;
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +    ctx->hv =3D (hflags >> MSR_HV) & 1;
>   #endif
>       ctx->insns_flags =3D env->insns_flags;
>       ctx->insns_flags2 =3D env->insns_flags2;
>       ctx->access_type =3D -1;
>       ctx->need_access_type =3D !mmu_is_64bit(env->mmu_model);
> -    ctx->le_mode =3D !!(env->hflags & (1 << MSR_LE));
> +    ctx->le_mode =3D (hflags >> MSR_LE) & 1;
>       ctx->default_tcg_memop_mask =3D ctx->le_mode ? MO_LE : MO_BE;
>       ctx->flags =3D env->flags;
>   #if defined(TARGET_PPC64)
> -    ctx->sf_mode =3D msr_is_64bit(env, env->msr);
> +    ctx->sf_mode =3D (hflags >> MSR_SF) & 1;
>       ctx->has_cfar =3D !!(env->flags & POWERPC_FLAG_CFAR);
>   #endif
>       ctx->lazy_tlb_flush =3D env->mmu_model =3D=3D POWERPC_MMU_32B
>           || env->mmu_model =3D=3D POWERPC_MMU_601
>           || env->mmu_model & POWERPC_MMU_64;
>  =20
> -    ctx->fpu_enabled =3D !!msr_fp;
> -    if ((env->flags & POWERPC_FLAG_SPE) && msr_spe) {
> -        ctx->spe_enabled =3D !!msr_spe;
> -    } else {
> -        ctx->spe_enabled =3D false;
> -    }
> -    if ((env->flags & POWERPC_FLAG_VRE) && msr_vr) {
> -        ctx->altivec_enabled =3D !!msr_vr;
> -    } else {
> -        ctx->altivec_enabled =3D false;
> -    }
> -    if ((env->flags & POWERPC_FLAG_VSX) && msr_vsx) {
> -        ctx->vsx_enabled =3D !!msr_vsx;
> -    } else {
> -        ctx->vsx_enabled =3D false;
> -    }
> +    ctx->fpu_enabled =3D (hflags >> MSR_FP) & 1;
> +    ctx->spe_enabled =3D (hflags >> MSR_SPE) & 1;
> +    ctx->altivec_enabled =3D (hflags >> MSR_VR) & 1;
> +    ctx->vsx_enabled =3D (hflags >> MSR_VSX) & 1;
> +    /* FIXME: This needs to be stored in env->hflags_nmsr. */
>       if ((env->flags & POWERPC_FLAG_SCV)
>           && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {
>           ctx->scv_enabled =3D true;
> @@ -7927,23 +7917,21 @@ static void ppc_tr_init_disas_context(DisasCont=
extBase *dcbase, CPUState *cs)
>           ctx->scv_enabled =3D false;
>       }
>   #if defined(TARGET_PPC64)
> -    if ((env->flags & POWERPC_FLAG_TM) && msr_tm) {
> -        ctx->tm_enabled =3D !!msr_tm;
> -    } else {
> -        ctx->tm_enabled =3D false;
> -    }
> +    ctx->tm_enabled =3D (hflags >> MSR_TM) & 1;
>   #endif
> +    /* FIXME: This needs to be stored in env->hflags_nmsr. */
>       ctx->gtse =3D !!(env->spr[SPR_LPCR] & LPCR_GTSE);
> -    if ((env->flags & POWERPC_FLAG_SE) && msr_se) {
> -        ctx->singlestep_enabled =3D CPU_SINGLE_STEP;
> -    } else {
> -        ctx->singlestep_enabled =3D 0;
> -    }
> -    if ((env->flags & POWERPC_FLAG_BE) && msr_be) {
> -        ctx->singlestep_enabled |=3D CPU_BRANCH_STEP;
> -    }
> -    if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
> +
> +    ctx->singlestep_enabled =3D ((hflags >> MSR_SE) & 1 ? CPU_SINGLE_S=
TEP : 0)
> +                            | ((hflags >> MSR_BE) & 1 ? CPU_BRANCH_STE=
P : 0);
> +
> +    if ((hflags >> MSR_DE) & 1) {
>           ctx->singlestep_enabled =3D 0;
> +        /*
> +         * FIXME: This needs to be stored in env->hflags_nmsr,
> +         * probably overlapping MSR_SE/MSR_BE like we do for
> +         * MSR_LE and the ppc 601.
> +         */
>           target_ulong dbcr0 =3D env->spr[SPR_BOOKE_DBCR0];
>           if (dbcr0 & DBCR0_ICMP) {
>               ctx->singlestep_enabled |=3D CPU_SINGLE_STEP;
> @@ -7956,10 +7944,6 @@ static void ppc_tr_init_disas_context(DisasConte=
xtBase *dcbase, CPUState *cs)
>       if (unlikely(ctx->base.singlestep_enabled)) {
>           ctx->singlestep_enabled |=3D GDBSTUB_SINGLE_STEP;
>       }
> -#if defined(DO_SINGLE_STEP) && 0
> -    /* Single step trace mode */
> -    msr_se =3D 1;
> -#endif
>  =20
>       bound =3D -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
>       ctx->base.max_insns =3D MIN(ctx->base.max_insns, bound);


--------------ms090805060503020202030407
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDEyNDEyMTgzNFowLwYJKoZIhvcNAQkE
MSIEIDtgtlJPO1Sd9Kc6+j1XjN/W74LBp2YRBG+c3Ix6sdL1MGwGCSqGSIb3DQEJDzFfMF0w
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAw
DQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgbwGCSsGAQQBgjcQBDGB
rjCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4G
A1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0
aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQAUsx
i7HsmGkuUPsvFswztzCBvgYLKoZIhvcNAQkQAgsxga6ggaswgZYxCzAJBgNVBAYTAkdCMRsw
GQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoT
D1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRp
Y2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEAFLMYux7JhpLlD7LxbMM7cwDQYJKoZIhvcN
AQEBBQAEggEAHfAk6yRfeYgHlIzXb/t3+kJP6jASM1GccrxlzaV18zJpSEIm8A03BNufKdZo
IO/H9TZS/VUch0WOYfgYXfiqs1bPiocD5fYy8EHzMlArKf2yrfI9n+TSz7j3jY0Lm6yWeWdL
RICLm9IS52jZHAfOO8n0ESGqN2wBI4osO2jh2cp6KuR7YZ2MVP9ObFgpJw/W2xkflOjkpuOC
nWNLi/MzuReKoCRhNTCKmzdlB/xSwI15HpNIQjkSXsLlkLO4HAf3ZplmDROihqL9wE3LX6H3
QzBDAX4eORPDdfVmSL7h8yDNYbkAvNlM1kDJpeswcvMpEOI2OyFQpN9XPyOQWqL3awAAAAAA
AA==
--------------ms090805060503020202030407--

