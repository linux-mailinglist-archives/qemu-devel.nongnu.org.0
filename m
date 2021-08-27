Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4AB3F9A18
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:29:19 +0200 (CEST)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJbv0-0005Rn-0A
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbtM-0003Gw-1A
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:27:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbtJ-0002Qe-Iw
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:27:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g18so2885246wrc.11
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=POEFUeFioQ7JoFGEtl1GkseydLm0FVw36z+WlrQ3akQ=;
 b=pMTbfJd4On+FCelVlFI2OWcUwkJg13Q1bfX2ARb1V7ViDKtb49p+LPvKBqdeXakqln
 oCtQRMMIZE1ev+Y8DqoF5haAQOL86TfChzX9AebMrDgPaypd9ok/3Re6wfGeQJLfHw6Y
 /LGZDk53GTVeBe6Vz1kQbJ8mL73raZrL0ylCdOPyslVjZxp6VoGNzSPi0Sq/nRxFglsN
 ALJPsLF6M3qPRgN3I66CYq/JaMOA2twfj+lp37gY6VIsupJeWqMlcYVJqqdDhcGY0mGv
 uO417eO1GgYyoEQbzqs3bR1/j/XXCjdUq2jOX7vGm3bvtVp9K2/tbAxnZTfVrSHu4pcl
 BAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=POEFUeFioQ7JoFGEtl1GkseydLm0FVw36z+WlrQ3akQ=;
 b=iL6bxUhFPGjdGEADH32J2qRsjRwltNyR/zJfDkZFUAAWNiUcF5NIj1cTLyMotGyJU4
 GZuqY4RZkvlTP8COLSC/IqA9lRNh1ZgcauaqVs0YV77yIoXkXUxNFCeQFum/8S45e8Ny
 Sdk+Tl2wqBtBFp7FxaHX/N1jqj5Pmb2UwHAgH6D3aFeAGD0lohZe9G17g/uWRdYkeQbS
 yOBWSAqoDvMZGlTRBMm+GRDikOYF4Sxz6uGjDI0lXdFKmdhJZV/z8hKCZ9JyuDFVNtwz
 JkA/qZj6grTU8cXqc9/jgxcTTeT1hrlTP+LAqoxkdI26mTtksGyBOxm4+IIsM+riDaA7
 L07w==
X-Gm-Message-State: AOAM533bjA0yNtu0W7wOoBR4uEoF/T9ZG3x6yoSbEz2yVfvcE3ES1VBR
 Yory5djJN1F0Qy9yQw+77FZnIA==
X-Google-Smtp-Source: ABdhPJwixoSFeS8ocntxlyA7Mb/x4/DUSs7u0nltOtrrVS18vES/WzLsp2pL0R1CfAmfvxunfsVwfg==
X-Received: by 2002:adf:ba08:: with SMTP id o8mr10377103wrg.234.1630070848191; 
 Fri, 27 Aug 2021 06:27:28 -0700 (PDT)
Received: from larix (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id r16sm1847029wrg.71.2021.08.27.06.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:27:27 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:29:38 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/6] hw/acpi: Add VIOT table
Message-ID: <YSjowprPDKhy7CGh@larix>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-3-jean-philippe@linaro.org>
 <20210810112227.05bfbd9b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810112227.05bfbd9b@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 11:22:27AM +0200, Igor Mammedov wrote:
> On Tue, 10 Aug 2021 10:45:02 +0200
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > Add a function that generates a Virtual I/O Translation table (VIOT),
> > describing the topology of paravirtual IOMMUs. The table is created when
> > instantiating a virtio-iommu device. It contains a virtio-iommu node and
> > PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> > node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> > machine option and "bypass_iommu" PXB option, only buses that do not
> > bypass the IOMMU are described by PCI Range nodes.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> 
> using packed structures for composing ACPI tables is discouraged,
> pls use build_append_int_noprefix() API instead. You can look at
> build_amd_iommu() as an example.
> 
> PS:
> Also note field comments format.
> /it should be verbatim copy of entry name from respective table in spec/

Got it, I'll switch to build_append_int_noprefix()

Thanks,
Jean


