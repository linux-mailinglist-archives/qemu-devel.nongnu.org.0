Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2347C401961
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:02:29 +0200 (CEST)
Received: from localhost ([::1]:60414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBSO-00029c-6a
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBNe-0006FS-Je
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBNc-0000JW-TC
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630922251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSXOgrr66XXF9S+NYHIEwV5TLpP6dUZoG8ILYonFWSk=;
 b=J8xN4IU+KP/5Tg8tLeiG9uqaouRMtA6ePRgp3SQ65RDzdqB2gWLV5gX/EG/7dOC+yraxnt
 dN7X6Fo7GrKMSPt6wki9im1FUuaD8IEAYOkfhxKnBczr2KnORc2Kx5RpUWUQaoaumzTxS0
 /iK7vSzfTPoItDq+ZGXiN0XcXS1hSLI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-Qqv65zuwOU2Be6r2lQprNA-1; Mon, 06 Sep 2021 05:57:28 -0400
X-MC-Unique: Qqv65zuwOU2Be6r2lQprNA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2145435wmj.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSXOgrr66XXF9S+NYHIEwV5TLpP6dUZoG8ILYonFWSk=;
 b=UaVgGJ8bPxN90/UItjWZZG7zA7oFc+GkiC9RhY8uBzXe+f376VYjtqf+7A90OZF4AB
 amEASvfJAC+tQJRkdq6VYC80ZsyBdO3b9DkybHBuMRkYRup+nH4cfgf0f8AQa4FEPbpT
 cLA0q4liSg6LskftKeOQw+uKKt4xHQ2FHiqArha3M9CEwcvGW6wKvUJg95X2vhENzpgf
 AI7v0q5IaUKAIR4K0g+URY8DBLS7K+xMoYuNlXjLSEvHzbw/6YVetBRKOdMKBDarCzat
 lD/gQK80UbElmM6ComtYdOfi4ddDWBhIweJHT1GyzoU2xAL7YEm+drB+Og6VjH85AAP0
 Zg6w==
X-Gm-Message-State: AOAM531q1XciWixytNfkmMTbmoKa4r7fDdYhrm3+QwYdmZaOgCKaN7kq
 5gdIFY4P/HHMbL/FXPjvNJHmEuisB+BQiQXDogySoPjXRnGYUAV1JUMehku3T6cSNiLT3Eg8PIf
 YRBdlORnXNW1qqa8=
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr10307924wmb.112.1630922247654; 
 Mon, 06 Sep 2021 02:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4ak0lXzp7I5U4GtG4BPZTEQueUItaTApSUgIPdMX8roT6IR52M8O1gchT+rrk9vYZxuX2eQ==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr10307906wmb.112.1630922247455; 
 Mon, 06 Sep 2021 02:57:27 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id l187sm6807477wml.39.2021.09.06.02.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 02:57:27 -0700 (PDT)
Subject: Re: [PATCH v3 02/13] s390x/tcg: fix ignoring bit 63 when setting the
 storage key in SSKE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210903155514.44772-1-david@redhat.com>
 <20210903155514.44772-3-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <83186465-1a04-ffa9-c384-cee4f084965d@redhat.com>
Date: Mon, 6 Sep 2021 11:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903155514.44772-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17.55, David Hildenbrand wrote:
> Right now we could set an 8-bit storage key via SSKE and retrieve it
> again via ISKE, which is against the architecture description:
> 
> SSKE:
> "
> The new seven-bit storage-key value, or selected bits
> thereof, is obtained from bit positions 56-62 of gen-
> eral register R 1 . The contents of bit positions 0-55
> and 63 of the register are ignored.
> "
> 
> ISKE:
> "
> The seven-bit storage key is inserted in bit positions
> 56-62 of general register R 1 , and bit 63 is set to zero.
> "
> 
> Let's properly ignore bit 63 to create the correct seven-bit storage key.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/tcg/mem_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index e0befd0f03..3c0820dd74 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -2210,7 +2210,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>           skeyclass = S390_SKEYS_GET_CLASS(ss);
>       }
>   
> -    key = (uint8_t) r1;
> +    key = r1 & 0xfe;
>       skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
>      /*
>       * As we can only flush by virtual address and not all the entries
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


