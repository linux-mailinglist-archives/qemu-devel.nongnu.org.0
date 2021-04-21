Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489FA3674BC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 23:18:13 +0200 (CEST)
Received: from localhost ([::1]:46552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZKEe-0005Gd-6k
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 17:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKCN-00041w-Qs
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKCL-0003Li-01
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619039746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ql5yPzC92BpO+G2QrOKEMGCHimlqFwdTnoM40sioHQY=;
 b=i2DUrdt+I4XCM652ye8jPERvanEMQ5sRjk+vC9HOikV0SMvMTX6vIgPBMoLtyi/AFTYryF
 NdDu6blCJz9L82UNPXkuFVrkv6sF8DPUSB2ZiK51MtiOBmxRuZSFOZnSbacL5lYP4V2nhg
 Cn2SbSr0D4m4F/L8+QBXfGUxj8hMDpA=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-_5TbwArjPoKz6nT0Fv2yJw-1; Wed, 21 Apr 2021 17:15:44 -0400
X-MC-Unique: _5TbwArjPoKz6nT0Fv2yJw-1
Received: by mail-ot1-f69.google.com with SMTP id
 f89-20020a9d2c620000b0290280d753a255so14198149otb.2
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 14:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ql5yPzC92BpO+G2QrOKEMGCHimlqFwdTnoM40sioHQY=;
 b=aS5+mGg1PhaWapdoqL2YG1T67TyyFAG1IVSgkmC7R18vgvVwbwDrn5Tnmluh7cNnx1
 QevH6TsJYdXEq//wX6eqd1wunI0gwV9BwlpiHxv+IkPaykx4fIHTKkAuLzmHqLWoyG7U
 kvFHmkTMNnbkUijAwYGkkoIFZxZX7wvZqx47GIFVVmZYA06jrUUVfUg2D2Co0cXC7pu9
 aZ3+OibecwbYyY6HTmj0pwhZsWU7e8wQfOC3QdtsI6YqJVvrnwNXo4e/w631zjx6+pdj
 UzItum25k3PZprfaxLhabyxxWX3mG/fvO1rPAIQMiuWyQzcmQ0Qt0P6+2dEvbbcckWHM
 eQZQ==
X-Gm-Message-State: AOAM531lbuj+3j4iaRR6b7yBuqc1Urv7wrNa1DMOwD2rnsEr8XxMWJuT
 m75RVDKMcI4xvbAdA741uXPfRKUpVpHo4X2O5AKOw4/0tp9TrHu5LCJnd2OGvwdZni/sGtSkgAF
 kw8OIOUF2SxyqZfI=
X-Received: by 2002:a05:6830:19dd:: with SMTP id
 p29mr107255otp.368.1619039743672; 
 Wed, 21 Apr 2021 14:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvlTCh99x3xLOxXhmsC58oisx+O6XH70XT8vEwoj9iLXK5lNPUzizjtfe+gctYsJTEBeMo+w==
X-Received: by 2002:a05:6830:19dd:: with SMTP id
 p29mr107237otp.368.1619039743462; 
 Wed, 21 Apr 2021 14:15:43 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 g84sm115856oia.45.2021.04.21.14.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 14:15:43 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] block/rbd: Add an escape-aware strchr helper
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210409143854.138177-1-ckuehl@redhat.com>
 <20210409143854.138177-3-ckuehl@redhat.com>
 <20210421110454.6jcig7ujr25my2xw@steredhat>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <525092bf-1cae-98ef-53ec-e0fa86ab2cc5@redhat.com>
Date: Wed, 21 Apr 2021 16:15:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421110454.6jcig7ujr25my2xw@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 6:04 AM, Stefano Garzarella wrote:
>> +static char *qemu_rbd_strchr(char *src, char delim)
>> +{
>> +    char *p;
>> +
>> +    for (p = src; *p; ++p) {
>> +        if (*p == delim) {
>> +            return p;
>> +        }
>> +        if (*p == '\\' && p[1] != '\0') {
>> +            ++p;
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
> 
> IIUC this is similar to the code used in qemu_rbd_next_tok().
> To avoid code duplication can we use this new function inside it?

Hi Stefano! Good catch. I think you're right. I've incorporated your
suggestion into my next revision. The only thing I changed was the
if-statement from:

	if (end && *end == delim) {

to:

	if (end) {

Since qemu_rbd_strchr() will only ever return a non-NULL pointer if it
was able to find 'delim'.

Connor

> 
> I mean something like this (not tested):
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index f098a89c7b..eb6a839362 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -119,15 +119,8 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
>  
>      *p = NULL;
>  
> -    for (end = src; *end; ++end) {
> -        if (*end == delim) {
> -            break;
> -        }
> -        if (*end == '\\' && end[1] != '\0') {
> -            end++;
> -        }
> -    }
> -    if (*end == delim) {
> +    end = qemu_rbd_strchr(src, delim);
> +    if (end && *end == delim) {
>          *p = end + 1;
>          *end = '\0';
>      }
> 
> 
> The rest LGTM!
> 
> Thanks for fixing this issue,
> Stefano
> 


