Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B651BCBF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:06:23 +0200 (CEST)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYNK-0006pG-Jr
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXG5-0003wt-Nv
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:54:49 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXG3-0007TK-T3
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:54:49 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id m128so6489854ybm.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXTi2qGXsJwL1kWtHg+euQEF/9oPJlQrfKzw+RwXwqY=;
 b=Ppd6McdXE/iu7fKQSqOhq0p0dpHhcNG4oAnmteSXDQLs+orFS3S9rApJIDnyw5O9J+
 Ozkw0g+EqScRaLjGUIFe45ejhEjZjQj6wOFB/b+YG9sDZefTLuqvonzGIC6c3FxNXd41
 TRaUczVRRbJyYvPp7E2DFciG3+0cTHBAWbIZyuALiKBNWeZ04JfmpRHX2cEuEBvCaPr1
 tyWyFw4JiMVzagD8sB8OA2jdjH2lSq3AdpOs3VboDYZEtbbjbYiQ75MUTx3ILsbf3fYl
 EbRvu55F26dDqBvIk9vFYZDCQI/SS4Jka0x6I4M7MtAY88ZAB/7ESyjLZYyLR75UAM+e
 CabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXTi2qGXsJwL1kWtHg+euQEF/9oPJlQrfKzw+RwXwqY=;
 b=bJRKiJ+mBcBmsOcq15ruV8nrEcS3ANLbon54e84dBFi8i5/fEzYOXeCHSwq2PTCzpK
 oQ7vYPA4kWR0Wjh3iYLxhV8oHmMgcyd5zyBmnrkQFQ+5RpUUQ9jon/6uP8UCZVndRvuc
 rR0er1bwOLywXCtRnIYLdD9TrzN0ovDhCS/ZOZFxHIZ2BB4+Vgwmb6AgfVFo5lt+dkXl
 fQo9YMi/G9r/rJBoXLYudWHO/fW3dByBsmmFe0tqpcJvAzaHw8RfqjD8DyvJ5AGOqo8T
 h/Rlnu6Oz4L8/SDGABSP4onFzRK4SfYO6gVFNPbjDuGhP7z3YVT12tY8+5mN+z2T2uMu
 QVaw==
X-Gm-Message-State: AOAM5301ZWJ+5/jrnJtWApDUBjtxJFr8n6VZAxtGdRhtp+faQVpxamZB
 EVGVE/rkYX+cBA4GkUmDHy3JnsX7HLOC3A8u/ZCPxA==
X-Google-Smtp-Source: ABdhPJxKNnZGuwXTVnsHZ6S+B4kvybM3Cme9eOkMvImoRdoYBFOKdLt6jTY+UThmnVn9GmZdgV251qhBb+JA80xA7Yw=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr19377319ybg.140.1651740886929; Thu, 05
 May 2022 01:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
In-Reply-To: <20220501122505.29202-1-gautamnagrawal@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 09:54:35 +0100
Message-ID: <CAFEAcA8qQMOgvpg2hbwztXVnGCQxDnzW8WXs+hC-aqWGckkfeg@mail.gmail.com>
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
To: Gautam Agrawal <gautamnagrawal@gmail.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, stefanha@gmail.com, 
 kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 May 2022 at 13:25, Gautam Agrawal <gautamnagrawal@gmail.com> wrote:
>
> A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
> has been used to track the creation of vga interface. If the vga flag is passed
> in the command line "default_vga"(declared in softmmu/vl.c) variable is set to 0.
> To warn user, the condition checks if vga_interface_created is false
> and default_vga is equal to 0. If "-vga none" is passed, this patch will not warn the
> user regarding the creation of VGA device.
>
> The warning "A -vga option was passed but this
> machine type does not use that option; no VGA device has been created"
> is logged if vga flag is passed but no vga device is created.
>
> This patch has been tested for x86_64, i386, sparc, sparc64 and arm boards.
>
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

