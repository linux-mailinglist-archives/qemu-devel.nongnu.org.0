Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C33346D97
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:52:39 +0100 (CET)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpt8-0001v5-V8
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOps2-0001Dk-1i
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:51:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOps0-0002lH-5w
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:51:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id b16so25423878eds.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 15:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CG5WIW6CUTZdZM/dpGmIPNFSSRzObj8FrnIdDXStcVI=;
 b=h8JIQmA0/zKhg4IuEdNRCLQWP6eoOd7WvV/iYNJdoKzg6RrXbXM+mmbdb1HU477ta8
 1u5i0n0Llr9vzqNmyl3JIwf83zKuodss7Sw7LDctGUu3pRArgIZA3MSX6E2l0uAyVkQw
 5/LuhsqleKHHhQm07NjORb1yq8OPI7Lx/ADuEoMzSLu1aTTsa7vEeOEuIDn9hSYsvl60
 T3CBHRPgqiekspyjjYNbyomYkRPQBw3dlr8RAs38WT+Y8O+K4d3ILSrMHxsmjk2+dGtB
 TlHhM72Wr/uXV35vd/B3i9LGnfvCOvGbQatPKUvHfkQVlxInQMDWEWqKNpgga89W40bR
 exUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CG5WIW6CUTZdZM/dpGmIPNFSSRzObj8FrnIdDXStcVI=;
 b=BkSHI4EUWOFkbHQRbwxTJNzY/ntjJU7OJOtUmEcwhbhV9+V8XU3TpXtYFh0yUM0759
 N+nbbXCGyNqZGNbGxgT/X7RTzJDws58pwWKy0QulGaKnHi82arpog6et73wZ3t9/d+Wv
 Z9Ne1JOaT2jJCIM1G+LJpivzgI26xiGITREPrO56gX8o5FnGURr2WnSPBe0MDJEDG0Co
 k3pAxhp2JeHPe10tFClkd588CCNHCKxCNzcIAYxEWjzrnsIcuiXzRvog4XYSXCA+2jsh
 T7ny3ZPPzMqdUK5YR75iukpeWqIBsLbyU7Wdh9MKQPKrjfcVncLFz1uvPVgngKJbru1T
 mBGw==
X-Gm-Message-State: AOAM530ZkmnoEx3fmnnm/HU94XT3U29wgebdS8Hm5hBSs5l+8duovGFx
 dGhc6JQJZR+ABi0wVhENqXscRw==
X-Google-Smtp-Source: ABdhPJx/SidvcANu4UyGPZu1XqnTwNN9My6Q3Jt5qsg2tnvaIOa1q2oNdN5+YBjjRllkUAJ/ypdpdw==
X-Received: by 2002:aa7:cb82:: with SMTP id r2mr140108edt.209.1616539886135;
 Tue, 23 Mar 2021 15:51:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bj7sm64883ejb.28.2021.03.23.15.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:51:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 357C61FF7E;
 Tue, 23 Mar 2021 22:51:24 +0000 (GMT)
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-23-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v11 30/55] target/arm: wrap call to aarch64_sve_change_el
 in tcg_enabled()
Date: Tue, 23 Mar 2021 22:50:48 +0000
In-reply-to: <20210323154639.23477-23-cfontana@suse.de>
Message-ID: <87eeg5iivn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> After this patch it is possible to build only kvm:
>
> ./configure --disable-tcg --enable-kvm

FWIW at this point we get a different failure than later on:

  21:10:25 [alex@aarch64-new:~/l/q/b/disable.tcg] (94e2abe0=E2=80=A6)|=E2=
=80=A6 + make check-qtest
    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley=
-softfloat-3 meson dtc capstone slirp
  [1/19] Generating qemu-version.h with a meson_exe.py custom command
  Running test qtest-aarch64/qom-test
  qemu-system-aarch64: missing interface 'idau-interface' for object 'machi=
ne'
  socket_accept failed: Resource temporarily unavailable
  **
  ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake: =
assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
  ERROR qtest-aarch64/qom-test - Bail out! ERROR:../../tests/qtest/libqtest=
.c:319:qtest_init_without_qmp_handshake: assertion failed: (s->fd >=3D 0 &&=
 s->qmp_fd >=3D 0)
  make: *** [Makefile.mtest:24: run-test-1] Error 1


>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-sysemu.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
> index eb928832a9..05d6e79ad9 100644
> --- a/target/arm/cpu-sysemu.c
> +++ b/target/arm/cpu-sysemu.c
> @@ -820,11 +820,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *=
cs)
>      unsigned int cur_el =3D arm_current_el(env);
>      int rt;
>=20=20
> -    /*
> -     * Note that new_el can never be 0.  If cur_el is 0, then
> -     * el0_a64 is is_a64(), else el0_a64 is ignored.
> -     */
> -    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
> +    if (tcg_enabled()) {
> +        /*
> +         * Note that new_el can never be 0.  If cur_el is 0, then
> +         * el0_a64 is is_a64(), else el0_a64 is ignored.
> +         */
> +        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
> +    }
>=20=20
>      if (cur_el < new_el) {
>          /* Entry vector offset depends on whether the implemented EL


--=20
Alex Benn=C3=A9e

