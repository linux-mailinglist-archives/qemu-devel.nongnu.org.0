Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A7633E03
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:46:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTaX-0006PL-AM; Tue, 22 Nov 2022 08:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTaQ-0006N7-Uv
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:45:22 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTaM-0005Ab-9j
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:45:16 -0500
Received: by mail-pl1-x632.google.com with SMTP id j12so13671867plj.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h/Oq5Vzq43pt+TLJrWRrYmNSVpAun7Qi8dgVU+ujW7c=;
 b=k3lOBlyk3iHsIeVXcULj5W+XNzHp1npbXI5M2sD8U1JSKt6EbBkyOcmk/09DbkRvHM
 axwekI0YY+2wk6+JJt90G0N8wfWYo+5nBh4X8uyJv0Awpm41zbmeH5cHd2LfKY1oUjeg
 0/Rm9+QzbEdwC5QMW54WEprIxUVe2a7LBZrFnZyYPQI2gfmY6Vhqn0632KBypwBA6V5e
 3+yEGvgJi2TCGnmISw3BqbAH3nluf7GQ3PBs4KzRCtejemM6Lz5m492RdxU4kiOQd3Mv
 iP7kDEYGcQGqdKbGx1OxP77lTrr7lrnmskzp34il2RRdooswOxnnHgOBsE1tVZWsMPbt
 ktnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/Oq5Vzq43pt+TLJrWRrYmNSVpAun7Qi8dgVU+ujW7c=;
 b=hpU86UlIo1lbG1F2vYBG7cMuuYoB/oolHfV9Zy5lpEFeJWkkU/U0nHdfyJgwMP4h+T
 2e9UcW4tfClWDZPsl0InMCkY4ITQQZkoc717oZvvppFGZlCaPuaX/VoPn4EydcszqCRA
 epZ6hA06jx6kSJ4APxH+HuKSqcqCs0rCK+ofTKRI5ZNbw8TC28OXJO8ufCToAg9eVUXA
 U8bAy94XShJ1yTFErdZA4y7SThaxCn9E2pfbc/YJhBvEBHxGDz9lg9EPE1Lw8NwiZASR
 0JmIxNeLiXdvb8pGm3GG+8V4Qxoasqcj3QrSMHI/DklhfosnSIqToMkQLH/CdSgpGPyp
 MV7A==
X-Gm-Message-State: ANoB5pmcfg6LuuQvRiH/RZGDsBzsQ0ClG1X7ZAlcen5Z0mR9qFe+ppH4
 PqM0S4p7kLsF2HGVnvTGIClsla9NiIWyBID/BLSwhw==
X-Google-Smtp-Source: AA0mqf4V3vvjP4ttCxZ8W2dQmgWx5gK+pS0eqp1a1kDzNeDwIHvrfxv52eZn6QCfRpAGLMZHml+5AuA8VRxLuwxIc1U=
X-Received: by 2002:a17:902:b691:b0:188:5240:50ec with SMTP id
 c17-20020a170902b69100b00188524050ecmr4267443pls.168.1669124712405; Tue, 22
 Nov 2022 05:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
 <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
 <87a64ki7zn.fsf@pond.sub.org>
 <47e0d3d8-607d-5e29-6780-c0a4364993a9@redhat.com>
 <87h6yrfjr4.fsf@pond.sub.org>
 <CAFEAcA-8tyYDMaZgYvhrG5G001HzgkCUoTUMbChDteJ+q-r8yA@mail.gmail.com>
 <875yf7ce75.fsf@pond.sub.org>
In-Reply-To: <875yf7ce75.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:45:00 +0000
Message-ID: <CAFEAcA9zzWJXq3j1oLaGLQTkvuKqSCjVm9bszs2W_jYnM4zEaA@mail.gmail.com>
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, 
 groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, 
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com, 
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com, 
 david@redhat.com, mrolnik@gmail.com, gaosong@loongson.cn, 
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, berrange@redhat.com, 
 lvivier@redhat.com, suhang16@mails.ucas.ac.cn, chen.zhang@intel.com, 
 lizhijian@fujitsu.com, stefanha@redhat.com, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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

On Tue, 22 Nov 2022 at 13:27, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > The obvious answer is "you might have got your manual tweaking
> > wrong". A purely mechanised patch I can review by looking at
> > the script and maybe eyeballing a few instances of the change;
> > a change that is 99% mechanised and 1% hand-written I need to
> > run through to find the hand-written parts.
>
> Define "handwritten" :)
>
> If reverting unwanted line-breaks and blank lines counts, then I can
> make two patches, one straight from Coccinelle, and one that reverts the
> unwanted crap.  The first one will be larger and more annoying to review
> than this one.  A clear loss in my book, but I'm the patch submitter,
> not a patch reviewer, so my book doesn't matter.
>
> Else, we're down to one file, which I already offered to split off.
>
> > But mostly this patch is hard to review for its sheer size,
> > mechanical changes or not. A 3000 line patchmail is so big that
> > the UI on my mail client gets pretty unwieldy.
>
> With the manual one split off, target/xtensa/ dropped as requested by
> Max, and tests/tcg/mips/ dropped because its status is unclear (and I
> start to find it hard to care), we're down to
>
>  28 files changed, 81 insertions(+), 221 deletions(-)

Yes, this is much better and "I hand tweaked these things"
is reasonable in a patch that big. It's the combination
of the ginormous multi-thousand-line patch and the hand
tweaking that was the really awkward part.

thanks
-- PMM

