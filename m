Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C831041F14E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:32:42 +0200 (CEST)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKWf-0004pg-Rk
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKVR-0003yP-En
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:31:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKVP-0005bd-Ku
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:31:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id a18so4019018wru.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3L5gb9aE7S+CfMi+IpBC0FIGTs1KVQSPrK1gpdia9ao=;
 b=cr1USAiULL3OiO65R1Fdd/+qqCLjmI/ZSHCq5jDpKtuyPDxXIVD3c7PeVWhnQU3pdD
 J8jz2xHLvtHzFO2FUAvDjVKgnawV9ew1N76O9FzO9d8u2HehP5Nci54enVC7TBuNqbGv
 xK/QAZMXGxSGNeJYSHwEnIBRu2MgMc9Ju2kQ4wlaiKHmVM2KTycTALcqYPds68Cf2HNO
 uMG5WiX7o154GBMvtWHWmvB+NWmOcACvXk6YgJEgekjLZbYCiZEbE8UUQJSdCKLLaS/H
 lseuk7o3RjKe3VPrk0oh+uZDyNqInW47SUahG2qaLGbFSYVoC0pLJ3HV01Tjd0AiSpno
 eshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3L5gb9aE7S+CfMi+IpBC0FIGTs1KVQSPrK1gpdia9ao=;
 b=LmCWv8JwwFqb9bLP3AQua7kS8d5XbxYZV1mIFez2qlWW44dc3jzgQOVSJjMVFKIw4W
 D+tKaGRyO+v7Pju7dlT0kNEXYOh+yvPxL27xoRZVIDbqwRhBgUN+OeFsig/qVYoFKsBo
 RhZpFn2wcECjE9WCGlITKkMkib0LJkQ8dATSVJGJzvjYJDMt10RwUhrC4uKjEXzKoGQV
 o8iXunR0TrA7FgunCnxdW+wNpNTE+KM4DJutlnAIYcktGrecD3C3fzCOnYgMrl8Sfgda
 R22YocFklq1wdvU1CK/ktgdi5fZQNUHWEpxfOe7YocCPUhxnkyP+rmCgVoVswT+a7gIS
 R9yQ==
X-Gm-Message-State: AOAM530Vb2uW7I9q9j9WasSp6ODE//k4/yhwown6j4JfxZUoaAntwcpP
 a5gVxeONuMSExp/tPC2ICmMyKQ==
X-Google-Smtp-Source: ABdhPJzKNoaQkgtArwzLZ74nt8UQOKRvN0xm9dLZ0y48gwXf224Zo3MMoqcoB9sZPAdDayBqojSiVg==
X-Received: by 2002:adf:f486:: with SMTP id l6mr12600282wro.375.1633102280980; 
 Fri, 01 Oct 2021 08:31:20 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k17sm8236397wmj.0.2021.10.01.08.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:31:20 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:30:58 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 01/10] hw/acpi: Add VIOT table
Message-ID: <YVcpsgmtNIhY22qJ@myrica>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-2-jean-philippe@linaro.org>
 <20210920100609.301b6be2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920100609.301b6be2@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 20, 2021 at 10:06:09AM +0200, Igor Mammedov wrote:
> > +/*
> > + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> > + * endpoints.
> 
> We usually put a pointer to spec/revision and chapter in it
> that describes being implemented table, so reviewer would
> have a reference to compare code with. Otherwise I have no
> idea if implementation is correct or not.

The 6.5 ACPI specification isn't out yet unfortunately, so I can't put any
reference at the moment. I don't know when it will be published. The draft
specification is here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
But that's only temporary. I can make a note to add the pointers once the
spec is out.

The acpica implementation could also be used for cross-reference:
https://github.com/acpica/acpica/commit/fc4e33319c1ee08f20f5c44853dd8426643f6dfd

Thanks,
Jean

> 
> ex: build_hmat_mpda
> 
> the same applies to viot_host_bridges
> 

