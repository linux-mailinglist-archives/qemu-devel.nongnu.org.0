Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65850DD38
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:53:59 +0200 (CEST)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivPq-00007q-RG
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1niuyS-0007Ut-0N
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:25:40 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1niuyQ-0003sX-7X
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:25:39 -0400
Received: by mail-yb1-xb33.google.com with SMTP id j2so25988023ybu.0
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHtlOyRsthff57hLMc3enz3EkasVfbl+dQs9f447/hY=;
 b=P5eOFc6RlaylfAbWxY/9S/X2XR2dpwyYWo7PBXcVGOV9Q4lZbtkERAe7uqwKtWS8X8
 1JcuqYSDxH3efmMArA6ds1oxwlsSN85WfmAs1S9DMnJjVpDCL4IPqz4+se87tlutPf7K
 5SwAJZ4P655D+14YkN0fuk6bXR5XozqJdLO0io8BARWuVgnSGiYXR0SNmSHvk9VmMi14
 OxPGZNkexrcKkfkpGmDyWgUhUkBaYxrjXdwCs5Q7PZLBbOX7gBmUkaJkj8kG4QCK5I9T
 pCfzX6Z4gIppjPwAcYDsDX0ZRYNQ4DGI+JaO7DJz0XYoEB9HBTdVT0BCJFmfkxnLhVyz
 WiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHtlOyRsthff57hLMc3enz3EkasVfbl+dQs9f447/hY=;
 b=L6tGhIlwPKzO5JAm+8tkdyOTDVUg+DSz2JDqmwgVxhiYwywHyhvzrIPaTGXey2Fvgw
 ZHtXjGneWSm6tWWFXEKlyVre/bPapC7VSa5c3f5lsVd5OjTFx4PQ7sJcYWBPSK+8c0De
 H7lv+OiNX00WBMKxma7ZXj/03hVTdHOzIaWVCuZ6g/J+WOlYzlnh51F49qqyVCxLkBN/
 Migx9W8vagVL6YNx2BRnCMpvScECC6d4F6Z4NJUqPdAbJTRs8rJk/DSS9W5sLdk0+gIT
 dY6fdt57WXdLSRuYjshVzAvsci5VVBZqOpJfYQUgoI4aSVtxTeBVf5Vhc5vsZkgk6yI6
 b7Vg==
X-Gm-Message-State: AOAM5338gWRO67nBmNg+nch0BerwW2WHUG5G53pU8XcP8QTJU7GS8tVg
 ZRoN8uMCFTA/aAvrHUQFD2MOcmzLxEFNAI06pXp7SA==
X-Google-Smtp-Source: ABdhPJx54NJ6lflZQHbrKB6tB8zTsX1SVjNpPtYT8w7ErKJ8hx6a2RJo1ZSboQezUy25t+Tz8pjgWhh7sXncaxOXtg0=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14731083ybq.67.1650878736918; Mon, 25
 Apr 2022 02:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220408104519.32931-1-gautamnagrawal@gmail.com>
 <874k2hr9y3.fsf@pond.sub.org>
In-Reply-To: <874k2hr9y3.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2022 10:25:25 +0100
Message-ID: <CAFEAcA_U+OJe=SiWosbB0_NgUqeDh59yXyi2sfk931Sp+p6+Sg@mail.gmail.com>
Subject: Re: [PATCH] Warn user if the vga flag is passed but no vga device is
 created
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: stefanha@gmail.com, Thomas Huth <thuth@redhat.com>,
 Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Apr 2022 at 06:47, Markus Armbruster <armbru@redhat.com> wrote:
>
> Gautam Agrawal <gautamnagrawal@gmail.com> writes:
>
> > This patch is in regards to this issue:https://gitlab.com/qemu-project/qemu/-/issues/581#.
> > A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
> > has been used to track the creation of vga interface. If the vga flag is passed in the command
> > line "default_vga"(declared in softmmu/vl.c) variable is set to 0. To warn user, the condition
> > checks if vga_interface_created is false and default_vga is equal to 0.
> >
> > The warning "No vga device is created" is logged if vga flag is passed
> > but no vga device is created. This patch has been tested for
> > x86_64, i386, sparc, sparc64 and arm boards.
>
> Suggest to include a reproducer here, e.g.
>
>     $ qemu-system-x86_64 -S -display none -M microvm -vga std
>     qemu-system-x86_64: warning: No vga device is created
>
> See below for my critique of the warning message.

You're reviewing an old version of this patch -- the newer
versions improve the message...

-- PMM

