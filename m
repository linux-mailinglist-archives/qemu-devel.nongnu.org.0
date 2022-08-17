Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C826D596779
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 04:39:26 +0200 (CEST)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO8xm-0001CH-VS
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 22:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1oO8ux-00089A-7s
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 22:36:27 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1oO8uv-00080I-1Z
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 22:36:26 -0400
Received: by mail-lj1-x22d.google.com with SMTP id y23so12286677ljh.12
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 19:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=FP4TMsYtWpuPZzFddeltvAS8iEg/MYJKwHuRTq2xrf4=;
 b=ioc4QtqfG6eKkRe/ddJaLEPKgm49syDJS1Tiwe1r6bTNlgajyJo6crpHBAzFbQzSut
 H0iLFfDnMs9JgSILXW7hDSPNKCzT+HYqySsGIb4KAHkcc/O9kE82/izVepKQYSwG3317
 gyoLkjUuECat3kuY57lh2lqPcexH7Sc+spnu4iWokv9RIgvXLBJLxWUmZ5b9M/8Iw93H
 x9uovTFsgY5Vhi9zgcKEy4Y5JMEx05/BCJBFn+m0ExT26vGudNjTKZFnreG0sGOjA6ZY
 JwuKA1bxSPEPgO/k8DIPBM/95j7NrhU6/pVRUFuTXJ86AKzWdmH3sE/k+AXlZ96XD/1a
 vKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FP4TMsYtWpuPZzFddeltvAS8iEg/MYJKwHuRTq2xrf4=;
 b=GZlJEHy7tu4YrQWhTxGwcALLYDAdLqOiYh+8Jisf72p8CVZGU3nFXw1khCReo5LK/X
 mAZGuBR9pJhCYS/YRMooJdgKCnp1HYeJvZzNS9HpT9wVxGYpGrNunszUOmjFI4hWEk/0
 wSbMYym0Vog0ADVNLk/0scNG8em9kMb5xyw94RrqJhECtw+b+ik6MDKfostLO0EVoEfk
 qKAJ6b8YHAYIw/6QRKaJwjV9Spqp+YLckLB+6APabdIJEm4KoM3pQP4VMkZ4lTfprFOy
 pwa0yN265WwFJK8eJiniqQv9aVH4OmFfUK+djH0N3MRPEVURee9dUQPdA7PqcsMJks+v
 QJbQ==
X-Gm-Message-State: ACgBeo3fCQgpFqvwVpfvnwL0iG8QmwnM754hn7kIorEkGhlEERHz31jC
 is787AnJndIdy6ffAgiQtMJ4mBjfLIySvUPilkk=
X-Google-Smtp-Source: AA6agR52OijIZBQvpccaa4IYIBrOtwU1/FuFXNLkjYJAgi8alJ9rCPiw59X3amOIv7e4KWtWfPvwmZgE3B5cMNmM96c=
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id
 k8-20020a2e92c8000000b0025d6ddfe71dmr7005436ljh.170.1660703782323; Tue, 16
 Aug 2022 19:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
 <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
In-Reply-To: <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Wed, 17 Aug 2022 10:36:08 +0800
Message-ID: <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
To: Richard Henderson <richard.henderson@linaro.org>
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-level <qemu-devel@nongnu.org>, 
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard and Xuerui,

On Mon, Aug 15, 2022 at 4:54 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/14/22 09:55, WANG Xuerui wrote:
> > From: WANG Xuerui <git@xen0n.name>
> >
> > The only LoongArch CPU implemented is modeled after the Loongson 3A5000,
> > but it is not the real thing, ...
>
> The 3A5000 is the SoC, as far as I could find, and the documentation of that says the core
> is named the la464.
>
>
> > In general, high-fidelity models can and should be named after the real
> > hardware model, while generic emulation-oriented models should be named
> > after ISA levels.
>
> This wasn't intended to be a generic emulation model, as far as I know.  There are missing
> features, but presumably those would eventually be filled in.
>
>
> > For now, the best reference for LoongArch ISA levels
> > is the revision number of the LoongArch ISA Manual, of which v1.00 is
> > still the latest. (v1.01 and v1.02 are minor revisions without
> > substantive change.)
> >
> > As defined by various specs, the vendor and model names are also
> > reflected in respective CSRs, and are 8 bytes long. So, rename "la464"
> > to "qemu64-v1.00", with "QEMU64" as vendor name and "v1.00" as model
> > name.
>
> Eh, I suppose.  I'm not really keen on this though, as I would presume there will be
> eventual forward progress on completing the real cpu model.  We simply won't give any
> compatibility guarantees for loongarch until we are ready to do so.
In my opinion, real cpu name (Loongson-3A5000, Loongson-3A6000, etc.)
and generic qemu emulated name (qemu64-v1.00, qemu64-v2.00, vx.xx is
the ISA level, I found this style is used for x86) are both
acceptable. But la464 is not a good cpu name, because la264 and la464
are in the same ISA level, while la664 will be in a new level.

Huacai

>
>
> r~
>


-- 
Huacai Chen

