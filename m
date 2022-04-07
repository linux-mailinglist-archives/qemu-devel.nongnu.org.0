Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CC4F7C5D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 12:07:06 +0200 (CEST)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncP2e-0005mR-KL
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 06:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncOzG-0004sk-4K
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 06:03:34 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:34139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncOzA-0005WS-PF
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 06:03:33 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2db2add4516so56106147b3.1
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d24atL9hj9V0U5q9epBivFWuqvOpJzUdZLF2FPrxjGM=;
 b=vct3iid4d3D3vRdhD1toskpk1LuxOLU0eIZIJU1w4eVIXFkZAdDfk7S3FeW8zuHRqT
 X5pcjZJo3ybwKIoqTOiOie4ok5//6I1aOxgr7WkrOdp3GFPcYkort2sHB1tkh9/A/nHU
 o/cSFOJQcfoCnMDlvxE/KOofCDlDyaTMVRxS9wNsCRw52gX6LvgQCszA4z1q7dVbTQhB
 1OY5gMY+vedsW+cotzBFw3Yr9EOUq+Nva4+aK9DkOzHBWSWXYRoj/NYEWkYsWSmhr+a9
 YEuB3RJNPpkTuj77pirzVPqNaxiAEM3OasbLWYV0QBoPNtVxfAN/F7/sUA0mkgKKikaR
 AGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d24atL9hj9V0U5q9epBivFWuqvOpJzUdZLF2FPrxjGM=;
 b=tHk7OuJl8zjDe0Y75NkH3rw3PmIpV4/9qz99jTwuCTcU8eWoz0XL7WRlMzn3Q0sEEJ
 L9NpXxfPB52+2azd8TPbWBIy6KzZepCXGSQEFWGytU/WbJjY0GAbP5DyzEK1bLmiGU7Q
 B6IHhTFtUGg/qpc1SgI6ZeN3G7a86LanS5mnG+QBPvhKmnc4p4J81wiYjGMpXuq/ZOMc
 35C9etmx1kPJSwcPlwsIYNw89ZZJ6NBTuzgGnLTbN8lxr5mRGVw9SRGOqjSdVGAg5gFW
 oc1iTwQgS2mmFZWVib5bkf8IHh6YxJ5n9zkt+a790dAMqX6z27SWLoY/yzPfdvHnYDKR
 DBmg==
X-Gm-Message-State: AOAM531MLaaq6pngQrfUkW1tSDiaf/jfUG/JhWjTF3TNwWxAKT5tz6No
 10nhEPGNmBjh/zee2SW6Dc4WEM8Zb5aFsE/dDCjb/Q==
X-Google-Smtp-Source: ABdhPJx+hSTSr5YrBOgqDOaQAHmlrAcVcrt722YgZDFy+gvnhrabshEOX3cRuWgzeXW667V8NNlgYgvICajsYvrJvGA=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr11211639ywf.469.1649325807813; Thu, 07
 Apr 2022 03:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220407095047.50371-1-mst@redhat.com>
In-Reply-To: <20220407095047.50371-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2022 11:03:16 +0100
Message-ID: <CAFEAcA8upf6nA8dUPeAyY_Q-F_oscqZonPGCKT2OUZORcX4FuQ@mail.gmail.com>
Subject: Re: [PATCH for-7.0] virtio-iommu: use-after-free fix
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 Wentao Liang <Wentao_Liang_g@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Apr 2022 at 10:52, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Wentao Liang <Wentao_Liang_g@163.com>
>
> A potential Use-after-free was reported in virtio_iommu_handle_command
> when using virtio-iommu:
>
> > I find a potential Use-after-free in QEMU 6.2.0, which is in
> > virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).

So, this isn't a regression. Do you think it's critically necessary
it goes in 7.0, or is it in the category "put it into 7.0 if we
need an rc4 for some other reason anyway" ?

(I have a feeling we'll need an rc4, but we'll see.)

thanks
-- PMM

