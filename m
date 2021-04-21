Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07AF3673D2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:57:05 +0200 (CEST)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIy8-00086b-EM
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZIwI-0007Cq-Ci
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:55:11 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZIwB-0007Y3-5w
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:55:09 -0400
Received: by mail-ej1-x62e.google.com with SMTP id w3so65294967ejc.4
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvYGj1X2sdN/xWUVtYpkJJL2vHZ5LRAW23ib3QpyReI=;
 b=X1rsAL/19otNFQJz44U12pY+RDYbYhAtGTutSHrKb5Q4YGdeoMYTITt+eqEb+VCwdj
 Nd0I7kSU67Jz0PHZNmtemarM8gkkG9dVuDy0/yhInMZrwwSIhkRTfCSneAQyMdHP3YJ6
 SqT8bGU56Mq2LFQUkLTQt1cQkq6HwvqZ+QbalsNI5ZF+ureAtp0lg/RgYX4iKhVDg5o0
 PC9vw9gqkHg/7jb6Xqg5O90DGirHU1nrRH5RedNzEOY0YEWVj4EHlkSzLKOc5cNDDhHe
 WMk0cD0UiablXDkg+FP+DKABwTWu7B04pYl55rNP/2xsU/Lvo9qS+slG4WkbZmLDx01D
 G57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvYGj1X2sdN/xWUVtYpkJJL2vHZ5LRAW23ib3QpyReI=;
 b=dcu6DdiwBOZxl17mV9HUhapnYtgnSolrfbR/fGCC8nQ9QPieE/XGel4nz/X3ksdE1c
 4QEk6hrBL0IjXzP9or0yUfR1KkVNH5zA5zdneDJsUuTePjMeWvWcnkuXG3M44PQDT1kC
 HzfFSraUvlPHHpZ7C51RDBqR77PUcoym5mjSMRB63XgsJ7QAah/3k8kNA7MYVQnMgcZk
 2kPV6g3Dp0gN+xBNEj9UPtByD7wfbAaNm3VWOvizsPpJXBuUbKyDv+yoHUwcIu5bf2Bz
 s8Ya9mPkqB8yMxDyU6FYgXGjBWbja+m/dg6UzrJfEwBqX/atmQ70Ibbh7Sq2TDYHDpLO
 dBjQ==
X-Gm-Message-State: AOAM533gauETeUPdmp4/2pbyC3HYywaO8CJY9EAdLPRgvURCrh8ldeJS
 qzNVcCC+jeCJ9i/UdeqjY/U70apYaIBQJjrZTLp5GQ==
X-Google-Smtp-Source: ABdhPJxeoxBo1dvCIvfI6ZwUarAI1qDsc4MFam8YgvHWgF8kD3kkpQhY41GqdcfRW69vCWazpG1ejM0sT7uBBWIXVE0=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr34554481ejx.85.1619034901212; 
 Wed, 21 Apr 2021 12:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
In-Reply-To: <3f6be9c84782a0943ea21a8a6f8a5d055b65f2d5.1619018363.git.crobinso@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Apr 2021 20:54:07 +0100
Message-ID: <CAFEAcA-=jNMCTcWZMnyC7vm=8z526zmAJ146=pKzzVg5uuaBVQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.0] net: tap: fix crash on hotplug
To: Cole Robinson <crobinso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Apr 2021 at 16:24, Cole Robinson <crobinso@redhat.com> wrote:
>
> Attempting to hotplug a tap nic with libvirt will crash qemu:
>
> $ sudo virsh attach-interface f32 network default
> error: Failed to attach interface
> error: Unable to read from monitor: Connection reset by peer
>
> 0x000055875b7f3a99 in tap_send (opaque=0x55875e39eae0) at ../net/tap.c:206
> 206             if (!s->nc.peer->do_not_pad) {
> gdb$ bt
>
> s->nc.peer may not be set at this point. This seems to be an
> expected case, as qemu_send_packet_* explicitly checks for NULL
> s->nc.peer later.
>
> Fix it by checking for s->nc.peer here too. Padding is applied if
> s->nc.peer is not set.
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1949786
> Fixes: 969e50b61a2

Is this a regression since 5.2 ? (I guess so given the Fixes tag.)

Also, I'm kind of irritated that this was reported to RH on the
15th and we only get a patch now after rc4. I really really don't
want to have to roll an rc5, so this now has a much higher
hill to climb to get into 6.0 than if it had been reported
(eg on the "Planning" wiki page) as a for-6.0 issue before rc4
was tagged...

thanks
-- PMM

