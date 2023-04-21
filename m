Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF66EACCE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:26:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprhP-0003zd-H6; Fri, 21 Apr 2023 10:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pprhJ-0003z4-7V
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:25:13 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pprhH-0007OZ-ML
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:25:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-506767f97f8so2905613a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682087110; x=1684679110;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z6txIi5s2+ga0/q1c6UKJmPymniZcR6p4g5ZE167CiA=;
 b=oI8nyBxbJeKIfcWk2qkX7UVk7waxGYrvUXRab21eg9POogVr4QDerBwme24eFqm0q3
 MqKYggCZ0F6VjBVE6buA36aYVK41vXwKEyBJhE1kIu4zudR7JjfDr2RhshetbkTubPkM
 z1fF4lQBTEtiBzBtFg2GRqgIBx7Vs53nY/O20R87S20tqYQlOUUP1NJ6/5fnwg6nGBqh
 HXjcurML5iimf8h4yUbVNWegWiAaCytjiqYqZ6Yr9Jkgo4Bq0+K9iuKl+MB13AhyZHuQ
 7tWSCC7HaBHmgFcDOgJHVfZfKAh7p+PdZT/d7TJbWKb/flDWGHm8s5A3WEaygo4kCSmS
 6uEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087110; x=1684679110;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z6txIi5s2+ga0/q1c6UKJmPymniZcR6p4g5ZE167CiA=;
 b=k3ypNCJtuaCSYz30riFOtJIwKwmq5NbyEkMgVmcKAGG2qVMfgHW3GMzfV3oGaWmC4W
 OC4aVNhDSzWx410wGvDAwVn51sfG9Evcje4WMNHvR59aWV8MQrfWYHdU/jc4epGo7hQg
 alVhF/aUYRs6noviIHMT+6ilzyMxuzy9Y/niJzFXm18K2n9xYAwg0CjueLBkHIDExGFF
 sc5brh2PPp6NzAkZG8YXpdopbEaJDdC1PQpGgHXOs0yIzOJCdLE3onBCRwqGalcPfCUI
 rdnyE5uQZjKsU1OrCwzrt9tm9jRkLW84H/9UaX3sHLT6pVe3OlzcKoP7nPbLqhnYCI9W
 ysNQ==
X-Gm-Message-State: AAQBX9cju7nElu/HzndvF8rzXvJbo6l76Y/JC0Phn7AsgB5qhcvas+BV
 Mk9aE4/kVVFjsbNxeFOrjVmWobyKDvXExnays14LHw==
X-Google-Smtp-Source: AKy350a93y7dYhmVCn4W2MpYkZNRPvDQQaz5TttM2557Chkvsdku/fkCowXCIBu4SlpcHSTOLB/9sFF+x6SFMuBVTyw=
X-Received: by 2002:aa7:d9d0:0:b0:504:8014:1554 with SMTP id
 v16-20020aa7d9d0000000b0050480141554mr4175963eds.28.1682087110161; Fri, 21
 Apr 2023 07:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
 <20230420142750.6950-2-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230420142750.6950-2-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Apr 2023 15:24:59 +0100
Message-ID: <CAFEAcA_rMURTYjDLFXLdHXv-p7VC3XJ=Lg4ahofVciRJ4k3S-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/pci-bridge: pci_expander_bridge fix type in
 pxb_cxl_dev_reset()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Fan Ni <fan.ni@samsung.com>, 
 linuxarm@huawei.com, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 15:28, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Reproduce issue with
>
> configure --enable-qom-cast-debug ...
>
> qemu-system-x86_64 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0
>
>   hw/pci-bridge/pci_expander_bridge.c:54:PXB_DEV: Object 0x5570e0b1ada0 is not an instance of type pxb
>   Aborted
>
> The type conversion results in the right state structure, but PXB_DEV is
> not a parent of PXB_CXL_DEV hence the error. Rather than directly
> cleaning up the inheritance, this is the minimal fix which will be
> followed by the cleanup.
>
> Fixes: 154070eaf6 ("hw/pxb-cxl: Support passthrough HDM Decoders unless overridden")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> --

We should add:
Cc: qemu-stable@nongnu.org

so downstreams don't have to disable the QOM cast asserts.

-- PMM

