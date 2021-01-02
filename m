Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41872E8861
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:05:31 +0100 (CET)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvn9W-0005cF-TV
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn7P-00045T-2V
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:03:20 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:32862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn7N-0006wH-HT
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:03:18 -0500
Received: by mail-io1-f44.google.com with SMTP id w18so21498984iot.0
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KUvQJmltrro1Yp8RNv/Kuvv1s0qHzO3wciahMTm/WV4=;
 b=FkRxYXdFVgE4TxlW8uCZWJnJnhM7Zp843/iadIEv8GV0n3rvtIZmFi8lv8Jm6I3jW3
 UE3cBW22v2eQheiJ97cQFrsiZmqAbRAcNkgcH9qoAvSH+nEsva9DQ1Kc5DWhPShDY0my
 AVUuxSTMJW3qKUSnBcoZhfnEM110A6oeJUa89/nniPUiVcKZEWf5FaIUmGXjWDN0oBFL
 HC5W+Ea1LKA8n6IiROwK4HWzBIK5nQc/pTv+FAYZlzewR9YFAOBDXJX+m7PTeodXPXRS
 zgQmZeKEMk/d2hFHUpUVG3Rj4fgW6w2Sb22VUY1nS6LIYvvZ2+OmNa6h2UO5H6UWsoB9
 617Q==
X-Gm-Message-State: AOAM532ywR8t5gLLEKvQzGo0O7iL94ue4cHUTfu522U8hS5gSIzpwSLt
 zpNs+7WZh9f8/6MfDDQnXbNPsTWrC2Q=
X-Google-Smtp-Source: ABdhPJxObVq57f+Tx/dvb1anyjE9hHGgdcZ/p4iPuJUbUgoMc6bTxKtrelqS1RMQNwkzXFRARvpYGQ==
X-Received: by 2002:a02:969a:: with SMTP id w26mr56170255jai.96.1609617796530; 
 Sat, 02 Jan 2021 12:03:16 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id k76sm41294505ilk.36.2021.01.02.12.03.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:03:16 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id z5so21446676iob.11
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:03:16 -0800 (PST)
X-Received: by 2002:a02:b607:: with SMTP id h7mr57778330jam.120.1609617796128; 
 Sat, 02 Jan 2021 12:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-12-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-12-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:03:05 -0800
X-Gmail-Original-Message-ID: <CA+E+eSC0L6Ut3k8wu-CC9rVZ8r9HcDi062PgsL=jc_enRiBMJA@mail.gmail.com>
Message-ID: <CA+E+eSC0L6Ut3k8wu-CC9rVZ8r9HcDi062PgsL=jc_enRiBMJA@mail.gmail.com>
Subject: Re: [PATCH v4 11/43] tcg: Adjust tcg_out_label for const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.44; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f44.google.com
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
> Simplify the arguments to always use s->code_ptr instead of
> take it as an argument.  That makes it easy to ensure that
> the value_ptr is always the rx version.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                 |  6 +++---
>  tcg/i386/tcg-target.c.inc | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

