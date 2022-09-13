Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B35B6D68
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 14:38:09 +0200 (CEST)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY5B2-0004Di-Bm
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 08:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oY54O-0007eZ-LT
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:31:17 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:41632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oY54N-0003H7-2D
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:31:16 -0400
Received: by mail-lj1-x22a.google.com with SMTP id a14so12048621ljj.8
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LNdxrbPBK23WVdXFvSIizl+cvfvwQk08JoyV4N0LB8Q=;
 b=PeeXsnPN3sc4CAxzFfzTYb+JYY5Mn3le2eRYJovZj0p5adZXwwU98Mtn49NEx6G5Tl
 ikNL737pXdsn4Cjhz2+TCfXcsXHdcHG09siyUri8uDrDnXizxTjcBmXqAr3wMc49eWiO
 WZWDKvajpOWn5guHTgkHU6woN73ilIEJVdKVjM4u8ekX0qaYEg83TMFA6if6HrGjHUzz
 x14s09t+ZCkx7hpp37c0HU016/ibB6ait31LO7Ptj8TTsgPcXnFJqwfSu8jFxu96MDvN
 TzZD7MyWIwjbcoSEv5gQ8xSGXn0Iw2kqVQZCe+ZlIOirHJzrJq7pHH3WLI1+5eHc9rjj
 iFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LNdxrbPBK23WVdXFvSIizl+cvfvwQk08JoyV4N0LB8Q=;
 b=0hrCoZRCCCTPO0xDjw62AgosSzyiJLUoA2HT8z0XjVtw8Gf04OUC8egLmdIKlLFHx4
 wzHMa8epLT74ofrQTQgpR6375uM5OFiDs7iO9Bv+qNwtyEyxhx6veQuDG9+EeZNFxDU1
 gOnOqqM32EnOxABBr3HfVX3doJ/bSX0ljvLIpsOlwtCDzvF0F37AhzGptEZdreUtmwuO
 z5jM+56Ks/mErTxqtuJq+bNH5Hh+o+TOIn6f+xkq2Vs4kVKV7lHyXMGQjEgulENysY61
 67x/HpJ7Mn1z65nVngiw+wueDyhTzn/iyUXQ6aOV/D76HbT3J6qIgZ52eV2Owpnf979y
 i//Q==
X-Gm-Message-State: ACgBeo1l38mYA1PmTGmoqT3esePDm8+pFFx6RXLUqyw0AshJL88SUufL
 Y90CQG7gd1WMaVjcIZbaykq6taOr1FaDRQWRMVl/Gw==
X-Google-Smtp-Source: AA6agR6CJRR6Rr5IQAac5CZQKsBdteWCa+W/YyjuiJXT1TRs4ptSjxzCUD4wuNINDlzCdTFp2GJzM8WGo9rmvSjwORs=
X-Received: by 2002:a05:651c:119a:b0:26a:a1b3:e6f2 with SMTP id
 w26-20020a05651c119a00b0026aa1b3e6f2mr9420464ljo.190.1663072271944; Tue, 13
 Sep 2022 05:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-2-arwed.meyer@gmx.de>
 <CAFEAcA_F+ETYHT-HSs3wHwjqP4CEe2LtdfCf8B_P2Ted4xvk+w@mail.gmail.com>
 <1bd4abdc-e0db-1fa6-99ba-84b729e5cb22@gmx.de>
 <CAFEAcA-9RD_Lxypgm1yM6T_R=SS=LD9JPQbD5SFek4_wrCnKhg@mail.gmail.com>
 <8bb22c23-23b2-8c2c-12e7-24a2f299445c@gmx.de>
In-Reply-To: <8bb22c23-23b2-8c2c-12e7-24a2f299445c@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 13:30:59 +0100
Message-ID: <CAFEAcA-KQnyWXueksODWS+Ew_Fq7g2XXZF+gBpVv3wb=8Mhx2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] msmouse: Handle mouse reset
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Sept 2022 at 18:45, Arwed Meyer <arwed.meyer@gmx.de> wrote:
> thanks for adding some context. Good question.
> Unfortunately I don't know the device and migration code much, so I
> can't really say anything about this. I guess(!) it should be enough to
> save/load contents of struct MouseChardev. No idea if and how this can
> be done though.
> Also since saving/loading device state wasn't supported in the msmouse
> code to begin with, for me this is a new feature and out of scope for
> this patch set.

Yes, agreed. I was really hoping to catch the attention of one
of the reviewers who's more familiar with chardev...

-- PMM

