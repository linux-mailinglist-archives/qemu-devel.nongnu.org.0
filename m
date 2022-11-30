Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D009B63CE4E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 05:18:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0EXR-00050P-Qp; Tue, 29 Nov 2022 23:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0EX8-000506-0I
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:17:18 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0EX4-0002kH-NH
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:17:16 -0500
Received: by mail-lj1-x234.google.com with SMTP id a19so3811091ljk.0
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 20:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lnVdse+B/7L1ckGUq3YTPd6s6aFWosdrJNhqy4pdobg=;
 b=SGy4tdW543+7nz5qB0BbldnomTu4NWW5SzhuIHJDb3vKaWzyepjrQ7OAF93oKVTdCi
 5Og+1lcNJ/gp3C0SZi7LuvLbzbDucflxBMUxScibFyM9eZheOr/7d5DQSf92pDZAU4Nc
 q1LBJDaOyQtcogsziduIVYATf9cPNVsQIsWqVEIYHXyS/5MMN2G7926eTeoWK1isys6O
 j6Wk3ADvulQJS6q2a2z2H2nm5kiVpFsjCAXBsdCCB5r1EUaQNijpfKhPGBOJLeRiQNR7
 K6zYh52urbnzUpHLl7MwRjk1uox4WCplbS1mzhus6FrDjOSg13Yi9CoY8RLHcdF9jSFX
 TTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lnVdse+B/7L1ckGUq3YTPd6s6aFWosdrJNhqy4pdobg=;
 b=F5a7kkQpTo6OsnR+lbt9X7URpXdtoNd9esvlBpYXHuN0y+oK0+wsAmT5GPAywOXlnX
 xx6cJAeih7WSeJDlFiz62fBLnpXv7gsAMrOQ5VmiqPS9lgVDWEr9xA8dLl0etr/k+Cno
 JRzo1i5BqTWO0NPdFomUoI9WFK3AZjPsEOQk6LBog8yCQhNvvdqGs3KcUIiCwi4Tyz0U
 YxbQBTEmlUtbkc825yDKNXnpjyg+ivxUQjtkxDjFTeKjCdMVfhPHVbPS7PX8euoazupK
 MWvBbg5Hh8Hx/PXpWVqQSTuvCnNhGqH+cOmJ61ffVXpdbbmZsHaVetwUU+7VTYrysz+J
 5hjg==
X-Gm-Message-State: ANoB5pmvdU1tWQKkij7G5smH6IGzFeGpNVneO7B3jXkKYXwLP3E9W6Wt
 Wm/5ordCPmkE3utdEsYtVxAeIYCpfWs=
X-Google-Smtp-Source: AA0mqf6RPoKNuWFIQOR8lvY7NWiHi8J34zPeLC0FK7jUxTEYHtpjmN0gwv9tLUp6woTuSwKzZDhF8A==
X-Received: by 2002:a05:651c:10c4:b0:277:21c8:aac1 with SMTP id
 l4-20020a05651c10c400b0027721c8aac1mr15088440ljn.430.1669781832667; 
 Tue, 29 Nov 2022 20:17:12 -0800 (PST)
Received: from front ([80.83.238.100]) by smtp.gmail.com with ESMTPSA id
 r14-20020ac25f8e000000b004996fbfd75esm81993lfe.71.2022.11.29.20.17.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 20:17:12 -0800 (PST)
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Implement something
In-Reply-To: <20221130041259.12032-1-evgeny.v.ermakov@gmail.com>
References: <20221130041259.12032-1-evgeny.v.ermakov@gmail.com>
Date: Wed, 30 Nov 2022 15:17:07 +1100
Message-ID: <87h6yhvzy4.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Evgeny Ermakov <evgeny.v.ermakov@gmail.com> writes:

Oops, sorry. Ignore this, I sent it by mistake.

> Hello!
>
> Evgeny Ermakov (2):
>   hw/char: Add STM32F7 peripheral: USART
>   hw/input: Add FT5336 touch controller
>
>  include/hw/char/stm32f7xx_usart.h |  30 +++
>  include/hw/input/ft5336.h         |  14 ++
>  hw/char/stm32f7xx_usart.c         | 361 ++++++++++++++++++++++++++++++
>  hw/input/ft5336.c                 | 357 +++++++++++++++++++++++++++++
>  hw/arm/Kconfig                    |   1 +
>  hw/char/Kconfig                   |   3 +
>  hw/char/meson.build               |   1 +
>  hw/char/trace-events              |   4 +
>  hw/input/Kconfig                  |   4 +
>  hw/input/meson.build              |   2 +
>  10 files changed, 777 insertions(+)
>  create mode 100644 include/hw/char/stm32f7xx_usart.h
>  create mode 100644 include/hw/input/ft5336.h
>  create mode 100644 hw/char/stm32f7xx_usart.c
>  create mode 100644 hw/input/ft5336.c
>
> -- 
> 2.38.1

