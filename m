Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96739D774
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 10:31:27 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqAfO-0007CA-FO
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 04:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lqAe8-0006Te-To
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 04:30:08 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lqAe7-0000mv-E7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 04:30:08 -0400
Received: by mail-lf1-x130.google.com with SMTP id p17so24107294lfc.6
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aid4MN1I2LbM2bUYAHcIJ++nAxr9FTYNcL0IFZv7RQ8=;
 b=VRCGaB0iZvyF9ZoNaAKoEzeaEkuNHnT04pv+K9DNdRYzdCM1KjsvnNuoi+3jFUgZO0
 qLOal+Ztb1RmRFJjdSB7OYGhXirceh1NC4vu6Czu7yMAPIZ7c4qlA3X0lgXa/jnKQiVv
 FwxThWxFKTj2i2QNgc17BNQa2uWa0+Vc8c9EZS5A//6kK8QY14isygl2t3JmUeklFMm7
 borMyfu27OqMDhPyPUxMfDAsqZUFdt1uDYzzr5bhTqLS+ACIp/PEe6f5B4rFeIEpg6mt
 FoykfPJf7gR2edm4qfLzQhmHvjzrLKpJsm7d2PM/WGlEa5ChgZeHXWLxR3wMHH5a0kPd
 1WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aid4MN1I2LbM2bUYAHcIJ++nAxr9FTYNcL0IFZv7RQ8=;
 b=WFEITPBYXjGXFG/CYwvgqdBNDBaOQAHSGNqMaaTO0O0V1006Zr2ACLHEWuhn+OWWuj
 q6MIKhwwWuoqiR4Wn1hwMx+T3WhKsquQQBVLyTJR8dzi8SDn3DMi0ZUYHUjnZYC+hZ+r
 V8eAJmx0E0RrQa+nQ/QioO5G6nuSgIuYNI4DmexFkgJcSl5cdObqf2QaafwSsHjVbdcy
 qUmgkFT0KH5Gq+Luf0jlHJZqfyrrzAGPiPG9sBH+yTKMeYGaVoPMjLUMQs2vG5yTnY4O
 kVPA2VVxFGOiSYDFq7YILpzCfK/hUo8EeWuY76gcMZt8xPZ6b6p+aduCgrTwcXtrs4lr
 viQg==
X-Gm-Message-State: AOAM5316iiNmFH0x5rxsoS6uunWv2kQCwfSY1DZMHos9BbmfkQvkA0A6
 RM5QSwdUUiJ5tS4YcFFFQmvX7QKF7QWmewdU35E=
X-Google-Smtp-Source: ABdhPJyoFkP9t5eCNWPa/pGi1t4+iTNddoMD8W2wuGOz1KDjgk+kaYCFisonZOxh/ZGle3RvD7O1cOSLsh/MyM/tVEs=
X-Received: by 2002:a05:6512:2314:: with SMTP id
 o20mr6070132lfu.531.1623054604971; 
 Mon, 07 Jun 2021 01:30:04 -0700 (PDT)
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Mon, 7 Jun 2021 16:29:54 +0800
Message-ID: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
Subject: Regarding commit a9bcedd (SD card size has to be power of 2)
To: f4bug@amsat.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=tom.ty89@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi philmd (and others),

So I just noticed your commit of requiring the size of an emulated SD
card to be a power of 2, when I was trying to emulate one for an
actual one (well, it's a microSD, but still), as it errored out.

You claim that the kernel will consider it to be a firmware bug and
"correct" the capacity by rounding it up. Could you provide a concrete
reference to the code that does such a thing? I'm not ruling out that
some crazy code could have gone upstream because some reviewers might
not be doing their job right, but if that really happened, it's a
kernel bug/regression and qemu should not do an equally-crazy thing to
"fix" it.

No offense but what you claimed really sounds absurd and ridiculous.
Although I don't have hundreds of SD cards in hand, I owned quite a
few at least, like most people do, with capacities ranging from ~2G to
~128G, and I don't even recall seeing a single one that has the
capacity being a power of 2. (Just like vendors of HDDs and SSDs, they
literally never do that AFAICT, for whatever reasons.)

Besides, even if there's a proper reason for the kernel to "fix" the
capacity, there's no reason for it to round it up either, because
obviously there will never be actual storage for the "virtual blocks".
I've never seen such a behavior so far either with the "mmcblk" hosts
I've used so far.

Regards,
Tom

