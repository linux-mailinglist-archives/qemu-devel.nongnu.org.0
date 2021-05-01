Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76553708F2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 22:42:40 +0200 (CEST)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcwRj-00034y-Eo
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 16:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcwQf-0002GJ-Uu
 for qemu-devel@nongnu.org; Sat, 01 May 2021 16:41:33 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcwQd-0006SH-QJ
 for qemu-devel@nongnu.org; Sat, 01 May 2021 16:41:33 -0400
Received: by mail-ed1-x52a.google.com with SMTP id j28so1962151edy.9
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+VsECP6zRussTtZj3QNQBfMgj7DEqtv7fg3sql2jnJE=;
 b=VBLXucetxUW+975kb2qN8rJINtiXW8DYUIs1+T8WP5N1HsOJUnCO4KOlwY6sABgWx9
 yulI0oa9GYGD8hVlaFvupYt+qTCHd4V8CI4voTxE//jgSMgvWob2KOgsupZN6yI/3Ihe
 6ZCwJRTUUbROshby0WKcfROSJPWVKCAXF1ZMnrmHlYFXlVVA1k4Su2paatUaKylT2YNm
 L9+S48o6umT9j/SNZye3tR39hlsiLwaZAVd40eUXi8Z5H2YNn/W5omkwggJYUaWfVlbO
 +SbYfvZfKkbx3rpPzHctDRkDNK5aWhqR2l2/2fAhLYsHymqcsJyJXCkSZUhWl66KdpUs
 IdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+VsECP6zRussTtZj3QNQBfMgj7DEqtv7fg3sql2jnJE=;
 b=f9H8pNxJ9pySUerAXaNRjLP85OH+loIC85npjuG4eAj07CdeOhqbzpxaQ7YXgK/5cG
 h6uns76/YF37b1oVzOTcpzF7wGw4NGJ1qyGTfYyHSeNXZupSaPgTkwzJKeu+VtQY7eta
 AGdwfxUfDg5n4Gg4wjukBoa2lMYdw1qaiv4v8JsvIRya6OpY+Ww4xtmywhnIHOCNcU9s
 4+5Lj6fftHtULeoc8Xw00a0yl+Gcayu47KDyXO7kLaEAz2YyrpWEAcmXAGqIYV34b+hk
 VS5wAaI6waB5QDdocgy5okv/BBqWCLXsNvcn+K7+cLlwRZSxX8iZj4BHtRDOiFdGhg2S
 QTyA==
X-Gm-Message-State: AOAM530BYc//U5nVIm9VM0CTaH4w5Qce/cUr93mmJ4gJ/xoPu6Bo6UUV
 PPlV7YkvV1Eol15bgw3bpnReas2Ey1YIY02Jxamr/w==
X-Google-Smtp-Source: ABdhPJzH/hr6kFxcNgUZTp3QqB0lTNboZjtDSY7BqUwC7G4M4SDM8F1MweM7KJL4xcmaqMdqyLB2T+rtU+k8QRscqh4=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr12622034edt.36.1619901689783; 
 Sat, 01 May 2021 13:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 1 May 2021 21:40:26 +0100
Message-ID: <CAFEAcA_fP6kPWn=A9EO1H09WN2awZhjkYjTXhSo-r_ttRtp9NQ@mail.gmail.com>
Subject: Re: [PULL 00/31] target/hexagon patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 May 2021 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 8f860d2633baf9c2b6261f703f86e394c6bc22ca:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-04-30' into staging (2021-04-30 16:02:00 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210501
>
> for you to fetch changes up to 26f7c044ad234c3dfa7ca2ddf047a71d815e66dc:
>
>   Hexagon (target/hexagon) CABAC decode bin (2021-05-01 08:31:43 -0700)
>
> ----------------------------------------------------------------
> Minor cleanups.
> Finish the rest of the hexagon integer instructions.
>
> ----------------------------------------------------------------

Build failure on the gitlab CI "clang-user" job:
https://gitlab.com/qemu-project/qemu/-/jobs/1229108656

../target/hexagon/genptr.c:31:20: error: unused function
'gen_read_reg' [-Werror,-Wunused-function]
static inline TCGv gen_read_reg(TCGv result, int num)
^
../target/hexagon/genptr.c:322:20: error: unused function
'gen_set_byte' [-Werror,-Wunused-function]
static inline void gen_set_byte(int N, TCGv result, TCGv src)
^

(this is clang being stricter than gcc about unused static
inline functions again.)

thanks
-- PMM

