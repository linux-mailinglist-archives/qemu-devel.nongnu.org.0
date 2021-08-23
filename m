Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A93F46E4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:51:10 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5fS-0005y8-ML
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI5dp-0005If-GS
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI5dn-00079N-3W
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629708549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1CV4PgXFAI1NPnVaQg+bqvkbHKuD/SQcy2488xqdSI=;
 b=DlejSqG5joK0pC6szsxAmXKFH+lQFX5yAHLnivyqBnLtWAgTw0IkC9n7yolZmVG945A6VZ
 RWncPVuItEP176w3RqKuKDoopDGMzneg7bX1E7gUjAQc9zPYDeC6ExI+esZbFlvVL0oq+2
 xWZDW1suRU6RH2U/xMwvxd8cSSgTByc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-4IJ5VycEMtOMLZCMJNYjYA-1; Mon, 23 Aug 2021 04:49:08 -0400
X-MC-Unique: 4IJ5VycEMtOMLZCMJNYjYA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p2-20020a05600c358200b002e6dc6adcecso3843420wmq.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G1CV4PgXFAI1NPnVaQg+bqvkbHKuD/SQcy2488xqdSI=;
 b=cF0dW2d7i5z4BhNHb2hK6tncyCBAv/jrxNTUEcrblgyK977XeDpd5kfdauXtE/7LzZ
 cSYzP4xgnTWG7rQDnhI8kRRO+pv2acG/5fQA6veLmOkTiHPqI8/yIyfnWnaToewbON8p
 xgie3PMJ6/UzeY3848fsCwL3jlfDQRwu+5PJZsZyZmEGYrp2n7mV6jXYAbHHoahVzRjK
 +NTsxyMcNTh1G164FVmDdURadCXwfEVxGjGNADNE9DxAQQWe5UCRpYxmbGp1K+NHL729
 2YRTLykl3He+oKA4C29K/KnHfdHLEyX69nKoTLgpFP2lC8e4G6RkqvwpjgbMisCL4v0m
 ph2w==
X-Gm-Message-State: AOAM5337PuFODpxkoa7DNXo5ieTrxX4rMsC55itMHxOtXuMOWsW+pgaj
 KZmVTu6xNDkkNSWmB/HyjjssXgaz2L8rb0wgsdmAtpGQV3vTLPDpo91+ultZaFMWzyTne3LN49y
 KzAiORbkU/PsV7TM=
X-Received: by 2002:a7b:c354:: with SMTP id l20mr15614574wmj.159.1629708547353; 
 Mon, 23 Aug 2021 01:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+TX2wt09oZSNMS5f4V9/K6hKqlNEvLPEmSW5oEYH81uGS9jNsUE/dtxY/OSooCC97c9elOA==
X-Received: by 2002:a7b:c354:: with SMTP id l20mr15614550wmj.159.1629708547115; 
 Mon, 23 Aug 2021 01:49:07 -0700 (PDT)
Received: from thuth.remote.csb (p5791d4fd.dip0.t-ipconnect.de.
 [87.145.212.253])
 by smtp.gmail.com with ESMTPSA id z15sm14404090wrp.30.2021.08.23.01.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:49:06 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <YR6FauCbECxehubc@stefanha-x1.localdomain>
 <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
 <541f1df5-47b4-bff7-f326-a087512c95ba@redhat.com>
 <dd8a6ccf-6e40-a94b-fbf9-d301259b965a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7bd51420-aa85-2dc1-0d39-ad61c5ce0282@redhat.com>
Date: Mon, 23 Aug 2021 10:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <dd8a6ccf-6e40-a94b-fbf9-d301259b965a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/08/2021 10.30, Hanna Reitz wrote:
> On 22.08.21 15:18, Thomas Huth wrote:
>> On 20/08/2021 09.56, Hanna Reitz wrote:
>>> On 19.08.21 18:23, Stefan Hajnoczi wrote:
>>>> On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
>>>>> This post explains when FUSE block exports are useful, how they work,
>>>>> and that it is fun to export an image file on its own path so it looks
>>>>> like your image file (in whatever format it was) is a raw image now.
>> [...]
>>>> This is a long blog post. One idea is to show a quickstart
>>>> qemu-storage-daemon FUSE export command-line in the beginning before
>>>> explaining all the details. That way people who just want to see what
>>>> this is about can get an idea without learning all the background first.
>>>
>>> Sounds good, will do.  Thanks!
>>
>> Oops, sorry, I just already pushed your patch to the repository since I 
>> did not notice this conversation in time. Next time, please make sure to 
>> put myself (and Paolo) on CC: when sending updates for qemu-web, otherwise 
>> I might not notice the updates :-/
> 
> Oh, sorry... :/
> 
> Is it acceptable to send an update still?

Sure!

> (And would you accept a patch to CONTRIBUTING.md to make it say to CC you 
> and Paolo?)

That would likely make sense, too, especially since you're not the only one 
who wasn't aware of this CC-rule yet...

  Thomas


