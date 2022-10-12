Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2E5FCA3F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:07:14 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oig8P-0004eQ-Kg
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oig70-00038n-Kz
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oig6s-00081R-47
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665597937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZP1bF2e8v0MXikGKc4m2Bl2VNZP/mkWCbR8s4QdTkcI=;
 b=Jtw6XcKqZCfRnLnLBwYmHHuYzNLOagApwm5Cpm2asiG3ZKlihC4kAhp0TVS/EfUjVUkzmS
 KacQLDfgxphBDiB70y5Jhvnq9TUdHQv8U2fb1FR6kv1W8xHwJ75Bm0TtFDb/v+v3MA1eNd
 Dusdkku+nD7kPtfRIPrju3k+XOYn84U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-6rA2nlgfNlu5OsD42bLPzg-1; Wed, 12 Oct 2022 14:05:35 -0400
X-MC-Unique: 6rA2nlgfNlu5OsD42bLPzg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n19-20020a7bcbd3000000b003c4a72334e7so747398wmi.8
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZP1bF2e8v0MXikGKc4m2Bl2VNZP/mkWCbR8s4QdTkcI=;
 b=71WTFvyWQffFauCBzC/BM8r7euQy51ZmuD5S8Gc72uxvUS+y2Gm0IC6w7Uav8l3+m4
 YR+zHjVMdgHKYUv5mHCvIXC/qDAu9AXN+zcAgRMVuTkaSF/u/qY0kZTpzUOy29TEkijY
 63vzW0QaBND8Y93taBEgxKj0d+1vNcgrLlltYJuzs6mDAB2JcN2zDCGU+acEw9DHBrnL
 aMwmStkVAMrzgbYp6uEk+yBEUHd5LzXpOBx7ImXbTHjk22K/Bjt/LNGhRVDXjAO8M85t
 LLPpqOzBVxwAR8hmphaAnSZ3eVbJ1VfAwcudid4hDKRwieWIQmNjA1JmqQAKV0YX9k3c
 xIBA==
X-Gm-Message-State: ACrzQf0WGy1SqOPx0aT0CqQnIliGRSY3eMYyuuVX46PN5CUk+mBuVMd2
 1GZ8E9/RY9jHu/VqFEbwVTjFFbgrsAxuxcNTrkSQmfhLmCPqfrpSytwI/8F4S0bmhaM7ohkx6vU
 rzNXyoQn+8pz3NfA=
X-Received: by 2002:a7b:cbc4:0:b0:3b4:fd67:d70d with SMTP id
 n4-20020a7bcbc4000000b003b4fd67d70dmr3709469wmi.98.1665597934632; 
 Wed, 12 Oct 2022 11:05:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5IIpaG+Igz9h/017sYIAAGo909DlTrIg4Md9fYCh/IUMk3ZGkO/G5P9YIoOT2F+aPbMH0Ubg==
X-Received: by 2002:a7b:cbc4:0:b0:3b4:fd67:d70d with SMTP id
 n4-20020a7bcbc4000000b003b4fd67d70dmr3709447wmi.98.1665597934404; 
 Wed, 12 Oct 2022 11:05:34 -0700 (PDT)
Received: from [192.168.8.100] (tmo-099-72.customers.d1-online.com.
 [80.187.99.72]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003b4868eb71bsm2421531wmq.25.2022.10.12.11.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 11:05:33 -0700 (PDT)
Message-ID: <e5dd172e-1b9f-3817-a87f-3ed52a0ce120@redhat.com>
Date: Wed, 12 Oct 2022 20:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/4] qtest: Improve error messages when property can not
 be set right now
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, lvivier@redhat.com, amit@kernel.org,
 mst@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, david@redhat.com
References: <20221012153801.2604340-1-armbru@redhat.com>
 <20221012153801.2604340-4-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221012153801.2604340-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 12/10/2022 17.38, Markus Armbruster wrote:
> When you try to set qtest property "log" while the qtest object is
> active, the error message blames "insufficient permission":
> 
>      $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio -chardev socket,id=chrqt0,path=qtest.socket,server=on,wait=off -object qtest,id=qt0,chardev=chrqt0,log=/dev/null
>      QEMU 7.1.50 monitor - type 'help' for more information
>      (qemu) qom-set /objects/qt0 log qtest.log
>      Error: Insufficient permission to perform this operation
> 
> This implies it could work with "sufficient permission".  It can't.
> Change the error message to:
> 
>      Error: Property 'log' can not be set now

Can it be set later? ... if not, that error message is almost as confusing 
as the original one. Maybe it's better to tell the users *when* they can set 
the property?

  Thomas



