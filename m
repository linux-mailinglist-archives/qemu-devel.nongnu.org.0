Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09A34930B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 14:27:51 +0100 (CET)
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQ1e-0004nH-9u
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 09:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPPze-0003jx-1b
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 09:25:46 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPPzX-0006UO-Lx
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 09:25:45 -0400
Received: by mail-ej1-x634.google.com with SMTP id kt15so2848901ejb.12
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBQ8EGeOD93WXWs7ALP2mjlKTDVnzKWQKUxQSBPtWxo=;
 b=WkGYo4opk8U2kf1zzd7sKDs6w6vbG5s2KH1ZcbV20A7/sNR0K/COUbk2cHqpa7I+CJ
 lYqll+L1riqpsd7gXlSEYk5suNBsKAiY/HYK+suQia+c4lMX9NvL/pFW0V9NEfIHTL62
 iV9g5WJw4DUpGk4rTC7UsmsFcJCAG/TtUcH3U7bOx8usTwGRc/2mTh6gF7k/cB/rPejL
 gaTpmLLk5gM05CEksJguLYqZBinxKh5bnWUMXCSWpFYr7ssQ/vQ/4Ug80hkQDaAXr4cB
 nokxWhMqDW1nl17RxTLhNEWH1/nPG1a6NGGIl38VCBrxxQ/oJcnY9n8cCSB9QXcUR3m1
 mpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBQ8EGeOD93WXWs7ALP2mjlKTDVnzKWQKUxQSBPtWxo=;
 b=mwdMFwLnDbk9ry/nO/S5bk4kwFY99+i9pZybDvyX9bMBu+G/toudYy3UMhu6WhZ8Fe
 /OX+ZP4tsDeJKT7OHKhkeGvuvCnJvD7LRJw0kQzcjv2FMc7Ofu3wnHJYvMUJaNnCZZUT
 OvN8yPzMBHuz9DmlxdX3Dhtf5Z+bqc975KH7gyvqV5D3m0SF6sstgN9g347fdBePfk8b
 8JRhp+ohePbR43yX7qEcvcgI8ed+6p2b3FldvPAZ+rlJ59A+OPvpEdmAYxNj5ltsgWhu
 3QFD8BZCDYxjmp+2+1me+HKCZjZzYlKTITC+4O/iscxGdNTKfBtei6zHW75godmBK63o
 wm5g==
X-Gm-Message-State: AOAM532SJYxeW3WBD1DbqRheQBwa1wcc1xUHzP5EM8Iy6M7/P80LRTxT
 ZykH72+y8lwOLNwqnespF619D0XDzWuseG+LvKmL7A==
X-Google-Smtp-Source: ABdhPJxKrFbkjmwaQkJrA48ee8zRJcLF87h19NWl/lbX3CMLZo2nZXhQrevwAtePcmYkMgoN7jh5N8gG5kSv5uxmjHM=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr9659152ejc.250.1616678737166; 
 Thu, 25 Mar 2021 06:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <72851037-b283-c4c1-fbeb-da86f0527627@ilande.co.uk>
 <CAFEAcA-8M7PKiM9tOXuVKMwMRF6Q02FbyQbU-P60wQqgcedrKg@mail.gmail.com>
 <4be7c437-ddaa-849a-6c0b-5cce2d5b6fdb@ilande.co.uk>
In-Reply-To: <4be7c437-ddaa-849a-6c0b-5cce2d5b6fdb@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Mar 2021 13:25:05 +0000
Message-ID: <CAFEAcA9ie7o49tm_eSMh9SEnkh_j6fj3Qq41B3t5rSEr_MfuPg@mail.gmail.com>
Subject: Re: Crashes with qemu-system-ppc64
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 12:57, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> Thanks for the analysis: I can certainly see how the above commit would have changed
> the behaviour. Looking at hw/ppc/e590plat.c in e500plat_machine_class_init() I see
> that line 101 reads "machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);"
> which looks like it is intended to add a class restriction to this functionality.

Aha. I thought there was a restriction somewhere but hadn't found that
function. I think the device plug callback functions should check that
list rather than saying "any TYPE_SYS_BUS_DEVICE is fine".

> In machine_initfn() a callback for machine_init_notify() is added to perform the
> check but the macio-oldworld device is realized first

Also, this check is only for "did the user dynamically create a sysbus
device that isn't an allowed one", which is a necessary check, but
not quite the same thing as "is this device we're looking at one we want to
assume belongs to the platform bus".

I'll put together a patch...

thanks
-- PMM

