Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42CE3C2099
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 10:14:53 +0200 (CEST)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1leu-0004W6-EY
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 04:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1ldq-0003pN-60
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:13:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1ldm-0002km-M1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625818420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zcc9PfRb3oxi1wGMh5iSgMy6bAvrJj+sM2sxMgjJr5c=;
 b=R//gyYGscQEODXp/6zNjAMAE2xgQr9LUwL1tVkPInwvTaXldfWFtVKZDgREMJYWpTndh5G
 u1Ruf6iFPdJxaZxy21VOV4qo5omIyM33W1o/hpji7Vs4rB11z+DcWjwyzFKGrRWQ0grV4E
 G1PUvWOfTWLX6XdlCI1XGH8xmJT8KiY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-3mb-BfxoP-6ozNtRtBm4Zg-1; Fri, 09 Jul 2021 04:13:38 -0400
X-MC-Unique: 3mb-BfxoP-6ozNtRtBm4Zg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso3704260wms.5
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 01:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Zcc9PfRb3oxi1wGMh5iSgMy6bAvrJj+sM2sxMgjJr5c=;
 b=AgZxauHmiWAn5wURyzXyfYupIIS53mcKyYPs4UsGubk7IyjkvAI1za8U979thDfKxU
 MUuan2fThvKHPldgPfvros6DIG9WPO3f8ysBUwTWake3WbnOogGPmFCANh2XT+YQULPN
 ONFIIqgcsKCmfy4+NEb0RAtY0iNlqGYYpq5bI+TR3zfvm2wP6IPVqwAP5gnVOjX+q6+L
 /L2kQG/eKDlvHnS4KFdo7xYU08/epDbzKN9XZwpardZPSDmWkC5NnGc+TWdMcQo8s/3h
 g7/wbrZX2km+CEz1vpkhG0KAsKDkxGFBWgUrxsV89ayAWfa9WqrNeCvD7Nse9zbIOzCv
 ExhA==
X-Gm-Message-State: AOAM532Kh+/U03LmtsZEJnHYLfmCJXeoRAbwEY1aTi4EjDQ1m3i7iic2
 vpIlX9YZ23Ser2oJYJR1HFPMy/eZueu8j3mPRmt8C+ZPtpohNsuZSZCmML17IKrn0X/+zMxZiMW
 PpHhwBwnBTLOjIsU=
X-Received: by 2002:adf:dd82:: with SMTP id x2mr39044542wrl.303.1625818417328; 
 Fri, 09 Jul 2021 01:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGWX/vJaG7Gk9dh09Ms5PF6LdpD4TrKSktL579S1i4pmx4g98nU7DkxbKBBaHYfVU0Alb/ZA==
X-Received: by 2002:adf:dd82:: with SMTP id x2mr39044524wrl.303.1625818417113; 
 Fri, 09 Jul 2021 01:13:37 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23a45.dip0.t-ipconnect.de. [79.242.58.69])
 by smtp.gmail.com with ESMTPSA id
 v1sm4825411wre.20.2021.07.09.01.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 01:13:35 -0700 (PDT)
Subject: Re: [PATCH v3] remote/memory: Replace share parameter with ram_flags
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210709052800.63588-1-yang.zhong@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <32477171-db5b-514f-cb6e-b50bd142dc3e@redhat.com>
Date: Fri, 9 Jul 2021 10:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709052800.63588-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: pbonzini@redhat.com, philmd@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.07.21 07:28, Yang Zhong wrote:
> Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to
> qemu_ram_alloc_from_fd()")
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>   hw/remote/memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 472ed2a272..6e21ab1a45 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>           subregion = g_new(MemoryRegion, 1);
>           memory_region_init_ram_from_fd(subregion, NULL,
>                                          name, sysmem_info->sizes[region],
> -                                       true, msg->fds[region],
> +                                       RAM_SHARED, msg->fds[region],
>                                          sysmem_info->offsets[region],
>                                          errp);
>   
> 

Just an info: no need to resend for added RBs or ACKs. The maintainer 
will usually simply pick them up while picking up your patch. :)

-- 
Thanks,

David / dhildenb


