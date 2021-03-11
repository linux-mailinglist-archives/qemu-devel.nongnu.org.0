Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFA333794A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:27:47 +0100 (CET)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOA6-0006Mr-Jh
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNrA-0000Ss-Up
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:08:12 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:32918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNr9-0007pq-5Z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:08:12 -0500
Received: by mail-ej1-x62c.google.com with SMTP id jt13so47369579ejb.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JC0PtddIRV5/7yV9JvUqMCuvvqt/dnLTrEw4IUY/jx8=;
 b=t8MQMte9cIMKSdmk2uf81NKVSmbdpSKFbqHyeyhv6i44U1lu4Z/A5maFXrPOz+Deb7
 WffSSblfiOsP7Bid8ox4bPrunugm6/hGIRJVXRQlBt+8gEhyVRFbd2zgNNqFoOsXX3Ng
 9WjPLVP+hbyw31/JKogn0sSJHsJgivBgbKkWjE4JtaEvHQaRPxnPzVKpeaXmTOtVaPfX
 YhSX6Fs9CDHdnM1GgtjlpKfNYiU65vKdRMA1TVKzDF30Naft6m//kCqRv2BkeA0sG9wg
 oyOv7y3OjM2agWzdIXBFYyxtAaUeZw0u9oONf1iyOxpfP2jj+Ydkluj7TarEGASZaIZV
 1ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JC0PtddIRV5/7yV9JvUqMCuvvqt/dnLTrEw4IUY/jx8=;
 b=OX56x+GbuL1B9t3575M5gVg/664wctF0zHZBTAyBi7emlnZf4zr18/oCotX8+ECVmV
 XsugTQ4E155rubbt5qYofJncdLwjFQyn9pDZoDSORfmfrYYlAeP4gAgqPYelX2U/kO4g
 7jLvVrDbaZWCmtKLG1tvP9ZVpryFyaXG14Zmeg1n7DT6ZJPR6IlhjFYViOvIrMl70fio
 sCAL8JPJF+polhVk9hFJEzLCgC6pOjTtfPtf9izZ0/a67e2TLD7bGFAdrPIouWbTIQMF
 QR2NwK0wlGKCzRkjxqOEBnzpOhBcrAX3pVdAgbfVnuPMpfS6T2GFb5gZacs0Aj91BFFJ
 g/5g==
X-Gm-Message-State: AOAM533WMyFrHNPnCCO3HGZev0QnmsOQ/y4Dif3+MaCKzQiTQxOUOFLI
 DQFKeSVa7we4HjSF73bOnf3F9HDpMpyShoKuUmIJO8EHTYNIjA==
X-Google-Smtp-Source: ABdhPJxAHw3+eXzk+hVJpS5AhOrf/QEBGAqgVXC7WL/CdDui0KodX/dekppJ0VOxPHSzXqEDphw6Us8M82BBKv/Kc3g=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr3888972ejc.250.1615478889387; 
 Thu, 11 Mar 2021 08:08:09 -0800 (PST)
MIME-Version: 1.0
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
 <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
In-Reply-To: <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 16:07:50 +0000
Message-ID: <CAFEAcA-zRB8t4h7eLsw5FbFtyBp6Ow16P4vvk2eA9t7Jcr42TQ@mail.gmail.com>
Subject: Re: Question about edge-triggered interrupt
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 16:01, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> That's a case I can't understand.
>
> 1.  An device causes an edge-triggered interrupt A.
> 2.  The interrupt controller sample the interrupt A, and setting pending
> bit for A.
> 3.  The interrupt controller select the interrupt  A to CPU and clean
> the pending bit for A(according to the specification).
> 4.  CPU start to execute the A's service routine.
> 5.  Another device causes interrupt B.
> 6.  The interrupt controller sample the interrupt B, and setting pending
> bit for B.
> 7.  As B's priority is lower than A, it can't preempt  A's service routine.
> 8.  A's service routine return.
> 9. No other interrupt comes after B.
>
> After the sequence, B is pending in interrupt controller, and has no
> chance to be selected by interrupt controller.
> A's service routine will neither write interrupt controller's register
> nor device's register.

I'm pretty sure that there is some interaction between the CPU and the
interrupt controller on a return-from-interrupt that you are
missing. There are several ways to do it in principle; you need
a risc-v expert to answer your question more specifically.

thanks
-- PMM

