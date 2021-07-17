Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701DC3CC506
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:48:51 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oQk-0001bE-Gs
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oO0-0007BQ-BD
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:46:00 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oNw-0004h1-0x
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:45:57 -0400
Received: by mail-wm1-x336.google.com with SMTP id l6so7727796wmq.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WQGmsshDpmH6IcxyjDts+Obvx5UG21r7YK7jyYFINa4=;
 b=FplHy9BVNVLcP2Xb9D07r2yyfmdpZE+NGV0Bfv3zNLqM3WROTb+jlp2uT3+PYG5vEe
 oz9/Oc/Zi4VZL4mRXkkdhWNylUt0sNItSVc8OVfbSz9/+svOUmVuiWseJwyI1sjVobVr
 OwfvXq0DQao9/PNGioBIymmWZQ4l8sRRxo1XvTmLqpWuNkoVNDzG3x/VXYN2BaxOZvFA
 ayL555ZV2auGSZtcjHR4j5UEMHKE2EpM0grg/lzZKbktt24aLy1lhcm0kMoXaW/M/xA+
 dgvdtwLrtkFLetZYr8d+y07jEEHAZ0YTeXpDb7aGuZzC5W9JvtOc2QDjAJ/3WvspuP7j
 8Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WQGmsshDpmH6IcxyjDts+Obvx5UG21r7YK7jyYFINa4=;
 b=je1uj8kYHB+BxwlPUeVDbXtdpdnJQY4cX6LQuJKCXvrK8+zol2yp0UP81FUi1vvIRD
 E2z8FegsXSiaursUDCN3uBID+3xWEnccm7IFUQ9F4qlSxE7m4Ok6CkUpEkUxtTu2VC/q
 67LWBpj7M04FKILRrUxR5NEIhhc1gXM2avRqzBzW3+KXD5bG0OAqEsel5CciZFARFCqg
 o5So2Lged2WD2zlrxGVdbws028b7YoLy/FmEeJMxeekF7Tghe1zn/EevU50d7vTHASTN
 DDolB/ee2jjTvxYZQRHS7l0n/WK9IvI6NGIO+Hz0oM/r19z+TXk73A8dTI54nFXhLzOH
 wcfg==
X-Gm-Message-State: AOAM531KFI/eVmQCYA30ceMFFpptF71fWTdvqTv93RKOVW1fXOru49o2
 IUSA5sFHgSdH1nJarYgT+tox+Q==
X-Google-Smtp-Source: ABdhPJyXJekto8OplCQ2cK6PlCPrUnUsqY5Yprn9xu/FRpHqc4hTk4EdXP4rxVahiyNnMAZf01MWbg==
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr17418441wml.17.1626543953616; 
 Sat, 17 Jul 2021 10:45:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm16418711wrv.72.2021.07.17.10.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 10:45:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 259F91FF7E;
 Sat, 17 Jul 2021 18:45:52 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/10] accel/tcg: Handle -singlestep in curr_cflags
Date: Sat, 17 Jul 2021 18:42:42 +0100
In-reply-to: <20210712154004.1410832-6-richard.henderson@linaro.org>
Message-ID: <87a6mk3kbz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Exchange the test in translator_use_goto_tb for CF_NO_GOTO_TB,
> and the test in tb_gen_code for setting CF_COUNT_MASK to 1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c      | 8 +++++++-
>  accel/tcg/translate-all.c | 2 +-
>  accel/tcg/translator.c    | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 70ea3c7d68..2206c463f5 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -149,7 +149,13 @@ uint32_t curr_cflags(CPUState *cpu)
>  {
>      uint32_t cflags =3D cpu->tcg_cflags;
>=20=20
> -    if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
> +    /*
> +     * For singlestep and -d nochain, suppress goto_tb so that
> +     * we can log -d cpu,exec after every TB.
> +     */
> +    if (singlestep) {

Hmm we are testing a magic global here and looking at
cpu->singlestep_enabled lower down. We have a transient singlestep which
is turned on an off via cpu->singlestep_enabled and a global as a debug
option. Can we rationalise it further?

> +        cflags |=3D CF_NO_GOTO_TB | 1;
> +    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>          cflags |=3D CF_NO_GOTO_TB;
>      }
>=20=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 997e44c73b..491c1a56b2 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1432,7 +1432,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      }
>      QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 !=3D TCG_MAX_INSNS);
>=20=20
> -    if (cpu->singlestep_enabled || singlestep) {
> +    if (cpu->singlestep_enabled) {
>          max_insns =3D 1;
>      }
>=20=20
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index 2ea5a74f30..a59eb7c11b 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -39,7 +39,7 @@ bool translator_use_goto_tb(DisasContextBase *db, targe=
t_ulong dest)
>      }
>=20=20
>      /* Suppress goto_tb in the case of single-steping.  */
> -    if (db->singlestep_enabled || singlestep) {
> +    if (db->singlestep_enabled) {
>          return false;
>      }


--=20
Alex Benn=C3=A9e

