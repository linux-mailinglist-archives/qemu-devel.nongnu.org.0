Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DE5545E7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:57:23 +0200 (CEST)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3yz4-0004gN-KU
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o3yxl-0003up-HQ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 07:56:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1o3yxh-0000Zb-MU
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 07:56:00 -0400
Received: by mail-wm1-x32f.google.com with SMTP id a10so9080483wmj.5
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U5e7GvEv15GkUdahdUQkaX7HOO1N37RGN+0M2Lj82oE=;
 b=ywgAudJEjqfjZzTf/O2ha+HenwjBx599ZNLQaEGIaDVw+EF4J9yRsgmR/J4aGgBFKY
 BfPjXqWJ1IEWEpqTHx3vClzFdI1Yxt5lynpJZA+0SDAVVSbQvDin3kywkJhknpeztEqu
 y6B6ZB21CScU5LBBTLmf1Pnc0B83u4eHAPJpcvm0vPKp3OMxwfYVMncTaj1qeZHwurtY
 yK71wvRTjE1Rf0f8JEAmXpGUpa30A8DxD6D78IEFmKZZYA25u4qD751MJ210/Sqf1pz3
 j9zTR2O3SaN5/HnQAP8D+zKK0KUmPkC4GzPT+aJgeAf4/KKZ4/Oi+b42mGAWK6YWoAfS
 r7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U5e7GvEv15GkUdahdUQkaX7HOO1N37RGN+0M2Lj82oE=;
 b=VCf8qhoXekv3zYCSSH1CCXoUmbB/NypWkkT1ZZ1OawWthrPjDscQxAfnL4+6Cb+Oly
 0YHlt1ly+IhtoqFhGXRUmOILDFdSYjzt/MJyg5Jc1fS3Eu8hJycG7AuvhMS/eJc5E944
 G7XT6SQObrL0tSRgk4pNK5rK16x+gqWOyqB6v3LeKtFy0JLFVP05DTaR1bsmhXNV0KfC
 8UM8Rez4lW7TkHbr9cXyp6TApaH6PJb5Cn1eRvhN/rsPOPnoLl29db4pfJjiElAAikcD
 yr/OORxXm2ufRdqcIURVGtskW6ESODw+EFadA0rqoBdhUFtbRgSZownZAn669ACGF1jh
 NZ/w==
X-Gm-Message-State: AOAM530hPUItibM76fH1X0zMcaEPXSUsQ5Gj00wPu+x8HfnndkWEAas/
 gODM3RoICGX3SQha8GqEV/u72Q==
X-Google-Smtp-Source: ABdhPJzTb6TgPRAsPEHcaHS9tYlL4hKeQlfy49dbrV2Pmx05l9TdwXubBoezg0SIc6gNu2qEd57+8w==
X-Received: by 2002:a7b:c4cb:0:b0:39c:35b3:e8c1 with SMTP id
 g11-20020a7bc4cb000000b0039c35b3e8c1mr46153412wmk.183.1655898955117; 
 Wed, 22 Jun 2022 04:55:55 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b0039c4945c753sm24990889wmm.39.2022.06.22.04.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 04:55:54 -0700 (PDT)
Date: Wed, 22 Jun 2022 12:55:31 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Message-ID: <YrMDMzfXAiEgFU+d@myrica>
References: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
 <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

On Wed, Jun 22, 2022 at 12:20:45PM +0200, Eric Auger wrote:
> Hi,
> 
> On 6/17/22 08:20, Zhenzhong Duan wrote:
> > The structure of probe request doesn't include the tail, this leads
> > to a few field missed to be copied. Currently this isn't an issue as
> > those missed field belong to reserved field, just in case reserved
> > field will be used in the future.
> >
> > Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> nice catch.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> the spec is pretty confusing here though (virtio-v1.2-csd01.pdf) as it
> presents the struct as follows:
> 
> struct virtio_iommu_req_probe {
> struct virtio_iommu_req_head head;
> /* Device-readable */
> le32 endpoint;
> u8 reserved[64];
>
> /* Device-writable */
> u8 properties[probe_size];
> struct virtio_iommu_req_tail tail;
> };

Hm, which part is confusing?  Yes it's not valid C since probe_size is
defined dynamically ('probe_size' in the device config), but I thought it
would be nicer to show the whole request layout this way. Besides, at
least virtio-blk and virtio-scsi have similar variable-sized arrays in
their definitions

> 
> Adding Jean in the loop ...
> 
> Thanks!
> 
> Eric
> 
> 
> 
> 
> > ---
> >  v2: keep bugfix change and drop cleanup change
> >
> >  hw/virtio/virtio-iommu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > index 7c122ab95780..195f909620ab 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -708,7 +708,8 @@ static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
> >                                       uint8_t *buf)
> >  {
> >      struct virtio_iommu_req_probe req;
> > -    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
> > +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,
> > +                    sizeof(req) + sizeof(struct virtio_iommu_req_tail));

Not sure this is correct, because what we are doing here is reading the
device-readable part of the property from the request. That part is only
composed of fields 'head', 'endpoint' and 'reserved[64]' and its size is
indeed sizeof(struct virtio_iommu_req_probe).

The 'properties' and 'tail' fields shouldn't be read by the device here,
they are instead written later. It is virtio_iommu_handle_command() that
copies both of them into the request:

            output_size = s->config.probe_size + sizeof(tail);
            buf = g_malloc0(output_size);

            ptail = (struct virtio_iommu_req_tail *)
                        (buf + s->config.probe_size);
            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
	    // and virtio_iommu_probe() fills 'properties' as needed
	    ...

	// then copy the lot
        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
                          buf ? buf : &tail, output_size);

So I think the current code is correct, as all fields are accounted for

Thanks,
Jean

> >  
> >      return ret ? ret : virtio_iommu_probe(s, &req, buf);
> >  }
> 

