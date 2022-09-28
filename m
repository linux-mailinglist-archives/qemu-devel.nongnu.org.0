Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85BF5EDE11
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:47:20 +0200 (CEST)
Received: from localhost ([::1]:36752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXPD-0006tg-Hx
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odVww-0005ZJ-Mt
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:14:03 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odVwk-0003fv-QB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:13:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id z2so17017578edi.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=JFq3K9EC+OCKpOQ4M2ftIjIno/fi2mWm/ivEeR6AHJw=;
 b=sgAoGdDlyyLbRbv6cQ66J1d3JOcPJw6KO3n2DEScARO+s9mAr9C1prscmPW6yTEC8V
 VuPl3IN3ZKw+LcS0/Y/vU/N+/UsEcoPgSwMdEbKuoCESTiTYOdM3c8Rlg85/er4gR5uv
 97Lca53GPtocRdpqT3cVjbUEu40880s4fRLBFANTDo7eLgc2RGDnXadadv+NSkbRHZcj
 yXXRooxwovaqoOWQH5x2/gds/xvfb8KHKhKRJRts3HLOumsyOUkuACfDLOK1f0hyaWRb
 32CgAHuouWmp/DZF2DbMUugY2a8rz8BMHUuLdl+z9uKZiu88TYcUtsZVsPwK81pLOKN4
 nUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=JFq3K9EC+OCKpOQ4M2ftIjIno/fi2mWm/ivEeR6AHJw=;
 b=mxmYBRfcQXG7gvfHKRqJXevlX9VaXowUpsFFsPRRNccMJx2RVJTLDAhvqU0bD5B9Ku
 Zy+qOyU4u0UZ54e8RwHxahj1Fa336bm9SUh6bYzRoygDFnr09mc0FyxiQMXuQnLaz/lR
 6Oc3yYLy0F4UldFiLxRpK4Z9rDcjtbcCY/McbNo2dREbn6yuVgFE1492lNkdcVeaiLtd
 fK2utvWybRFEOp5Ew4hibiwtZRabanoBmKbOk8W+g51roiaZzat0BhjMn7WUqSMRIwqQ
 zHDA56g2IGZJ7kBe4I0XzAwP5j1n942RCb8yLlWoYR5e2UTd5Ty03BMvYG5241/qbAbA
 HSKA==
X-Gm-Message-State: ACrzQf3k3NCml/kYRLWVJsV3ADV1sl5cvdjQQrS+j5zrP7r5kHvcAmlf
 EJmb8uRtduCj/9l8EL8oVYKME4TdMHXHXrdQSMmZ5Q==
X-Google-Smtp-Source: AMsMyM6tdUMikLKyp/TfIj8ULcfgsE47KkHS9t7cCfanxBtVezsddUHSk76GGlJx9pI/i3Tvmo07oHMZUJ+hUsbZ0Kc=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr33119954edc.149.1664367228837; Wed, 28
 Sep 2022 05:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220928081517.734954-1-laurent@vivier.eu>
 <20220928081517.734954-27-laurent@vivier.eu>
 <CAL7npF_74nKB+quM7QsWWi9s=S4cFA_dKQLGqryKuCf=3vgf4A@mail.gmail.com>
In-Reply-To: <CAL7npF_74nKB+quM7QsWWi9s=S4cFA_dKQLGqryKuCf=3vgf4A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Sep 2022 13:13:37 +0100
Message-ID: <CAFEAcA--WtwSxj2C8-GOz7AeBhNZcCFFEAEpWEhK+ceo20Ahew@mail.gmail.com>
Subject: Re: [PULL 26/38] linux-user: Don't assume 0 is not a valid host
 timer_t value
To: Jon Alduan <jon.alduan@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Sept 2022 at 09:23, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hello Laurent, hello Peter,
>
> I see the Maximum number of active timers ist still 32. I hope it is not too late, but for my application this is not enough. Could this define be bigger i.e. 32*4?

This is a separate issue from the "0 ID values" bug -- the
limit defined in QEMU has always been 32, and this patch
doesn't change that.

There's no particular reason why we shouldn't raise the
limit, though. If you file a bug we're less likely to forget
about it.

thanks
-- PMM

