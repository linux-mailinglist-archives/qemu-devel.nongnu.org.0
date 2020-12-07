Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C052D1BC9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:15:26 +0100 (CET)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNqv-0007cH-4S
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmNoT-0006dp-6j
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:12:53 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmNoP-0007xG-Uo
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:12:51 -0500
Received: by mail-ed1-x543.google.com with SMTP id i24so7443002edj.8
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 13:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nP66wwvpvcDKklQ0xO5Ce0OO1UGDrKFG5rX/IB24vk=;
 b=zcJI7IRb0kQIl+PdRZ7YewVAgxcmi2lIJrhl4z/gZpEC+B2s4ohSeqzCJ3Fpcwxw4g
 X3JN7gxI3rNVr4VAmtXDGnOcCzzVyaGTUb5sXpk2E84/FZSRUGEmfTMAIhP4hObGSdoi
 GCgS1FOybNf8m1GbsW5NEWAtb0cvejemdACgDipDvmiPGc9l/ulWaP7jhfoJSshzE62r
 Exlu2yTSfxI7OGBbfZthKhmXDftY6JSzVH6X/k5DVDuzytAoEW14B2M/qhY/VY2hdrhp
 v5pwphce052w4QMwGPgjYGy7cLkR4hb3Ik1/ZXksUQ2t0KWVRcBJsUHHm2JXW49T7J11
 HzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nP66wwvpvcDKklQ0xO5Ce0OO1UGDrKFG5rX/IB24vk=;
 b=iw8U1pEbgXRxHWbeM7up7KVw7eCukeZ/SImEnb2o+pvUkg0OVQC9SZNr6M8602eBKH
 1q2gj1VZ2p3gJqHZtymQuHdUbglOcyWAaacbJLP6x/fq0cv6Gub8ExpC5K7k1yi+eYy6
 llkjXK+OTN51LzH0lFPck9Fz6+eLqu11jgWRvgiRp+Jsa18m7Xa8dOq0wh9yaA3Yg31Q
 ktBFAZxVAqiy1QY0807KVPr77yHOE2Biw9iopWcHiWBfISKIDj/JaEOrzRw5jDLyKyZ6
 K3R+/7eGrZa8kB9T+Z9qtSMvgWDDFFlHK6uH1q8mAy7IZk8h+O6VXJs9p2rlQIPrRkZh
 N4Ug==
X-Gm-Message-State: AOAM531sk8WdwPv7jmWXviMsiY7UzMrwMnSmCc8pD+pITblPxVCEz51i
 FKpKcMmg4eGlsc2LCY29NUh98jgVwnpUu6pj8qLKwQ==
X-Google-Smtp-Source: ABdhPJyybvQ7OkMEByCLnFI42mZ9bS4Zht+gYrSZDZt3Sp+6p9iE7CmeWA8yy9qLdm1iCJlhgR5JJrZb8zi/Ku6F0NU=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr14865142edv.100.1607375565850; 
 Mon, 07 Dec 2020 13:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
In-Reply-To: <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 21:12:34 +0000
Message-ID: <CAFEAcA_X3Lhc0Pmea78fboTr_5kUjM4x4QbEXC2VWFXX=a98uQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 21:06, Claudio Fontana <cfontana@suse.de> wrote:
> As I understand it, for the purpose of code separation,
> we could:
>
> 1) skip do_interrupt move to the separate tcg_ops structure, wait until KVM/ARM uses another approach (if ever)
> 2) do the move, and just call arm_cpu_do_interrupt() directly, since for KVM64 it is the only one that can be assigned to cc->do_interrupt().
>
> Which way would you suggest?

So what's the intention here? To put tcg-only methods in their
own struct so that on a KVM-only QEMU they're compiled out
and attempts to use them are a compile error? In that case
I guess if Arm really is the only user of do_interrupt outside
TCG then we should do what this patch does and do a direct call.

thanks
-- PMM

