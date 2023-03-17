Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C16BEFAB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:28:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDs6-0002tk-Ty; Fri, 17 Mar 2023 13:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDs3-0002sa-Qt
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:28:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDs2-0002qK-4M
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:28:03 -0400
Received: by mail-pf1-x431.google.com with SMTP id fa2so1967034pfb.7
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679074080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H/LmUNzVYO4FxndFu4Tp0LEGnEDAeI8ZDFVoUgYyYNM=;
 b=NWBnfzBJnVCWBZANXJNigbtlogeNBqZfxvGE1LDOUhd2ceF7Tl4ZxUGQBrwTqz/323
 I9Glch/Vh3bMurC5KDSuLz/p5AnptIpaVek/QNCO4s0BKtn87vVieb2kGsDyERLmQODT
 qqhG5saXDP3eZCFgSLtNNBQW9vj30K7AFMBZ2+jhg8UZlaiIMKpqPPiJX4GJp7b0To7n
 3NsijlTa82GLu5EAhaRuSisDYc5ijfJ4KK72dpD+d65SHSyFRPzSD1i6XjyqQkhSyLme
 oi0y3YD5FHVd7U0uGME16HbRiwsXAneucsanI59yC7gRHNgBFSjFm7aYzO1afONZS8Tq
 ctSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/LmUNzVYO4FxndFu4Tp0LEGnEDAeI8ZDFVoUgYyYNM=;
 b=eIByoMdmStS+/uoHOk6aZ8gxI2FRR2Jmo+QXty+nbCvhAoknO+8ZBNPJCfcD73rgIx
 OxunvmHZyyb6AaSszrreiPGEfyWJcZTexrpC9AovCLKi4AHNyW96/Kv3KqPjNIeoI/3/
 nujjAbzDO7LA4muwfrQ9jSq5OnYgE80VzSPgv5s2gkEssEuVyu+UnhU+4P9Q5g4ds7cK
 oxiZR0yUmyEOTHNrP+7cJZl/JEgnVIcaUcMrysbq3o4hdqW88txTrkFDYVtUsjoO1Mon
 yxNIGqkA0igUZ8VBcasO3g9xdby8z2ZgBnffnhO+SXmb+zC1RYbVhTkDHqb+PMwQ5jNC
 BHWw==
X-Gm-Message-State: AO0yUKXjpawichWEzcD6nEtBLkc31Ia30Gy2e306/0bOBJngy78rrxHS
 cNu2XQ4AAm+C6xxulzO2LHHkt2x3iDgjEzSQs+9xWQ==
X-Google-Smtp-Source: AK7set9oy05rSDK1zDbxUtSLRjVHV93BDvS1aBTLzBhzzVY6ML2NbD2S/EpS6Bnl4FxfTNnNIxN1JjT73AHA4NmEyVs=
X-Received: by 2002:a05:6a00:2d8f:b0:624:1261:918f with SMTP id
 fb15-20020a056a002d8f00b006241261918fmr3743423pfb.1.1679074080165; Fri, 17
 Mar 2023 10:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230316201904.2284949-1-jcmvbkbc@gmail.com>
In-Reply-To: <20230316201904.2284949-1-jcmvbkbc@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 17:27:48 +0000
Message-ID: <CAFEAcA_T41ASq6puUZ9UeUPKcjG20ctekPYLPYBu=959MVYtOw@mail.gmail.com>
Subject: Re: [PULL 0/2] target/xtensa TCG test updates
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Mar 2023 at 20:19, Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Peter,
>
> please pull the following updates for the target/xtensa TCG tests.
>
> The following changes since commit 27a03171d02ee0de8de4e2d3bed241795d672859:
>
>   Merge tag 'pull-tcg-20230313' of https://gitlab.com/rth7680/qemu into staging (2023-03-14 10:09:15 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/OSLL/qemu-xtensa.git tags/20230316-xtensa
>
> for you to fetch changes up to 51139fb3e7b05dd7daeca8f00748678ce9e087e5:
>
>   tests/tcg/xtensa: allow testing big-endian cores (2023-03-15 05:08:04 -0700)
>
> ----------------------------------------------------------------
> target/xtensa updates for v8.0:
>
> - enable testing big-endian xtensa cores
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

