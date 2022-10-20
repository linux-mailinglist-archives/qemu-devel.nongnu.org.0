Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612B6057C3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 08:57:47 +0200 (CEST)
Received: from localhost ([::1]:43842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olPUv-0000L8-Sv
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 02:57:45 -0400
Received: from [::1] (port=48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olPT5-00070O-4X
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 02:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olPAR-0003Tw-Rf
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olPAQ-0005i1-C2
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666247792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kRBbbX5B002JvDjBdtsKCnptQ4/G16BokJ88dvvDa0=;
 b=ivYhF0bucOT+8VCBjpc5Hmqyfk2/oC3afEjznSrWxgKMOgNuCKULef5TarZ9q+KGT1PvjM
 UP2AOVkmTm+kUGtVgZuzgnNFbjTrkeuPgKh+VgGGAiW6Arr9T0jy/dqP4fn20Vk9rTk3PZ
 okDHGewwdT1dbOXuGKzrCUWVBPBPGLk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-wDh69GMSNOiA2nzWLUbJ3g-1; Thu, 20 Oct 2022 02:36:31 -0400
X-MC-Unique: wDh69GMSNOiA2nzWLUbJ3g-1
Received: by mail-qk1-f197.google.com with SMTP id
 o13-20020a05620a2a0d00b006cf9085682dso16442552qkp.7
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 23:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2kRBbbX5B002JvDjBdtsKCnptQ4/G16BokJ88dvvDa0=;
 b=ABxNppXcXgN2EECF3PObJvqwlUis8Mmm6Yv0A89UANATYZfkh0uS18evEHY39+WrHU
 Qnkcq1DOzLidHkHKJa4Y7yoGia74vGMq1u9AiiPcxTjtWnGhPxxlqvv9ARWtkfhc1m2E
 d7XE9zwethuH3bPfCkgmciHpgeL/Oao8spG8CAKT0fTzM26zpnGQlBhSGNOdF96h4wLF
 O8DSFz/oxmuic+tFESiQ8Xrl7pr3ivFfyD8j/F5XhFLVAIUmwtX3DJpZBf4LnZ/BNWU+
 9qbkOPGEWMY2ZK62YfR6eN4aMPd4fzP2xXJQrMQ0gnfK1B1IZX5VijUYcl5YunCI381s
 nekw==
X-Gm-Message-State: ACrzQf35/L72MxfIpPzXp4hsNwxk+9r6GHg3+SuvqfQrqVu/LhL+EHIQ
 edL+djoIOX8wqng/vXXqoWNosPZXOYyRUvTiBcDnJ66FM9rPkBYFqMvewsUkVDIKZsHDwBagMpU
 uyO0bEaRvNHJ9D0E=
X-Received: by 2002:a05:6214:d4b:b0:4b1:80eb:64e2 with SMTP id
 11-20020a0562140d4b00b004b180eb64e2mr9932927qvr.123.1666247791241; 
 Wed, 19 Oct 2022 23:36:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5HotGjXbGADOVL39axLzTwboWGapVXuVoD9Oxv1XGr1aCgURvjAWkgyj8QK6AbrkLZLotusg==
X-Received: by 2002:a05:6214:d4b:b0:4b1:80eb:64e2 with SMTP id
 11-20020a0562140d4b00b004b180eb64e2mr9932920qvr.123.1666247791080; 
 Wed, 19 Oct 2022 23:36:31 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-247.web.vodafone.de.
 [109.43.177.247]) by smtp.gmail.com with ESMTPSA id
 ay40-20020a05620a17a800b006bb78d095c5sm6427970qkb.79.2022.10.19.23.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 23:36:30 -0700 (PDT)
Message-ID: <a2ec5f5e-925c-59da-d685-b04d8e57d6b3@redhat.com>
Date: Thu, 20 Oct 2022 08:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] MAINTAINERS: target/s390x/: add Ilya as reviewer
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/10/2022 14.56, Christian Borntraeger wrote:
> Ilya has volunteered to review TCG patches for s390x.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3d5b7e09c46..ae5e8c8ecbb6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,6 +305,7 @@ F: target/rx/
>   S390 TCG CPUs
>   M: Richard Henderson <richard.henderson@linaro.org>
>   M: David Hildenbrand <david@redhat.com>
> +R: Ilya Leoshkevich <iii@linux.ibm.com>
>   S: Maintained
>   F: target/s390x/
>   F: target/s390x/tcg

Thanks, queued to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


