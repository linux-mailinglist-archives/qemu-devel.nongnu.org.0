Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B1570320
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:45:05 +0200 (CEST)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsme-0001tl-Jp
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAsjy-00066Z-C5
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAsjw-0001Dr-0T
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657543334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqY+qeMbiLEYSU0V788jg056NIhaRxmCH4CLCGWLDtw=;
 b=MEcDYXczB4CwIbQ+/vn+2xhulAdvG9CmZCXdH9Ih6wlau+CRbbPpzj+AOPuauSskwM+q3o
 yBQbYs79t3SGN2teCq7lXB2ljCR2D/RRS+mCQQkcvYP5iWmcr+vNu2P9pXFERMNg8iy75M
 SGjjF8nk7OVuF9NkP2LxDJbClQGtjo8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-g1aSCb2PPzSPBRgFstOgKg-1; Mon, 11 Jul 2022 08:42:13 -0400
X-MC-Unique: g1aSCb2PPzSPBRgFstOgKg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g7-20020a056402424700b0043ac55ccf15so3242957edb.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqY+qeMbiLEYSU0V788jg056NIhaRxmCH4CLCGWLDtw=;
 b=uFa/yD9qcd9qrklfO8LgQu42BQVYvWoGsWr1Yn6rYXzz10lGlTomHQyqgTxPJSNh+R
 /prlHNC35TEqeOTmBSmi3Uwpxye23OhtLZ/09lxR0xp9gg2foCaOWfaB35Zq9+Fy1mIU
 D4O8zEOBJD9ttmsf1ZhckPMhW61PnMGKJBJC6Z/pPwLfxoYJJrfvfWG604qVUbDI7sA9
 1kNakG4fzGHWtIU8mEyPkpwDkfJnVQc+1S9cAZeDCiKrPTgmoXdICmZLFoK/QSqDIsin
 LrBgQmLq0zemNtbCsuRw/HLnKPqGm1K35n5IqU7P6GH6b28vZuMCgLYwwkY26vNu2SL6
 QGGQ==
X-Gm-Message-State: AJIora80LBPec+woBEESFTnpWVADf2vo5af0BYkv9Biwyk7sundbq5T4
 17mwKotdjG65Z1FdJ8TcDJhWvY9vbP28jdqcMkw7hVwhHXD6BACYZ22hBVybWgTwAvJFgaltDJn
 iJyBnHnsTRn7k0LPIfbtBPmz1DscbRGqLAQ0ogVyxAUisN8MQnqdtaxw9pPMylPhWJgU=
X-Received: by 2002:a17:907:2c57:b0:72b:32a8:7afc with SMTP id
 hf23-20020a1709072c5700b0072b32a87afcmr14165169ejc.129.1657543332354; 
 Mon, 11 Jul 2022 05:42:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfHW1VSTeuhuXSR5RAEEuwY+J6bsciPsPo9h7bLZtgDmFWVTGiCkazjsRUIKv0K1x5ohMDyA==
X-Received: by 2002:a17:907:2c57:b0:72b:32a8:7afc with SMTP id
 hf23-20020a1709072c5700b0072b32a87afcmr14165142ejc.129.1657543332081; 
 Mon, 11 Jul 2022 05:42:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090630c400b006fe0abb00f0sm2627066ejb.209.2022.07.11.05.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 05:42:11 -0700 (PDT)
Date: Mon, 11 Jul 2022 14:42:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron via <qemu-devel@nongnu.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, "Ben Widawsky"
 <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] hw/cxl, hw/machine, hw/i386: Misc minor fixes /
 cleanup
Message-ID: <20220711144210.567505a9@redhat.com>
In-Reply-To: <20220701132300.2264-1-Jonathan.Cameron@huawei.com>
References: <20220701132300.2264-1-Jonathan.Cameron@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 1 Jul 2022 14:22:57 +0100
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> Three more or less less unrelated fixes for recently added CXL code.
> 
> Jonathan Cameron (3):
>   hw/machine: Clear out left over CXL related pointer from move of state
>     handling to machines.
>   hw/i386/pc: Always place CXL Memory Regions after device_memory
>   hw/cxl: Fix size of constant in interleave granularity function.
> 
>  hw/i386/pc.c                   | 6 ++----
>  include/hw/boards.h            | 1 -
>  include/hw/cxl/cxl_component.h | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 

For whole series:
Acked-by: Igor Mammedov <imammedo@redhat.com>


