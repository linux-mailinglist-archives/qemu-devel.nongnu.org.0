Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965883323D6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:23:13 +0100 (CET)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaSG-0007gb-N3
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaR3-00079E-2w
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:21:57 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaQz-0001oG-BJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:21:56 -0500
Received: by mail-ej1-x632.google.com with SMTP id r17so26622736ejy.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BPRObKQxik7O0I7ygThGHfMK6C1FYFIB4f7c0R+FZlo=;
 b=yWJEGZaAdrqQRS4sV1ULjZA87KcLjAdr181Mz7/E/BWEBEOoj4QdV4kMZI6WYyhoZw
 gRtINkGDNh1JZ2Q0uoX33f1XsQKT1sZWuagzx2TD8Hsj0hmGQ8H8WcqkzE74qw74qKBG
 EAC8Z6w8EAi3TiwSw6b+LU0TVklpEO4tE6LdcA3Etfi+e0dK2gnaorNj4NqniMD6Yt6Y
 wgg1d/HNiJ3+AvPcE/hSwprj868aMHKXcrzqwfZikq0qUz8VoLFkEepaYfM5pbqzSmOn
 IqiOcrA+UC2V0RJKBnygDIFxyYzviiNd3rDVDuIEPcE4voKxdRzv9F9xmARV9o2zuJjq
 BeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BPRObKQxik7O0I7ygThGHfMK6C1FYFIB4f7c0R+FZlo=;
 b=jVkFRW+Hwtg1osaaE2H/7nV6WEI/smMpIDFcAcUyIHixW8JsxRx/DIloDGF/UEcfpL
 Gg+2/IN5r/whCH62xOLSWq6jy3ZBjNGsYzCCHclqTVn+lxoTJbcfwyzVyi2sY7CiuqFC
 hEFBSWrne6IVF201kSHluhuOHaOqx6ptQS8cjIH8EZJOz9ZgaSeRoMMyjMsFvbS+0FNY
 tMNSqKCfD38JNg7yr5OZjYkn+Cm0nFQpve5UD+GvtEpPMLjr6cHslNqIG0kTUZreldvB
 8co8FyHYGWiWZY1KTBaxP+KWU2ulC7oLoJvX9I+NlfSbEXj0rMs/uWQYbedqTq0CeA36
 APwg==
X-Gm-Message-State: AOAM531m+DKug3PnleT5zf54nsiu6ExgrGvBApWBABe0UL9cYLV9XqDR
 ejp0kP0RNglQUuSZ1mr8R6nIIuoxbobYhlo+6FT6AA==
X-Google-Smtp-Source: ABdhPJy6LkR+8rQ7W+WUCPpXG6L+Jd/0C9Zdi7MKZUvg84O7N+yMhQiQoiVL7kZhhCYRJFXXO9t+C+FvY8Hv/Sdoueg=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr19276785ejp.382.1615288911434; 
 Tue, 09 Mar 2021 03:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20210306213613.85168-1-richard.henderson@linaro.org>
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 11:21:35 +0000
Message-ID: <CAFEAcA_vHAh5xo6WcN=nnY1Z9Fz-DpFG+fxBa3-72J_b3vcfFA@mail.gmail.com>
Subject: Re: [PULL 00/27] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Sat, 6 Mar 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210306
>
> for you to fetch changes up to 6cc9d67c6f682cf04eea2d6e64a252b63a7eccdf:
>
>   accel/tcg: Precompute curr_cflags into cpu->tcg_cflags (2021-03-06 11:53:57 -0800)
>
> ----------------------------------------------------------------
> TCI build fix and cleanup
> Streamline tb_lookup
> Fixes for tcg/aarch64
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

