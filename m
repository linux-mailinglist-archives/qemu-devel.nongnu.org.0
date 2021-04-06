Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0169E354D1F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 08:55:21 +0200 (CEST)
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTfcN-00081X-Jx
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 02:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfaw-0007Vn-To
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 02:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfar-0004xi-0g
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 02:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617692023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlvzP+K5iItz58JKBzAE6xpZv4929Phf/XY5iHTUQLE=;
 b=BUgk1Y2dJ3zQymAJ95NA47zOSLS8oLBlcCD7tMgvjKSu80WI6kkAYxlpV5A9lG3ioTbBHK
 8Gsup/5TS9TvWBc9vD8pjrmueLZeuIQMYWdosvhFA5/wA/xjwvHiswptepFmLDIHmOBpHd
 ckn8ExnxyzHzkLdjmDu0QVBYJLNlhBM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-EcW3_jB-NW2ZrFX8Ma4gsA-1; Tue, 06 Apr 2021 02:53:41 -0400
X-MC-Unique: EcW3_jB-NW2ZrFX8Ma4gsA-1
Received: by mail-ed1-f72.google.com with SMTP id j18so9871551edv.6
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 23:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AlvzP+K5iItz58JKBzAE6xpZv4929Phf/XY5iHTUQLE=;
 b=Aa5y2PJsOM0RTUQ4A/VyvcIZ9gPGKdxNefSX9PEJO/YkkeQhjQjw/2Dp2YVcbMUwic
 249aMFxhOW77WAbTMyf8UeChKo0RxNJmaev/I50xGeQJOzsDy15N4UCQEcmQlW0loE7r
 bVC7+nIWo9PyA1Ril1qBoQla+WFVfdfAiCdj0mrzA85h24irD8Nf/fc/rSMhw0FZTEm2
 qMvQ+Ip/1vTp8UlvI+GMEyrkj/0/1bggthFbznfv0APmVSQ+yVlMxdAie0Pi2dQRrkup
 TY8lcg5ZL27Uo4yZyHoylbkDnAPMIapU90ivYzFs7fVqAuHyRdekQFLLyS8b2howRMpx
 JjnA==
X-Gm-Message-State: AOAM532jZfCIJLCN1Cs608F1wHk5ZeNbVKSGG9f7edjGkX/eFXA6P2qy
 9nxNT0YxkvTBQDv+fzHbCkOMbfTnynaVT7R0WpGmn3HzO2AEyt2V6+5xjwlTeUr9lpRNOHyEk9a
 YIGLlcXHpSln6qJk=
X-Received: by 2002:aa7:c551:: with SMTP id s17mr36351238edr.291.1617692020441; 
 Mon, 05 Apr 2021 23:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+ow/R8x0oR6Bw+f6GZ6ektwzfMYMv/6CPwdZxnbiLIs5C2V/dQPhQ7XDgzJIx6KYpKx+9aw==
X-Received: by 2002:aa7:c551:: with SMTP id s17mr36351215edr.291.1617692020247; 
 Mon, 05 Apr 2021 23:53:40 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id pj18sm3825884ejb.101.2021.04.05.23.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 23:53:39 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 3/8] hw/block/nvme: fix the nsid 'invalid' value
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-4-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b061ab5-573c-0c67-3990-8087aa385ddb@redhat.com>
Date: Tue, 6 Apr 2021 08:53:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210405175452.37578-4-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Klaus,

On 4/5/21 7:54 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The `nvme_nsid()` function returns '-1' (FFFFFFFFh) when the given
> namespace is NULL. Since FFFFFFFFh is actually a valid namespace
> identifier (the "broadcast" value), change this to be '0' since that
> actually *is* the invalid value.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> ---
>  hw/block/nvme-ns.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 9ab7894fc83e..82340c4b2574 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -96,7 +96,7 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
>          return ns->params.nsid;
>      }
>  
> -    return -1;
> +    return 0;

For 6.1 can you add a NVME_NSID_INVALID definition along
NVME_NSID_BROADCAST and use it here?

>  }
>  
>  static inline bool nvme_ns_shared(NvmeNamespace *ns)
> 


