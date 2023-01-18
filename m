Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1AF6719DE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:59:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI69F-0006o7-Cv; Wed, 18 Jan 2023 05:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI69D-0006nc-IW
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI69C-0004j8-6O
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674039505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDk8r/HFKBIuWbFyQvtHHZ9kEIhLCmhlDUhvl1m2KWg=;
 b=hTnNRgydKwoh0jkT85LNSb0d8L8TMMiR4g+xonjiMlN1bikkBaLG4gLY9wzUg+pKGbwBnZ
 Yn287fc9vygIRKp3fdP6KX7o30P7QhaqOnMjOhK/D47JlYMiy3y7ZvAOVqvZcL4k4MzeIk
 Um3VyxXegH+EbAqeXwOphyL9vuEarWA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-Ojo5RfWHMOKefIf7k5lO3w-1; Wed, 18 Jan 2023 05:58:24 -0500
X-MC-Unique: Ojo5RfWHMOKefIf7k5lO3w-1
Received: by mail-qk1-f197.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so24656859qko.15
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 02:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iDk8r/HFKBIuWbFyQvtHHZ9kEIhLCmhlDUhvl1m2KWg=;
 b=ZIwp3lhylxKZd7TAWNW/fcMXkhX0jqR9eDMxqB+hZ6EAV+tRLb7XduBDFVw0EoNPOz
 75xufktDji7yKXPuqfK6Q0KZQ3Uzm25qJqca6WItJvwZYHMxrbRJoiOdauCnV6QadQgO
 bqRmlL7hcvlnY7ICOSnnrulxQ0WGmq0NjTdjp+UAJ92bV/Ba9WVTBxSKvH8CoaYBlAbI
 3jG6IRMbGKaLDQ2O/pAlypc0xiWHiett42H/G1ztIZh/J+rxmdkC2VNMwRolPSZlhcad
 NLjxve/d++Vx666sK9KTeP07k8iulm5rm4uHOLeoyE+SM9IElROxk1BEUlPqNPUkGNuQ
 PGrg==
X-Gm-Message-State: AFqh2kpiDzFDM9BxGpHLCggOg5hbOQhXSWIv4LhWKq6Cq/m1RSDJNZ88
 1PbLVwKLa7EWO8XdcPbp2Xas95R4DbuCs5UXU8h6UfaNjbHKTAKr8DRhx4kMU4BblAeQPwMiZZ+
 RBHp4e83zVXSBn1w=
X-Received: by 2002:ad4:55cd:0:b0:534:8cbc:d666 with SMTP id
 bt13-20020ad455cd000000b005348cbcd666mr10154618qvb.39.1674039503527; 
 Wed, 18 Jan 2023 02:58:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuQ/iSp0Ui8GTUKYYBztVwXDp/dkjM9sqxMvNcRKLjbhtSX1X0WGuWPr0Wlp4E4y9isa7YeVQ==
X-Received: by 2002:ad4:55cd:0:b0:534:8cbc:d666 with SMTP id
 bt13-20020ad455cd000000b005348cbcd666mr10154604qvb.39.1674039503281; 
 Wed, 18 Jan 2023 02:58:23 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05620a240600b006fc2f74ad12sm22371819qkn.92.2023.01.18.02.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 02:58:22 -0800 (PST)
Message-ID: <97be9e13-6aa3-32c0-dfb8-31225d5efcbc@redhat.com>
Date: Wed, 18 Jan 2023 11:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [for-8.0 v2 05/11] cryptodev: Introduce 'query-cryptodev' QMP
 command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>, arei.gonglei@huawei.com,
 dgilbert@redhat.com, eblake@redhat.com, armbru@redhat.com,
 michael.roth@amd.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221122140756.686982-6-pizhenwei@bytedance.com>
 <Y8UyezxcEeE+TH2p@redhat.com> <20230118052127-mutt-send-email-mst@kernel.org>
 <Y8fKBEmXD862n3EW@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y8fKBEmXD862n3EW@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/01/2023 11.29, Daniel P. Berrangé wrote:
> On Wed, Jan 18, 2023 at 05:25:37AM -0500, Michael S. Tsirkin wrote:
>> On Mon, Jan 16, 2023 at 11:18:19AM +0000, Daniel P. Berrangé wrote:
>>>> +    for (uint32_t i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
>>>
>>> QEMU coding style doesn't declare types inside the for() control
>>> conditions. I'd suggest 'size_t i', and put it at top of this
>>> function.
>>
>> It's actually kind of vague:
>>
>> 	Mixed declarations (interleaving statements and declarations within
>> 	blocks) are generally not allowed; declarations should be at the beginning
>> 	of blocks.
>>
>> for loop starts a block, does it not?
> 
> I wasn't refering to the specific docs per-se, but rather that no
> code does this at all in QEMU. It is effectively our style, even
> if not documented as such

$ grep -r 'for (int ' * | wc -l
381

... we're using it in many places already, and I think it should be OK since 
we started using gnu99 and later as a base standard. Just my 0.02 cents.

  Thomas


