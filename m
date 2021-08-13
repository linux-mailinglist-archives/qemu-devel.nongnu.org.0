Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422DC3EBA51
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 18:45:57 +0200 (CEST)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEaJf-0007Zm-RQ
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 12:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEaIU-0006lY-VG
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:44:42 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEaIF-00049t-Iq
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:44:42 -0400
Received: by mail-ej1-x62a.google.com with SMTP id b15so19314322ejg.10
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 09:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8BCSS8d0ct5KHtCFrgYthNO1VjuHDd84aooPMW1oYs=;
 b=wGc1zh7MINa8RSGhV0OGtgnomqvowf8sLlm9rtsufaUT9bJ6sB3kr0+40hlADyrRz5
 NuxiCBAQzscV4SYbZ93XOId0YOEJJT53LwdrxrdhvhhjrJ4ByCCmu/cAhbdV0WN69Uak
 YB7SaARj6SH6F6uSHRuJ9AKeaWNtk6+31DnFSrXQY6bS6dbE6flxLxpEbijJ6OhXn1ZO
 syeqeGFlMxdHx1FANHsIZf0u4QFTswdFNYz+L4IU0o75k79yF+2lgU2uMT+Lqo41bn+u
 owj6Y+PQeGUnCSXsZa//uHAOhwTBj6Hzmag/y8jB9Pa+Wj4vTmTh+0OnpZ50N2czrIEf
 tHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8BCSS8d0ct5KHtCFrgYthNO1VjuHDd84aooPMW1oYs=;
 b=cxvdhemp+Jlr1IxrMxPgDe3OB1mT3Gc/gGcgqsWllWrYvBZJKjnrwxxAKxjPcna8jy
 rc23yr6yXwx2xrNkgiT4PnOWYPGxngxA3xiGChUoodWSRU/yZMENHwhzeDZ/NXE/bTuR
 /sLtWTYA0d3EKMcv2yOqUiocCVr3gKbxWxrjaWT1j5WA3xM0EB/FKNr4zBk3NG4I+FmF
 XJxOnJ9K8xG5AmXvaGu+HKncZ0PYUlpOOoaP/zyNBVmLgYCohYiyZvjxQHsoTdFio/ai
 kwSOwKgrpa01zz64B0y1NG7OPG/wDKZatk4so2gPchsvynnBEyHbU3ABqyMwQV5kv+0q
 AuAg==
X-Gm-Message-State: AOAM533iv8Tx7pnIJYfk0xXA3f06OVmTuRxafXG2haNfuKWmpRgNCtmk
 YXqwJJO6Mn3OxoQsX4E58sP4OEmq4feI3OK1G/ivlA==
X-Google-Smtp-Source: ABdhPJzz5jueaN6fnDFNdtIXVllG5BCfwA/3unabzvLThlMcl5z1mBbf/jMmD8KBrtUAfOYuSrfMq8o46Pwszygqe3o=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr3364585ejf.482.1628873065452; 
 Fri, 13 Aug 2021 09:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <4C23C17B8E87E74E906A25A3254A03F4F216C4FC@SHASXM06.verisilicon.com>
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4F216C4FC@SHASXM06.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 17:43:40 +0100
Message-ID: <CAFEAcA9JWA515a4uO=G9n5eTaNNuCJ7GKZnmdq3v6F9zusCnZQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/pl330: Add memory region to replace default
 address_space_memory
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Aug 2021 at 07:44, Wen, Jianxian
<Jianxian.Wen@verisilicon.com> wrote:
>
> From f780b0ee2ee36c562ab814915fff0e7217b25e63 Mon Sep 17 00:00:00 2001
>
> From: Jianxian Wen <jianxian.wen@verisilicon.com>
>
> Date: Tue, 3 Aug 2021 09:44:35 +0800
>
> Subject: [PATCH] hw/dma/pl330: Add memory region to replace default
>
>  address_space_memory
>
>
>
> PL330 needs a memory region which can connect with SMMU translate IOMMU region to support SMMU.
>
>
>
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>

Hi; thanks for sending this patch. It mostly looks good to me.
I have a review comment (which you can find further down in this
email), and one note on the patch-sending mechanics:

Your mail client is sending these patch emails as multipart/alternative
with both a plain text and an HTML version. In general the list prefers
plain text only, but this is particularly important for patch emails because
the HTML can confuse automatic patch handling tools.

If you haven't read the SubmitAPatch guidelines you can find them here:
https://wiki.qemu.org/Contribute/SubmitAPatch

Using 'git send-email' is usually the most reliable way to send patches
if you're a regular submitter, but it can take a bit of setup to get
working. You might also be interested in the sourcehut web-based UI for
sending patch emails described in this subsection:
https://wiki.qemu.org/Contribute/SubmitAPatch#If_you_cannot_send_patch_emails

>
> ---
> @@ -1108,7 +1111,8 @@ static inline const PL330InsnDesc *pl330_fetch_insn(PL330Chan *ch)
>
>      uint8_t opcode;
>
>      int i;
>
>
>
> -    dma_memory_read(&address_space_memory, ch->pc, &opcode, 1);
>
> +    address_space_read(&ch->parent->mem_as, ch->pc,
>
> +                        MEMTXATTRS_UNSPECIFIED, &opcode, 1);

dma_memory_read() can already take an AddressSpace* -- you don't need
to change these calls to address_space_read(), just change the AS*
we pass them.

Otherwise the change looks OK to me.

thanks
-- PMM

