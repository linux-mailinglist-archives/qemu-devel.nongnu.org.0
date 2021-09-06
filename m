Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1140197A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:09:07 +0200 (CEST)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBYo-00012D-Qd
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBWp-0007i7-6k
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNBWn-0008G4-3Y
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630922820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAt9i6VycHY0R+wGzmIpv8x3rwmy6eQ+w3hPGONqukU=;
 b=AWjs0Wv6zSLBTGlC7JSca8fQ0BnI+31i9byGz1dwuDkiqNcuWgFl95cii/NuxOz8EqpBVT
 6Z9tJWNs8wAFU1lAm5E2C/AQhEvJpXsozaejrw0/UBUHqClu1MqisHY8yPsAiZQOyeOqry
 IAw3vJ2BBgOQwMSdYvoK4GOdgY8TCvs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-Jp_op5TNMsyxdegf6VxOMA-1; Mon, 06 Sep 2021 06:06:59 -0400
X-MC-Unique: Jp_op5TNMsyxdegf6VxOMA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso3049341wmi.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MAt9i6VycHY0R+wGzmIpv8x3rwmy6eQ+w3hPGONqukU=;
 b=ZKAyqGygCTkHU//34QTRx/oGsJ4Vfv2Ld+xfrNcbHE8PnSE0mocAPFeEfJwOvsHBT/
 i2Lo+JPTwzSi1flMLzZarzB1x/cjupS96mmymS4roWdSlCuHVNZyQvkJ0sbs3UeZ9ZhB
 06lg147pccOmp9MNaUZcTpe/fQeOyMYX4luObEhi1HTDWGiuO1w6edhPGs50/l8nnxyd
 BfdR3KRkED72YsFRDikzfYwJ2NlGTi3+/E5SWb9X32eudIr2Res0enOdao5K3kYw1YsP
 0PkkyFkxM1C9K7kwGqmZkIgiQxFMk1mmp8MHTM1TwCZY4J0SE7E2cChdc2XrAEUEBwmW
 /Dnw==
X-Gm-Message-State: AOAM531GpvuX1jq10nhbIgUWBXzXUeKH2swvDmy/Lp53Az5rJNepMT3X
 mFICR8gAihy4CMjhUVMPPr0zLA9HC/4Dhk/AYdINfFoZjmPx+pPg3WywC/92Ke68WlDoGWPBlcf
 pldGOKhGkQ4S4yPw=
X-Received: by 2002:adf:e747:: with SMTP id c7mr10143927wrn.241.1630922818185; 
 Mon, 06 Sep 2021 03:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydIbXqnWAYhA8Tm3WV0WTn7CECCc6G+hsy9pfOqmUgZgdM2R+QHA49YXUuAe2uQHGHz7AFrA==
X-Received: by 2002:adf:e747:: with SMTP id c7mr10143903wrn.241.1630922817978; 
 Mon, 06 Sep 2021 03:06:57 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id p11sm6718002wma.16.2021.09.06.03.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 03:06:57 -0700 (PDT)
Subject: Re: [PATCH v3 04/13] s390x/tcg: check for addressing exceptions for
 RRBE, SSKE and ISKE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210903155514.44772-1-david@redhat.com>
 <20210903155514.44772-5-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7b28a5b1-5ce4-b4e3-9aae-e1192db5172a@redhat.com>
Date: Mon, 6 Sep 2021 12:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903155514.44772-5-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17.55, David Hildenbrand wrote:
> Let's replace the ram_size check by a proper physical address space
> check (for example, to prepare for memory hotplug), trigger addressing
> exceptions and trace the return value of the storage key getter/setter.
> 
> Provide an helper mmu_absolute_addr_valid() to be used in other context
> soon. Always test for "read" instead of "write" as we are not actually
> modifying the page itself.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/helper.h         |  6 +++---
>   target/s390x/mmu_helper.c     |  8 ++++++++
>   target/s390x/s390x-internal.h |  1 +
>   target/s390x/tcg/mem_helper.c | 36 ++++++++++++++++++++++-------------
>   4 files changed, 35 insertions(+), 16 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


