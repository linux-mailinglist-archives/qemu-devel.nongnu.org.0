Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFDE2C6A1D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:49:32 +0100 (CET)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kigw7-0002gg-W4
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiguR-0001oQ-JD
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:49 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiguL-00058W-D1
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:47 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so8475296ejb.3
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFI4g5tKIg+8FkTDm8TF/ivYcrUKkhGXo1xF1itZwZQ=;
 b=hGncZYa7UMJRHo8ItFhGUq+3J/LE/mnTXhKU546TTu9YmPmlE+ZkZuLSXKwPLAa9HK
 PrlK9bFBWqZIN7KQGFdDHJWQ49qPagWn7YQi6Is9OW0vERLLC/u1xqRJvx6JERXBBVOX
 xsjyRiOyed6nVYj+aRgiXV9dQkweZCwSyB113jFTZFtYY6USfFDoq894y32LmMqh5Cdd
 adBawl7Vw98CDLlUiOelrWzREBZtuy7PgRthIzm0WxEFjTXe/LiWspldO2uCqCNjHKPb
 xtaIen81RrICxmcaXuyu7hVGRxbkbFyix11WAh4NwSKZFBVARV7wnW4yTTGyeXWPQOZK
 L/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFI4g5tKIg+8FkTDm8TF/ivYcrUKkhGXo1xF1itZwZQ=;
 b=j/Ty4djXjE/o5k/LXc79LPw1U+Th6PAYoXH7Yf5ivzmwg9nbTxzCBJowPYc3+psOHT
 Op1PNTCkfn+FVDmpUmdMjo6o3w6rmPXLxsoQpT9xWiKLt2FDPAd0YhntBFg7i2pZiVrG
 4xYE7sCucYKNCNrHzCEnib0n3k5ekqazev7HBXkNiRCOleFFWnepl+PbSMrXAhUNDZmS
 u31bV/1hhrgoqO5jYlZ1FexlXJCB1WTFS2Q4vkmq5+CGVy8cShldCrRxVM957E3+SqAX
 Ez6OlgLUJ3vXnc/Q0ZQOTJzLjXqW4yfvG4vNIsmgrYPIsanBIU/TTtE4dUG2vGoZRmLE
 imXg==
X-Gm-Message-State: AOAM530wdCc8yhuUhPy00GVCRNkp4YY5ViYfC/9bwJBS0eCwtsOOkIZt
 cPUqA++yHAWsNbyyqdwRtoZljQrZZ3fH+9xqBic9fw==
X-Google-Smtp-Source: ABdhPJzCeOV0jOdOEAIOHHmeKj0JXr24gE0wwNJUwyLL+oQtHQTCxH55dWsOh02zrdz3WtDkXGiilYj7GAgdGkRxo7w=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr8186261ejd.382.1606495659277; 
 Fri, 27 Nov 2020 08:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 16:47:28 +0000
Message-ID: <CAFEAcA_Xo4ptyVhJGXvO3B4FJh86W-Oj81f_nxMbaZt-DPfLrg@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 at 16:38, Peter Maydell <peter.maydell@linaro.org> wrote:
> Having looked a bit more closely at some of the relevant target/arm
> code, I think the best approach is going to be that in virt.c
> we just check the PARange ID register field (probably via
> a convenience function that does the conversion of that to
> a nice number-of-bits return value; we might even have one
> already).

Ha, in fact we're already doing something quite close to this,
though instead of saying "decide whether to use highmem based
on the CPU's PA range" we go for "report error to user if PA
range is insufficient" and let the user pick some command line
options that disable highmem if they want:

        if (aarch64 && vms->highmem) {
            int requested_pa_size = 64 - clz64(vms->highest_gpa);
            int pamax = arm_pamax(ARM_CPU(first_cpu));

            if (pamax < requested_pa_size) {
                error_report("VCPU supports less PA bits (%d) than "
                             "requested by the memory map (%d)",
                             pamax, requested_pa_size);
                exit(1);
            }
        }

thanks
-- PMM

