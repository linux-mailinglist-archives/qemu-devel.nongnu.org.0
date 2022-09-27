Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0315EC528
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:58:34 +0200 (CEST)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odB6X-0001dU-FR
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od9LT-00085t-8X
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:05:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od9LR-0000Fm-Oo
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:05:50 -0400
Received: by mail-ej1-x62d.google.com with SMTP id lh5so20177440ejb.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=Rz4kMLLz42YPqUOuRBmQh7Nj8cYzXnrKuPJCGwNeb5I=;
 b=qTQiHp40o1Srjuc+S3W1bq9/Pvg5K+F4HBeiUmnXmcmkbaOxhbYRjBpZOPpA+FaH1b
 vmakaAYDwcW7XMWSMjirUVn112b5E2xScleRF0BECfd4TJNqRvhgmL0qNkROl8G8cKfZ
 ks42w1u3pM+4qwbpOcU+dsp63VI9Ww7NliMs5UfFkiOQVYne2mEiPkJkmSCLnHHtQBaM
 bPRqSKINtJFJGa5vdsKgVobvgJtJGFXh0un5LpZ2h1mUHVJ/yrHPhAdHwxMLFeV3LH5X
 XnomAVcg8drJlBx7mzDZaGF7rQ80AE/q37jQfzazss0tjZOxeKeS2SUQk9cGcPTPcK7l
 JXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=Rz4kMLLz42YPqUOuRBmQh7Nj8cYzXnrKuPJCGwNeb5I=;
 b=tT3N+5zjt/vMKYtLbUHDsI/LU07ehjrswdNMtq6sy28etNzMnSxQov9J7RwwiaxsX8
 cIEK04RDS66AFWasY2yNYGOyyeFKhEYoeIcQ5B8ahxoVJCOZdoO5i4AY97yjhlq7m6xj
 Gd8U1JzAnoRllY9uHWc+WjLe1GuTeIHdlg/IFQsCYzRUVMNyO/hCwh7x5N1rCkvm/fF5
 OJmP9nGynUvAZ2VHLAnfP0PBLtwxH9aVB1Px3phmxS1uLLcQKvSBc4DA6grt3NSGCvjy
 NW9/hVSXfy6q/6sjUWwlzOXJUDRv9yklkrsYL6f5y1kXxrAprpHrq0AFo6PtQNJt5tGi
 g8FA==
X-Gm-Message-State: ACrzQf1qgURI8L/LnmBA6Zw/9VkfNPNGLbABfSsc+w47Mmu/EqGEHXg5
 TiWuLbEZDFGr9FEjpWfT6py209X8inuuK+yyDLkeFXxXPcM=
X-Google-Smtp-Source: AMsMyM69NNSxmFeHTP36eX0qZfSV6eOk9Ma8SvPwk0XbO9+8+zLXSXH6O8Ww7qbuyXVQ/i+7DP/25T6mdk+F61snerM=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr21762211ejb.609.1664280346966; Tue, 27
 Sep 2022 05:05:46 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 13:05:36 +0100
Message-ID: <CAFEAcA9dcDNw6QvKSs8BZgjzueEPi0v6R5LAPpsiJU3J_p=AXw@mail.gmail.com>
Subject: missing entries from docs/specs/pci-ids.txt ?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

I noticed today that docs/specs/pci-ids.txt doesn't have
an entry for the virtio-iommu, which is defined in pci.h as

#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014

There seem to be a few other virtio ID values defined in the
header but not in the txt file too -- do we need to update it?

Conversely, none of the "modern" ID values in the txt file seem
to have a #define. I suspect I'm missing something about how
this works.

thanks
-- PMM

