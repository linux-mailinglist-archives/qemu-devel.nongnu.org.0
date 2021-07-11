Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596E3C3D51
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 16:23:20 +0200 (CEST)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2aMY-0003ml-T9
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 10:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2aLg-00036C-Dm
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 10:22:24 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2aLe-0007Iw-Qf
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 10:22:24 -0400
Received: by mail-ej1-x630.google.com with SMTP id bg14so27939071ejb.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7AICqMTH/3BLGlAwZfxLo9aeQZzJ2k5NCYR8LZfqSvI=;
 b=PdkizLyr6aAWC+7GoUJbPFst63QGVUPEeholq2dR/uhe4heEh0CEzssm4TZGHqN8I5
 z4Tr6SYFc+SKVHHZOrKXCABKy7ZdE2/rv/fHpW0a0PI98JigNF0vlzWXkVQ8UFQdHFkG
 /Lo26BXcPMKb3U2SllVu1gP0SPlX2EtX5NV6BneyuP4Sk7Wc0tzCcRMlfE1ySh6V9yXY
 2wbTfb9e+UKN6p1z1ndkYXM0f51TLTacPwpYCPRgLwC0FdhluDhQYEc6eBLRZilCduwR
 xKbw1jQ2N1SNB4WLi5JApl7jFG0av8eJOecjbVxW1ge73BPioKZbtEmuOVgJpowQ0fP9
 nzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7AICqMTH/3BLGlAwZfxLo9aeQZzJ2k5NCYR8LZfqSvI=;
 b=WV4rFkwPIgl0lQ/wJJ9Mk/bXHOmJL+iYk0NPt+Ow3PtfWcqGlQWh825kHYhCB7cVLA
 Sj/RP8YilXUFWY8+ZUS+NFbgti13+aCZuJl5s8FEO53ymabBtqcagOnm4mMQSDwWrmsa
 OCb64j6j1wWGueBg+ulgWHACDo43KWrKnoe3Hd10aa3lQyIkQwNkWNmwTY6LPz5mY9ct
 VhllR7hQT6HUJue7/VaNvt8nrA3WsotXQ3JpNhlXVzgFIky3T4BNqOqz0IU7EMeTBwXn
 xz2cTKut3c9h2E7gMTj+QCMj7/o3iVq8aecE3hOVV+XdN92PM+L+OrTRSdDCj+icRj/Y
 9lQA==
X-Gm-Message-State: AOAM531u6uHnDWUllQ96FlvkBp4cjz8hzvCan5a/5tHEekHfWJokz/fo
 ujojE7xuKAVnJAGhEsbK8i8uQms45L/HzaejhxD3sg==
X-Google-Smtp-Source: ABdhPJxDdxARPh213Ryjye1dpmwjB+OtfH4WfNiytoDTspNt9NpIWNA0oxMXAzJ5wbfGCJ6S+ouibAAHptzVx7AZZXM=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr31097279ejx.85.1626013341179; 
 Sun, 11 Jul 2021 07:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <20210711120854.andcppzuxo6ztykd@Rk>
 <CAFEAcA9tF7pU1uEC06tppkKCL7m+5OYWm8T5MO_qF4P2P_UuOQ@mail.gmail.com>
 <d21e1a9e-1df4-4fce-d6de-e7a15131b684@linaro.org>
In-Reply-To: <d21e1a9e-1df4-4fce-d6de-e7a15131b684@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 15:21:41 +0100
Message-ID: <CAFEAcA92V5rkyHr8Bjtd1VHM2QYLumMrUtQRZK5h2iWB7N-wAw@mail.gmail.com>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Jul 2021 at 14:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I believe that I had to perform the install under tcg because I couldn't find the right
> magic to boot off the debian cdrom with kvm.

Weird, it ought not in theory to care...

-- PMM

