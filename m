Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89438FFA0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:00:13 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUnE-0008Fd-O6
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llUm7-00076m-I5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llUm4-0003Zv-Nj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621940337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGYMs+tt57UNm8Qyvtm3ydQu+35y0HzWju3ZTmMKt3s=;
 b=AFWuOmGhTigycGaoKVOpkFziQnbiAatO/BR9ShsAoJoOtGieY0X4NsPOc90ffyjFxaF7HX
 G9di4XqZWBrS+ac8XTB7AjCrmWNEMpwP6Exskh7mh1rVxdMr2jpguOeqre/Ad4OfWig5rp
 zVCyslDT0rsyHrnU1S+07QhyGRfRgAo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-1zYiWwMaOyuOAw-jqKOtpw-1; Tue, 25 May 2021 06:58:55 -0400
X-MC-Unique: 1zYiWwMaOyuOAw-jqKOtpw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b8-20020a05640202c8b029038f1782a77eso8644544edx.15
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RGYMs+tt57UNm8Qyvtm3ydQu+35y0HzWju3ZTmMKt3s=;
 b=biFuexHuj1oYHX39YDK7OQs+eaFiB+LSb2+IzmjdO3NlSK9ocgs0/06wPdDTY0BFir
 dvmiwrXJFPcZPZzsiJxLGhrwv37Yd18x8eQxVUVfMtwTC7yK1MkkI5g4eGos9fB5b2HN
 NpIICwLcrKWhuBGbPRUFwrni7wmi7cynL1FYyPa3eCK2jR8KQKNLAexkoB9qQF+8JL03
 XLQgG5/WIwEPMIZXUhqlHO2oz/I1OgS4jN++mCZNizkF/oNa4Johk7qCTuzmD2rkicKy
 fJsW30tlQUvaCZENRMdyfmtVfyjMrVMqCWMIISbeySugnNVOlGwx6VSIJqDaqp8KJMyE
 NovA==
X-Gm-Message-State: AOAM531LgfRivVyl2o4qU9ZVg2eKr6xI55BqNDCIBW3uItjUmVEdQgvQ
 uCqHcJ3+D4lIMwoKCm9kegX3CFZnXwTSrkM4EjuHey9a/WN0usKMHcj1o31nYBF0KrSma29crAV
 +ajOTyyxwc+rS3LLWDjcqRivUcKHjeZGpABd5A+iSaUcRq2rhHt0XZzrYwlzehMy2ftY=
X-Received: by 2002:a17:907:1b20:: with SMTP id
 mp32mr28696890ejc.495.1621940334522; 
 Tue, 25 May 2021 03:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz/lIK2C07JYXBdRF5r50uaHMYk06lgG4V75GmgX7iG5Lp+YFjSt+oiDa28eaUAfvaLlUWZg==
X-Received: by 2002:a17:907:1b20:: with SMTP id
 mp32mr28696871ejc.495.1621940334315; 
 Tue, 25 May 2021 03:58:54 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 g4sm10630552edm.83.2021.05.25.03.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 03:58:53 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] block-copy: add QemuMutex lock for
 BlockCopyCallState list
To: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-6-eesposit@redhat.com>
 <e1170527-29de-0eda-9f66-399e12923bca@virtuozzo.com>
 <cd5dd350-cb83-c2d0-c937-393191d6c7f4@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <72b73ec2-da87-f672-6a7d-bba008df9871@redhat.com>
Date: Tue, 25 May 2021 12:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cd5dd350-cb83-c2d0-c937-393191d6c7f4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21/05/2021 17:01, Paolo Bonzini wrote:
> On 20/05/21 17:30, Vladimir Sementsov-Ogievskiy wrote:
>> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>>> As for BlockCopyTask, add a lock to protect BlockCopyCallState
>>> ret and sleep_state fields. Also move ret, finished and cancelled
>>> in the OUT fields of BlockCopyCallState.
>>>
>>> Here a QemuMutex is used to protect QemuCoSleep field, since it
>>> can be concurrently invoked also from outside threads.

Actually I don't even protect it here, I should have deleted the above 
line. I left a TODO for the QemuCoSleep field.

>>>
>>> .finished, .cancelled and reads to .ret and .error_is_read will be
>>> protected in the following patch.
>>>
>>> .sleep state is handled in the series "coroutine: new sleep/wake API"
>>
>> Could we live with one mutex for all needs? Why to add one more?
> 
> This patch should just go away; the QemuMutex will not be needed once 
> QemuCoSleep is thread safe, while right now it is still racy.

At this point, I would just rename the other lock (tasks_lock) in "lock" 
or "state_lock", and substitute it in the calls_lock usages of this 
patch. Depending on how it comes out, I may merge this with the previous 
patch.

Thank you,
Emanuele


