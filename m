Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D130F4E1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:26:22 +0100 (CET)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7faP-00022P-NG
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7fZC-0001Zv-DI
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:25:06 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7fZA-0002Db-MV
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:25:06 -0500
Received: by mail-ed1-x535.google.com with SMTP id g10so4366088eds.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wr2wmMaNGmX6i+k+nsdbLKLl6sSuEN3yJSueFtDW6eE=;
 b=vhYRFlr/lgiOJCqhtXoKEKcnWXpLhElK4gwna9EoL/JkH8Y49YzgenBXbPES8XMiVG
 pfQOZ4VABEj+PVOgKC6PrUke8ePLZuPlGyu9HbIf2CM2QVYap3Gz5H9NMoa4GrkBIZT0
 43u2GCgGcgVISSsMzTlcDxBjtRPWTnHI2BLVWViS/ofOezzjjfUoP1tIsmop0uAyU65n
 E+fNXLXP85Ow0aWHss3euO8DsgxWR/qESc2+su8Tl9kovHIuk8ee4mwj+QgS4dIlyTOB
 HHdwXiifE9UOkBrldmhQBKUqEIuwd/HTcB7I5FgTwfbXmmt2WdAN4l4Wcj4YzoAV5uwY
 0qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wr2wmMaNGmX6i+k+nsdbLKLl6sSuEN3yJSueFtDW6eE=;
 b=WTI0dZNhsZ9Ssvx/x7CegNNPtJM6wzvfB+P1BmOFpE0F3GTuJ16uVjozpNaiJOF/RY
 H72C3bM1s8vRFeZbtn3mkfi9IaPWo2kVSIOkMIClikmopHpebq9yxUeX5r7RxPrIggsI
 yaFlpCe0K/O6ZTAn1X+elIcsIBMY2bu3BDhxhZf3ux5qSmJQse9T0w8jOdyg5dVWndHB
 49utNJfqpD43y2Guts1xVQSAt7zqkdsB8amc5KnNVcavUAQrmC0QDefRTpYWnh3ca44x
 QwfJ2aWWh/IIS1Z68+M6Uigb2rQsRCGnuUvCkQgj/FdtMJWLBkvb7oPBy/kt27wO2gfF
 nl3Q==
X-Gm-Message-State: AOAM533u6n3UM9OW1bM1vccnTjJA7Ocea6BeX9zG8xqFIZLlMob4Ffj8
 m3KN2gLz/slb9LSQ3XLOCD+zgewhTKS06umaJY6vIQ==
X-Google-Smtp-Source: ABdhPJytKKjBC+1tx/tosNe+wPjZ+tqJeaSSCuI/UKVuljhp49pDktYwOrZhqRFSjcDRa+YjkKhPUevM9kSQOtK1mRQ=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr7927541edd.100.1612448702682; 
 Thu, 04 Feb 2021 06:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-22-cfontana@suse.de>
 <871rdxrt08.fsf@linaro.org> <7500a412-c94a-6990-eb48-9ee78bfb94e3@suse.de>
 <05980f44-88a6-6ef7-b263-07c2d898b8f0@redhat.com>
 <483bc092-cf71-d2c2-59d7-861f3131c8e4@suse.de>
In-Reply-To: <483bc092-cf71-d2c2-59d7-861f3131c8e4@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 14:24:51 +0000
Message-ID: <CAFEAcA_ArFBhfasRHQ3VbmKisnP7i2rm48vmji9RB5ub+dzStA@mail.gmail.com>
Subject: Re: [PATCH v15 21/23] hw/core/cpu: call qemu_init_vcpu in
 cpu_common_realizefn
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 14:18, Claudio Fontana <cfontana@suse.de> wrote:
> If we could consistently move not only qemu_vcpu_init, but also reset in the common code in cpu_common_realizefn,
> and force the sequence: qemu_vcpu_init(); cpu_reset(); in there,
>
> and this actually works for all targets, maybe this could actually be an improvement.

So my question here would be: what is special about CPUs that
we have to reset them in their realize function?  For other
devices, we don't reset them in the init/realize sequence;
we rely on the whole system getting reset and that doing
reset of devices.

There almost certainly *is* a reason here (my guess would be
that it's related to the mess that is reset and in particular
that CPU objects don't get automatically reset on system reset
because they're not on a qbus). But if we're thinking about
aspirational goals, I think the aspiration should be to not
need to reset the CPU in its own realize function at all...

thanks
-- PMM

