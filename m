Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05C441A37
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:49:39 +0100 (CET)
Received: from localhost ([::1]:48596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUsl-0003Tn-26
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhUrk-0002im-IH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:48:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhUrj-00066Q-44
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:48:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so8463902wmj.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3/x0Jd9zXpWQrDriwoxuGDt1jKzyXserDsvEKIi9jM=;
 b=K/MM7OZYXdKoRE8h2Ja7ogfoWOodLmTp1+wAQpZa/YrsiUNFjvpEh5BOZbiUDbCcTu
 kvDGLD9uATkC1XVrEi2Fur6Kkjp8znNY1FhCpBhJzdsYS3MHMEinMEnP7dkrCTIiTP6b
 UJ5XbeBdj3gccwfFmVF/+Rrcl9gAhLSNlrxhwtVNPYnG+Pi0+PRr9U9cJ+x68m0RQ9Dc
 hmZdUYubw6Ta7j6XTFqthEZv/mHlI7EVw1zoWhfKGU4Qdhx5G9oWi24W1p0guBZ4Gwj+
 taBw3wQ9EHwE50KzTLKckQs9MUTwRj8wj76t+W8kwcxLSOUGqYfTs5mgJ8FfpT6Nf5mf
 Z36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3/x0Jd9zXpWQrDriwoxuGDt1jKzyXserDsvEKIi9jM=;
 b=XIesbvIZQufRWFhSStcnQHPpyB3PAvleeW8QvCIpQd46ecDwfAKq5GNIfm+ARL/qnv
 K2AWtuNETVmW9uyFHWFu09WknfB4sbck1KcwIk4VCYDBTVzQexrSuQu8KsIpSRHOwafd
 9ylw7Stou4XW3EKcA2yFUFaBD+8ZqUbQzuW64m6bd8ih+lOyc+bJzS+LR2hWylJ55AUT
 ICSS7bgNwB4gbk3jYhj1LpMg8alD0sKIbpqpkDWrKD8Tk0aS6rj/39Gxn8jI1RJUQ0p+
 EWOW/yNrDiPng4aOIuA3y3HdyumM2DMwj2rEjMRRTsEZSrRIhvlMpaDEOlidMoBeBQA8
 Dxqw==
X-Gm-Message-State: AOAM532HN5UbgQwKufJQQ6jIFYCUeFmfVOaDFhbA1obPMfagGJrt0asW
 5RwtBP5csV0Q9gGTPwNFb2LGO8y3+SwKtlJZUUda0A==
X-Google-Smtp-Source: ABdhPJzsnfbNES1i01ZNhJT/RyKePtpxAmS/AdsC4em7HRd9X5ieDv9eN4rjmko396M1fGPqeK/VgCx/NSCYCU5Zghw=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr18971101wmj.133.1635763712637; 
 Mon, 01 Nov 2021 03:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
In-Reply-To: <20211026002344.405160-7-sjg@chromium.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 10:48:21 +0000
Message-ID: <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote:
>
> Add this file, generated from qemu, so there is a reference devicetree
> in the U-Boot tree.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>

Note that the dtb you get from QEMU is only guaranteed to work if:
 1) you run it on the exact same QEMU version you generated it with
 2) you pass QEMU the exact same command line arguments you used
    when you generated it

thanks
-- PMM

