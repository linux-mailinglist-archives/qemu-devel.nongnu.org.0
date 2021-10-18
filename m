Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2D43141A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:07:29 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPYF-0003Yy-VH
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcPXM-0002kh-50
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:06:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcPXI-0003vy-25
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634551586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQBLt9psXnTRczxx3yHhpmFpuACghyAjvX3WKHHNPz4=;
 b=UFBR0US+YIVRZ8mF7FRpnDknZl2XynIRU/Z1nIlRyjATcUVRyEcqsoz6soQRQVLMgHXUYj
 pB4JNfBF8aiO7BcqpmBCdWFJTo4qSDPdqxU2D15cucYlNCeNF1moUWapn40CCnLnYCcRdh
 6CFUrV30TN7DzEHnHOp6N9FiqlFR110=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-4RN90fsLN621KJDTlxyJHQ-1; Mon, 18 Oct 2021 06:06:25 -0400
X-MC-Unique: 4RN90fsLN621KJDTlxyJHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l39-20020a05600c1d2700b0030dba1dc6eeso2706323wms.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KQBLt9psXnTRczxx3yHhpmFpuACghyAjvX3WKHHNPz4=;
 b=HSlUIfp5n7OXxYEhW+x11b/tX38szph8u64b4NA3ep6eoDwfV7I0yKyVkBig0zCD/T
 47/vC0Lw2dZJCJLFiqEitx5SxN9j0kR5jhAt0qqlWEVsDJWF4pMsti+jwd6uZSVhGje4
 BLcgcSAnu0P8o/tYccoHGHPYFq9aYIb83FIsfmIdtdNAPeHR/a+rSyAUKBjCaqFqExuX
 5ADJ+0UWAG6vGblACwoJz8OsZDlb3J7lpBMAIxJXkF7c6FvtDxTBC0NuGd3rXotsD1Ip
 iC+6Sk44W4Db9lhM/Cov709jkDtPfsbSx425tNX2pgS+xRnaPXY/8yquuCl8cK46/FXc
 HwBw==
X-Gm-Message-State: AOAM531S8mtB1A2vNYndNmlGxr7b+lUcLDy/fKVu6w/VbtY5PW8ecu1s
 kawTM1pMx3dpSt+qYMKaiXihbh/PhP76bcpKDdh93Y6KA2csGM9fi1z/8aw1liXf4CBBi2Y/27H
 TSmADxTBkWgUsdZU=
X-Received: by 2002:a05:6000:11:: with SMTP id
 h17mr34434640wrx.278.1634551584275; 
 Mon, 18 Oct 2021 03:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0JK587nc6rxEe2qnwyCX6jw8zu87+0Ds24OQOeGibLxQOA4Oh7DuW/bgE+AlQbl/s3sT89g==
X-Received: by 2002:a05:6000:11:: with SMTP id
 h17mr34434608wrx.278.1634551583971; 
 Mon, 18 Oct 2021 03:06:23 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id x7sm11867461wrq.69.2021.10.18.03.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 03:06:23 -0700 (PDT)
Message-ID: <c8563f17-b0d8-72f8-f9d8-3029c63e6994@redhat.com>
Date: Mon, 18 Oct 2021 12:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 10/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-devel@nongnu.org
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?=c5=81ukasz_Gieryk?= <lukasz.gieryk@linux.intel.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 18:24, Lukasz Maniak wrote:
> From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> 
> The Nvme device defines two properties: max_ioqpairs, msix_qsize. Having
> them as constants is problematic for SR-IOV support.
> 
> The SR-IOV feature introduces virtual resources (queues, interrupts)
> that can be assigned to PF and its dependent VFs. Each device, following
> a reset, should work with the configured number of queues. A single
> constant is no longer sufficient to hold the whole state.
> 
> This patch tries to solve the problem by introducing additional
> variables in NvmeCtrl’s state. The variables for, e.g., managing queues
> are therefore organized as:
> 
>  - n->params.max_ioqpairs – no changes, constant set by the user.
> 
>  - n->max_ioqpairs - (new) value derived from n->params.* in realize();
>                      constant through device’s lifetime.
> 
>  - n->(mutable_state) – (not a part of this patch) user-configurable,
>                         specifies number of queues available _after_
>                         reset.
> 
>  - n->conf_ioqpairs - (new) used in all the places instead of the ‘old’
>                       n->params.max_ioqpairs; initialized in realize()
>                       and updated during reset() to reflect user’s
>                       changes to the mutable state.
> 
> Since the number of available i/o queues and interrupts can change in
> runtime, buffers for sq/cqs and the MSIX-related structures are
> allocated big enough to handle the limits, to completely avoid the
> complicated reallocation. A helper function (nvme_update_msixcap_ts)
> updates the corresponding capability register, to signal configuration
> changes.
> 
> Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/nvme/ctrl.c | 62 +++++++++++++++++++++++++++++++++-----------------
>  hw/nvme/nvme.h |  4 ++++
>  2 files changed, 45 insertions(+), 21 deletions(-)

> @@ -6322,11 +6334,17 @@ static void nvme_init_state(NvmeCtrl *n)
>      NvmeSecCtrlEntry *sctrl;
>      int i;
>  
> +    n->max_ioqpairs = n->params.max_ioqpairs;
> +    n->conf_ioqpairs = n->max_ioqpairs;
> +
> +    n->max_msix_qsize = n->params.msix_qsize;
> +    n->conf_msix_qsize = n->max_msix_qsize;

From an developer perspective, the API becomes confusing.
Most fields from NvmeParams are exposed via QMP, such max_ioqpairs.

I'm not sure we need 2 distinct fields. Maybe simply reorganize
to not reset these values in the DeviceReset handler?

Also, with this series we should consider implementing the migration
state (nvme_vmstate).

> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 9fbb0a70b5..65383e495c 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -420,6 +420,10 @@ typedef struct NvmeCtrl {
>      uint64_t    starttime_ms;
>      uint16_t    temperature;
>      uint8_t     smart_critical_warning;
> +    uint32_t    max_msix_qsize;                 /* Derived from params.msix.qsize */
> +    uint32_t    conf_msix_qsize;                /* Configured limit */
> +    uint32_t    max_ioqpairs;                   /* Derived from params.max_ioqpairs */
> +    uint32_t    conf_ioqpairs;                  /* Configured limit */
>  


