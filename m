Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB5327055
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 06:15:36 +0100 (CET)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGEQZ-0006hY-UI
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 00:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEP6-0006Ea-Qv
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 00:14:04 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEP4-0000sv-6u
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 00:14:04 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id c131so13386161ybf.7
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 21:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkYnJ7wa/+zI+8NUoftb2gtLTjwFLyuZgytDrAWBTPo=;
 b=XHedob714sb64JpGM0HO17mqW2vaW7rdOUv/NqtXSU5XVyjvCnIiJfAJ0phraCYLJH
 afPVRfAC2zjvK050n5zBvkz0bNsEShUExbxrBzeUC4//uAl2OvGTAi3R23gKjL3wKHc0
 e4lKvyDm0ACCu7IGR4v1j3ETW8Wg+lj77SVR0OVh3OqdC4jcQcy3lRH1DfLbcncobhUh
 XigIOw4mgx+K148h0OZuzXo2zW8EOcU9/vhJjZk6al+cGJottXy1s5XoL0ZbRqYSJ/KY
 i7YMDiy73iH08oO0l3irxUGbC4MoqLH/qMxe2K0ERsGogd573+PaC2SDOSjJaBdZdUgI
 IjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkYnJ7wa/+zI+8NUoftb2gtLTjwFLyuZgytDrAWBTPo=;
 b=oJTmfofT9t2GhRuW1NNKExdxSXNWqpuTg3qs+RdLHDz4UxEzSSnHAgNf+SX8aKdk6e
 BZEiCrQE0me7E5zBMCoDT/6efOuCY1U6lCJfibVUTUx1crF/ZdCE8cvoiIOfXW2UM+tP
 OIyhs2zbW5/pH7ZzovZI3nB0Xd6hJ98YD04U+fw413ePdnqX8pUgLkRPo1rI8yZhwOEY
 wcNuyK0MIcUGQF/+8kS6bncGM2KSlRJ/jwzfyxPe6e+gx/45H0vXUI/UVUToGxjZiYvB
 Ajsk1l47u6Pok0K51fiusKXnw5j9PpO6NMomfEj8wmCwZbj4kywMYN+VaPS0dSC6Jxw6
 PljQ==
X-Gm-Message-State: AOAM530z+QYIvv8rp7eRN8vmRSrNyWOD0Y0ZJv7hJUFcItSBkGZvlvtw
 JiiVq7X9UHHUsm7+JjswwDtWS6z9qRkRGna1/Qg=
X-Google-Smtp-Source: ABdhPJypScBJ3+MtCR4DInyxi1jykPRdVQR9PyJeXHV8vdXORnRRepBYDMX/MJ8YPjE7VpEp7y8ZJiQN8YcIHz4+KQs=
X-Received: by 2002:a25:d17:: with SMTP id 23mr16158716ybn.387.1614489241234; 
 Sat, 27 Feb 2021 21:14:01 -0800 (PST)
MIME-Version: 1.0
References: <1613739127-61825-1-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA_qpOXLXDkaYq6T+StUnSUEuV6+FL94bgzvkoRE6ShUMA@mail.gmail.com>
In-Reply-To: <CAFEAcA_qpOXLXDkaYq6T+StUnSUEuV6+FL94bgzvkoRE6ShUMA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Feb 2021 13:13:50 +0800
Message-ID: <CAEUhbmXvVqqn9QhC15oAV_erQzdfhOUQoxVoNcEgmVH7D9_L5A@mail.gmail.com>
Subject: Re: [PATCH] Make ram_addr_t 64 bits unconditionally
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Fri, Feb 19, 2021 at 9:11 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 19 Feb 2021 at 12:52, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Currently machine->ram_size is a ram_addr_t, whose size is 64 bits
> > if either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
> > enabled, so it's effectively only 32 bits on 32-bit-not-x86.
> >
> > commit 4be403c8158e ("Make target_phys_addr_t 64 bits unconditionally")
> > did the change for target_phys_addr_t which is now hwaddr to be 64 bits
> > unconditionally. Let's do the same to ram_addr_t.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > --
>
> As noted on the other thread, I like this in principle,
> but I think it would be interesting to check whether it
> has a measurable perf impact on the non-x86-32-bit hosts
> that it affects.

What measures should we take to move this on? I don't have any access
to non-x86 32-bit hosts.

Regards,
Bin

