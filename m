Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C9418A90
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:49:19 +0200 (CEST)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZDC-0004wx-An
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUZBd-00034d-1v
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:47:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:47053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUZBW-0007aA-8y
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:47:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c21so15656247wrb.13
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=smG6Hs6KVAAO9oEtyeGcrgMH5h/PVsQD3rFwHkMpVmg=;
 b=y9I1OTxGg/No1Lq4ov0AAI8kGMD6T96FoEKgU+WaNHw17npZCFzTJLEMmv/IdhfY3C
 R+v8FpBJmkR6GL93p/gKSXCNwe+5NOeeBOIzzy6F0O8emdqB74oSVIOLuHQSmBvJb2xW
 Jrgj1U8AF7l4g3cKkiivNcB3ZvdR9j/uV6yBpQmv0HeCYD+mBFely04b7hTQkgHbI+uQ
 sGeiz7JzEWgWu7ve6iJGIYZIzuqPsNB8qjtMpnmnE81umVzGS1qNxSbVfNYTXDhxsM3Q
 4HWVp677ykUdts25UwExucGINj7Sx0nF8FBznU7YzKIvNZZ21uJwwAB+Q/Q7QTBxhVBI
 8T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=smG6Hs6KVAAO9oEtyeGcrgMH5h/PVsQD3rFwHkMpVmg=;
 b=SPqnAYt5/31YtY91H9aBZxBTkkBtG7tQLj41gsB79lR+4Jlf37bsv+9epBgIGUMu3x
 o8hWJrBRzec+RgKr5+npgjB8LAh04faR5Y+bnqKmNjVbwIccrIizpt7jt34ocjqGw+lz
 IDRTgIEaf4TdRzEPDvw5R3QzHiyxzuJkfKiQVlj852RxX9f4oG30vWaSOUCj7b1zPcxw
 jWVpNEvTDfdvSRnQWfZG9t4kKvnJqcM8lcVOItiOv6RYxl6lVdo7T6DJuZ8Rrb+to7jc
 3C7O6WMmxBeSjevuK1Amn2aH7ovFuJqi8paXolXEo3QYCpgkGKfCWJZJ0tmn7leXQi64
 qLOg==
X-Gm-Message-State: AOAM532GbxT4nwzzRElLtRlH1FOyGvRYUifyXVfyutLO9iCbU0alsbeV
 bojjKUdwMMA5VbJw3CM+zdRtO6kb6KmpQr89O4ZsGA==
X-Google-Smtp-Source: ABdhPJwuTBSpEeMlhbj0Q76c6+aGTLeHwUzfHuPqPrRiSyzYteIOs36jHFOiGtAJKhv9Z0cmPxbQwVleHZBfKxM06fQ=
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr6106699wmq.21.1632682051443; 
 Sun, 26 Sep 2021 11:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
In-Reply-To: <20210926183410.256484-1-sjg@chromium.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Sep 2021 19:46:38 +0100
Message-ID: <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 26 Sept 2021 at 19:34, Simon Glass <sjg@chromium.org> wrote:
>
> At present qemu creates a device tree automatically with the 'virt' generic
> virtual platform. This is very convenient in most cases but there is not
> much control over what is generated.
>
> Add a way to provide a device tree binary file with additional properties
> to add before booting. This provides flexibility for situations where
> Linux needs some tweak to operate correctly. It also allows configuration
> information to be passed to U-Boot, supporting verified boot, for example.

So, I'm strongly inclined to say "nope" here. The device
tree virt generates is supposed to entirely describe the
virtual hardware we pass to the guest. If a guest doesn't
work with that, then either we're generating bogus dtb info
or the guest is not handling the dtb we pass it, and one
or the other should be fixed.

thanks
-- PMM

