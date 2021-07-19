Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4F3CD129
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:49:49 +0200 (CEST)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PuH-0001Zl-10
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Pt8-0000fw-Om
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:48:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Pt6-0005k4-TX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:48:38 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso12417094wmh.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=N28Dy6wpJ/edwPx+7NckFwbXEeGsjej1Dv5Lga8PRuU=;
 b=B6xepJRLAr7/e+3Beb1K1PY2azBiG4tcKWWVObVZP5N3yFC2riFTt4TkQj+8maUDF6
 /VAAJLNM/D9Lz5hycuVdYGohUR1iSmELJTE2kUD7rzTY09mciulokH734LyS1dK8XYa5
 InOuiEPxBNOmFZIrSHEQRoQMDP+a2o8Hr5mXEL0+DE3M3lCdo/zmRaV08PL3gtfSQZEM
 YoixfZnvqsMCLadcEqCQhF2XdlyNnlGKH823LqAaZng5VcgOyXQgFHwRvCCVApQSJWJQ
 d3vKhnNQdqfswOhcWqKzUeKMADuTyWQeciuF8N36DuEYeEVPa6pioFIwRQg5D3SFx2Ef
 FLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=N28Dy6wpJ/edwPx+7NckFwbXEeGsjej1Dv5Lga8PRuU=;
 b=n+dfForGQ377g2LFWaPW6fDhsWHQ0EzgS4+RkAH/fUGw1k2K0jct19tbqVnvp1A3hT
 lNWADf4yH1v4xD+cZUR6L+pHBgwwYE3uSxGtBcPWEMyuTu+UmBT6tBQqRCL505GuNRyT
 nDOb9mkh878AaxBfq0emG6tDmRFVkV3dpMVtHcri6KKjoccqKfPgt9sggM2/f+rlQklj
 errp52ktPUCr1k7+0QzQViLyWsyUuXzWPfcHV04aphpKUIegbKtGH1de9gQQnSbnjN6w
 PiUsVw9vpha4wUiXRJInzvf3sblC5PwRZzyfkFGPzzIKbfJShAjMWW9ddjPmYVmpgWw7
 ag6g==
X-Gm-Message-State: AOAM532KNtmKkeI5/Uxr2VIJSO8vcta/ywZe/0t+9pLj3M7kGo4NeajD
 VTrFwz1lmI0gZVEUNxkgGhm+Kw==
X-Google-Smtp-Source: ABdhPJyWkdIduIAerYt3odnxG66P7BWNolcVdsDYYUNWBh7ZTcwxp0C12cKWJ80EnETC0MVw+rq/tQ==
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr30832954wml.72.1626688115301; 
 Mon, 19 Jul 2021 02:48:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a10sm19239136wrm.12.2021.07.19.02.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 02:48:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C2491FF7E;
 Mon, 19 Jul 2021 10:48:33 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-4-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 3/6] plugins/cache: Fixed a use-after-free bug with
 multithreaded usermode
Date: Mon, 19 Jul 2021 10:45:26 +0100
In-reply-to: <20210714172151.8494-4-ma.mandourr@gmail.com>
Message-ID: <87zguiprbi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Since callbacks may be interleaved because of multithreaded execution,
> we should not make assumptions about `plugin_exit` either. The problem
> with `plugin_exit` is that it frees shared data structures (caches and
> `miss_ht` hash table). It should not be assumed that callbacks will not
> be called after it and hence use already-freed data structures.

What was your test case for this because I wonder if it would be worth
coming up with one for check-tcg? From what I remember the race is
in between preexit_cleanup and the eventual _exit/exit_group which nixes
all other child threads. Maybe we should be triggering a more graceful
unload here?

> This is mitigated in this commit by synchronizing the call to
> `plugin_exit` through locking to ensure execlusive access to data
> structures, and NULL-ifying those data structures so that subsequent
> callbacks can check whether the data strucutres are freed, and if so,
> immediately exit.
>
> It's okay to immediately exit and don't account for those callbacks
> since they won't be accounted for anyway since `plugin_exit` is already
> called once and reported the statistics.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 695fb969dc..a452aba01c 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned int vcpu_index,=
 qemu_plugin_meminfo_t info,
>      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : v=
addr;
>=20=20
>      g_mutex_lock(&mtx);
> +    if (dcache =3D=3D NULL) {
> +        g_mutex_unlock(&mtx);
> +        return;
> +    }
> +
>      if (!access_cache(dcache, effective_addr)) {
>          insn =3D (InsnData *) userdata;
>          insn->dmisses++;
> @@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned int vcpu_index, =
void *userdata)
>      g_mutex_lock(&mtx);
>      insn_addr =3D ((InsnData *) userdata)->addr;
>=20=20
> +    if (icache =3D=3D NULL) {
> +        g_mutex_unlock(&mtx);
> +        return;
> +    }
> +
>      if (!access_cache(icache, insn_addr)) {
>          insn =3D (InsnData *) userdata;
>          insn->imisses++;
> @@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, stru=
ct qemu_plugin_tb *tb)
>              effective_addr =3D (uint64_t) qemu_plugin_insn_vaddr(insn);
>          }
>=20=20
> +        g_mutex_lock(&mtx);
> +
> +        /*
> +         * is the plugin_exit callback called? If so, any further callba=
ck
> +         * registration is useless as it won't get accounted for after c=
alling
> +         * plugin_exit once already, and also will use miss_ht after it'=
s freed
> +         */
> +        if (miss_ht =3D=3D NULL) {
> +            g_mutex_unlock(&mtx);
> +            return;
> +        }
> +
>          /*
>           * Instructions might get translated multiple times, we do not c=
reate
>           * new entries for those instructions. Instead, we fetch the same
>           * entry from the hash table and register it for the callback ag=
ain.
>           */
> -        g_mutex_lock(&mtx);
> +
>          data =3D g_hash_table_lookup(miss_ht, GUINT_TO_POINTER(effective=
_addr));
>          if (data =3D=3D NULL) {
>              data =3D g_new0(InsnData, 1);
> @@ -527,13 +549,20 @@ static void log_top_insns()
>=20=20
>  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  {
> +    g_mutex_lock(&mtx);
>      log_stats();
>      log_top_insns();
>=20=20
>      cache_free(dcache);
> +    dcache =3D NULL;
> +
>      cache_free(icache);
> +    icache =3D NULL;
>=20=20
>      g_hash_table_destroy(miss_ht);
> +    miss_ht =3D NULL;
> +
> +    g_mutex_unlock(&mtx);
>  }
>=20=20
>  static void policy_init()


--=20
Alex Benn=C3=A9e

