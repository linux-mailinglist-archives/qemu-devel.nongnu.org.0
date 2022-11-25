Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D4D638BF6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZWo-0006eS-AN; Fri, 25 Nov 2022 09:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZWM-0006c9-JT
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:18:04 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyZWG-0004qF-Ur
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:17:35 -0500
Received: by mail-pf1-x42d.google.com with SMTP id l7so1804844pfl.7
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wIR27mQAMDQU5wZSKe7lgwesYEmOHelMhHFL6pQD6zE=;
 b=SsUYlTc63NISqbSW192ETaZs+ZlCzw491YWPXoYw/Tf4qG87wYwKh4nYUprum/r91h
 iSXwUM2b2+u/1jfP+pyXUlwbcPEwcZOftKl7gJFVwOqUwEcJaeSOJs/CM71N20kli2aM
 FnGK2LCfewdMFVDXhetpJyIvVBvoyQOnULqzro/+nfKSSOzKcZ2Yb/YXEc41oHefaTYQ
 T8Iieb8k6IFYL0KwsqvSingV56PPQMrXXiRZDEPmqP1ggQG6UMdHT8Vj7QmkPk4iDC3h
 R1BFrsZ08zcCf4pX/xdrsS1Mz7epxvVbYaMzSpNn+uwJy6xR1nRVHzKs4ZBHsx0rj3tI
 WQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wIR27mQAMDQU5wZSKe7lgwesYEmOHelMhHFL6pQD6zE=;
 b=VwiKpEuWAnhi52ctx+VuCQdBHLtx6iJByNb8KZOWmyptBTJ6E2mJi1bnJ8RKz6/RZg
 0+2jdrHulj8dR9hMM0LqtOpDCnscgYQ/8KQ8NvWvqLAjqzMBtDkZc7duF4lNF+ahFhP3
 ZFgCteYdlZ2J2vvk7LSX0NkMWGaMuahkDD8x5rk9Fsg+Z2xgYa7sTziDT9zwABNTf3Ai
 IAhhVrr1slPRizrPO1hbuZKCdDHt0yju7RJpIHQK+0rbfr+6NMqAtAMO0w8kYCRTDh31
 KTLotCXLGtQduGzpTaTsRfSJxkwTB4J6ru42SR+duB1jjyTdZsLqljRvmXI7QXKALp4s
 msPw==
X-Gm-Message-State: ANoB5pn4t06Uh7mnhqG2j2OJCfAXtx8BOAAE98JsA8xipcy6Dg26R8Ml
 sm7x8WX+YqOTizkcU7cWp78oIkTSOqaZyXoijXePtg==
X-Google-Smtp-Source: AA0mqf4nOXQYMGx5j5z7in+FOkjUZWF2jPlXKA8UpKp/O46AW09GGkqaiqlMXorboQNqfq4/lZ3ZxYl/J+wzIpuwkzo=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr16348321pgl.231.1669385848264; Fri, 25
 Nov 2022 06:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20221125140828.56636-1-akihiko.odaki@daynix.com>
In-Reply-To: <20221125140828.56636-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 14:17:16 +0000
Message-ID: <CAFEAcA97ouQdARofPOZ5+==qNMPiK_eFH8anL6eb0Tw-PaPK1A@mail.gmail.com>
Subject: Re: [PATCH] e1000: Configure ResettableClass
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Fri, 25 Nov 2022 at 14:09, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> This is part of recent efforts of refactoring e1000 and e1000e.
>
> DeviceClass's reset member is deprecated so migrate to ResettableClass.
> Thre is no behavioral difference.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/net/e1000.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index e26e0a64c1..f97610d7e1 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -1746,9 +1746,9 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
>                                          e1000_flush_queue_timer, d);
>  }
>
> -static void qdev_e1000_reset(DeviceState *dev)
> +static void qdev_e1000_reset(Object *obj)
>  {
> -    E1000State *d = E1000(dev);
> +    E1000State *d = E1000(obj);
>      e1000_reset(d);
>  }

This function doesn't actually do anything except
call e1000_reset(), which is not called from
anywhere else. So we should:
 * delete this function entirely
 * update e1000_reset() to be named e1000_reset_hold() and
   to have the prototype for a reset phase function
 * directly set rc->phases.hold to e1000_reset_hold

As well as being less code, this avoids having a
function named "e1000_reset()" that gives the
impression that you can do device reset by calling
one function. That might be true now but if we ever
need to add something to the other 2 phases of reset
then it would stop being true.

thanks
-- PMM

