Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0429D444FD5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:51:55 +0100 (CET)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miXXN-0000xM-K9
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1miXVb-0008IA-OD
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:50:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1miXVa-0003i0-3R
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:50:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d27so7199915wrb.6
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 00:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yEUckQKicv+3a7lPS1pZxsHWJxH1FV0YFPg8vzrxM4k=;
 b=bFL3QLnfJDidC/HkWUnF/J8Hbgg2OhhG6QqoYOX26OGsU5cOEZA43kR8hP+H42RTiD
 WnkidR/hX80ycOgXkBDv8vkKiTp+rJSFspArrElJxEc64MWGIN1SSroLsE/PEzZCi06o
 CGWMX8wQQiQ1a7VPMqfsdezFYLQbOI81dUaaeutcvFxNUzhQW2jrAd9iFfEFpK6pvrCn
 wVZbjLev6hxHnNfwntcEVo4BVx8ZhArg9/nBvUw4q034xgj3ZPtiQ7kLhfojwbXLMrUy
 18mZ4jUYxewy7fuUZB6z6eQe64tuJIxY67LJkLlA7ZhGL40ko67tCi2QAOXVR1PTkj60
 lvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yEUckQKicv+3a7lPS1pZxsHWJxH1FV0YFPg8vzrxM4k=;
 b=RVocdCKJj2bFCWVFDKArnDGitJA0qCGHRPz2qpaxeUxDunD+XxvQYXoX8XIPHFZ/xs
 vCYqb4IiLZ1wvf+k852GDUgdTr1H2ZMQUKsZU/ePxaT5T8GUNTFfdxUaFXqnKG0ny5Tg
 KtAphmofStVBAcHpPnqNclciexqGS8f3wnHRYAb8OF4U9Mf93WOe2zbvwM8GrAw78ux0
 1xv4UvaWRFGaM1hmj153ldl4pWGGxdeeMU9uGaa/IpiobKEo348YZ99cjjtkCQnNK7Ki
 xumgyhCicAwH9KLp/c/kiW554JatOkGzzz2DeZqzzTPQfcxkLoYwVSql7Qptht/9usNB
 wRMA==
X-Gm-Message-State: AOAM533ArHXFuUhPjI0Stx54jY8jRhTFvDxtDZEBBl8A5Pfqh6ZodGr8
 A5hqNHQEOaz4a14K+Z6rsk+iVQ==
X-Google-Smtp-Source: ABdhPJylrHlsjKcwx7qLRTg0gyM6ttLZ40AFe4JgWIy1LQkOm2Dyw434zzn0d8RJmp4AwuI+PdD5nA==
X-Received: by 2002:adf:fc88:: with SMTP id g8mr33192315wrr.334.1636012199526; 
 Thu, 04 Nov 2021 00:49:59 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l5sm810573wrs.59.2021.11.04.00.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 00:49:58 -0700 (PDT)
Date: Thu, 4 Nov 2021 07:49:37 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v6 6/7] tests/acpi: add test case for VIOT on q35 machine
Message-ID: <YYOQkbtkfIgfYltF@myrica>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
 <20211026182024.2642038-7-jean-philippe@linaro.org>
 <20211101193358-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101193358-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, eric.auger@redhat.com,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Mon, Nov 01, 2021 at 07:35:04PM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 26, 2021 at 07:20:25PM +0100, Jean-Philippe Brucker wrote:
> > Add a test case for VIOT on the q35 machine. To test complex topologies
> > it has two PCIe buses that bypass the IOMMU (and are therefore not
> > described by VIOT), and two buses that are translated by virtio-iommu.
> > 
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> seems to need the bypass property patch
> 
> qemu-system-x86_64: Property 'pc-q35-6.2-machine.default-bus-bypass-iommu' not found
> 
> given Paolo decided to pick that one up, pls ping me
> once that one is merged.

That patch has now been merged

Thanks,
Jean


