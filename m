Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3506E5728C4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:47:21 +0200 (CEST)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNix-0006rl-5g
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNgr-0005MY-JT
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:45:09 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:35651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNgq-0006cp-5y
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:45:09 -0400
Received: by mail-io1-f51.google.com with SMTP id e5so9212489iof.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 14:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZ+k6WD6S8GRODRxQcP7F0RIkNkBgZIxKuCqWyhmVaA=;
 b=G8Wh6/Nj0XNjgjTRRRpxcp0HBXZsajcWBim3NLfEWYl5wgnRCZKz0HEwBzVVeFd9Xv
 Uxivs6P18D6mQ1OyrKoNPXkhegS1Trst4uyaKFYG2c0+1bHJDP8eDq6oMzC2XJbxI8Ld
 eagBISeerTsv1YxYcNcokIsZCe9te1SLpOaP+KIH7nBFuUWW878rk9PdBSLyrYzk3lRh
 iEGO9e1W0bLXMYGt4Kq4bqpgg0BNe2LjNSbCPiCedDHJexTk5s9kSxFjxnpuTMr1Oycj
 pJ3P0AcAfw6tpE7pPGRRXzw2xaEWRD9NE11o0q1eSl+vlsiv1dDZbzw2Kp63RLXEC/Y0
 7pYA==
X-Gm-Message-State: AJIora8lJJ/afRJneEAxlraYQNFyM22RadA7kjTkQutrDvkPXHzrSxme
 ZPIontkhTz1CN/9NN57Ruh/UPDmom6P2LZ5x3Cw=
X-Google-Smtp-Source: AGRyM1tG4RARcAlWHU6sI2WPTP/iqrvhld+qcDtu10k78t0O9Y/O2a1KFlZvgSicxUwX5BNFfvK+G1dWRFjotr9xmJU=
X-Received: by 2002:a05:6638:d51:b0:33c:9ebd:2de5 with SMTP id
 d17-20020a0566380d5100b0033c9ebd2de5mr113449jak.266.1657662307058; Tue, 12
 Jul 2022 14:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095004.70682-1-bmeng.cn@gmail.com>
 <5a93f9db-f057-e454-17fd-0d44de5355f8@linaro.org>
In-Reply-To: <5a93f9db-f057-e454-17fd-0d44de5355f8@linaro.org>
Date: Tue, 12 Jul 2022 23:44:56 +0200
Message-ID: <CAAdtpL45EibQmQDSRHCoKxSp98nFeHdRYL31ZwfwUX6kyPsPRA@mail.gmail.com>
Subject: Re: [PATCH] target/avr: Drop avr_cpu_memory_rw_debug()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.51;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-io1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Mon, Jun 20, 2022 at 10:01 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 3/22/22 02:50, Bin Meng wrote:
> > CPUClass::memory_rw_debug() holds a callback for GDB memory access.
> > If not provided, cpu_memory_rw_debug() is used by the GDB stub.
> > Drop avr_cpu_memory_rw_debug() which does nothing special.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Queued to tcg-next, for lack of anything better.

Thank you!

