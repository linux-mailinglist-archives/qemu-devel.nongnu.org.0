Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B94FC2A0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:42:16 +0200 (CEST)
Received: from localhost ([::1]:49960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndx7G-0006Bl-K3
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx52-00051N-1b
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:39:56 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx50-0001Qp-KY
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:39:55 -0400
Received: by mail-yb1-xb34.google.com with SMTP id j2so28600896ybu.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjxKOp68n/kJQTL3fdGKp4vd56Chll9dKNBt9mvhfPY=;
 b=Etm5SXTKYtx7OWjc8YJoQu3y+K+4+eaCXZKgcTfC7zEE5vu/okHIEJfV3Fq/9ZghCO
 gsbUzMQ8wpcnrmvyOXM3XP6aA5SDz3jEYoF90xiXZjHLiTweGlNlFVzLit4noX+Ug+I2
 aV6ItsmVJPrhR6XLG8PNtdGSexfeOzDq4uwzCxmgEIOv26q8f5D+NlZsVRvdPcjhrdgT
 gqvO6pcGw56FfhHs5mi43bAGjRqwoKHx6ChnBw6uJ3lz4KfhZDncYiDyCE9D3igYZmSk
 ilgGbnFL32ta2gWBBxMM+duhMzSC0vZ7m0PZQD1x851w1s+6wjiRa1bJMBhcuYQWmVou
 8ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjxKOp68n/kJQTL3fdGKp4vd56Chll9dKNBt9mvhfPY=;
 b=hnXJPaJ8JU7auaMgzkcCnBtqUFdzPZee1Kf1T/NBG0Muo92lCbsCtLGdaewJ63LOUW
 +LDTH/+/8Kb0fh+BIw68TVYzGTDs7fHdNZMBBlXlxI4JLQp9AnUUebLlMw/byZqki1nC
 ogdW+ebhMF2kiPl/HFOThwPriWPfEonuLDxwhJgWy099RsAJ+p6BJhsdzH7c5LRqpslP
 XzVkd+IlC6P0bre7VBeRSA3Wd5vwJmQ7KIl4GsqgC4eFEj3UAcq33I25/2DOuA7cDnQz
 xGciNLmMBtbaTzfc8HkegBdlzQmIC13yL//rOw3WYBaTdCKAkdLt0FIuOdmtBiK/OwsA
 +VQQ==
X-Gm-Message-State: AOAM531MDLVdjhjCIJ9LKbvhqNdcwyrhKu7oHYkqVufPRwX3sm33ix76
 jNPW1/2MApOzvYtOP/uCnerfQOF3rxNX0L6NPT4iEQ==
X-Google-Smtp-Source: ABdhPJxYa7lvpS9nXcgUZTjbwyydVzL8PeGQQCHrOmFPV+3LklrPy2KTEkT09PRl0v84ZzUGnvmjYSRS6jn9K4iA/Hc=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr22746778ybu.140.1649695193416; Mon, 11
 Apr 2022 09:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-2-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:39:42 +0100
Message-ID: <CAFEAcA94Vzw27yDxDeQqkbOgagH=AcPu68mXV7wAeprjxDztzQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/arm: Enable FEAT_CSV2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 10 Apr 2022 at 06:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns branch speculation, which TCG does
> not implement.  Thus we can trivially enable this feature.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 1 +
>  target/arm/cpu_tcg.c | 1 +


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

