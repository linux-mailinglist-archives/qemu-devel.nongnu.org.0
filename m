Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A445D2E8868
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:13:18 +0100 (CET)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnH3-0004xD-P7
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnAA-0006sm-Bj
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:06:10 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:41297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnA8-00081W-Tl
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:06:10 -0500
Received: by mail-io1-f45.google.com with SMTP id t8so21449865iov.8
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:06:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqUNiBKpSYc13thrMeMsg0Jn+dOIIj/JOPCBY11nri8=;
 b=GgnPPcgGmawkyMKU7IEceKacOM2bl8JvsVUuPO6RKdecO1KaUflsLMeySwymfD5WY3
 tbwcZ4SF9qLPHhtY9HIP6Yg3pXG//cAyO02wqpEtONGbOYbnja9qnGIzj+McMrfLBlsd
 XZcYbqwg/Da4rOLMoqUGM/fWGC0BaXcj14Cvxs1oYFLvJr7QElDchTOzLUXGDVqicU8n
 xokCx7FBi3uZagEY+dglG6KMheyh14i/SPCh51qdqKpDcUWmr0OHzrDkVbfK+Nlz+K/k
 wnv2mRftWv+3Xiub6S4Yc92Ujx7zgkptWgzbita+5AboF1wiMYp2aLiIIDVdmxYAxuv4
 d7kA==
X-Gm-Message-State: AOAM532cdF3pbDH9o7iGumatzI6vkbWnirFL96zui75giWrOzAB533vS
 hyvzAz6a51tNP1zZTwJHNE4AAAfJFq0=
X-Google-Smtp-Source: ABdhPJzuKw6MhjUP07E5v2eyViz9c4ukX3YhVQX5AhzNh6Z1FIa1pOzYY7UsWkxLWrBg860eixS8RA==
X-Received: by 2002:a6b:c9cb:: with SMTP id
 z194mr53549225iof.110.1609617967756; 
 Sat, 02 Jan 2021 12:06:07 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id w1sm40120953iop.50.2021.01.02.12.06.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:06:07 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id r17so21684953ilo.11
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:06:07 -0800 (PST)
X-Received: by 2002:a92:cccd:: with SMTP id u13mr64749640ilq.273.1609617967316; 
 Sat, 02 Jan 2021 12:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-15-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-15-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:05:56 -0800
X-Gmail-Original-Message-ID: <CA+E+eSC=XsTbPE0jqvbCf3vR7VqRamY7bpKjgdpsV_Zv4VLrQQ@mail.gmail.com>
Message-ID: <CA+E+eSC=XsTbPE0jqvbCf3vR7VqRamY7bpKjgdpsV_Zv4VLrQQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/43] tcg: Make DisasContextBase.tb const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.45; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is nothing within the translators that ought to be
> changing the TranslationBlock data, so make it const.
>
> This does not actually use the read-only copy of the
> data structure that exists within the rx region.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gen-icount.h  | 4 ++--
>  include/exec/translator.h  | 2 +-
>  include/tcg/tcg-op.h       | 2 +-
>  accel/tcg/translator.c     | 4 ++--
>  target/arm/translate-a64.c | 2 +-
>  tcg/tcg-op.c               | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

