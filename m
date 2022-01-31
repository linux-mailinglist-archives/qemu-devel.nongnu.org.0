Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A94A479C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:54:50 +0100 (CET)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEWCj-0007tU-Jc
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEUpG-0004Po-P9
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEUp5-0007lJ-DE
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643628360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Yrwf/ujQ584Sd2lvsY2HTDRXDy4EGmznBoid9JSBt0=;
 b=WrLVkMSX9P4TZJ2a3ZEhh+mxxlJjPaCtFavpyYK3OEevNI/lOovd3bPgeD8rGXfTMD99BK
 nEn8H4LPIy/KvmhJfSFZD+xpxroEBWbC/l46/xpfWb3DI6TZYfhGHSjAWuN4B1uEbpLkA/
 zlGQ6yqGUnhEGy9KIEXePZwY7w+udrk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-c3VmiW1sP-6jQLBHP4uugA-1; Mon, 31 Jan 2022 06:25:58 -0500
X-MC-Unique: c3VmiW1sP-6jQLBHP4uugA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l16-20020a7bcf10000000b0034ffdd81e7aso5694567wmg.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 03:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Yrwf/ujQ584Sd2lvsY2HTDRXDy4EGmznBoid9JSBt0=;
 b=rivy3vHXj3VGS1Ish0LCmufZaZEzwOdCHPtpKunGG8WAvcG8V9GyOzAnksnuCSrA2S
 NyoCN72sWL+J2H33wZV7FnfVlNSJxQCYW2qg/+F3X5u7YdDkjb6sGdn7Xi+lTZgJswwk
 0TaVOtVMNlEZx1d91EWGhHr0l5hYOZkrdJJeoqvDJAlK3W2Tu7sGyU9gH+fNQ+8SFp+L
 4wCGdUQ29o3STV2j22EQFFWjGjlRbHL5EN3wokpfe5N+uj1MQj66qa2AHv1DW+FIsihD
 DTVW2ZsWgRaQUY780Il/6O8KdtaLvMbNfHS+DAaZqYVAR10M8zvxM2Y35IeZ9fg6/aso
 luVw==
X-Gm-Message-State: AOAM531Has/lLmfGAnFx78Q6ktqSR7y8Q66EKrgiI5IoUFIQdZnNeR/d
 FckHktObNwhrADa1dKluJWL37A2Xq2f3TGd5UOyCLg5ELCE63djGkYelSe63yTgsfa89vFhm451
 WZraj4vaBbtk5itw=
X-Received: by 2002:a05:6000:189:: with SMTP id
 p9mr17420434wrx.496.1643628356709; 
 Mon, 31 Jan 2022 03:25:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY/dCJZgpQhgIzcpyvzstVVEMTW87XYh/nLyMavIvIu4NMoRf+DcjoYwiPG8k36iK8mxGgwA==
X-Received: by 2002:a05:6000:189:: with SMTP id
 p9mr17420383wrx.496.1643628356412; 
 Mon, 31 Jan 2022 03:25:56 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id g9sm6288375wri.95.2022.01.31.03.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 03:25:55 -0800 (PST)
Message-ID: <7ada78d2-0978-8f5a-f0f8-318d2f26ba41@redhat.com>
Date: Mon, 31 Jan 2022 12:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
To: Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-2-eesposit@redhat.com> <YfJ6dsVcmB4Uc2rO@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YfJ6dsVcmB4Uc2rO@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 27/01/2022 11:56, Kevin Wolf wrote:
> Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
>> When invoked from the main loop, this function is the same
>> as qemu_mutex_iothread_locked, and returns true if the BQL is held.
> 
> So its name is misleading because it doesn't answer the question whether
> we're in the main thread, but whethere we're holding the BQL (which is
> mostly equivalent to holding an AioContext lock, not being in the home
> thread of that AioContext).
> 
>> When invoked from iothreads or tests, it returns true only
>> if the current AioContext is the Main Loop.
>>
>> This essentially just extends qemu_mutex_iothread_locked to work
>> also in unit tests or other users like storage-daemon, that run
>> in the Main Loop but end up using the implementation in
>> stubs/iothread-lock.c.
>>
>> Using qemu_mutex_iothread_locked in unit tests defaults to false
>> because they use the implementation in stubs/iothread-lock,
>> making all assertions added in next patches fail despite the
>> AioContext is still the main loop.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> This adds a new function that is almost the same as an existing
> function, but the documentation is unclear when I should use one or the
> other.

Why do you think it is unclear? as explained in commit and
documentation, unit tests for example use stubs/iothread-lock, which
returns always false. So we can (and should!) use this function in APIs
invoked by
unit tests, because qemu_mutex_iothread_locked will just return false,
making all tests crash. On the other side, I am pretty sure it won't
cause any failure when running QEMU or qemu-iotests, because there most
of the API use the cpu implementation.

> 
> What are the use cases for the existing qemu_mutex_iothread_locked()
> stub where we rely on false being returned?

I don't think we ever rely on stub being false. There are only 2 places
where I see
!qemu_mutex_iothread_locked(), and are in helper_regs.c and cpus.c

So being cpu related functions they use the cpu implementation.

However, commit 5f50be9b5810293141bb53cfd0cb46e765367d56 changed the
stub to return false for a specific reason.

> 
> If there aren't any, then maybe we should change the stub for that one
> instead of adding a new function that behaves the same in the system
> emulator and different only when it's stubbed out?

I don't think we can replace it, bcause stubs/qemu_in_main_thread()
calls qemu_get_current_aio_context, that in turn calls
qemu_mutex_iothread_locked. So we implicitly rely on that "false".

Thank you,
Emanuele


