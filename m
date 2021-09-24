Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F2416EDD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:28:19 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThVC-0006z7-LX
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mThUO-0006Iq-DD
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:27:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mThUN-0004HI-1D
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:27:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id t8so25515105wri.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWUlz4K71NaTkYuf3yT5V8gFx/OMV9CZDF7mMugJpxI=;
 b=Ia2hPG4IJ3Ko0XcazKia3bQLLgKEImZFJXUUbgO6cyr/TAQlHF99ei5QwC/28x+TLA
 sIWbGhXY4x/sAC2VEwb6YMXtXrv7Bk9ItZY9hoZ4+2RxIYU4FkuVYX8zCryhHECZRvYn
 vlrr05GcSUYRK5Gz+rheNlFvk08fttxuodTBFc1TimOUc/AmwIJX94ZPpfatW5ePKwT/
 zZR8+XkPpyPYa8NHQp0IITn5M13pgJcYQlnabl1MZixC5UZSNH1FiK6tQ9Fxv8DA1onY
 osRQO1HntMEdLv75WlR4m6ziH+zTiMItVBvXUNa+LZJM2+UMGjWjZzyMIfaA9DBa6Q5j
 pCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWUlz4K71NaTkYuf3yT5V8gFx/OMV9CZDF7mMugJpxI=;
 b=j8wRUz6U2+V8qUnqQ5pdBHQEixfG08hrIgtv+WxGWlRxM/rFs6WM3pI+VDueUlWUFB
 4u7SG8Cx4T7A+wPeSNcsqmPybEkM9GTeFttd5Db/1NrQCcMNDbNUU+ZgDeETdg4PF+6v
 bJE6qtsUADZE1zmTRxtljLv7mJmlKsvgykptVJyDG5asd6QVFq4ojEg2rFjJap8Jgy2H
 nlginQrDY/boaQgmF0ml8cqhNNFqP15Rq4rX6xaaZmTBYxmWawGXLRkmjeX+4jBi9Yl2
 xNxyS1R1snzeaH4PjEwmbPhSvZXMm0mwCONrAxHecA1cYjL9hFzbAUbc+fTCbXnuvLHX
 +HJA==
X-Gm-Message-State: AOAM5302qu865VBbUOQwOocY7jGHL5Ou/9OL3YSezSTTM2R2LUdNbm4E
 ZOyyeuEpeva+LGmKxP+Gqf8slzEk+yzafI/ZljxFyg==
X-Google-Smtp-Source: ABdhPJylPviRzU2D+tBJRka7QbXjLYPu6dMw4b60BVY+b6d6EjAUbrpck1cugCNFWvMiQjXfZbHMpBTsaDLpqNBPZMI=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr1030278wmh.126.1632475644610; 
 Fri, 24 Sep 2021 02:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <89CF5E51-5126-44EF-8311-136CDCC50D8D@gmail.com>
In-Reply-To: <89CF5E51-5126-44EF-8311-136CDCC50D8D@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Sep 2021 10:26:32 +0100
Message-ID: <CAFEAcA9+0BS2m7FxPaiH9f1CF2BT=WxsjnknQ8hgh0RvgxX1JA@mail.gmail.com>
Subject: Re: Ping: [PATCH 0/2] cocoa.m: keyboard quality of life reborn
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 00:08, Programmingkid <programmingkidx@gmail.com> wrote:
>
> Hi Peter, are you reviewing cocoa patches? Should someone else see these patches?

Gerd sent out a message a while back suggesting that people interested
in the cocoa UI (we have had several people recently submit patches)
ought to start reviewing each others' patches. I would certainly
prefer it if those people who are actively using and working on
the cocoa UI could take on more of this review work.

-- PMM

