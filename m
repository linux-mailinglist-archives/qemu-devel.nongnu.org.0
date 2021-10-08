Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B092426D7E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:29:10 +0200 (CEST)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYro5-0003eZ-4z
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrmb-00012l-EO
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:27:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrmW-00079M-9y
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:27:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id e12so30967853wra.4
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XM92KNyY8ssiKhgafzShXuuJk+BtFgYt61/l12lThvs=;
 b=eskSE94d3+G8To9qWjp6BEBZ3NGhaaKC/cULyYhcej8RdQd3CG4ZVbUnkSiKO3vyR6
 jO8VhBeUTBUZuis/f2RU8Ai1ZRZnYozOiTkQEeNdDyPSh54IOXBF23847gglz/CcrmsJ
 x3/1LzQm3BnDgd3t6EL8S0HnTVnT0vkSWewz7w0E3LC3BB/5DhtFx3SqTEri5MP21F61
 y9D4/hZKz+fhDp3p78B6qBrguKAYbgzoQFyD9JJ/DpbnwbOGUzH40f8gXXcUKpTf9eK7
 IOCmoojdnETNf2/tXed844zhXiDhvsBx5XC6PtJMcKmoYIlO5VLF1j4EIGLNP088ABzM
 zUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XM92KNyY8ssiKhgafzShXuuJk+BtFgYt61/l12lThvs=;
 b=oWgyOryYf83DrCfJp1TLgggYoq8tBbRPGSvrQDETC3YFKVxSohwHpsrn9d0aK3LRPW
 DEO06FopakK/GY4X+uj7xrJ8jqn33tfgCfmwOChlkmHdfnOmhvWiEBWhCSkLJUbuWRw7
 uqTCDIe8onlm7js1BEDGtuAvJQc606w99BQ/Sif81e4O2rliJQPTn2cWsi9cVw51Owsh
 T5mOS0BuPp5VNpNdDQIy8b8TfNs11YxfZqSM8bmC7Dgd8Z87ZOyPCZrnubbcIydWYtYa
 K1iuR3qKgxg79aJmxE84jpt1pMQe1pfwf4pOgixta5cfJAIRh7PtnqaN5CQPy2xyywDt
 LPWQ==
X-Gm-Message-State: AOAM532ZQ/4YelAQqTEr7lflsvLGpM1VJso99ruMaQMdBwlJ+OQh8O/e
 hdr0zud65GMSV8cgE7Vls63EzA==
X-Google-Smtp-Source: ABdhPJzWQa6mrR7jBpZ0cGLjuVFunIReFlGd2F8HzjEaaUulZosEcNtgGDPaxnDvCRzkkipp//aSFA==
X-Received: by 2002:a1c:e901:: with SMTP id q1mr4047378wmc.185.1633706850928; 
 Fri, 08 Oct 2021 08:27:30 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l124sm12193068wml.8.2021.10.08.08.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:27:30 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:27:08 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
Message-ID: <YWBjTODTiGc/vTTU@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
 <alpine.DEB.2.22.394.2110051556270.820442@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110051556270.820442@anisinha-lenovo>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x433.google.com
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
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 03:57:17PM +0530, Ani Sinha wrote:
> 
> 
> On Fri, 1 Oct 2021, Jean-Philippe Brucker wrote:
> 
> > Add two test cases for VIOT, one on the q35 machine and the other on
> > virt. To test complex topologies the q35 test has two PCIe buses that
> > bypass the IOMMU (and are therefore not described by VIOT), and two
> > buses that are translated by virtio-iommu.
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> This might be a stupid question but what about virtio-mmio and single mmio
> cases? I see none of your tables has nodes for those and here too you do
> not add test cases for it.

No it's a good question, there is no support for either at the moment.
virtio-mmio based virtio-iommu is relatively easy to implement, just
requires a little more machine support. QEMU doesn't support putting MMIO
endpoints behind an IOMMU at the moment, and implementing that is more
complicated.

To test the Linux VIOT driver I did both prototypes, but I don't have a
compelling reason or time to upstream them at the moment
https://jpbrucker.net/git/qemu/log/?h=virtio-iommu/acpi-2021-06-02

Thanks,
Jean


