Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4FB445017
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 09:21:50 +0100 (CET)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miY0K-0000sp-V3
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 04:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1miXzF-00007F-OL
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:20:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1miXzE-0001Lg-3X
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:20:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i5so7331592wrb.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 01:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p7GvVhZgPZh+9KfobnLVQx/x6DC6ilhThqFY7t2CExY=;
 b=d28Gt4FoXFW4GrowjD1d2x6mi11jzo4+6kZ28H37mbqvQAexC7rV1ktO/fpMvvmfS5
 yKKTQv4Sf17wsEvw1iI2EqKYf2CDoaiyFRkyiM1mTHkDc9elTI3QlxD0WNb9pZFMB/S6
 UU9wQJHUGqS5WE+Xfdv+leuPJfGmRDJhYsqxOMw1Lg7C4uI0appKWeuayAtGEcB2a2zC
 uwbOfCj2YRvZV8CABMvZdzz7ORnpf0YDel7FAakorubmjekugT3BIwItCqrX4TAtZZ5y
 lWp/oseonzOZlvgfRpvBrhWolhdARDktIagKaHQJq38eXr3RJHUFqNcOMbclGC3bdSIy
 sCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p7GvVhZgPZh+9KfobnLVQx/x6DC6ilhThqFY7t2CExY=;
 b=RgNVIg0iy8xKD/2ipIgU1IClgggEz1jl2STgWz1OdKYTP7d2fviL5cO/fRcQVfXaK1
 0N8kn/vEKhRhMYhhaebOQVWJR/uEIrd8cpAJwsIzNaqLoElFlzUwOV4N7eqJ45aEVnZA
 ty58UdKvJjtIePcslOmzEzChjACHB5Jn2Cux31xpJot+Ebg5QdSv1YTVATSrK5fEKhkn
 6S1uEh+2UT4Jyu1CPykzO/drMqv2Euq49UA7KPYl5ifBzf2AXdlbhXfoJnROGFL+ni/v
 qRKNhGzQ92i4LaA3aPyFTCNi2nSus0k5zGFLyjdlWqbiFio8hSf+S0LBYBYis7sUFDRh
 DuxQ==
X-Gm-Message-State: AOAM531hUY35i0iE5tNZc2Dsx4GAxDRpVHtyB6Bu92Ax+xKDimtFMS5F
 ZNyGGyDm6JDIYEFDlO1OTTd7Tw==
X-Google-Smtp-Source: ABdhPJzY2+Z1/LNZl7Nj9Ja+a5daMBy1kWF4Pzj809dQfX7kdwfZgP9a3TBzms2pXQVz9JmrxoJqFA==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr18387925wri.321.1636014038414; 
 Thu, 04 Nov 2021 01:20:38 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f24sm4134971wmb.33.2021.11.04.01.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 01:20:37 -0700 (PDT)
Date: Thu, 4 Nov 2021 08:20:16 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v6 6/7] tests/acpi: add test case for VIOT on q35 machine
Message-ID: <YYOXwMw1TERY41LT@myrica>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
 <20211026182024.2642038-7-jean-philippe@linaro.org>
 <20211101193358-mutt-send-email-mst@kernel.org>
 <YYOQkbtkfIgfYltF@myrica>
 <20211104035525-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104035525-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
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

On Thu, Nov 04, 2021 at 03:56:38AM -0400, Michael S. Tsirkin wrote:
> On Thu, Nov 04, 2021 at 07:49:37AM +0000, Jean-Philippe Brucker wrote:
> > Hi Michael,
> > 
> > On Mon, Nov 01, 2021 at 07:35:04PM -0400, Michael S. Tsirkin wrote:
> > > On Tue, Oct 26, 2021 at 07:20:25PM +0100, Jean-Philippe Brucker wrote:
> > > > Add a test case for VIOT on the q35 machine. To test complex topologies
> > > > it has two PCIe buses that bypass the IOMMU (and are therefore not
> > > > described by VIOT), and two buses that are translated by virtio-iommu.
> > > > 
> > > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > 
> > > seems to need the bypass property patch
> > > 
> > > qemu-system-x86_64: Property 'pc-q35-6.2-machine.default-bus-bypass-iommu' not found
> > > 
> > > given Paolo decided to pick that one up, pls ping me
> > > once that one is merged.
> > 
> > That patch has now been merged
> > 
> > Thanks,
> > Jean
> 
> Right but OTOH we are in freeze now. Will try to keep it queued,
> but it'd be nice if you can repost it after the release.

Sure no problem, I'll resend 

Thanks,
Jean

