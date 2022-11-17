Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0652862DC4B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oveax-0002Vl-Lt; Thu, 17 Nov 2022 08:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oveam-0002Us-II
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:06:09 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oveai-0003E0-Rd
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:06:08 -0500
Received: by mail-pg1-x52b.google.com with SMTP id f3so1929004pgc.2
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 05:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N3hbbHG4CTwXtKeb/YtACWGOa4zTlUiCesH3Fm/c9OE=;
 b=DIYR5UNxqBFhYq8aRL6VmqokW2pLPTC3KdptUMKbZbAoHryWKl58tIdlHIqOsyKmNH
 13kCOEr5f4ZgFH1Gx1NxO5fAIND+KrgIq/6upegt3fdpc/GsIamTciIxnOV6NGCCqRvI
 M7QXAxYwNiX7FvTv/e9s52L89qV66RyttSMQyRHntuE5Wz1hld2MN4bVKk6T6Ydmh1SV
 7pVicAoUAP0DOD3faDJ4Ep7ElI5jmMwGlHs0peekDJh4wJrUPMKuEbGlxJbSJBrZ3hnx
 HcVxBD5w4rAZ888FaGNhhfLga49O/k7A6Lzxeu4FqBRBIpq5hsEhhUaqZ/bai4bTD6pV
 BbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N3hbbHG4CTwXtKeb/YtACWGOa4zTlUiCesH3Fm/c9OE=;
 b=eVHCkCIl8H9D+D/ipXN57+/x2uAIX3C4gwUu+S7H8KtpyrG+QqZpRJKVIEwpcToAWs
 d0ay3GwIP6tEIFZt2iokwOwDUFKhTgaoFAJV4uM+BIIshrMJCBybmu/GDk/Ov95soT7C
 p9LtEN7WcX/2yArbHpDyYO78hRbiPHSN8JRM6U0JLjmZ/QiBljzQUMKGoQ7LtEGEk02i
 qB6BZWWJthgnQ3wL4S4akl9+UHltskmBo7FXogNnZON9dKJZFDVs20pdNPDeYhVu3Sj8
 7f24xOemj8opno2n8d830xXK4SNHSyHT61KKstJaKQabqtDy4MNzb69VHQixlbQjvCcy
 edGA==
X-Gm-Message-State: ANoB5pnHKe4G7JjZ1NggIbUsa8IUkhhSGZRx2VGn3MH+9k1vlEv4aeW+
 Qf2Vtf8DNfLpEFLquxq5FPas6LNP/fgeTdOUz95sQZVMK7c=
X-Google-Smtp-Source: AA0mqf6hy25fBgK4fOBtCEd7DkdX8hiG9aLnJYmKvm95H7pAgpOPOTkJs5PARywxP4zlXVUc0sv9lm6hVu+52cI6RuA=
X-Received: by 2002:aa7:9ed0:0:b0:571:8549:89c3 with SMTP id
 r16-20020aa79ed0000000b00571854989c3mr2904527pfq.26.1668690362625; Thu, 17
 Nov 2022 05:06:02 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9tnOCij+OKV8Mpe37g9i5Sd4oYVTA4642SAY9MfCBLLg@mail.gmail.com>
In-Reply-To: <CAFEAcA9tnOCij+OKV8Mpe37g9i5Sd4oYVTA4642SAY9MfCBLLg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Nov 2022 13:05:51 +0000
Message-ID: <CAFEAcA_gDzyucBEq2pQJVmgZkLEP5hhW7k6_LmY7_mO3gEGHhw@mail.gmail.com>
Subject: Re: UI layer threading and locking strategy;
 memory_region_snapshot_and_clear_dirty() races
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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

On Tue, 1 Nov 2022 at 14:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Hi; I'm trying to find out what the UI layer's threading and
> locking strategy is, at least as far as it applies to display
> device models.

Ping! :-) I'm still looking for information about this,
and about what threads call_rcu() callbacks might be run on...

thanks
-- PMM

> Specifically:
>  * is the device's GraphicHwOps::gfx_update method always called
>    from one specific thread, or might it be called from any thread?
>  * is that method called with any locks guaranteed held? (eg the
>    iothread lock)
>  * is the caller of the gfx_update method OK if an implementation
>    of the method drops the iothread lock temporarily while it is
>    executing? (my guess would be "no")
>  * for a gfx_update_async = true device, what are the requirements
>    on calling graphic_hw_update_done()? Does the caller need to hold
>    any particular lock? Does the call need to be done from any
>    particular thread?
>
> The background to this is that I'm looking again at the race
> condition involving the memory_region_snapshot_and_clear_dirty()
> function, as described here:
>  https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/#u
>
> Having worked through what is going on, as far as I can see:
>  (1) in order to be sure that we have the right data to match
>  the snapshotted dirty bitmap state, we must wait for all TCG
>  vCPUs to leave their current TB
>  (2) a vCPU might block waiting for the iothread lock mid-TB
>  (3) therefore we cannot wait for the TCG vCPUs without dropping
>  the iothread lock one way or another
>  (4) but none of the callers expect that and various things break
>
> My tentative idea for a fix is a bit of an upheaval:
>  * have the display devices set gfx_update_async = true
>  * instead of doing everything synchronously in their gfx_update
>    method, they do the initial setup and call an 'async' version
>    of memory_region_snapshot_and_clear_dirty()
>  * that async version of the function will do what it does today,
>    but without trying to wait for TCG vCPUs
>  * instead the caller arranges (via call_rcu(), probably) a
>    callback that will happen once all the TCG CPUs have finished
>    executing their current TB
>  * that callback does the actual copy-from-guest-ram-to-display
>    and then calls graphic_hw_update_done()
>
> This seems like an awful pain in the neck but I couldn't see
> anything better :-(
>
> Paolo: what (if any) guarantee does call_rcu() make about
> which thread the callback function gets executed on, and what
> locks are/are not held when it's called?
>
> (I haven't looked at the migration code's use of
> memory_global_after_dirty_log_sync() but I suspect it's
> similarly broken.)
>
> thanks
> -- PMM

