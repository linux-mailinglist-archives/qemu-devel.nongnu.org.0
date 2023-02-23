Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1766A0E0C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:29:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVESQ-0004Jh-ET; Thu, 23 Feb 2023 11:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVESO-0004Ig-IK
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:28:32 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVESN-00069t-0K
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:28:32 -0500
Received: by mail-pl1-x633.google.com with SMTP id z2so13723228plf.12
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5yAy70DUx5lQzC8BQFWUqB/z2e5qhz0qG3VRVZ5iRrc=;
 b=F3HwFEpWyeaJeGN6jtU8ifwwAtVszUEF+eSMvUaEZjdu3GtGG2ejPIVxCblpZQuUyI
 aFRa8dQJLr8+vUXatg0fHljtrbqzhejDzEN2PIz4lMbbrFt60RIZlMYw6e94BKON2+2u
 pbpJLyz7ux42P923p/2Xgf6rv8VOcOPwd9jkNn7d9YiKVPXGaPjkw/1KQYfyLDOS2cqY
 hCOZwE7AXjbO0pO/kXfxI3I1fZW0uzMA022IuodbSiHQbxcfiZoRH9n9ALqmR0gnwxcW
 cc4sMJu2pEcM3xMyovyFG5VB2qxZDECk3T3UtPUXSeUwv+FxsT0gTV7XVOND83EB6dAh
 oAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5yAy70DUx5lQzC8BQFWUqB/z2e5qhz0qG3VRVZ5iRrc=;
 b=giOrqcO9oBJZHPGmDVrNgrXYju8JGeUM6LhbbAOPtg36Na+WwCK8hxKIZAxnvXQOxp
 xc61MXcfpJNC/kjG4tjtMdmwvCA38VjYE1VTX3MjPsyqkvK3uqfAQWM83a9FbjGIBl0Z
 JYSkGVIhm6iYSTABOmtaAnSL6CkUD2H/6xsnqFm7vCQAKYERG/NyEX+fcNxhcUfYOGZ7
 sAOaFZsoSnDWZl9H5HMZOLyUTyT6feBBD1XFzQMPYjvZ6De6iqpeVdjT4CtQLG2YVshO
 QIMg6xfk/iMjz4n3jk8nIC7c0yrUVN+TZ6HJB3bHgTHZ41mkNqLE3IvsM9Zry8OLMFST
 0LLQ==
X-Gm-Message-State: AO0yUKXMRxqrnate+IxcIuQqeOzyW2jOIISoOmZEgpT7KHFK6MDq6HiX
 eGpuNSUN0Kob1v0vqkzzS7gKGYiOYfo25acR10t3kg==
X-Google-Smtp-Source: AK7set/IFLN8vxyemUUGPc94dj01lDJguAMxckMtjDNeRLAN3Djo0cFZzt8H/+L8YVQpgieqNFN4qWCH7DqNFe59zuc=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1265744pjb.137.1677169709302; Thu, 23
 Feb 2023 08:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-15-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:28:18 +0000
Message-ID: <CAFEAcA_N1zcgg44v7AmKgHJiuE=Od0cCV8q1OW1YS9_hJFAYhw@mail.gmail.com>
Subject: Re: [PATCH v1 14/19] target/arm: Check alignment in helper_mte_check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes a bug in that with SCTLR.A set, we should raise any
> alignment fault before raising any MTE check fault.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h     |  3 ++-
>  target/arm/mte_helper.c    | 18 ++++++++++++++++++
>  target/arm/translate-a64.c |  2 ++
>  3 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index e1e018da46..fa264e368c 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1222,7 +1222,8 @@ FIELD(MTEDESC, MIDX,  0, 4)
>  FIELD(MTEDESC, TBI,   4, 2)
>  FIELD(MTEDESC, TCMA,  6, 2)
>  FIELD(MTEDESC, WRITE, 8, 1)
> -FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
> +FIELD(MTEDESC, ALIGN, 9, 3)
> +FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
>
>  bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
>  uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 98bcf59c22..e50bb4ea13 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -784,6 +784,24 @@ uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
>
>  uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
>  {
> +    /*
> +     * In the Arm ARM pseudocode, the alignment check happens at the top
> +     * of Mem[], while the MTE check happens later in AArch64.MemSingle[].
> +     * Thus the alignment check has priority.
> +     * When the mte check is disabled, tcg performs the alignment check
> +     * during the code generated for the memory access.
> +     */

Also described in the text: the I_ZFGJP priority table lists
MTE faults at priority 33, basically lower than anything else
except an external abort.

Looking at the code, is this really the only case here where
we were mis-prioritizing tag check faults? Have we already
checked things like "no page table entry" and all the other
cases that can cause data aborts at this point?

thanks
-- PMM

