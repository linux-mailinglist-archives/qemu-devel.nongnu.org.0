Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E43ED8D8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:21:31 +0200 (CEST)
Received: from localhost ([::1]:52548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdUY-0003Q1-IJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFdTf-0002YH-E4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:20:35 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFdTd-0005CM-TT
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:20:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b10so23584705eju.9
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UXfFbulsq4fS7KIg9xiVs70mixUORNzY5tH/pROSk+4=;
 b=NXDXwk73VmExs1ZPR6N/gKYaf9fhYTxR2LHCoEkBzsxYV/KxP/tBhUxQnAnWrRn2PX
 AzLTMYWalsy75NveysievS7V9szjMyYbX9T1cSLBrByHGcuN/3EpQbw1wOihaRn0KIj5
 nkeSFjdRvPD18Yvc8kp9LnIwAKis4ao3fUHH4JK8mtFxH2LfxW0WoWs7rOOFrRaopRIi
 bsF3uKmZdRnyU9PQYif+/rDAvGAPHE43oG1q8b8wQqPm51rN743+vox/XwhUij609Be9
 YG1oBnyp+f8DDhJ2FoOfavfBSnZWL/WHWqhzrjiEzL2U9cjvVOXO1dJBYRtXxnXgpROF
 pk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXfFbulsq4fS7KIg9xiVs70mixUORNzY5tH/pROSk+4=;
 b=kGvZGtMjpenU6yHflTHwKD3T9TtvhT1Q2Wyivuh0nfBs0OkWI07EEyrGfOMHc7nRHq
 tSwhSuc7vCR1ccd+GOa9dEfdTSrG+yMqaDp3yIjcmkgArAs9qlb+8TjxsioGU17wiO50
 YrKyzinicVDDnDQzNhz1WzxhdH+jqQlEe8WRERALGJEqLtz2FaQuRPKYV5660cT4pFbO
 R0itScYxfRE6urbKdRVZIl4NuNvvRTUwMSnmFK9ag4TcPO8Hou0vl6CYlKUgyfBh5YmV
 z3zs7SpBCnBQT4oVz6OWhvJY8n5OhojRqPUeAsYhTTNJv+yaSlWSqP5r/7FFkGFUDaHJ
 k0aA==
X-Gm-Message-State: AOAM533SjgIbvhkp7gCEmqicbwkN2Tw/gi0gXkMHzshtW40ctewy2Hhp
 NiYGOGTrYrwF+gIWkHn5oSGmwVbXrONTkNT1D/qFgg==
X-Google-Smtp-Source: ABdhPJzR5uq+fvwk+PPLLYmfPZkgZbEcyd020zYbCVZ54HGkM/wGH3S10cIuXq8LlWpkwM0wwSfRpiQoRrJW1B52Hys=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr12876053ejf.85.1629123631904; 
 Mon, 16 Aug 2021 07:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
 <6b0a3a08-a57b-fbb6-71d8-3760d76fd265@roeck-us.net>
 <CAFEAcA_CJXseGT6A36h86Tt7rrgy0T14kXAMGLmR=AgO5W78ww@mail.gmail.com>
 <1ac55b8f-db96-0747-5beb-2016ef4bb6b1@roeck-us.net>
In-Reply-To: <1ac55b8f-db96-0747-5beb-2016ef4bb6b1@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 15:19:46 +0100
Message-ID: <CAFEAcA9KDTurQx=FgyuWPmRrHQy+q+MrHkTZ0Soe_p8pJW-+fg@mail.gmail.com>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 at 15:11, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/16/21 7:03 AM, Peter Maydell wrote:
> > On Mon, 16 Aug 2021 at 15:00, Guenter Roeck <linux@roeck-us.net> wrote:
> >> The controllers are instantiated (it looks like the Linux driver doesn't
> >> really check during probe if the hardware is present but relies on DT),
> >> but when trying to access them there is a PHY error. If a different Ethernet
> >> device is explicitly specified and instantiated, it either ends up as eth2
> >> or as eth0, depending on the driver load order. That makes it difficult
> >> to test those other Ethernet devices (and with it the PCI controller).
> >
> > I thought that code wasn't supposed to rely on the naming/ordering of
> > ethX anyway these days?
> >
>
> Depends on what you call "that code".

Sentence should be parsed 'I thought that (code wasn't supposed...)'.
That is, my understanding was that the kernel simply doesn't provide
the ordering/naming guarantee that your test code seems to want.

-- PMM

