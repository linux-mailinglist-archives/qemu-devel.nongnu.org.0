Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80C4027F5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:41:57 +0200 (CEST)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZUA-0007Bq-Vv
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNZQt-0006I3-7h
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNZQi-0008Fy-CD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631014695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAtL6L3SYVGu3MNvxU+Sd6EzPHhfsbErp71QFuR7lNM=;
 b=BxgqBVjVwcGYb42277+dE+dBZo9Z3kUob5moqfL8J7DUBACCW/8Jn7H9abYERH2046du0U
 B0tJ0SPLFVLc0b0zP8WCZ3mVhghdqs1lVo2ZMKaxSAvzP/C1BTRAi5cZrD9zu5rSNWBJDS
 d5dag7OaOgy5qbh0Tihh/b93HJPXE7o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-M_02Mzp9P8idWyFZsnemeg-1; Tue, 07 Sep 2021 07:38:14 -0400
X-MC-Unique: M_02Mzp9P8idWyFZsnemeg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so1061114wmj.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HAtL6L3SYVGu3MNvxU+Sd6EzPHhfsbErp71QFuR7lNM=;
 b=Tazu7HfwHQ3N68l0gcQlgSO6oA7yhvdfUD4lgxLPsIgJc3BgkZecULblHQdrfwIIGB
 ALfK4UHRcqlIV32dR7CLbEl+TPQmGRKXA3yxQV/dPiDPqAV2Q7D06qCa5Pgow/eesVM5
 WlIEPkiZ+ulqYVhcNLe4hlqXkT+RouunfbNlqj9LcyhTNv47oW8Cglfa6vPHWNbDGvxT
 epJzUdwX+rysBGadKp/HARQoprSh8277V0xTrSbA03WRsn7ZYNaTOLsHg6Fu1UoZe1Ks
 VhkcbLhlOLYcGMNFVOOY1S0sauXg5xpGsItG6p5Ez9sIO6BBA5FaqxyEWegsocV97IeM
 IUlQ==
X-Gm-Message-State: AOAM530vJ2XhLk+UGmnYPE4LxTUjhQ9gGKXko1NIFW9Rohh3dJ9RJ2pd
 nfqQasEtylvpPQWmD463nnm4zCckesQ9WUHLk2ajhq90YjjaFDYwR7XrPu8W8vZ6kFWqecFaugs
 JZgAYC2Ixb6yrNOA=
X-Received: by 2002:a5d:548f:: with SMTP id h15mr17869969wrv.290.1631014693298; 
 Tue, 07 Sep 2021 04:38:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlVdd56lDF5YYOUwfugECWM3sFKZ3zu7IwwqRGcaDFkM4/lRR5RuguV1CWsQkXFK0hif2n3A==
X-Received: by 2002:a5d:548f:: with SMTP id h15mr17869936wrv.290.1631014693103; 
 Tue, 07 Sep 2021 04:38:13 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id 17sm2044238wmj.20.2021.09.07.04.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 04:38:12 -0700 (PDT)
Subject: Re: [PATCH v2] s390x/cpumodel: Add more feature to gen16 default model
To: Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210907101017.27126-1-borntraeger@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <88d42564-3bcf-9058-dade-5ce85a7e9c1f@redhat.com>
Date: Tue, 7 Sep 2021 13:38:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210907101017.27126-1-borntraeger@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/2021 12.10, Christian Borntraeger wrote:
> Add the new gen16 features to the default model and fence them for
> machine version 6.1 and earlier.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c  | 5 +++++
>   target/s390x/gen-features.c | 8 +++++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 4d25278cf20e..61aeccb163f7 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -803,6 +803,11 @@ DEFINE_CCW_MACHINE(6_2, "6.2", true);
>   static void ccw_machine_6_1_instance_options(MachineState *machine)
>   {
>       ccw_machine_6_2_instance_options(machine);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_NNPA);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_BEAR_ENH);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_RDP);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAI);
>   }
>   
>   static void ccw_machine_6_1_class_options(MachineClass *mc)
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 7d85322d6814..7cb1a6ec10be 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -663,7 +663,13 @@ static uint16_t default_GEN15_GA1[] = {
>       S390_FEAT_ETOKEN,
>   };
>   
> -#define default_GEN16_GA1 EmptyFeat
> +static uint16_t default_GEN16_GA1[] = {
> +    S390_FEAT_NNPA,
> +    S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
> +    S390_FEAT_BEAR_ENH,
> +    S390_FEAT_RDP,
> +    S390_FEAT_PAI,
> +};
>   
>   /* QEMU (CPU model) features */
>   
> 

Thanks, queued to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


