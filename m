Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDE586CD3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:27:41 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWOS-0001sh-BZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWLw-0007QH-Hx; Mon, 01 Aug 2022 10:25:04 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWLu-0003P1-UH; Mon, 01 Aug 2022 10:25:04 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id j195so19130910ybj.11;
 Mon, 01 Aug 2022 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xWKQnhZTeHEF7c8boMVi8dErKRrOmi8etAD1IcXVUYA=;
 b=RymscPAIAHR34myBzSQV6sCqUfDgGZwWSdMnpXpW/y+Xd/uaggprI7+sDBlSYptGPb
 89ge/7SQZ246zXaYMZ0pO3Mf12ne3ZNEGFVQ+Qkxz8x0lWs4dPf2Cj3SS8UUxNZB6zVO
 2eH39qEySrh4HOW1Y5W++ZzTKy9waBc0BOqOTkv4gSlGgi3v7LHhmFpaOKRfKy66gfTe
 4Yd7XuA+eCzkVfuN+Bil+EAUBKd5FGKTRMcfZS0MgQBRkVPQRh7UpZVYmpGSv26Moe+R
 5hrnGhU2EajGMC1Oqqxp6lS8A9FDTfT08Xd+wn1CG5qAUAs7SAujbAfCHioigD0Q0/zU
 tY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xWKQnhZTeHEF7c8boMVi8dErKRrOmi8etAD1IcXVUYA=;
 b=HOt0EmQokw8QRWt4S+Af61Onqg+xix1Vg/qf9m+Q0IDbs3+gFllnKwvi5GPTjBbEjq
 fHwLxyQvExu3G3Xk0ijSzWEPGh5r9UGx0bzkovP/uu+FjbCDQsUkLUakY6XSKuaW6SLh
 ctVBsOdo2A7XzkX1WwYsFP9OFAef96kj5t9j+ZtO34VPylito1pkp/vzVHY+d0kIYai5
 zNXXwMtshysu2Y9wARo5ZhtlLDD4rxaMm09GhAxvBin3cGJqbNpy6A7xwcQrSwwFpIKZ
 Q53e57Con+N7B9x8qXyyBM8AGhN2vuC90m6mnB5/aBZNCiHdicyEJrHMqznpM+0NUXTO
 01+Q==
X-Gm-Message-State: ACgBeo19/1AJn7XOxGAl4BrKPNB7IFgEmuf15GkFwUg40l9MqQbt1Ze5
 cYQyitU8HZfG03Yf3w/LTrvofx5BBs9/WZLqrPU=
X-Google-Smtp-Source: AA6agR61J/u/NHduhmFE/24b7003Ra+4jsWdPrD9xQVcl6BIRjEbtS12EIkk6tAf64FjK4G1h883A0gqCLqIXHn+BdY=
X-Received: by 2002:a25:e78e:0:b0:671:88ae:bee0 with SMTP id
 e136-20020a25e78e000000b0067188aebee0mr10817287ybh.58.1659363901542; Mon, 01
 Aug 2022 07:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013205.10371-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013205.10371-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 10:24:49 -0400
Message-ID: <CAJSP0QXX7LX88A2w-VoYb5u7boC69X=0VeANQq3BXfotXutO8A@mail.gmail.com>
Subject: Re: [RFC v5 02/11] include: import virtio_blk headers from linux with
 zoned storage support
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
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

On Sun, 31 Jul 2022 at 21:33, Sam Li <faithilikerun@gmail.com> wrote:
>
> Add file from Dmitry's "virtio-blk:add support for zoned block devices"
> linux patch using scripts/update-linux-headers.sh. There is a link for
> more information: https://github.com/dmitry-fomichev/virtblk-zbd
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  include/standard-headers/linux/virtio_blk.h | 118 ++++++++++++++++++++
>  1 file changed, 118 insertions(+)

This version of the <linux/virtio_blk.h> header file is not yet
upstream. Please move this patch and the virtio-blk emulation code
into a separate patch series. It depends on Dmitry's VIRTIO spec
changes being accepted and the Linux code being merged.

