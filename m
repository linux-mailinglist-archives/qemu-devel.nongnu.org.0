Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3CB58499E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 04:10:58 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHFSr-0006jy-CJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 22:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHFQj-0004yt-MB; Thu, 28 Jul 2022 22:08:45 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHFQh-0001i2-Mg; Thu, 28 Jul 2022 22:08:45 -0400
Received: by mail-qt1-x82a.google.com with SMTP id l14so2460761qtv.4;
 Thu, 28 Jul 2022 19:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H8LAnQEdgaQwy5buPc63lvVf8AswWrRTySnIeNXG+HM=;
 b=Z+TTBc8cZ4ihdw5K1Z3U2MMiJNJUX8q6S0dC6M7WOkmuZlG87vCuVbw3/NS1EyNpiD
 wNv0r01N18uEKIPu1f3nLSkLz80D4VzyfTqKTeXtdjduViOh/ee9poak91dYOOmcbvtZ
 mRB/bGJ5zh6yp6/yClfexjyabNnLh2mjhJ0lTSq8nJL5dZ/9Wsd8LR+sHAuSb1prsZFO
 LJL0SciHAB4G1UQ0RDaKvw0AkN9Je9RERXEgiWCcIm/cFuAvY0cIkbCJsQ1xhPtrxJA+
 3DJjFlcVxNiDSQ6ljSUljaMBSHKTxaH8a+Z0nhH+iA5dkqcuP7vP+KjaKmbs9sBcIZMk
 FJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H8LAnQEdgaQwy5buPc63lvVf8AswWrRTySnIeNXG+HM=;
 b=Q8XBnuuEzxYeuJDcqd3iNOrbkNWZiP0s4K14IBguBTfNfhQ4AeMdcACK+4eV/O/tEy
 nEc+lUbghJmmcmcTmT6RBXdTaGvMxATDqqe76/oaeyPvS+LVxOIwOvyMvAcy8aobfeBp
 gvtNuXTRw1y/4MupDtjMNLP/XvawXJOkD1pPAxo52Y2/ISm0S2P/WER5ur2AeSZx1VlB
 dTXwWXSNtfal4HtzUeScWDBStVfup4YP3Pg2pnmWks/yr9jhjT1lqM9+6hw9yWIanPnq
 lrCNSg/f7AUx0OmEMoNgQRmSrPZkTvOCiSuEc+QYY+VQc0T2yBg7wCV3RKGKaTIh2yqy
 ADVA==
X-Gm-Message-State: AJIora9XymXhLUtqJHO1epAM5WHwkZ0z9mVo2BkUNtxvUAnEGXr8MEJT
 2bneRXdDJHsSPR06hXBCZAZ2tu/sizCr6awgFC8=
X-Google-Smtp-Source: AGRyM1uPixyKdDGjR9XjBB8SxppuBUipfCWtH6nBwIdkhLDUGvzerdUoDyzG9eyqe0M+jAhmr6eJbnS6LEon6LJjwZo=
X-Received: by 2002:a05:622a:100d:b0:31f:25e3:7a45 with SMTP id
 d13-20020a05622a100d00b0031f25e37a45mr1622316qte.365.1659060521536; Thu, 28
 Jul 2022 19:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220728200422.1502-1-luoyonggang@gmail.com>
In-Reply-To: <20220728200422.1502-1-luoyonggang@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 29 Jul 2022 10:08:30 +0800
Message-ID: <CAEUhbmWrLJ5=AGbPAF3jdE5i3SGPebbd42o70OQ4JnfzaH8=HA@mail.gmail.com>
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82a.google.com
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

On Fri, Jul 29, 2022 at 4:04 AM Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  .cirrus.yml              | 2 +-
>  .gitlab-ci.d/windows.yml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

