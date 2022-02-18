Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63B54BB45F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:38:22 +0100 (CET)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKymT-0001pp-OW
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyY2-0004M7-SR
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:23:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyXz-0001DC-6b
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645172601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32Lj8GPBFPBnPPn9bkRCpDMm8FrbXVxRFZookkbKKOo=;
 b=M7zxgAl417jkVWO9mD93WHCV+vvGEKr3mYaEjwKer2FYtBdnS9OLTsLTYutWLKFiEa7sCj
 VGhKASb6S0h+p6EGgjKmTXqo5Ster2ULRPOhObEffoJTsWCjqEieFvDYPujf9jvIv+7jUm
 9gmMOglZk+k7MlUOYbcEHZbB/wg5vVU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-ogiy2Qb6PgCH90Obrvezsw-1; Fri, 18 Feb 2022 03:23:20 -0500
X-MC-Unique: ogiy2Qb6PgCH90Obrvezsw-1
Received: by mail-ej1-f70.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so2699636ejd.8
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 00:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=32Lj8GPBFPBnPPn9bkRCpDMm8FrbXVxRFZookkbKKOo=;
 b=eqZtspjsT0vhOsfEngzIemPuRky9U+lssWqO2G4anU5JL9rHY3HHCVIEHCf1yRCxxj
 HObjbhPIqhQfFjkqvYos9MxCQwmKjxeV1/tXJn0jgoBKsFR3aQmlW1SgySzTjny5Lddl
 cCaRymyrpCuD3jUM3pJqwO2CJjBFnQOZ63GFVQ/EABAE3jmYGJI6Vhh+lUWcbq53VTJ8
 c/Rlw4OcNDI3Y56QlcUvBGx53e52+HAIw1doa7s5Xd0V1rojti4zc2o6D/m2nXkX25+W
 khkMwSvcWO8KF4ZieLwd0RgNj6f0mqsN/BxNfQRx4cut7biCcMWQrXYmxB2KvG697ROk
 y92A==
X-Gm-Message-State: AOAM5304NLvG/ByvQLc8yv8Gpe/Al3r3CcYkNTcEzb+cTSNJvdsNkUB9
 QksFo7gYoanPSUhqfZkFfculkTVHMw2XCGiZxdLQ44+Vf/M6bZS8yXo/TNusw12cY2KFC8N3Ruz
 uBOvlnRcIAIwrdyQ=
X-Received: by 2002:a17:906:2a97:b0:6b4:143f:37c6 with SMTP id
 l23-20020a1709062a9700b006b4143f37c6mr5608078eje.133.1645172598953; 
 Fri, 18 Feb 2022 00:23:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzta5BVrzofDQDwO8j37VMvN2oteyH6ifTP+k92MPgRTq2rwLwey4wDLgK3iZggi5nh+EIVSQ==
X-Received: by 2002:a17:906:2a97:b0:6b4:143f:37c6 with SMTP id
 l23-20020a1709062a9700b006b4143f37c6mr5608058eje.133.1645172598642; 
 Fri, 18 Feb 2022 00:23:18 -0800 (PST)
Received: from redhat.com ([2.55.156.211])
 by smtp.gmail.com with ESMTPSA id ed9sm4058902edb.59.2022.02.18.00.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 00:23:18 -0800 (PST)
Date: Fri, 18 Feb 2022 03:23:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20220218032252-mutt-send-email-mst@kernel.org>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:44:49PM +0100, Lukasz Maniak wrote:
> Changes since v4:
> - Added hello world example for SR-IOV to the docs
> - Moved AER initialization from nvme_init_ctrl to nvme_init_state
> - Fixed division by zero issue in calculation of vqfrt and vifrt
>   capabilities


BTW you should copy all reviewers on the cover letter.



> Knut Omang (2):
>   pcie: Add support for Single Root I/O Virtualization (SR/IOV)
>   pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt
> 
> Lukasz Maniak (4):
>   hw/nvme: Add support for SR-IOV
>   hw/nvme: Add support for Primary Controller Capabilities
>   hw/nvme: Add support for Secondary Controller List
>   docs: Add documentation for SR-IOV and Virtualization Enhancements
> 
> Łukasz Gieryk (9):
>   pcie: Add a helper to the SR/IOV API
>   pcie: Add 1.2 version token for the Power Management Capability
>   hw/nvme: Implement the Function Level Reset
>   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
>   hw/nvme: Remove reg_size variable and update BAR0 size calculation
>   hw/nvme: Calculate BAR attributes in a function
>   hw/nvme: Initialize capability structures for primary/secondary
>     controllers
>   hw/nvme: Add support for the Virtualization Management command
>   hw/nvme: Update the initalization place for the AER queue
> 
>  docs/pcie_sriov.txt          | 115 ++++++
>  docs/system/devices/nvme.rst |  82 +++++
>  hw/nvme/ctrl.c               | 674 ++++++++++++++++++++++++++++++++---
>  hw/nvme/ns.c                 |   2 +-
>  hw/nvme/nvme.h               |  55 ++-
>  hw/nvme/subsys.c             |  75 +++-
>  hw/nvme/trace-events         |   6 +
>  hw/pci/meson.build           |   1 +
>  hw/pci/pci.c                 | 100 ++++--
>  hw/pci/pcie.c                |   5 +
>  hw/pci/pcie_sriov.c          | 302 ++++++++++++++++
>  hw/pci/trace-events          |   5 +
>  include/block/nvme.h         |  65 ++++
>  include/hw/pci/pci.h         |  12 +-
>  include/hw/pci/pci_ids.h     |   1 +
>  include/hw/pci/pci_regs.h    |   1 +
>  include/hw/pci/pcie.h        |   6 +
>  include/hw/pci/pcie_sriov.h  |  77 ++++
>  include/qemu/typedefs.h      |   2 +
>  19 files changed, 1505 insertions(+), 81 deletions(-)
>  create mode 100644 docs/pcie_sriov.txt
>  create mode 100644 hw/pci/pcie_sriov.c
>  create mode 100644 include/hw/pci/pcie_sriov.h
> 
> -- 
> 2.25.1
> 
> 
> 


