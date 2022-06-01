Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405953A11C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 11:47:02 +0200 (CEST)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwKwP-0002iS-6B
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 05:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwKtL-0001jl-8w
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwKtI-00023c-Lx
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654076627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7RWbBFZ9h8KgCTFbbImkFGjh0dsKJBByuiAlE3+oMY=;
 b=icgi/ST1bysaq9GtRmg8VCN9sP5Oa3KIX4ted/J9iuTpyliHoAKOSsp7SzF7LkDwfCg7r/
 DQEYwXmTvKmfBhX7lLul5tvzboSbQH6DBo4mOx2M9DJjJN1CxZOSG8K7oaEO4vMDQGge+/
 Y4mSrIcMl62CmghZ4BZnRYUhVSGYTAs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-Qxq5wZLWOVicKwi1dfFIuA-1; Wed, 01 Jun 2022 05:43:46 -0400
X-MC-Unique: Qxq5wZLWOVicKwi1dfFIuA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso3101652wms.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 02:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=D7RWbBFZ9h8KgCTFbbImkFGjh0dsKJBByuiAlE3+oMY=;
 b=TNJ2lkI2uEnuv4n85lf6rhQgPO5Nz48Z2fzFdKm3ZJatki8kxXZFB3BsaX4KP+QLLE
 kN/GPzCrGFdT1Ih/Qss8SrV1gVkgKt2+kPF46QkhDXAmcTwiVf3gsNdsmIM/lNQTPeot
 yIAX8V1gX/E+a7FTWTuvRm8sAVtb2rn/oFkHpgQf8xC0jHJ2b/iaXMSbRy2mPlfZqueF
 kKjc80rQMqqXAAu96HhJJOcDTsGGZU60BRulGwIRQDgLpre48LlKAoQj0WNh224OlHU8
 xX+loqWfTlIUEaIm9d9MiNUV29YQKL8iziFYg6tclC8JFQfuToBKIsYt2nm494Ab1BmY
 KKXA==
X-Gm-Message-State: AOAM530QwvOx77fsuiVwTKS/nxy5Mk8uqZQz0Qyf3uqaLyzjAlQhl0OG
 kt5p76vc1sp1jg2T2URqDSz5Lr3NTyBZ8QZqROgNVZA/6+ZWSbeWyesvqPFIA685XdDdKXm75Zq
 BQw2Jdpel6l32p3g=
X-Received: by 2002:a05:6000:1f8c:b0:20e:5d60:17a2 with SMTP id
 bw12-20020a0560001f8c00b0020e5d6017a2mr52263937wrb.515.1654076625267; 
 Wed, 01 Jun 2022 02:43:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxP4t3pfSZqFd0wIUkK26rej+SDuKZSny5NE5lG0SNc86R+xym4ZOqg7zCgOTZRecYMGOE9w==
X-Received: by 2002:a05:6000:1f8c:b0:20e:5d60:17a2 with SMTP id
 bw12-20020a0560001f8c00b0020e5d6017a2mr52263914wrb.515.1654076625038; 
 Wed, 01 Jun 2022 02:43:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45?
 (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de.
 [2003:cb:c705:2600:951d:63df:c091:3b45])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b0039b006bd6d9sm5526288wmq.6.2022.06.01.02.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 02:43:44 -0700 (PDT)
Message-ID: <b3016857-775a-bc22-a337-bbaec76e5023@redhat.com>
Date: Wed, 1 Jun 2022 11:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] tests/tcg/s390x: Test overflow conditions
Content-Language: en-US
To: Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, thuth@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org
References: <20220531183524.40948-1-gautamnagrawal@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220531183524.40948-1-gautamnagrawal@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 31.05.22 20:35, Gautam Agrawal wrote:
> Add a test to check for overflow conditions in s390x.
> This patch is based on the following patches :
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51
> 
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


