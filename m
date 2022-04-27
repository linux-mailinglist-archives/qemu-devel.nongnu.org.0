Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54FC5121C5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 20:52:32 +0200 (CEST)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njmm5-00032Y-L5
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 14:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njmhZ-0007Am-11
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 14:47:49 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njmhX-0005AD-6R
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 14:47:48 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r189so5032775ybr.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAhfQLXPrcc3iEs8Mayj7mdKWRElREYqruuog9Gb3CQ=;
 b=HVQjBvaZin9noWg2xfTTe+1nB2YKyCdckDVePAwYC7twUoc3Vnoa/24iZsiq5eSmTY
 6UslKMxKmpVfDuFJMm/u9HxVM+VTLQKtQ8CXd8sOHRJeByKtzkcG4Obnxdt+C5sagL34
 qgncVbSMydPzXNsHTmzkUS+PgSp5nbV8CrahJ0+RPidFY3GdTqbvtfMQIXsifFMIqZyI
 E8xnLUk4+GE9LQbpv2JOGPzs19O4QYyjD+22aAwMijhwuIELNitVfZquRb9HvPVtD/vB
 yh3S5IVJSMchTQ9Mvbkm8hUauQscW0qqRrZzt5WQVHaDkLvbP0IjdoBv60sZHUfTF4YD
 yGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAhfQLXPrcc3iEs8Mayj7mdKWRElREYqruuog9Gb3CQ=;
 b=voYgXyTTmipe13iFeZsZz5Rr2EScd+GlR/QDCoTd18IIPobU934uXZKtwToegeMQhZ
 RFtxXxEr3CIeC08OUTmUnx5Ng4nWa9KDv58jkI6o4Vyg0HbfYTbYVpJ8hdEi68sw8Crr
 0+roY98B6uJXajyqah/UhhXflIpXTTQ1JYtzhNmbjXQZrw9iaPM3Rk2zXWuLWz8414Hn
 9z/DQyb+ZwY92Q4YDncsOEAun5IxAhc81xI6wmdGw0PBBqgU/RTUAVTmzSySoDhpfvrJ
 e3Jn+qK1DqdN979saeT8riQ1aSzNc+Pj+EGQnBudBCs8/DW0cWXpd7n55+Ud0LmV5hOD
 CYnQ==
X-Gm-Message-State: AOAM5306PwKIGbQBOd7SG4SqiSSipwyztOSrxC9a9PzvLbJfrJY3w1Fy
 WNHluXnfwKJsjVCqH14yuaVIrevfvmSXwl4tp/Vk6g==
X-Google-Smtp-Source: ABdhPJx3obP3CzOBsnNy8H/9Zwl6QoCZA+lm6iMKeUyI80XYLjWuOOWoHTlWJkK1wrUZ0Nxz99m/1pfX2Jt3VqIFDF8=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr27091835ybq.67.1651085264763; Wed, 27
 Apr 2022 11:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
In-Reply-To: <YmmA4li384azQ2i9@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Apr 2022 19:47:33 +0100
Message-ID: <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/7] target/openrisc: add shutdown logic
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 at 18:46, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Stafford,
>
> On Mon, Apr 17, 2017 at 08:23:51AM +0900, Stafford Horne wrote:
> > In openrisc simulators we use hooks like 'l.nop 1' to cause the
> > simulator to exit.  Implement that for qemu too.
> >
> > Reported-by: Waldemar Brodkorb <wbx@openadk.org>
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
>
> I'm curious as to why this never got merged. I noticed I'm entirely able
> to shutdown or to reboot (which is mostly what I care about) Linux from
> OpenRISC. It just hangs.

This kind of thing needs to be either:
 (1) we're modelling real hardware and that real hardware has a
device or other mechanism guest code can prod to cause a power-off
or reboot. Then we model that device, and guest code triggers a
shutdown or reboot exactly as it would on the real hardware.
 (2) there is an architecturally defined ABI for simulators, debug
stubs, etc, that includes various operations typically including
an "exit the simulator" function. (Arm semihosting is an example
of this.) In that case we can implement that functionality,
guarded by and controlled by the appropriate command line options.
(This is generally not as nice as option 1, because the guest code
has to be compiled to have support for semihosting and also because
turning it on is usually also giving implicit permission for the
guest code to read and write arbitrary host files, etc.)

Either way, undocumented random hacks aren't a good idea, which
is why this wasn't merged.

thanks
-- PMM

