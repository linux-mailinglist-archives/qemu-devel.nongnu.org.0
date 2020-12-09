Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD22D4126
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:32:52 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxiF-0003By-7w
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxgp-0002lT-IC
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:31:23 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxgn-0000uq-Pr
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:31:23 -0500
Received: by mail-wr1-x442.google.com with SMTP id 91so1347632wrj.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 03:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qGmL6VDjer/qjUCWllsVx4i39e4x8Ay+Z2tAC7YHW9c=;
 b=EzdRdCmJKHIErvuaHKvEF/eXMuyifRshTO7D86lud5jb5ybykB92seHC5r3c+jpsga
 hG1EhBgI7vjBuInwwkUmv53kTmVPFc3CG2/6HfNibzHUP69YuaOLgs4lhAd+tOsd0WFN
 f9e6mOHU21/7e0YPl3oBPTeyoydWIxO+z+FmaQkI/0/vo1teT+EOHks0yOfonbexx0q5
 KbTrrIUG6CP78xjMo9rgyKyuET6LxYivOvagR8TOdZoNG4AvoY70TpHO4tFa+q5DSEl4
 fBsG7pUcDY4qGqpnC76EPmizA+pFGD4RWZcdRYkycnYHpyxCt54L8NItEDSg2btkhdX1
 EPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qGmL6VDjer/qjUCWllsVx4i39e4x8Ay+Z2tAC7YHW9c=;
 b=NwjFmJknvnxhhkwGZY5sTpZjXswBdks/yg/1AIlWltF20wx8CZLgS8vhl4/7r+9SUf
 PipaY4r0XZowIEp1PJj6XjROJJcg7Lgyn7Bt0LOGi+RxOR6EjJNrlFIlHxu1EXT4lDUH
 e/dDaU1zwUtUMDsn9GV296XjeBb/ZgBuGCIyFCqiPhhNsy5oQMvRb/oj+sN6srB6ZFp2
 n6eSTPrie9irH66hzmIeVBhAVjIrcB0cyzaR130EmBfq7/APAC9qbqGvT3t2bF6+ka2v
 C9f+vQ052pXSHKHccfvbTYMKT9EJH+m9ku5eFQrM+R5hFxYiAdSqLr/v3xc0xxUaL/h8
 Gh/g==
X-Gm-Message-State: AOAM53284ZdkF/gAy2K0h1rvSP2v8UpCqvb3/jlS4Z5VSvTZODsdUicC
 qvIxmAZ8m/x8JZU7uADMd1RaGQ==
X-Google-Smtp-Source: ABdhPJx8Jxe1seSpzlEpqP46FdDeCffFYAIF9IlC9gWkWex9NYG8wsOK23LIyHTbwlwbhcqDaHb1Uw==
X-Received: by 2002:a5d:4349:: with SMTP id u9mr2103436wrr.319.1607513480203; 
 Wed, 09 Dec 2020 03:31:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q17sm2660277wrr.53.2020.12.09.03.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:31:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BBA81FF7E;
 Wed,  9 Dec 2020 11:31:18 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-23-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 22/32] target/arm: do not use cc->do_interrupt for KVM
 directly
Date: Wed, 09 Dec 2020 11:30:47 +0000
In-reply-to: <20201208194839.31305-23-cfontana@suse.de>
Message-ID: <877dprdxmh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> cc->do_interrupt is in theory a TCG callback used in accel/tcg only,
> to prepare the emulated architecture to take an interrupt as defined
> in the hardware specifications,
>
> but in reality the _do_interrupt style of functions in targets are
> also occasionally reused by KVM to prepare the architecture state in a
> similar way where userspace code has identified that it needs to
> deliver an exception to the guest.
>
> In the case of ARM, that includes:
>
> 1) the vcpu thread got a SIGBUS indicating a memory error,
>    and we need to deliver a Synchronous External Abort to the guest to
>    let it know about the error.
> 2) the kernel told us about a debug exception (breakpoint, watchpoint)
>    but it is not for one of QEMU's own gdbstub breakpoints/watchpoints
>    so it must be a breakpoint the guest itself has set up, therefore
>    we need to deliver it to the guest.
>
> So in order to reuse code, the same arm_do_interrupt function is used.
> This is all fine, but we need to avoid calling it using the callback
> registered in CPUClass, since that one is now TCG-only.
>
> Fortunately this is easily solved by replacing calls to
> CPUClass::do_interrupt() with explicit calls to arm_do_interrupt().

My ultra-modern gcc10 gentoo box is quick to point out:

  64.c.o -c ../../target/arm/kvm64.c
  ../../target/arm/kvm64.c: In function =E2=80=98kvm_inject_arm_sea=E2=80=
=99:
  ../../target/arm/kvm64.c:947:15: error: unused variable =E2=80=98cc=E2=80=
=99 [-Werror=3Dunused-variable]
    947 |     CPUClass *cc =3D CPU_GET_CLASS(c);
        |               ^~
  ../../target/arm/kvm64.c: In function =E2=80=98kvm_arm_handle_debug=E2=80=
=99:
  ../../target/arm/kvm64.c:1494:15: error: unused variable =E2=80=98cc=E2=
=80=99 [-Werror=3Dunused-variable]
   1494 |     CPUClass *cc =3D CPU_GET_CLASS(cs);
        |               ^~
  cc1: all warnings being treated as errors


>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/helper.c | 4 ++++
>  target/arm/kvm64.c  | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 38cd35c049..bebaabf525 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9895,6 +9895,10 @@ static void handle_semihosting(CPUState *cs)
>   * Do any appropriate logging, handle PSCI calls, and then hand off
>   * to the AArch64-entry or AArch32-entry function depending on the
>   * target exception level's register width.
> + *
> + * Note: this is used for both TCG (as the do_interrupt tcg op),
> + *       and KVM to re-inject guest debug exceptions, and to
> + *       inject a Synchronous-External-Abort.
>   */
>  void arm_cpu_do_interrupt(CPUState *cs)
>  {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index f74bac2457..2b17e4203d 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -960,7 +960,7 @@ static void kvm_inject_arm_sea(CPUState *c)
>=20=20
>      env->exception.syndrome =3D esr;
>=20=20
> -    cc->do_interrupt(c);
> +    arm_cpu_do_interrupt(c);
>  }
>=20=20
>  #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
> @@ -1545,7 +1545,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_=
debug_exit_arch *debug_exit)
>      env->exception.vaddress =3D debug_exit->far;
>      env->exception.target_el =3D 1;
>      qemu_mutex_lock_iothread();
> -    cc->do_interrupt(cs);
> +    arm_cpu_do_interrupt(cs);
>      qemu_mutex_unlock_iothread();
>=20=20
>      return false;


--=20
Alex Benn=C3=A9e

