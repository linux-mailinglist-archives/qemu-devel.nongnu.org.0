Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070BD41911D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 10:51:54 +0200 (CEST)
Received: from localhost ([::1]:57316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUmMa-000142-JE
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 04:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmJm-0007h9-NO
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:48:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmJj-0000ne-BC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:48:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c21so20504185wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdxaTro+RZTeSKxUQRkCRNrXlwy7a5EMBAZasV++LjE=;
 b=bWNvBp8HbGODeNPqnwJ8g2FcnRFC8/E7nweywJZEgS6tV5QtV5wtGvCBXv5KT1c/KM
 rM2ovWB3SkGp5sec0IbIMWSAYVpkMUMGPfcMh3ddJYY4qwDgj/lS2dP326Rl1yffYAWl
 FWdkiZ8cmf7ChUn2fA7/ogmXZIfZaR6bzCQ9+Tc2odo+1ZGzYbg09Sf7V/uZ88mqthFx
 61pA3vCQ2viWmZMh5TKdIC6ZABAWyOyqXtXkluBOfB+G36Vexv9q/7RrNrIVk8LUOUGe
 taUngwcDjH8TTEBh4MbZUDaIsmF5BEiaqocEIl/Lj55peOcc4DTfTvMfnhsmrBQQSHAo
 MXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdxaTro+RZTeSKxUQRkCRNrXlwy7a5EMBAZasV++LjE=;
 b=LmI9e1GDZF8gbG6YxaxhSQ91Y3+2Ydgk0XX62IAx7s48xePlFOzv1EzC0MrR4pAx1r
 5NRf8dDbVipkN3xChDDdbN6W7LLQaec0m6/RjcUdOBwf84k43rjSGubwC5rOoBDsxU6y
 xP3U2u6PXRKJ5Wjz2XglpS5OAjQbBwxQpy6R97RCSdC+Tc5p3yMKlKiqHpcthTut8QH+
 8ym7S1AsH+w4Og90tUQye/i8Tk/Y7Op6HSsHjSN7N+9QqfimC14+z7S3qMlqfdhwi2aW
 XzLDUnHozMOVr52FQ+qyRJuPIFaWmL9PNI6Ivm4z5qvq3syRsbe9IU4Iw1l9HeFQ3vfl
 H83w==
X-Gm-Message-State: AOAM532vvFmG0Kx1OUgudAp+Imep2ZJ6VPPY2Kj4xtWYR4FmnygAF/g3
 TFiLlseu0V6HaU395hmsyjYVyYF86oWaLgZdkpAdbA==
X-Google-Smtp-Source: ABdhPJzxsCPFhPKBMqzERRY2AYQ1mjFGSiuQ7v5j6BKDX+RHlwIrTX4TZBgll8FCpduD3lbvmAAaf9fXd2gs3FdpVRM=
X-Received: by 2002:adf:eac5:: with SMTP id o5mr17765454wrn.275.1632732533597; 
 Mon, 27 Sep 2021 01:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
In-Reply-To: <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 09:48:00 +0100
Message-ID: <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, 26 Sept 2021 at 19:55, Simon Glass <sjg@chromium.org> wrote:
> In the case of U-Boot at least, it uses the devicetree for
> configuration (it is a boot loader, so there is no user space to
> provide configuration). So the current setup is not sufficient to boot
> it correctly in all cases. On the other hand, the 'virt' feature is
> very useful for testing U-Boot, so it would be great to be able to
> support this.

So what is missing in the QEMU-provided DTB that it needs?

thanks
-- PMM

