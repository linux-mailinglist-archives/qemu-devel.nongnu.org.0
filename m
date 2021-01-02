Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3F92E8866
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:11:10 +0100 (CET)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnEz-0002YM-S1
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnDZ-0001wt-Jg
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:09:41 -0500
Received: from mail-io1-f49.google.com ([209.85.166.49]:44248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnDY-0000kn-7M
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:09:41 -0500
Received: by mail-io1-f49.google.com with SMTP id z5so21455635iob.11
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mV2jis6d9zvwY4CeeoIIg8rxwizRoTBGRsrvBg9m8fE=;
 b=NwvJHwu4TfO7kPwb9I0bDB4c8f24flQpcyj0196nnnlBt9cFZhle6HrCO2Vmmpnzju
 yu7K/X9jBPaHi+/XaRty7W9icX60yM5zGpFRUHlGccmjFv8zzdazt+Jtgu36mUV/AVRX
 bDkvMIuT/Yc2UOTH+a0cbphPY9nQUobWiCOi/PbqRCYBp4mdzctZjg5JdXN06G3HRgaJ
 Aopa82qQujMBnZoxpnnmRuJ8ZftaYUrwSfs5IZ1LpC+rVAWTBhbt/B99+aA83xupmrM4
 7gjwAnUfAVw6Btkrk4UJrr+9Y52BnxQoV4C09afzdF2SEYmeFHeGh3MnUuNxHlItzGlk
 gARw==
X-Gm-Message-State: AOAM5310nv1EQOz+f4KlgBKSxWl33fdbMDPXr785y3bU0G1N3vpi4Q/p
 IY200q7JW2elQnM9k2JrBiHtJ3mb10w=
X-Google-Smtp-Source: ABdhPJwq29Q4BT61OfxUKf6IAzr+eFbLmzGaMGPpq6r8FD+W3039ys0YQq+EP0nPlBMJ1yNkaGSRwQ==
X-Received: by 2002:a5d:9e0a:: with SMTP id h10mr53448278ioh.149.1609618179229; 
 Sat, 02 Jan 2021 12:09:39 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id k76sm41301850ilk.36.2021.01.02.12.09.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:09:39 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id t9so21783666ilf.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:09:39 -0800 (PST)
X-Received: by 2002:a92:cccd:: with SMTP id u13mr64760167ilq.273.1609618179001; 
 Sat, 02 Jan 2021 12:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-17-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-17-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:09:28 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDVA5a2C3=+3Kfq5LGO54ig9hRYo=xTjNn=y_08EyByXA@mail.gmail.com>
Message-ID: <CA+E+eSDVA5a2C3=+3Kfq5LGO54ig9hRYo=xTjNn=y_08EyByXA@mail.gmail.com>
Subject: Re: [PATCH v4 16/43] tcg: Use Error with alloc_code_gen_buffer
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.49; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f49.google.com
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
> Report better error messages than just "could not allocate".
> Let alloc_code_gen_buffer set ctx->code_gen_buffer_size
> and ctx->code_gen_buffer, and simply return bool.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translate-all.c | 60 ++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 26 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

