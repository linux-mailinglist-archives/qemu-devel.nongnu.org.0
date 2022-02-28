Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D04C6952
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:04:20 +0100 (CET)
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOdpC-0007m4-K9
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:04:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOdna-00073n-Mi
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:02:38 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=45967
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOdnZ-0007E7-5Y
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:02:38 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id g6so19637419ybe.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 03:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FjIxF5N63C+gahA5b7nZQkHLfOwHAnpdOpQi2wnN41A=;
 b=PdtZ5zguPfdaU69YMHDvlIvc1JqeZkhYKg29ayHpmf0gRtVkwl63/7YcGzzjqlm0zz
 Hjp31I84zym6uReoK6Bo1051XmDKhFsc6a80GN86SSpN+I6jniIrL5HkHGav00rV63jn
 86Na+TLpCrcz4KhfW7WGvghFZLw7xNpIQEuBpo+cpJ3LeM0Jbf+ZBZ+alYCP/i+OQth5
 cnbYNztlIADOVsjWW1Vrslj7meAUPfLfNES56FX5EZIhg49WNVAhoJalHc7yRe0KXkAh
 7pR6KFAM9oUXgJWHhWUWDcntxBXgLOuWTMto6DJjjB+Zpc8WP1gab3eYqFTvvOTHWuVh
 OP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FjIxF5N63C+gahA5b7nZQkHLfOwHAnpdOpQi2wnN41A=;
 b=ReFFfF5Kbyqm2/Q97QaRSidpQTPvS2Cjx91cSQLcmm//t20tXhMPd0KT6wd2oxuftN
 DPmJBLNeFwbnbodfekc0ZSN+qlTjFpcPJp+JrwKrivvIzQi0jY6j0AsJLC+BCv8o1pE3
 CWJjoVAHUBJiCwSwwjT3jck8rBI0ZHom1hFmwH1dTbyahv7ABzBuQPaFfK10ujC5iTZf
 Kl1nPsx448BALkVW4shGUDm/uaB3BXhgLj7+fB1xE25a2RYuqLC02EBVkXfLNUaYOEyi
 7J/siC4NfnT4VxbIrAK+s8Qw6xdnFnqTOb7JbaXSZLrWpBIhMWsPOV7yX8s5h0EJrTxH
 DGAw==
X-Gm-Message-State: AOAM5328mmuvLtH9+SUktaXi0AW2OHyJK6+lrGmEx8GSSNMVrUKlvNfx
 XKqqcKpMNee+vpio54D6I/XSIZDcN5Ns/2WbhkXw8Q==
X-Google-Smtp-Source: ABdhPJykrTqLKT34idcj9Mz9kWomsQ6A1av8TSyAL2JDmN8SxX4vmIubj9+V0tIKPbkVlU2AFvuA9unpA4c11d+mQbQ=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr18422242ybq.479.1646046155076; Mon, 28
 Feb 2022 03:02:35 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR12MB3192248D73D9C8AF64076A62D9019@BYAPR12MB3192.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3192248D73D9C8AF64076A62D9019@BYAPR12MB3192.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 11:02:24 +0000
Message-ID: <CAFEAcA9+cof3gHwTEht4j813hoTsSdstHd568BZEd5fm8n+n2w@mail.gmail.com>
Subject: Re: Timer delays in VM
To: Eugene Huang <eugeneh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.

On Mon, 28 Feb 2022 at 07:04, Eugene Huang <eugeneh@nvidia.com> wrote:
> I am running qemu on an arm64 CentOS host. Inside a ubuntu VM, a process =
runs a timer created using timer_t:
>
> ev.sigev_notify_function =3D m_callback;
>
> =E2=80=A6
>
> timer_create(CLOCK_MONOTONIC, &ev, &m_timer_t);
>
>
>
> This timer sometimes has significant delays. For example, the 50 ms timer=
 can have a callback delay of 100ms.
>
>
>
> I did a host kernel trace and see a lot of WFx kvm_exits, and  the follow=
ing events between kvm_exit and kvm_entry:

For questions that are really about KVM and not QEMU, you'll probably
find more experts on kvmarm@lists.cs.columbia.edu. My non-expert
look at this series of events:

> kvm_exit
> kvm_wfx_arm64

The guest kernel has nothing to do, so it idles,
waiting for the next interrupt.

> kvm_get_timer_map
> sched_switch
> kvm_timer_save_state

So the host schedules something else instead of this vCPU
(I think).

> kvm_timer_update_irq
> vgic_update_irq_pending

At some later date, the timer IRQ fires...

> kvm_timer_restore_state
> kvm_vcpu_wakeup
> kvm_arm_setup_debug
> kvm_arm_set_dreg32
> kvm_entry

...so we reschedule the vCPU and re-enter the guest.

I don't know why the timer might have significant delays,
but of course if your host system is very heavily loaded we
might not get round to rescheduling the vCPU for a bit.

thanks
-- PMM

