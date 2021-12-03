Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD614467D24
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 19:20:26 +0100 (CET)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtDAX-0004y5-JD
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 13:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtD8k-0003LG-O3
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 13:18:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtD8U-0006HG-TC
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 13:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638555496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fphzoqruj/GSER9WikftOGOyqYcY3SAZ2CnJKbP2iM=;
 b=IxdN9wcfrP1urruDgVVhUiLmnQfJDTafTgyL+C5Uiem4aK7Y3qGoGO/35M2ZtZ6sqYAJkw
 ZwnQteeRC14nfu3un06u2i5sq3f55WaPl89dCWRwndYuJKaXW/WnSERT7GJWs9rL9yn0YD
 krQRN70ZsnnNcEfZfBqz6VnJbroFoYE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-DS3aBNNgPwGi4QSVqUmCRA-1; Fri, 03 Dec 2021 13:18:15 -0500
X-MC-Unique: DS3aBNNgPwGi4QSVqUmCRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1688162wms.5
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 10:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6fphzoqruj/GSER9WikftOGOyqYcY3SAZ2CnJKbP2iM=;
 b=n5kfvZdcjiYJrMZ2tVmeOAYXjvryr/QMehpzq/ezySJNBCeaAOhi0kKszZ/LYJtRqG
 h83I8dFgwQDqqK1oZ4McJ64u+yZEsYTOzGQi7pu3lCvGU+6W5G6xV1kzSlSC+7d7qTXk
 3x3q6R281xx0vPIhSgd3wjt7S9XMpj5oEFStReVa3087DSXTr9lDAPu1YdMka5x5gNAS
 /NBtWrCSOWsqFrShxYUBGel/jQUno9ZGwm/O5yjuzoBLh+948T4NVpcx8RvWRYwVAp1i
 A/e2zD8+8FASJQYZj5lFBq41Y4Wuzg2gW9WeTkTyEFvplTNI1EjUgsIFOZVez2XHyPiR
 zFNg==
X-Gm-Message-State: AOAM533TACyDLJzJCIG6JEx5XvknV+6+P741/vs6YimmN+fp4GH3mwce
 ex8SNKPqIlce60vVHb0VEDWc3Jyi6Fwan2KP7EJq2dAI2DsonKuoN005E+XCJ0sLK4EsatNrWQ2
 stTLbm/h9NDcoBtA=
X-Received: by 2002:a05:600c:4f02:: with SMTP id
 l2mr17176057wmq.26.1638555494433; 
 Fri, 03 Dec 2021 10:18:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQQOig4wn8eSfi2Daj3yeGOHSS3qlYS1CBKlxyYY7xswn5skqJ82M5+zLTDSNe1pYtwuTUBg==
X-Received: by 2002:a05:600c:4f02:: with SMTP id
 l2mr17176027wmq.26.1638555494197; 
 Fri, 03 Dec 2021 10:18:14 -0800 (PST)
Received: from ?IPV6:2003:d8:2f44:9200:3344:447e:353c:bf0b?
 (p200300d82f4492003344447e353cbf0b.dip0.t-ipconnect.de.
 [2003:d8:2f44:9200:3344:447e:353c:bf0b])
 by smtp.gmail.com with ESMTPSA id c4sm3371022wrr.37.2021.12.03.10.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 10:18:13 -0800 (PST)
Message-ID: <e9a7760e-33bf-478f-50b2-830eaf35d1de@redhat.com>
Date: Fri, 3 Dec 2021 19:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] hw/arm/virt: Support for virtio-mem-pci
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20211203033522.27580-1-gshan@redhat.com>
 <20211203033522.27580-2-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211203033522.27580-2-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.12.21 04:35, Gavin Shan wrote:
> This supports virtio-mem-pci device on "virt" platform, by simply
> following the implementation on x86.
> 
>    * This implements the hotplug handlers to support virtio-mem-pci
>      device hot-add, while the hot-remove isn't supported as we have
>      on x86.
> 
>    * The block size is 512MB on ARM64 instead of 128MB on x86.
> 
>    * It has been passing the tests with various combinations like 64KB
>      and 4KB page sizes on host and guest, different memory device
>      backends like normal, transparent huge page and HugeTLB, plus
>      migration.
> 

I would turn this patch into 2/2, reshuffling both patches.

> Co-developed-by: David Hildenbrand <david@redhat.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks Gavin!

-- 
Thanks,

David / dhildenb


