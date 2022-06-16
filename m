Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D854E0C2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:26:30 +0200 (CEST)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1oZx-0002BO-HR
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1oRw-0003pW-F0
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:18:12 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1oRt-0007SS-QU
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:18:11 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so1323933pjz.1
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HT3XCh8zga3m7ytHGKiV4p8LVk1a/Q5+eIuxY/AIYoY=;
 b=b7XBvKpGKuoy+t1i7KYKRPVIHzEtuWDQh0UQJmg/l1fuJIS7NzKUbl+KiTw/hQV7E1
 BYoSTW1WFHy/YKyX50ywucOzr684yjFNGsTZtgX9UPioh1yzdXdnR4nAe3pjwkalRsx1
 DRBvjI0w5j6C/hf7dJflCiRp8jJTMohnHCs6CRLKI9N+tJ/6Kiul75ds4quYMOZYldG3
 8HHK0R7NAqfHlgD0gbF1qnHw0TPYBHBYuPHowcDbNcY/V+N37PjPLAvp3HQStHyBEgmu
 L4PGjtDruk18uABkOQn1lm3xVrrmrKxUBqgZNBPIGaWPBkabKFjiamT6+MZ4VPaxz9WG
 oSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HT3XCh8zga3m7ytHGKiV4p8LVk1a/Q5+eIuxY/AIYoY=;
 b=nKCy0cg06WfioaoVmCiyI0AL50jkCzRCE9wYnVnmi6CM2w2l18T43unQEAzNU54DWk
 R9sbRIrIaHbhxYF6y46BEgyN7/KB6rf9IfE5qst333CwTpirEpYh3k/7hN4QoyLiWPif
 arAgPEGWGAOIJETWk3GIm+htF97Nac5zu8EzSmouPEhElNldfEi/Rsb5Kmg787rW9sSG
 6CZiK0KCrfj9l81OM63kq1E6yMiRMd5Tqcb0PbIgg9sdXLKlvUcqzoaTHycreVBcYm/x
 AUSJy4yCb0tD7smop/TVU4CDaskMyEUUr1Da6PdvdNdZtcVgl40LTDB6cQg2RiQCO9ED
 Jr/A==
X-Gm-Message-State: AJIora/i1UaMJ8gE10k/2DXz3WeqopF/9Fiip/6O4RpDCwkyh94v0c4G
 lxBKfFVUUAO7QXyBCNp+FMMRAW7OC+0hoVA5XFY=
X-Google-Smtp-Source: AGRyM1sG5BECQGgk646bZcRg8HjauEyHXBZRIgGh4d3iUaowgcK5EW6imcEgKjEqlIciJ04vdb4JiZc7ynONsNE/QJU=
X-Received: by 2002:a17:903:2291:b0:167:59ad:52e8 with SMTP id
 b17-20020a170903229100b0016759ad52e8mr4399446plh.121.1655381887245; Thu, 16
 Jun 2022 05:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAEUhbmX8hOuhHrT1xx3HrgUt5jZvO_jUN+64RPWfZADKCbGvKg@mail.gmail.com>
 <CAKmqyKOO1o9BX66pNd3fevkK5URnHqefkbnuJqBrqYt4=4VXdA@mail.gmail.com>
 <Yqr/jN1bnEmDVIKm@zx2c4.com>
In-Reply-To: <Yqr/jN1bnEmDVIKm@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 22:17:40 +1000
Message-ID: <CAKmqyKPRd-aA=R3d+naV4YC=9KqRLvGBwkyqDGvs91AzOCOsHQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jun 16, 2022 at 8:01 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Alistair,
>
> On Thu, Jun 16, 2022 at 12:32:36PM +1000, Alistair Francis wrote:
> > Applied to riscv-to-apply.next with the full stop removed
>
> Great, thanks. Just wondering: am I looking in the right repo? I don't
> see it here: https://github.com/alistair23/qemu/commits/riscv-to-apply.next

That's the right repo, I just have to push the latest updates. You
should see it there tomorrow

Alistair

>
> Jason

