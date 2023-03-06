Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF56AC59B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCtB-0001eS-4x; Mon, 06 Mar 2023 10:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCt5-0001Ya-RJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:36:31 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCt4-0002kg-9C
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:36:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so10756701plh.11
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FT+GEhr54ZPOMqWGOKz9HKtLzH0dtqpI4U6uO/gobbo=;
 b=rqs07uJ27cJgBvNDxoXI7H/aE/q63UqGcDYqg9TMbMwF9TnkrffY+d8yiOenYzH8/W
 Bs7Yvjf9NJgYuUbTlHjhGMkWDH6OkYb6rJhG3OS5M+b4hbFNPMHeLnSDPT4H/PwJxSy8
 TNdj/aBC/TFpVtJMYFYRxk0mvibgPTe3O5OSUDARGjJwBeDCn0PCz0lF8QO/vfbI3Jaw
 yefFTxouJVFRy69HT0VOaiPxPV8uttwnqeuKEMyiXYfbdVFfbwvh9DzZEgrSkggiUERr
 en3VdyTGWe2eSaDKHcB4lcrsbMQuZQtz/HSA4ON9zY2SrMOerYlPjdB6NcOvrvX9kG0U
 UGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FT+GEhr54ZPOMqWGOKz9HKtLzH0dtqpI4U6uO/gobbo=;
 b=NH28FdRgrDbuGWXLLavaMkgglO0WcT1oK3Q/fAmOKpWOZA/U5gTgHWaC/g9CBJTbRA
 JaVPODHdxszkWWaPGQDCop8QLY+6ON2Bljuxlz/fJY/5AHevoxqiIyrEV0RexAbzt1s4
 syujgptFtE9ses24hIpFN7w27Kdi6EZtR0lDs/p8pwlQby9GLaPwim3r1V+G/Lpqa0pO
 JjxrGKzeHifcaxjEJLEFy4g8D0S/NpFOUzBKso98sb1P9g+3mgdrQmv2vo4ut6115t4k
 BgKEEIC/TgGD4vt+BpVXKdu/L+KVGP7sSnTnxbVc5bRlv5eHgw1WVJXZSrQnNWX0dHzP
 IaLA==
X-Gm-Message-State: AO0yUKWuCGNzJvoLbj16G6vN+oKRkw2ZPVYsYJi1cymtWtBfhOd4ua5Y
 HnvrjJ+C7MXBDpJSZhwOyWNxzHaA3ZL1TnafmgiGWQ==
X-Google-Smtp-Source: AK7set9NMhwz7svG4RWdpElqkfxXzO2yupDdzRyCEZmJfs6as/v2dKEuCw7O/LKSLlVyBvO9jDzrHZNeDzd+kCnepQs=
X-Received: by 2002:a17:903:2616:b0:199:4a4f:9d2a with SMTP id
 jd22-20020a170903261600b001994a4f9d2amr4474237plb.13.1678116988387; Mon, 06
 Mar 2023 07:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-5-pbonzini@redhat.com>
 <CAFEAcA961ZHCLAp2ZiZZ2iURFt7_FdcN_1rFtzJNdHs-sesHFg@mail.gmail.com>
 <71ed58bd-fb24-4eab-6638-a6a88676201b@redhat.com>
 <CAFEAcA9SfBnBaAL3P2VPGh0Mjx59Fgp+RP1vdLtezruT=Sh4aA@mail.gmail.com>
 <c756dc04-0b37-a02c-7359-1636e1c7256c@redhat.com>
In-Reply-To: <c756dc04-0b37-a02c-7359-1636e1c7256c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 15:36:16 +0000
Message-ID: <CAFEAcA9C3dioT03WeCf2Sint+VFA1wucXBiG4rL-jdkXofN+Xg@mail.gmail.com>
Subject: Re: [PATCH 4/8] edu: add smp_mb__after_rmw()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, gshan@redhat.com, eesposit@redhat.com, 
 david@redhat.com, stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Mon, 6 Mar 2023 at 15:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/6/23 15:24, Peter Maydell wrote:
> >>> Why is this device even messing around with multiple
> >>> threads and atomics anyway ??
> >> Because it is an example of deferring device work to another thread,
> >> just like on real hardware it may be deferred to an on-device
> >> microcontroller or CPU.
> > If we want to be able to do that, we should probably have
> > infrastructure and higher-level primitives for it that
> > don't require device authors to be super-familiar with
> > QEMU's memory model and barriers... The fact there are only
> > half a dozen other uses of qemu_thread_create() under hw/
> > suggests that in practice we don't really need to do this
> > very often, though.
>
> Yes, you're totally right about that.  I have never needed this kind of
> higher-level primitive so I haven't thought much about what it would
> look like.
>
> The usage of barriers isn't great, but all this patch does is correctness...

Yeah, I'm not objecting to this patch, to be clear. It's just
that it brought the edu device to my negative attention :-)

-- PMM

