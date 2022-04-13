Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893AF500025
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 22:46:00 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nejsF-0007Z8-4c
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 16:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejqJ-0006kQ-4o; Wed, 13 Apr 2022 16:43:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejqH-0000nk-HB; Wed, 13 Apr 2022 16:43:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id w4so4261864wrg.12;
 Wed, 13 Apr 2022 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z6hxrytZ3fBmcBTrzyJ90JXImTnrbO2ARhUA8ECYiX0=;
 b=pCz7Mt4OZmmpeDw9VRHwvBDfvsSDQqUe7a1b+5vmVpbafstLPbqKaVnwO1KN3MFyU+
 fCOuvCCjtpD5JFMQ9M0BjpGUWbtuan/+RzjK6dF+2LRjxYfeBxFuQShH4UdYzuFI6lv1
 L1ZT8sm4kQZURPwSqa+O4XkUQfhunWtJfKFUzeC8uyTKUW6nlbsuEbTU1UmnixTepXLt
 1xpm106l3M1HEY247sztnm/VTyfVF9LWIXuzr9uKAPanqezRPbNvfyBGFX1eg7yrGhej
 +TseArNV1o2bKGc4x9ooinmYBzsbLXkkOX0JQ5fTDEKwTCRbZFmKxWawm7bUliQPVU5B
 sqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z6hxrytZ3fBmcBTrzyJ90JXImTnrbO2ARhUA8ECYiX0=;
 b=YbX3odqY+kLQfIZWPTz4tzvYvm2Kkuyvo9DB/z2qEMk3xSIwjbE+DdPGqpxSOq6pM7
 4j45Eeky5Umyb5NoTpl42zacnr5QEdEAx834WUSiLwq5byW+3d+aRxcChQlEA7m/v/vi
 CeWtNUciHKRC0x+NGUYmX2TwaekdWrq66gGFQdHUTmZQengq8SK3FhNEJ4MVSEujCVET
 031peHVBYWQsiTJ+BEJ1utvdTtlwkh2XNpiTYiFrTTS8ARW78AITJJIjZIdPhZiOEmU5
 oUsBreRK1+x7NJyAQKyd+hdWUWg7b/lPe7JtaNqBptOc6K2Xv5MgCJcWdX9aIezmqBND
 oSRw==
X-Gm-Message-State: AOAM532FmUmOv304wQBFm9JKvazFzt7onTwr1Tt+XALlV6E5rP6QH1JK
 egbM2xexLNDbGKM9X39dml4=
X-Google-Smtp-Source: ABdhPJx4PAcdHQjj7eVHz/4Fm9xvi50PHWgsrC7vEnxgYvqm+VEar7rtmPP4L/jkDFVcYWqk+kB1pg==
X-Received: by 2002:a5d:48c8:0:b0:207:afc8:13fa with SMTP id
 p8-20020a5d48c8000000b00207afc813famr418842wrs.487.1649882635784; 
 Wed, 13 Apr 2022 13:43:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 k63-20020a1ca142000000b0038ff2c38e85sm493271wme.39.2022.04.13.13.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 13:43:55 -0700 (PDT)
Message-ID: <b648c5f9-e8d5-956c-bf77-746d27266691@redhat.com>
Date: Wed, 13 Apr 2022 22:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
 <6b88890c-f191-7f77-93eb-91f4951e179d@redhat.com>
 <Ylbjd3kzEsBZmgJQ@redhat.com>
 <5d34e709-fe59-70df-2723-49f252aaed78@redhat.com>
 <Ylb6W+8l2d69J8dm@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ylb6W+8l2d69J8dm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/22 18:29, Kevin Wolf wrote:
>> A reader does not have to be a coroutine. AIO_WAIT_WHILE is not
>> mandatory to allow it to finish, it helps to ensure progress in case
>> some reader is waiting for something, but other than that is not
>> necessary IMO.
> When it's outside of a coroutine, how would you implement waiting for a
> writer to finish if not with AIO_WAIT_WHILE()?
> 

In the main thread a non-coroutine can always read the graph though, 
because the only writer can be the main thread.

If the critical sections are large enough, I don't think rdlock needs to 
be taken outside a coroutine in the iothread, e.g. in a bottom half.

>> No I think if we focus on small pieces of code we end up having a
>> million lock/unlock pairs.
> 
> Yes, I agree. On the other hand, if we're taking the locks in high-level
> outer operations, avoiding to take the lock recursively might become
> harder. I guess we'll see how it works out when we actually introduce
> callers.

My "hope" is that taking the locks in blk_* functions covers most of the 
calls, and then only a few (dozens) direct uses of bdrv_* remain.

Unfortunately, adding assertions is not easy because "is there a reader" 
cannot be easily answered.  But I think Emanuele has a debug mode that 
can enable the assertions at a performance cost.

Paolo

