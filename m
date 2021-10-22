Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A9437A3B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 17:43:09 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdwhH-0002ZZ-Vs
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 11:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdwfi-0001YU-2R
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:41:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdwfe-00026x-Gl
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:41:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 62-20020a1c0241000000b0032ca21cffeeso1674057wmc.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1PZdL8GMTNxlY/SAqXEHFEtcGavyS8A598IJOB1TNRM=;
 b=xCtsgVNz3bT/9k3yOzDuCAnUmuCTYx+Om6Plm7erUmd1MRkfLPeL8zNtT54/RDGhmV
 hzUhFIe3czUEVCCD2Mcoi6I15FTvBrgQis3U28tHpzGvU+lMaoICMe/Gd+rn8uVjqlgm
 JoghaWL6+WYBLuz+zWP+maurxxUFJ3q9ydJwUKpVk3T6RLaBw2W+RGlc0LFDwbjEmBCL
 U8dZPyuYGJLY2Q56WnlwiP1AP7Ttiwxf+ja3mgPI3UQHaHz0FVtwPxzFW79mvWpYWrVX
 V27aFw+BwZxE3p6iqNS4QSuW0fK3KZrUB2+1ApX2Recy78PeTgTSprh/deeXgXwDoGqw
 nL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1PZdL8GMTNxlY/SAqXEHFEtcGavyS8A598IJOB1TNRM=;
 b=ClDZEE3IgLr1Xx/S6U8i2XxRv/SjbhDJqzW552IUHhIFI/QlMhLlrkLCEYj977mASV
 hk0Cp1PYdqzF8KIx7t6MFarKAkPbTSqR8cBdqk+ImZgMOIn4Fl/0b7LXk8PmPF61ErdK
 w1LdsXjECmmeMW+N1qR1e2Xpty7IKCqxxDRh3Srm8egP4k/vhpmIVk/9dl7ywh+o4tIS
 hOxhI4pKLgnOjMsPuFv+L9thGpt5NQqDCg24jKxHFZqNyTNDtDh3wd+mkxE4BRxJJeP3
 0jPVE1OWE1r6IMFwnOpNTPJTeZxv4p1rvUMcg/R9j9tcayCbmFzgS3my+sN8tw0/RyVu
 cHjA==
X-Gm-Message-State: AOAM531HcPaMgkJJHLhqi/gYONa3oMNbQ1+SOhJvFVExtlVdcjp+MHh0
 2OsJt5rWnYMWaibqGyW0VLn1MQ==
X-Google-Smtp-Source: ABdhPJycKuMc+scsDg2CDlfwEU0V8lBGjA1AebRJ8GLmtPg+Pi+X/7wtor1S24Ik/dhVh6DXuZFI5g==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr28839754wmq.164.1634917284745; 
 Fri, 22 Oct 2021 08:41:24 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id o194sm901237wme.40.2021.10.22.08.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 08:41:24 -0700 (PDT)
Date: Fri, 22 Oct 2021 16:41:02 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4] tests: qtest: Add virtio-iommu test
Message-ID: <YXLbjh9S6jmkQK97@myrica>
References: <20211019063755.917506-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019063755.917506-1-eric.auger@redhat.com>
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 08:37:55AM +0200, Eric Auger wrote:
> +static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtioIOMMU *v_iommu = obj;
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
> +    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
> +    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
> +    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
> +    printf("%s  domain_range_end = %d\n", __func__, domain_range_end);

Looks like a debug leftover

> +
> +    g_assert_cmpint(input_range_start, ==, 0);
> +    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
> +    g_assert_cmpint(domain_range_start, ==, 0);
> +    g_assert_cmpint(domain_range_end, ==, 32);
> +}

[...]
> +/* Test unmap scenari documented in the spec v0.12 */

Comment seems in the wrong place (also v0.12 was just to keep track during
development)

Apart from that it looks good to me. The mappings should normally be
aligned on the page granule, but as the device doesn't do alignment checks
the tests are not incorrect. I'll update them when adding the alignment
checks.

With the printf removed:

Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

