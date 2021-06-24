Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9CA3B33E5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 18:25:33 +0200 (CEST)
Received: from localhost ([::1]:44888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwSAW-0007Ta-P1
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 12:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwS8d-0005eO-Cd
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:23:35 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwS8a-0004dc-JH
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:23:35 -0400
Received: by mail-ej1-x636.google.com with SMTP id hq39so10446783ejc.5
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8cbfYmkDAlLyxPiO3mndWrNUOrbsVz1gquYkDnk7gFU=;
 b=Ukp1S0WZGNCiOHCubQQbITMwyMWrigDzcU5eFtP09swcuAASpjP2cSHBgixAF2uait
 JTWk2bco7/Y23wZTlI5kYK8FdEqqtTj+NIp6LNWo4jeEB5VNYKXak6tw5zw5P55caj2L
 SgrBwoMyqDKQ3EYgzrOibsA+ElR6Yhl1PO3Jdo1AqWbDLXY+74WZEMOI0gcXbWzymUe/
 QHJSfIAehc92KMZzSkzKiILZVj3z98YVR/s+cBUhCuwh4T0fg/9REj0W5wxryDZ6zPpe
 SAG0HgxludUaK11TitI/oG/NSPUbB/MojHHsLufDVwG4vihrfzAgpfcJeIEe0zIKQvxR
 skOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8cbfYmkDAlLyxPiO3mndWrNUOrbsVz1gquYkDnk7gFU=;
 b=az+8vl5kOMqZH74MB6jJ732BMD6PfZ0HfWzeMG32Mg4bf149yr+e6sHEauNplwdQXv
 gViw/Ty5ucRD31Kr4RTrTDGC53WNGJCJ57SKlpaRIvArppd44jD+yxrIwGaeBuBTWTHb
 NEQWhWzAXTbnRqVFZrg+I2Jv0ijOwfUsFYuCqKs7kk6J6+KQUgT1wMhhOki2pI39HYZd
 LReo4LOeJQhVlqID8sk+uIbmY3CobEafY8nzUVVoFd+jg7pH5NsbgjyaVtGQ6uN5WPmq
 csIeBsWCe+JplUO1LFOTnU5Wo1Ybbo/P84W3tgWTL1g9llicXC0hj4fo93oHDxFfw106
 N62g==
X-Gm-Message-State: AOAM532Z90cVJHQWYr36rZ56f7YFlsskEz7QDIiVoZwlWbD9xLUHDbAg
 NjtltXOTe0Y+n3Wq2pLUSO19gCt+yk5D9gdKK/2V6Q==
X-Google-Smtp-Source: ABdhPJxc6Ua8amn6J166xqssT9D5Vmoy18himeFB0AiXf8NCiTFdP5LfsMfW3zV6vVbmOen0v7f1u6lxe4Hztuv5jXo=
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr6306253ejb.56.1624551810429; 
 Thu, 24 Jun 2021 09:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
In-Reply-To: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 17:22:54 +0100
Message-ID: <CAFEAcA8eADzVVMVZHaHBC9Lm09aVvC5Wwj-q7nLkKoRUn3vS5A@mail.gmail.com>
Subject: Re: Extracting PC information from QEMU/KVM during single-step
To: sraasch@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 at 22:10, Steven Raasch <sraasch@gmail.com> wrote:
> I have used KVM to create a snapshot of a windows-10 guest running a grap=
hics-intensive app. The *original* issue is that the app does not execute c=
orrectly when re-started from the snapshot using TCG (it doesn't crash, but=
 it doesn't run correctly, either).

I'm not sure that taking a snapshot with KVM and then resuming under TCG
is really tested. So I'm not very surprised that it doesn't work.

> I'm setting DEBUG & single-step modes by calling cpu_single_step() from t=
he top of kvm_vcpu_thread_fn().
> in kvm_cpu_exec() I wait until I get a KVM_EXIT_DEBUG signal before loggi=
ng the instruction.

If your app can cope with the slowdown involved in taking a VM exit
after every instruction (which will be massive), then it can probably
also handle the extra overhead on top of that of the gdbstub communication
protocol. So it's probably simplest just to connect to QEMU's gdbstub and
do the single-stepping that way.

The other approach to this would be to see if intel's perf monitor
stuff (which I know nothing about) has some kind of execution-trace
capture support and if that works when passing through the PMU to a
KVM guest.

thanks
-- PMM

