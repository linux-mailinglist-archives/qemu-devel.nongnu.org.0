Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36F63A1C55
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:47:47 +0200 (CEST)
Received: from localhost ([::1]:34086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2Is-0006JV-WF
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr2Hl-0005Ks-6X
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr2Hj-0004C9-Jj
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623260794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6+xVGuDR7zg86dnV0FricuCra4cDSpRV4/B/s95gcg=;
 b=SVG/5ZjFAhwMel8XXQfgIg/QyvLJQ+PFlO17Z4xaKMwxdGtORayUwhIUmhc2aVHa6syGCT
 0fkmMAt7qMzvOT+G5vqI5DjgWoQR2X30DK7T4AuSQVb8izU0C9ygegaAYlVFJhEpIUB/m8
 99nRFjRdVkIhGD/8D3Py0PLyqc+J9qA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-TXNwHr-aMsa8_FY5k0_zdA-1; Wed, 09 Jun 2021 13:46:31 -0400
X-MC-Unique: TXNwHr-aMsa8_FY5k0_zdA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a05600c3509b02901b985251fdcso946325wmq.9
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o6+xVGuDR7zg86dnV0FricuCra4cDSpRV4/B/s95gcg=;
 b=tq1dELr/yJqU4nudjhVH9rUPh7Wv9Hun64+E2pJY80iDw41jIjPIuj+6KquX8EdkSs
 II14sRUQV/I/qN37Mhp0LYePAZJCkR/aDZJwmwELHiJUyKVZ6Rqk9n2llRSXHAFLeGLr
 gliTBu7F8lcDd6gSeG6MggFEOH0eNblGpRRZy2PSTM3X18hY5Sb5nSzVCeTDfq1J9GgD
 6LVK6LFPPoPVRtzJGr1q2dhWJq2ItGfMGurL6zFtAaLeKhhUpU9mRSSbAdu+/qoXzEOP
 LD5f1WuA5tmprHwhvrXroHRyiSuHLUjjLL7ibKRVvxCwW5poTQ6/LroSKyiDVcbMir1l
 8X/Q==
X-Gm-Message-State: AOAM5306cA/APtrCqnJ3L8Pjfw32yniiO9XQqapxZXmlqmo8IClorvFG
 ZglJva8+RZkx9jWn6GeLCDokNtLcyW7Cmc1wmxVEJBYllDQfdN6RjGrjJRiVJeAeuW5oMgcFM0E
 WleCw6NzvmH4J4uk=
X-Received: by 2002:a05:6000:110e:: with SMTP id
 z14mr1004555wrw.235.1623260790328; 
 Wed, 09 Jun 2021 10:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNdGLIB0+W4OMJ3mcj+2uFtq4D+vgldrPwGh8dtX+FYiANCu4dl592/Xjcd9vyj+7PLq2weA==
X-Received: by 2002:a05:6000:110e:: with SMTP id
 z14mr1004537wrw.235.1623260790163; 
 Wed, 09 Jun 2021 10:46:30 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id r7sm9135864wma.9.2021.06.09.10.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:46:29 -0700 (PDT)
Subject: Re: [PATCH] tpm: Return QMP error when TPM is disabled in build
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210609152559.1088596-1-philmd@redhat.com>
 <CAJ+F1CL0ZdNUdcgTR8gv3w-+p++tDfvtFVYPm6NgoU_b03VgRQ@mail.gmail.com>
 <2ebcd286-cc73-e8da-53ef-2424419822ff@redhat.com>
 <d73d226b-557e-d619-10ba-e547fc51ad9d@redhat.com>
 <YMD8IaJKTHJwp+io@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1a6d1dd1-b7d4-cde4-3141-ad9c202d6c0e@redhat.com>
Date: Wed, 9 Jun 2021 19:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMD8IaJKTHJwp+io@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 7:36 PM, Daniel P. Berrangé wrote:
> On Wed, Jun 09, 2021 at 07:34:32PM +0200, Philippe Mathieu-Daudé wrote:
>> On 6/9/21 7:27 PM, Philippe Mathieu-Daudé wrote:
>>> On 6/9/21 6:01 PM, Marc-André Lureau wrote:
>>>> Hi
>>>>
>>>> On Wed, Jun 9, 2021 at 7:33 PM Philippe Mathieu-Daudé <philmd@redhat.com
>>>> <mailto:philmd@redhat.com>> wrote:
>>>>
>>>>     When the management layer queries a binary built using --disable-tpm
>>>>     for TPM devices, it gets confused by getting empty responses:
>>>>
>>>>       { "execute": "query-tpm" }
>>>>       {
>>>>           "return": [
>>>>           ]
>>>>       }
>>>>       { "execute": "query-tpm-types" }
>>>>       {
>>>>           "return": [
>>>>           ]
>>>>       }
>>>>       { "execute": "query-tpm-models" }
>>>>       {
>>>>           "return": [
>>>>           ]
>>>>       }
>>>>
>>>>     Make it clearer by returning an error, mentioning the feature is
>>>>     disabled:
>>>>
>>>>       { "execute": "query-tpm" }
>>>>       {
>>>>           "error": {
>>>>               "class": "GenericError",
>>>>               "desc": "this feature or command is not currently supported"
>>>>           }
>>>>       }
>>>>
>>>>     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com
>>>>     <mailto:philmd@redhat.com>>
>>>>
>>>>
>>>> Why not make the qapi schema conditional?
>>
>> Using your suggestion (and ignoring QAPI marshaling error) I'm getting:
>>
>> { "execute": "query-tpm" }
>> {
>>     "error": {
>>         "class": "CommandNotFound",
>>         "desc": "The command query-tpm has not been found"
>>     }
>> }
>>
>> Is that OK from a management perspective?
> 
> That's fairly typical of what we'd expect to see from a feature
> which is either removed at compile time, or never existed in the first
> place. mgmt apps don't really need to distinguish those two scenarios,
> so this is fine.

Thank you!


