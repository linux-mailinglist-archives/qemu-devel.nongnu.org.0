Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A88437718
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 14:27:02 +0200 (CEST)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdtdV-0004zb-AA
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 08:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdtaT-0003s9-Mk
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:23:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdtaR-0001ZE-Qf
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 08:23:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2340339wmz.2
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 05:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wFfh5H6e/vJ4OfwEl75nAjmYHbuhvfRKyC6EF7EvdiM=;
 b=j+oxj35wDdzLTLAtvJ7ZuOpj3Iyb0KnYmXF3J994ibFYxfSrzYqL5syyjzReq+cDxt
 XlGxhmlIe63s51NBO3p1qqeYtx1a/MU/i+9lR9YuY1VrKhncu0cU9FIa+qXThdESyj9N
 WQ8cQA8VFq6G+LAxNMvYfE1opSKux1C7+WQXz6164xaDb2o++t5zwOydA525wIi8oHE0
 r2uHj0Vokicggtt5sFyMSy/M5ycSsAnTMQZYBwYV9nJlwiioDRJCiiVSjAQ/kvmPC3+g
 ZE0/amzDLSBY4cxJLZJTpCPOI378fAS8ZxfVuU0flOPu8HWTebSD/2XySrX6V/Ur0Zkn
 yEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wFfh5H6e/vJ4OfwEl75nAjmYHbuhvfRKyC6EF7EvdiM=;
 b=qA1yu/DXheLAeR+GJTGd369+un3/GnDuEcpEFD1K7EVfi9y5IRVPGXYY64mZPRTQ5Z
 Hi/t0sxuZPUl7z/o7358dkZ0HXegCR2bG9rkjuw2hmMKw3EeV7UvJiUEQxD5X7UuLQL9
 0s18+/kf8mUi/1sR4gutb7WdURTUM0hXYuDjbcXhVFQdVHmwEZQqLqNxaVWubpEoe4At
 hLGMZzsmgvDKNCxKKg8tqGAdZQ/55vz7FKorDgZOQyK2Az4/sEiwKoCIgEpp7kR11hFc
 rzQceQta/ldvGeAHkh7CDxk7U6ddG4eUr6A9C1siabfy0gUL/Lfj3PuUmNn7bo+Gv4Au
 za9A==
X-Gm-Message-State: AOAM531IPNACWFP4tQrWZLZ3wmwpChdkk1Ot7KtEdtqBg3peO19E1Pmh
 b4nMjPl1zRn85/sYH/v0lf2tZA==
X-Google-Smtp-Source: ABdhPJzfXRIQAjheLOaWtCRk+1gCGUhMfOHfNfsy7XmkqJgRophQ4+dYY5V85kRkPorjF/4TvJtUIw==
X-Received: by 2002:a7b:c38f:: with SMTP id s15mr10914482wmj.167.1634905428805; 
 Fri, 22 Oct 2021 05:23:48 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id z6sm10310739wmp.1.2021.10.22.05.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 05:23:48 -0700 (PDT)
Date: Fri, 22 Oct 2021 13:23:26 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: pbonzini@redhat.com, peter.maydell@linaro.org
Subject: Re: [RESEND PATCH 0/2] Fix machine parameter default_bus_bypass_iommu
Message-ID: <YXKtPsQ+55Dnm/7m@myrica>
References: <20211013160607.649990-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013160607.649990-1-jean-philippe@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, armbru@redhat.com, qemu-stable@nongnu.org,
 eauger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On Wed, Oct 13, 2021 at 05:06:06PM +0100, Jean-Philippe Brucker wrote:
> The machine option "default_bus_bypass_iommu" is broken since commit
> d8fb7d0969d5 ("vl: switch -M parsing to keyval"). Fix both machines that
> implement it.

Please could you take a look at these fixes?  Another patch adds a test
that uses default_bus_bypass_iommu [1], and is blocked by this.

Thanks,
Jean

[1] https://lore.kernel.org/qemu-devel/20211020172745.620101-11-jean-philippe@linaro.org/

> 
> Resending with Review and Tested tags, no other change since last
> posting:
> https://lore.kernel.org/qemu-devel/20210811085842.2511545-1-jean-philippe@linaro.org/
> 
> The fix was suggested by Paolo:
> https://lore.kernel.org/qemu-devel/6e233344-dd09-598f-082a-afe73d788b33@redhat.com/
> 
> Jean-Philippe Brucker (2):
>   hw/arm/virt: Rename default_bus_bypass_iommu
>   hw/i386: Rename default_bus_bypass_iommu
> 
>  hw/arm/virt.c | 4 ++--
>  hw/i386/pc.c  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> -- 
> 2.33.0
> 

