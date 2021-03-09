Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F7332E7A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:46:43 +0100 (CET)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhNS-0007SO-H6
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJfCH-0004V4-Oy
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:27:01 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJfCE-0003Sn-Vw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:27:01 -0500
Received: by mail-ed1-x531.google.com with SMTP id dm26so21310119edb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BzEi1fcPHCu1SeOGWK7zuipJlQvhGM96UMkejEtwLd0=;
 b=XlBblAYnDF4I8oELsXpWrvqLCyNfpqRNXBJQMvHgqP8AOfXgnTk3CXo4b9hysr6VgR
 cciU+bx+Ccd5I4HAIq82QUXVEZ2czUsNo/NH4JvFDOwolCEwax2q6Oi4mmZwUDr+PzEH
 leCxAWa+/YkVCeT8fScW1Zci2UzLOF8pMpuBEBKG5NK5S0yA1oSKvsIsjTAo5KF2gv4L
 xghgpvbmgVnvwW3QTvOay+zhS92DQdTA396wy3PXfjZ9jPoAaPPnKbMKDmu7SskziFHH
 0wcoiQH3XsiuKQGh6H8CrMocJJfePANvLJCinf8qXpcCABEnQMIh0d3Dcigd4Mnd/JMC
 iv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BzEi1fcPHCu1SeOGWK7zuipJlQvhGM96UMkejEtwLd0=;
 b=QgkIq74I0MofaYdMTrclXWLnUYhWteD3pcp3ptefnoSwDAX8gHDRsY6roScxSKAeFC
 iFOO/o5twiNKB/B/2ol1yjk19LC7ZdjHew5+sVkLEQS8IJuCvIx4eYU4Of2xnUI51gbP
 z+6/eSifXIrZ1ATR1ihvY2dBG68C00fOgybolnQij2uPjG+0JUf3rrEBBzTzYHp8Zayb
 0CpU44b2Q7a8YUn7foCL7Ww/qkf/fQroJ6+Yv3jp5nz/xBYXsTgaGdWIMSTBcij6Hw3z
 1vesjPTzcK2lfCIg23I4d6EnqGn5AtLMeKanYfGBzNnnyYjus7tMPQC7N1gjjnsm5IQQ
 14+g==
X-Gm-Message-State: AOAM5333sbTTH8IfctbGwIj5hBx1hCJjynVDZ/ZO9idUlUkJF6y2A+ak
 oD53httX8fquhrAydBy7be89kbJD42N0V1Vl2Ec+sw==
X-Google-Smtp-Source: ABdhPJzNlVlI2bI3nwakgx3Jk5s3sh2gJsCFZFbFvBPrqLxcFkFjfH1/bLZN897NktNssJufcfZ+SoaIZAEeO67/ZBg=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr5188652edr.146.1615307217610; 
 Tue, 09 Mar 2021 08:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
 <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
 <11854ebf-ed88-496d-8381-5385ef1b403a@redhat.com> <YEeM8eUUzm9AlaFI@work-vm>
 <48fd9bee-4542-533a-b893-7acf3744fe36@redhat.com>
In-Reply-To: <48fd9bee-4542-533a-b893-7acf3744fe36@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 16:26:39 +0000
Message-ID: <CAFEAcA-jnVADA85uTxPUUHfPLacN5+-d=D8MjKzfr3bT2hL7gw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 16:20, Thomas Huth <thuth@redhat.com> wrote:
> The vga code basically does this:
>
>      region_start = (s->start_addr * 4);
>      region_end = region_start + (ram_addr_t)s->line_offset * height;
>      region_end += width * depth / 8; /* scanline length */
>      region_end -= s->line_offset;
>      ...
>      memory_region_snapshot_and_clear_dirty(... region_end - region_start...);
>
> Thus it uses a size that is nowhere guaranteed to be a multiple
> of the page size.

The documentation comment for memory_region_snapshot_and_clear_dirty()
says:
 * The dirty bitmap region which gets copyed into the snapshot (and
 * cleared afterwards) can be larger than requested.  The boundaries
 * are rounded up/down

That is, it is the job of memory_region_snapshot_and_clear_dirty()
to round the boundaries up/down to whatever extent it requires
internally.

thanks
-- PMM

