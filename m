Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CF354D43
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:04:38 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTflM-0002wJ-Qa
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfil-0001iH-Op
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:01:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfig-0001dB-Cg
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617692509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+Tr2aOUwC1bzOSBFcc+l5ZzEVTcFwnt0ng4pxYPlvw=;
 b=STVdk1Kz8oTKiMAFAJ+Jn960BDMwl7lkCbMUTw2WuNJqSrwFFe2MO8vRO7qRqesGIwIKqf
 BtojtfhSfhov+0ehmz12gqp0uauyvausgnZfcSRs5wWWnI+MZMSbgePJiFMIffqozF+PYa
 zILVwp7kcsaybgw3Mfu1dOyL4MO5Lfc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-lc4X7yfJNSiBrzyjHnVB4w-1; Tue, 06 Apr 2021 03:01:47 -0400
X-MC-Unique: lc4X7yfJNSiBrzyjHnVB4w-1
Received: by mail-ej1-f71.google.com with SMTP id zn19so1164271ejb.14
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 00:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i+Tr2aOUwC1bzOSBFcc+l5ZzEVTcFwnt0ng4pxYPlvw=;
 b=sHuH5bs7JnnCevPs0B659pdl4Fml5zT0hba3Muo3LsUCHkv+n7Lp9g2WVrHQdP9jDJ
 T9Ca0R6//qmqOKVWfeHxADKw8rvWbcQ0Clnvs1mK2u8mP3Wk8OBzuBwGy/mXI5mLiHt2
 doWkKNOLtqLmKIcucAYzZE4wwXEDUSaP5zM5GzxVgl5PXhv+1KV6OCKpb84UQNDXAoGv
 4p+NF7HQ9IszrJqDlLLZZKdIdMAPeGw1Edg5mMEsBhXTyQbRbX16utEfp38X9+RWbTzg
 lRHX33xZ0qTl+eDvTIQASjebi8rwe7nbAsgrIo/vXE1SGVfBNZoIajYjJ9nrme6DCYal
 AXdw==
X-Gm-Message-State: AOAM531CkjDLRvUK4ovpDi7xdvi8AIe6RtsUeTX7zyBELGNHcE+FuhI8
 NmvRX0Vkq6DKq8tnhSfo8mjtlwcgRgfnLQrxnzhQbOFm5FP5Qd+r3YgyN5uqcxOLz9gV3wreYrF
 6cs2xUriGNywnRV4=
X-Received: by 2002:a17:906:1182:: with SMTP id
 n2mr32857785eja.234.1617692506593; 
 Tue, 06 Apr 2021 00:01:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEVQN0a4nzFhUd5gopFVnDoudidNtQtR+oBsHI0+bnzui6IcI2ZG9xRYkzGdJhGmAyfZqjHA==
X-Received: by 2002:a17:906:1182:: with SMTP id
 n2mr32857749eja.234.1617692506243; 
 Tue, 06 Apr 2021 00:01:46 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id pg2sm10319898ejb.49.2021.04.06.00.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 00:01:45 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 4/8] hw/block/nvme: fix controller namespaces
 array indexing
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-5-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e9f266a2-f12e-6dca-805e-4f70a4ffc248@redhat.com>
Date: Tue, 6 Apr 2021 09:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210405175452.37578-5-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:54 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The controller namespaces array being 0-indexed requires 'nsid - 1'
> everywhere. Something that is easy to miss. Align the controller
> namespaces array with the subsystem namespaces array such that both are
> 1-indexed.

TBH I don't understand the justification. Assuming you hit a
bug and try to protect yourself, maybe now you should also
check for

  assert(n->namespaces[0] == NULL);

somewhere. In nvme_ns() maybe?

> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> ---
>  hw/block/nvme.h | 8 ++++----
>  hw/block/nvme.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 9edc86d79e98..c610ab30dc5c 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -217,7 +217,7 @@ typedef struct NvmeCtrl {
>       * Attached namespaces to this controller.  If subsys is not given, all
>       * namespaces in this list will always be attached.
>       */
> -    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
> +    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
>      NvmeSQueue      **sq;
>      NvmeCQueue      **cq;
>      NvmeSQueue      admin_sq;
> @@ -232,7 +232,7 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
>          return NULL;
>      }
>  
> -    return n->namespaces[nsid - 1];
> +    return n->namespaces[nsid];
>  }
>  
>  static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
> @@ -253,7 +253,7 @@ static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
>      uint32_t nsid = nvme_nsid(ns);
>      assert(nsid && nsid <= NVME_MAX_NAMESPACES);
>  
> -    n->namespaces[nsid - 1] = ns;
> +    n->namespaces[nsid] = ns;
>  }
>  
>  static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
> @@ -261,7 +261,7 @@ static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
>      uint32_t nsid = nvme_nsid(ns);
>      assert(nsid && nsid <= NVME_MAX_NAMESPACES);
>  
> -    n->namespaces[nsid - 1] = NULL;
> +    n->namespaces[nsid] = NULL;
>  }
>  
>  static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index c54ec3c9523c..6d31d5b17a0b 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -5915,7 +5915,7 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
>              return -1;
>          }
>      } else {
> -        if (n->namespaces[nsid - 1]) {
> +        if (n->namespaces[nsid]) {
>              error_setg(errp, "namespace id '%d' is already in use", nsid);
>              return -1;
>          }
> 


