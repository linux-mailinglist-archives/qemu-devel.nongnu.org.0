Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E204037F4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:36:04 +0200 (CEST)
Received: from localhost ([::1]:42840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuvy-0002Oa-LK
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuYx-0006GS-4p
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:12:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuYu-0000T4-I9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:12:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m9so2465136wrb.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hglgwo8uVM8lqoCwpiy6NiQvi4JgQ4hmiTtQcuXFvHk=;
 b=oo8pq7rh9zryaxLIo3RZpb65QOG1R8APYdxdei104LR01ZsCCLK2ypVK6lTcXEDk65
 gjv71Uf8Mwgef0EOkA0u/VMcL9pqhIQ60Zt2iBKtnYOku9I3i619jVsiyvT1FkM8NmHm
 OMWafMCJ5pfCYuDn4rIsnzlL8bXsAaylvSxBL5hFcZQEcLvR0dlzmInYw8fXUukESdLM
 +acfVOzclTTUh2GI/bzc3r2OAQhI5dyhxSTPJcUpk92U12EVjA9Dqwimd+8L8Su0Kphh
 gQxQqQzii7buka5qhNPkSxm5KU91YFdvQfOL9XjnCFSFVfihgHDDLqyhyHfNugPpNlQL
 9W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hglgwo8uVM8lqoCwpiy6NiQvi4JgQ4hmiTtQcuXFvHk=;
 b=LOQU3NnEtFCsI8/Awzm/evwkSd8NCUbzAkNm96Rfz+QyzU93m6ZHDvtg0jILB/8hFG
 tLCgZeOJl+o9/Phcf0JXkCEJZw2MRPjDYB530E/bBhQQHx/iSwV0E7YwYrtqOuQo15p3
 YJ8QumooVIpT+8V4giHqPyPROh6LjkTQ91rDBOmjF5Wo4Riyg5e6umHcXlZYHY+GytYW
 SHTxDpU30Jlz1sES/5vo8rzYiCi8YIxAXk6vZSoUmSXL0YcIK3tbqaEochWX+qzIjHK/
 UzHQwakQO6JGiGyEokFzMC8mn1YgQxlGrElHqlMCjApiRsHxDB0m6Rg0dqe1oGwSoq2m
 BHkw==
X-Gm-Message-State: AOAM533JkN3KdMCNtTyp6hmmyD0TMfISC2GDE42hTLRcUKHJrVIs2LFt
 jFwZHZWN2QcnI3SZKY4ioXpgYQ==
X-Google-Smtp-Source: ABdhPJyUJYW9/RSAZ1fm1ZyfUy+jXCuxHhvMq3iNpgE7W34XQEHO8Ak6m3sSoFq/HmqDNgPyLTa58A==
X-Received: by 2002:a5d:4f88:: with SMTP id d8mr2678252wru.358.1631095930992; 
 Wed, 08 Sep 2021 03:12:10 -0700 (PDT)
Received: from larix (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f17sm1921439wrt.63.2021.09.08.03.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:12:10 -0700 (PDT)
Date: Wed, 8 Sep 2021 11:14:20 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 8/8] docs: Add '-device virtio-iommu' entry
Message-ID: <YTiM/G37Lwi0MWSa@larix>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-9-jean-philippe@linaro.org>
 <YTYpiPYaRJHmCmsK@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTYpiPYaRJHmCmsK@redhat.com>
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 03:45:28PM +0100, Daniel P. Berrangé wrote:
> On Fri, Sep 03, 2021 at 04:32:09PM +0200, Jean-Philippe Brucker wrote:
> > Document the virtio-iommu device for qemu-system-x86_64. In particular
> > note the lack of interrupt remapping, which may be an important
> > limitation on x86.
> > 
> > Suggested-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  qemu-options.hx | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 83aa59a920..9a1906a748 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -976,6 +976,9 @@ SRST
> >      Please also refer to the wiki page for general scenarios of VT-d
> >      emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
> >  
> > +``-device virtio-iommu``
> > +    Enable a paravirtual IOMMU, that manages DMA isolation and remapping
> > +    for all PCI devices, but does not support interrupt remapping.
> 
> It would be desirable to document why this is better/worse/equiv to
> the intel-iommu device documented just before, so that people have a
> better idea of which they should be trying to use.
> 
> I'm going to assume intel-iommu is more likely to "just work" out of
> the box since it models real hardware that OS are likely to already
> support ?  Is that right though ?

That's right, and there isn't much point in using virtio-iommu on q35 at
the moment, we're still laying the foundation. It only implements caching
mode for now so it complements the vSMMU on arm which doesn't have that,
but on x86 QEMU it doesn't add anything useful. There are extensions to
get better performance for different type of endpoint, and other features,
but those are all work in progress.

I thinks I'll just drop the documentation patch until the device is more
mature and I have something useful to write here. The other IOMMUs are not
described either at the moment. x86 users will just instantiate the
intel-iommu as usual if they need an IOMMU.

Thanks,
Jean

