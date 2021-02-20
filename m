Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9869320413
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 06:51:19 +0100 (CET)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDLAk-00079A-Cy
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 00:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDL9v-0006cb-OP
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 00:50:27 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDL9u-0003JX-3C
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 00:50:27 -0500
Received: by mail-ej1-x631.google.com with SMTP id gg8so7231004ejb.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 21:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/IikMz0EjZa9HHTxfwo0r7gqMnuKG+sAk1Wx36+NbcM=;
 b=L1HTxrvDYsBSsAoUDklgfrzh/ROeRu6I9VHhd7s9MajHxcdHu3LyA6zdPU8PhOi2Rs
 w34+3WrYCm8J0vk8nD9gLXO0We2mLTdhQVyXKID812wZnLsdNX8QihvungszXYTFKaCS
 3nFHkzHuc5l/PAIPIduRY8xSSZdciHayfLzr2Fl7IFZl/WGzrknnQJi1RMOf9B0dWmY5
 qcPRXUbcIZC1UCnFqAUqv47w6dWmUy0CgTqZz9qYLNEKEWAo9wNMleUiilni27n67K7F
 lIh3LaNIRQreXWYhjU9QB5k57FkCusHpnDRNqr8olbV9rMwDhnbIef1o/d/Pq66TAfrb
 hSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/IikMz0EjZa9HHTxfwo0r7gqMnuKG+sAk1Wx36+NbcM=;
 b=gcwStJT+9Ki00BXe9ZggIHCas6w69Y2jNIWOYsRkZ+x8owr1/l+ma3zaHRvNHTD5nB
 eMi67ANdR6gYeBFj+rVzDEqVBjHxradYhlQS0VU2SJqHGjADxzjoX0CQgyxjxAllnsIW
 kxweYLp04z+FMUEA7+dA7LhjvGH6nmfD6SKMDeoSakO1YdJ5B9EJQNqZEMzRTMFRJ2RV
 QOZ+o8U+tA7gPTUiXXskJDiTvZSP6+fz0AH12uYUQYu2ZzZwqFPXDAcoLZRLVqcj+KP1
 SOjxfcr+jVzIdklZmL9IzLcDmOVwV/r6nSktzmZZfDS8d3si24WLB8rWRkXy4EvCc39F
 foaw==
X-Gm-Message-State: AOAM533KC9J6MeaBGkG2As1D88+rCNmQpeG/vg4j8lqy4FxpZ5Opf8zk
 rbZuRzO8MsxvvNwPDVzLPR65EjUssoNpencCdec=
X-Google-Smtp-Source: ABdhPJxYMWgPLKz1+E8HitC/0TDclETyVqcj1eUYJvB2mz2o66pJMZicSuc7M4P0+o/eW6gOdBEAJBDYD8ciHT5iDUg=
X-Received: by 2002:a17:906:b6cc:: with SMTP id
 ec12mr11988887ejb.520.1613800224551; 
 Fri, 19 Feb 2021 21:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20210219094803.90860-1-akihiko.odaki@gmail.com>
 <20210219141446.ne2mutkfa5pa2dhu@sirius.home.kraxel.org>
In-Reply-To: <20210219141446.ne2mutkfa5pa2dhu@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sat, 20 Feb 2021 14:50:14 +0900
Message-ID: <CAMVc7JV5Q-Ms=oy1-4897_u9haW2hZj67aA0UAfbkvbofzB1vg@mail.gmail.com>
Subject: Re: [PATCH] opengl: Do not convert format with glTexImage2D on OpenGL
 ES
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8819=E6=97=A5(=E9=87=91) 23:14 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Fri, Feb 19, 2021 at 06:48:03PM +0900, Akihiko Odaki wrote:
> > OpenGL ES does not support conversion from the given data format
> > to the internal format with glTexImage2D.
> >
> > Use the given data format as the internal format, and ignore
> > the given alpha channels with GL_TEXTURE_SWIZZLE_A in case the
> > format contains alpha channels.
>
> Hmm.  Do you know what effect this has performance-wise?
> Is it maybe useful to not convert for desktop gl too?

I have no idea about performance, but I am concerned about
compatibility. OpenGL 4.6 core profile does not support GL_BGRA, which
is aliased as GL_BGRA_EXT by epoxy, as internalformat. I also tested
with Intel HD Graphics 3000/Mesa 20.3.4 but it didn't work.

>
> take care,
>   Gerd
>

