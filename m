Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434392E886A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:15:47 +0100 (CET)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnJS-0006b3-B4
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnIS-00067H-VA
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:14:44 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:42127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnIR-0002UG-Hf
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:14:44 -0500
Received: by mail-io1-f45.google.com with SMTP id q137so21420712iod.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJye6qytTzNKsqBufpiiRrfx90IcpFZtdjVxprrPCGo=;
 b=RRwoD5N7/F40eZtZgMvyczSX7SuARU4z2UxFXV//LGWkn/RZAbaCWM/zACvok/fhU9
 MEUV1aPdCmLyRiHdPGqoSwvIxhykGu0wRciRNF3jOl3yzcoHstTU7JlXt6oUjcS5+S66
 RVwX82rvxgJ1YP70aqY1NDByKsJpM6ubUecmaWYqZLowr2eCI8g15ajpDqqLb5EQPCQQ
 F4ZtM7umOIaWwmtV0eQjjUVgqC0xa2/Wdpj3/x9IvRH0RxQ8ZGssJTCNGISAzk+SHKXx
 lJpfAwvgTu990MzhL6+Akl0AVeTVTjf1tYhAXlqfvLF0dCgzWNH/U0VHonO3ZLoF6l7d
 yLFg==
X-Gm-Message-State: AOAM530QzEmimDUsZpSwWO8n0CkP8Cy/2bzpfSxx7IgTPXMoxQYfq37h
 XOT57OXtxo9sLqJiprgg5iaZYdEJswY=
X-Google-Smtp-Source: ABdhPJyXQoNF7bqbbqn8YIN8ACJ6PKjnk2pR0E4ii2GHls4c8x2Vguk+BhyuMmycglD7NAdQ7ucB/A==
X-Received: by 2002:a02:ce2c:: with SMTP id v12mr56468459jar.60.1609618482413; 
 Sat, 02 Jan 2021 12:14:42 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id q5sm37604237ile.48.2021.01.02.12.14.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:14:42 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id q137so21420702iod.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:14:42 -0800 (PST)
X-Received: by 2002:a05:6638:1202:: with SMTP id
 n2mr56640320jas.85.1609618482164; 
 Sat, 02 Jan 2021 12:14:42 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-21-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-21-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:14:31 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBECUqOn++XLeJ85xffOm9d7VP_ipV4hDS33aBeB8acTw@mail.gmail.com>
Message-ID: <CA+E+eSBECUqOn++XLeJ85xffOm9d7VP_ipV4hDS33aBeB8acTw@mail.gmail.com>
Subject: Re: [PATCH v4 20/43] tcg: Return the TB pointer from the rx region
 from exit_tb
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
> This produces a small pc-relative displacement within the
> generated code to the TB structure that preceeds it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 35 ++++++++++++++++++++++-------------
>  tcg/tcg-op.c         | 13 ++++++++++++-
>  2 files changed, 34 insertions(+), 14 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

