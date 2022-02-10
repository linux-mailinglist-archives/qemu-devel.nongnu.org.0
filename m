Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F464B151E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:19:06 +0100 (CET)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIE24-0000Mu-S8
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:19:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nICAQ-0007e5-Pn
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nICAE-0003Bw-Rz
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644509956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtY/UooAPoho79vyI+WsJOyq9jR7SrD3fX5bT+4/XtA=;
 b=eXhuBtu3o6uHaZLSkfBCNZl5VsHqoyN/wvJ4ou5tbTVMAzf/vFvYD2lsdGfIdAav6af8t6
 Y0SzYHT7rw/mqnYShMIv5gAY2UdzLvVU8EzyTTasPb/sKd5nlBzPxlkmMH5WVHv3DZiwGx
 FTf9ftX1gtEJoLfQM9ikB9o7hDtXYmA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-QH6pVTr2PBOjXEicpnbl2Q-1; Thu, 10 Feb 2022 11:19:15 -0500
X-MC-Unique: QH6pVTr2PBOjXEicpnbl2Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 d25-20020ac84e39000000b002d1cf849207so4699282qtw.19
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 08:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FtY/UooAPoho79vyI+WsJOyq9jR7SrD3fX5bT+4/XtA=;
 b=FayUSKGyUAL0+QrwMtybpGyw6uG7S5pEqqQvLGwS9o6Fdu+ZqrqdUGD6IEdti+ZU8o
 kYWeH1+AtWEkgCP0JQkA04XbitHFOZ9vTfnpeLzFKMSM2tYxhrFJyFpSvUQCMDI5e7XN
 DA+59qZg/IihPVo25Kzvjaf/mZeN0yJVNH7uuBlXvLZ+Uq8XA7CsGb6A+AidTZcsGIRp
 bB/3aOfKSQhbQOtd+ux8TQ3Xlo5zuYmr+yFTkdttGK+rFWbda2yPI8f9xXPQIZuGFPA5
 TRwFvILBsVUURS8JLiSLUkNIkqP9KBRY/yoipQ97rBBkr8y4LunU5Xx7FdQQ2QLPizhh
 JsAQ==
X-Gm-Message-State: AOAM530Pds1EfU5HXMSEOH2AKxNiWjVQfdaoMVvmHZ+BUWnLcryVSkLk
 41FdtN9UMYZEd5/lGklmTyYPakFeBOoGyBbUZ2F2zJhRx10ma5fZC7pijRgacDK2m5AUlrRd9a/
 dOAxaYtkRLW6hyXY=
X-Received: by 2002:a05:620a:4145:: with SMTP id
 k5mr4288158qko.737.1644509954735; 
 Thu, 10 Feb 2022 08:19:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7/mXmZ2SEcRuSV7g1DzaLkENuPfqGYmi61irv3lEUV8DnCqQgIESqQm8zLWRRoKhK7OGpfg==
X-Received: by 2002:a05:620a:4145:: with SMTP id
 k5mr4288137qko.737.1644509954509; 
 Thu, 10 Feb 2022 08:19:14 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id g11sm11150540qtg.49.2022.02.10.08.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 08:19:12 -0800 (PST)
Message-ID: <204d1a78-64e3-c8b0-b327-8769e93fbc7a@redhat.com>
Date: Thu, 10 Feb 2022 17:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 00/33] block layer: split block APIs in global state
 and I/O
To: Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <YgFlQrmGXcOO9P/4@redhat.com>
 <1f3d2562-c355-4295-77b5-088d2ed49023@redhat.com>
 <YgJrPL7k+D1t1Ubm@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgJrPL7k+D1t1Ubm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/02/2022 14:08, Kevin Wolf wrote:
> Am 08.02.2022 um 12:42 hat Emanuele Giuseppe Esposito geschrieben:
>>
>>
>> On 07/02/2022 19:30, Kevin Wolf wrote:
>>> Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
>>>> Each function in the GS API will have an assertion, checking
>>>> that it is always running under BQL.
>>>> I/O functions are instead thread safe (or so should be), meaning
>>>> that they *can* run under BQL, but also in an iothread in another
>>>> AioContext. Therefore they do not provide any assertion, and
>>>> need to be audited manually to verify the correctness.
>>>
>>> I wonder if we could actually do something to catch at least some kinds
>>> of bugs. The first conclusion from thinking about it is that we probably
>>> shouldn't open-code assert(qemu_in_main_thread()) everywhere, but have a
>>> macro or inline function for each category to be called in each function.
>>>
>>> So an IO_CODE() macro could increase a counter in the coroutine object
>>> (that is decreased again at the end of the function with g_auto), and
>>> then GLOBAL_STATE_CODE() could not only assert that we're holding the
>>> BQL, but also that the counter is still 0, i.e. it is not (indirectly)
>>> called by an I/O function.
>>>
>>> We may want to enable this only in debug builds, but maybe still worth a
>>> thought anyway?
>>
>> I don't understand what is the point of the counter, do you want to use
>> it as a boolean flag?
> 
> It would only be checked as a boolean flag, but it needs to be a counter
> because of nesting where e.g. one I/O function calls another I/O
> function.
> 
>> Would a single counter work in a multi-threaded context? Shouldn't we
>> have it per-thread? And why you increase it only in coroutines?
> 
> I don't mean increasing it only in coroutine context, but having a
> per-coroutine counter, including the leader coroutine which exists for
> non-coroutine context in every thread.
> 

As agreed also on IRC, while we wait also additional feedback from
others on the counter logic, I am going to add GLOBAL_STATE_CODE,
IO_CODE and IO_OR_GS_CODE macros in the respective functions.

GLOBAL_STATE_CODE will just replace the assert(qemu_in_main_thread()),
while IO_CODE and IO_OR_GS_CODE will be nop.

This will also visually help understanding in which category each
function is, without looking at the header.
In the future we can extend the macro to support also additional logic,
like counters.

Emanuele


