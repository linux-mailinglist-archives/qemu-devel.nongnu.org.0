Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E125A0F7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 23:49:06 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDE9J-0005CR-6F
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 17:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDE8S-0004jG-Mt
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 17:48:12 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDE8Q-0005QW-SP
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 17:48:12 -0400
Received: by mail-ej1-x629.google.com with SMTP id e23so3786428eja.3
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 14:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qRX1yUnBYj0LBWD0sCShC3siEOFYQJkynaBp2RLL2t4=;
 b=x6l6WqcxU8pllHQrrbDYmt0GHpoYdtTdZrOE+rmhxCTSukZ5YwxYDFCdFOyDQKqvgx
 JE9xwvF3/dQSFgw+llKqCH13odggAJZD0qF5YnMm0iw52ZU2JPGZZj+ZiquKK8uXpVro
 SSQDEwf/5+yoBsAdB6L8bpbHUJzVWeUKhHGjoWFRXeCjU3tIbnAXvKzdn+Ugd0Vnoe0h
 WWos4hN/0Yrakr+nBhjvNZXRtIZY17fY1Cfo+6kX87npDTAxHkF4MbJkGCE7kP3pMIMK
 zkQ9gG+m23+Y2F4ct1vfruXY2JnHKAV8bAU96SVYGteXXNUyKeoPBQW1KVhoq2kgD+Y5
 uCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qRX1yUnBYj0LBWD0sCShC3siEOFYQJkynaBp2RLL2t4=;
 b=jcuI5fevX7ISPO8kQIRgQFHt+CdKrRlmHRZYk63n/F1q1zrjnQTx57DcOdmkUZm6ic
 Hdqx2VsrUn5x2mOz0CtxkTpXodIz148OyMNvzKY6a0ulQenf8wZIrK+o1m0IIHB9D06t
 RV9KTIP3wGsCCXcw8B5EJbyjOg97N1swFS6myC/QM8Vu/1Jhv+kiK+nsfiKhu5g9KafK
 NYxeHWFF0Zwy+e6nQXuNhlYAoI2BA2pIEqhOO/qkPh/GvqlYqbUXp0EnyaFGQuYKub+T
 jU/y7ZWpLDRL4WIxfJu1oGniY6/NcHoB+GbzCDzDJeJ8PTDl0xtH+1JhJADfiL8kCBkT
 lDbA==
X-Gm-Message-State: AOAM530uQyLiS3Ck5UsPjys1xx5msNuHoxWQtlpF4x5eZ34MyXODplwZ
 plwDtZXCSAyRdNmx3barfU4DkRHnI2lsMNvmmV13a8Agugqi4Q==
X-Google-Smtp-Source: ABdhPJxcGepSaDRDyD000ycy5EFfBjPdDLi9pU3ynTKhtDkDSr6kzGII4QhuNR3HvFFlUcWld51P0uOAhI3d5MJxUrE=
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr3337731ejb.382.1598996888558; 
 Tue, 01 Sep 2020 14:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200901151823.29785-1-peter.maydell@linaro.org>
In-Reply-To: <20200901151823.29785-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2020 22:47:57 +0100
Message-ID: <CAFEAcA9+BiMJE8uRDnN9Xuu5a57AFAOdNj2zk-BFshH8FCSPEA@mail.gmail.com>
Subject: Re: [PULL 00/47] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Sep 2020 at 16:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Just my fp16 work, plus some small stuff for the sbsa-ref board;
> but my rule of thumb is to send a pullreq once I get over about
> 30 patches...
>
> -- PMM
>
> The following changes since commit 2f4c51c0f384d7888a04b4815861e6d5fd244d75:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200831-pull-request' into staging (2020-08-31 19:39:13 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200901
>
> for you to fetch changes up to 3f462bf0f6ea6382dd1502d4eb1fcd33c8e774f5:
>
>   hw/arm/sbsa-ref : Add embedded controller in secure memory (2020-09-01 14:01:34 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Implement fp16 support for AArch32 VFP and Neon
>  * hw/arm/sbsa-ref: add "reg" property to DT cpu nodes
>  * hw/arm/sbsa-ref : Add embedded controller in secure memory
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

