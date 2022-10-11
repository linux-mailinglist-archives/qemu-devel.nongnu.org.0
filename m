Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD45FB28E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:40:05 +0200 (CEST)
Received: from localhost ([::1]:56894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEYG-00060p-68
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDA2-0002su-9M
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiD9d-0006Ki-NM
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665486633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8n99qr8mbjYhL2gVhkrXQNnhjofl1R6orzfmwbIIRA=;
 b=Z1db5C8xHJ2PwuWLvj9Xgb4CHfIho733Y5sJd8ZqdZ52apn8Z7pMa6W6olv3a8pwQAhu8z
 a7eHE+BdjJx+6iEv358D9A2dlsWSofB6nhw9NoddfM/XMCTxFWPqR+u0HfVowlbHpc4Ssy
 H0y57gozbZUQ/DNHoHFS93sMrcAioAg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-v4Y-cErZMeCulpeZWqiwHA-1; Tue, 11 Oct 2022 07:10:32 -0400
X-MC-Unique: v4Y-cErZMeCulpeZWqiwHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so697226wmb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r8n99qr8mbjYhL2gVhkrXQNnhjofl1R6orzfmwbIIRA=;
 b=q9ze6Yue8i8PX39LCBIAAZCLyn+Liu16pswj4gz2Vp/lCYbwD+pLWHpGS7sW4F4qTn
 rUrF5Bu1V9TLGw7z+lmpdlL8EsmPZkXuBdyHK2K1WYRmBVcLpcQQDwEA1B1rtefqpiuQ
 X8Wix5WZusjFztLAffVo480qgypGikuRGGVQ54BIQdyc8yIQBN4PECzYRfgjN6NGOG1A
 xnD3Qt+r68qHzfPFS3vbL31uM6YDDEF0zrc3T+8X/h53a1fN9LqRJVNagCRDJq9gIjCo
 dwAnzD0r7GuW7lYPu3gjfCYr0hvmv1QoWcsjaN0B8ZjWbBnnFf0gc4xyDuuGrQcC4TNJ
 6Z2w==
X-Gm-Message-State: ACrzQf0zsBX6ow0FuzSTTlgFH0hITXh4wd2UhNziilNmODK7Lna99xfZ
 /CguzOKTU+PmPKTx63/OwPSGk3WTIZqv5SJjVWd7tssg1jSWqppeGevs5jJgJUZi5MsbgBeS1uC
 GP4OVHpDQ9TIt8GU=
X-Received: by 2002:a05:600c:643:b0:3b4:a1fe:d20a with SMTP id
 p3-20020a05600c064300b003b4a1fed20amr22902696wmm.61.1665486630951; 
 Tue, 11 Oct 2022 04:10:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+5KtRbvwVpXXj11YB6aNhSxCGv7OgbBDzSTI1fEiE81jvlTFYqOiVTG7ghWiY4b8ybTg3Jg==
X-Received: by 2002:a05:600c:643:b0:3b4:a1fe:d20a with SMTP id
 p3-20020a05600c064300b003b4a1fed20amr22902682wmm.61.1665486630789; 
 Tue, 11 Oct 2022 04:10:30 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003a5f54e3bbbsm18479824wmo.38.2022.10.11.04.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:10:30 -0700 (PDT)
Message-ID: <d43b15e4-35a1-ef3b-79f4-d75f0a82b314@redhat.com>
Date: Tue, 11 Oct 2022 13:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 2/9] tests/x86: Add subtest with 'q35' machine type to
 device-plug-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-3-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-3-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Configure pci bridge setting to plug pci device and unplug.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/device-plug-test.c | 41 ++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>



