Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E84032E731
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:27:05 +0100 (CET)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8bo-0006y1-5w
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8Zo-0006Av-3i
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:25:00 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8Zi-0005lO-OV
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:24:59 -0500
Received: by mail-ej1-x629.google.com with SMTP id c10so2704493ejx.9
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s7vGvqzRy8b/gJxm87b/S+KkzlxIVTgYDsci1M179E8=;
 b=v3GSKXjMNp3IsxUYpDqgdbWnHJELhSvbg7JTFgtkm0p8FDTpdw/H2UMkLvSfjOvPRt
 Bdjr30w3ZdZjTmJMZEHkFNRbRY+y+4GdyqLbHM/kYmB3Yg2fyQFfULeVesmFepNMHTiJ
 dpDwfBabX2oohVWywo5tBBVxSSnsv5D0g9CgHlVqHn+f2MTbd71jRcEDxReXgcisbIE7
 Il590wtuYV1Wtrn0hGpFcj00wk2Xd2Xyd5CtMcdS08orpWCr/6N/mq+NO09uSsSlIDdu
 eKUlA3FMHVu24L/G42vMHXe0puvU46LF0FJ6WLVquMhhMFiPBNXLn8zP2RxpNpVtEmye
 KILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7vGvqzRy8b/gJxm87b/S+KkzlxIVTgYDsci1M179E8=;
 b=LztPDAK5+NkFhYQ5nHQ4oRKpGgzKGjnmDKpGprPt2XoOgb6pS09bxNONoBR+jtrDCg
 Rx20gPuT6JSsVUy2O/gM0/j+4dMk+O7Z/Gvb/nx9mzetjtObnqNbRILy8Tq+ubcJ59Iu
 oujyWCc3bwNQUVxULmP5+TFvirdCNXnKK5fgsLWu2HFiQo4lVpQRbAX3PIUzgNkBzNo8
 v0H6LM+HoRC9xtfEzsGIVzY+BR04MY156791ym/eNEpsnVstCGNz0i2eT7W5GTrBzXJe
 Seq6vAErbSpODajuOAw22fc9GqH9rGw8vJmlpbwmd8MG5x7q0+a+hVZfOLwQtcYCjU6/
 R+oA==
X-Gm-Message-State: AOAM532+sxnb0ImP6gZnFkNQEpzZM46UReS3IlaXQYCXdBrIFUq6QY01
 Bwd07hSx+r+xqj5JdEoyh7DGYMhzgLQwivtBWZcYhw==
X-Google-Smtp-Source: ABdhPJzhAndITV7dLyZ5iFBAhnMcUpp5Ofj8j9gzBK/KK5NDzOu9aFgXRpcIsXuDI9sCZhw8plsKZNYsgvYZTMxmvP4=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr1778444ejb.407.1614943491709; 
 Fri, 05 Mar 2021 03:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20210218212453.831406-1-dje@google.com>
In-Reply-To: <20210218212453.831406-1-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:24:36 +0000
Message-ID: <CAFEAcA_xt4VsqhPuMpsJKxQsEW1p9cWFjme-AXMH7zFSygD1ew@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 at 21:24, Doug Evans <dje@google.com> wrote:
>
> This is a 10/100 ethernet device that has several features.
> Only the ones needed by the Linux driver have been implemented.
> See npcm7xx_emc.c for a list of unimplemented features.
>
> Doug Evans (3):
>   hw/net: Add npcm7xx emc model
>   hw/arm: Add npcm7xx emc model
>   tests/qtests: Add npcm7xx emc model test



Applied to target-arm.next, thanks.

-- PMM

