Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C542C5DC9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:28:41 +0100 (CET)
Received: from localhost ([::1]:48292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPkm-00070D-Do
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kiPeV-0005GO-Kp; Thu, 26 Nov 2020 17:22:11 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kiPeT-00082s-VO; Thu, 26 Nov 2020 17:22:11 -0500
Received: by mail-ot1-x341.google.com with SMTP id h39so3029055otb.5;
 Thu, 26 Nov 2020 14:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V01+2pVf3iNWwDk6BZ5Dn2lGMVYKNZwGeFqfpVoAE8o=;
 b=GCD9HlAKX1toB0hyoYiwZEloOhiwaY9AFjuZseQ0ZtA8HTOL4jtngAD1JdcEOu2yRJ
 xVddNg5TXr7xdG1pLzaY81vH2vs91tvEGMJbVoaEAIQVryC6BXFbgPIWR4/RvQ3kcU0t
 pGb837jTvU9wmBNr9wCn7KHlrhNRwZERrDZ7w/BVhh8yCskk6LyrimNqy+aJrUJvNWvO
 M5uvWaDY4w9CeQbdilltpUSsfvgL/JVw+XMXlvI7EI1G0J3VjZ4pd4/Uk3PWbrB3qLoE
 ow0X9DdpJ/JvFSlrbYFzuFTGjw9whNgdTYFAqcikSi8hefzhgZEC8ztl/NYiUrSB59hQ
 M8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V01+2pVf3iNWwDk6BZ5Dn2lGMVYKNZwGeFqfpVoAE8o=;
 b=hQWGSaVuaeFcGx6+hJDiKYghPbAubFseUW+vYi5KHdLEF1WoZfybzRHIphB1dKOISr
 Tw2S3CzeoYk+g0EExZG/Jgqm0l9QtoBYNNMcPHR2lo3hXKgL50ewo7mh996R6eP6SsBX
 xwXObRgaiXRfGNT0bhiUMlrck7zsxgwh1KMaBBt02B2AHiH5jKzGtLAg0PoEG8ZNH2yg
 j7Cr9r1DbpF6c6LAxUFZA+x4MMkSu2ODIUQMxOZ6uR9OoXEq75DnJqU5nIC7uhF8mUo7
 iBgmv/jbVTEZOu0SAkJovnpAqDR2lIktTj6SPicYFPATUM5iPV52QLFLUwV60NJYfYaf
 Nk8A==
X-Gm-Message-State: AOAM533wNHG24fLeFyk54zzKo83DmlXaF7QwVLuir8xI6Mj4MAdhFV8F
 a4o6QtXr0JiQome86q1S29jeSM8E3+MtzW/gdyo=
X-Google-Smtp-Source: ABdhPJww93fj0xFBms+PCGC2HKcEEKnmZBr2PE9D/JaTaOEvBFqNI+0AnF9HEm49CKs+81oQB0ev1mIOBtDUA+PP3Eg=
X-Received: by 2002:a05:6830:4035:: with SMTP id
 i21mr3673707ots.221.1606429327728; 
 Thu, 26 Nov 2020 14:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126185605.539311-1-its@irrelevant.dk>
In-Reply-To: <20201126185605.539311-1-its@irrelevant.dk>
From: Minwoo Im <minwoo.im.dev@gmail.com>
Date: Fri, 27 Nov 2020 07:21:52 +0900
Message-ID: <CAA7jztcYwDm3-T4mhbWYOsPn+5-ko6j4Qd2ge7DVLgAf7GfKAw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block/nvme: add compare command
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-ot1-x341.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Fri, Nov 27, 2020 at 3:56 AM Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>
> Add the Compare command.
>
> This implementation uses a bounce buffer to read in the data from
> storage and then compare with the host supplied buffer.
>
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> [k.jensen: rebased]
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>


Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

