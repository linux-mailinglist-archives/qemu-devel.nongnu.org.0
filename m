Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B237508362
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:26:38 +0200 (CEST)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5fY-0003cQ-DM
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh5W7-0007Ws-8n
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:16:54 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nh5W5-0002ny-FY
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:16:50 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i20so1499901ybj.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/IHQz+Gnkf87ihkv2I9Bw8Hp7cU8PEeMXpnz9007D1Y=;
 b=ZmT4ajLOXU+ICKfTndafXiT6Xa4DQJbYjuAST4PuVVYZ5UOuk4e4dGDWTmnvum+RFN
 m80M8E12nSWhkwo7TSbtWvTjvS4sRbaDAyRR7B6bqPjDtiI5+0Cd9+aj6D73sht2VwrC
 maAifjnicdzvVcw+PCBnXj6MZ0o5Tz9/PftHwVdnh1Q/VydRGMB0CKvnHIUU2W/KR38D
 ttsCa3lhmhE2p5sS5aJM3lIrEpwqdQssRwqLWudJAgLIjPd4oXdgkAic02K4ToQHPm56
 GTayzRlOEEb3sXvqRY3lRu7KoqO4UIAlBmF0cxMZIQGPcIjmfkypv7f/9leovh3KDdhK
 5ChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/IHQz+Gnkf87ihkv2I9Bw8Hp7cU8PEeMXpnz9007D1Y=;
 b=Vw8TKXuJ/OY0YwhNjS5kTbitXrBwE+gUYLtmpAIWLTdZrnfmwLRD9xStJJeNNaSGp5
 UXXhmg0w57zZ7C1iOIyP079ogqzxlqHr4eS5lCS176wbJ8mOOot6bDpbMnTqYDd0irXd
 aKzfD3DilF6M7B9SuW9Dwkb63ZCIDN0taTmD0rLa8RvefcKKyKyWLwOyhlEIP0ZSD1a+
 N+M8aCJP13ls23bXd95aKPXB8y1S8PPt+jUXnVjn9BcAfdgKNMxvQEfCdzs+LP4mOnQ/
 6Y78/BTM1aMO8OP7h2PZJH+LjyTJf/AXoWGTIofLrWhCUpNAQruYDjc+p1JYakFdKjqu
 m+fw==
X-Gm-Message-State: AOAM530D0uGFPpyDT9/zXIWWPoKuyF+pNYGiq8czQNpHRjnSsdpkUfGN
 3pE1Khn8bBX20o5BVtXWUH4wRmDrY7jsa9WA2r8=
X-Google-Smtp-Source: ABdhPJzAB2dnwZOo2ryvb7BsJW0nrmlFOcsRxlZvT4ap/y+8ETztDHSsoc3DUqYfyvrHsBPcvDG9VAztIiVDyB4isoA=
X-Received: by 2002:a05:6902:10c1:b0:63c:d3bf:59d2 with SMTP id
 w1-20020a05690210c100b0063cd3bf59d2mr18386851ybu.99.1650442608478; Wed, 20
 Apr 2022 01:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Apr 2022 16:16:37 +0800
Message-ID: <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
> >
> > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > (no changes since v1)
> >
> >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
> >  1 file changed, 142 insertions(+), 71 deletions(-)
> >
>
> Ping?

Ping?

