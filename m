Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E938C9AF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:02:53 +0200 (CEST)
Received: from localhost ([::1]:53766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6fs-00074K-Ji
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6ep-00069P-CG
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6eg-0001mf-QC
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621609293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpfQ/LlPNJZukpR+Y+iWPKY7Wd6EWYnkC4Jv8h8KANM=;
 b=edj8li013Pkg16Ji4qKKh2oee2KaqGuMKjwp6dVXlqlEVLak/k/XeCvxj83Cnu8RdURIBX
 6iqVMIFZ0J8IrzFIFpE2qX1t+f0Ya66dOWM0H/RBtPuxVJkgU0IUE2z439KlXwC5ifMP9i
 DxilQpLcQcOPATiYartPOc2U1O0x00c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-lB5YR7r9Nvm8LG_epz4k0w-1; Fri, 21 May 2021 11:01:31 -0400
X-MC-Unique: lB5YR7r9Nvm8LG_epz4k0w-1
Received: by mail-ej1-f71.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso6339695ejc.7
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gpfQ/LlPNJZukpR+Y+iWPKY7Wd6EWYnkC4Jv8h8KANM=;
 b=WFIyjv9ZODuVDGcaXRr4+KdpakmmAPtg2+ZgQsNy7LgfRNoG1lriQo4ut+/KpsVoJA
 7TgHaIyZeaOA/4UBN7qQkmJ2HB2EyBQGBVvHGcRswsUYsVB6RYx4qSY6Yzl7mVNOkqxv
 EoFeKfHE0uz9ErIAqPYSJ1IlA78lA3CYSqsErVnCXDHH/AravD9+I3aV2UEnEtWgMEex
 4v76vaX1yHYSj1oNkkhRdViFct2TupV7Q4OyoEeydtCubVAy6UAS+UHUWLMrmCXPnQmX
 9PzJ0jlu9Qq/OFxtSbD9DcGKmiFa1fXqwBGKXMrPxPNC64KjS/EPC/B78Mpw+/1AXXxD
 P7Jw==
X-Gm-Message-State: AOAM530qyPFGvansGeHatcT/9cHrIEESDazSdkpJZiEvw7v2sZMu4khZ
 QS78dp1k6uPWFK7sf4O5BSZNhqQYwvR++ehiAj8DIpDalhnlzpa7xTHqSU3gSRS4JmGOGd4A2Ey
 hZ/ZsbcDkLnRuVhvOcBYfIU0umH896DiFVXTbwSYjjwc9LmU+B3AAaLSyyG0nlhDSKeM=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr10844391ejf.25.1621609289854; 
 Fri, 21 May 2021 08:01:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcHm293jogC6iVB2TFklg6/69q/lLbimGqRmSLY2gEmt0hyL7XClpCt+VXIjpANXHH8Mp6XQ==
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr10844359ejf.25.1621609289490; 
 Fri, 21 May 2021 08:01:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c22sm4181706edy.59.2021.05.21.08.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 08:01:28 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] block-copy: add QemuMutex lock for
 BlockCopyCallState list
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-6-eesposit@redhat.com>
 <e1170527-29de-0eda-9f66-399e12923bca@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cd5dd350-cb83-c2d0-c937-393191d6c7f4@redhat.com>
Date: Fri, 21 May 2021 17:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e1170527-29de-0eda-9f66-399e12923bca@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On 20/05/21 17:30, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> As for BlockCopyTask, add a lock to protect BlockCopyCallState
>> ret and sleep_state fields. Also move ret, finished and cancelled
>> in the OUT fields of BlockCopyCallState.
>>
>> Here a QemuMutex is used to protect QemuCoSleep field, since it
>> can be concurrently invoked also from outside threads.
>>
>> .finished, .cancelled and reads to .ret and .error_is_read will be
>> protected in the following patch.
>>
>> .sleep state is handled in the series "coroutine: new sleep/wake API"
> 
> Could we live with one mutex for all needs? Why to add one more?

This patch should just go away; the QemuMutex will not be needed once 
QemuCoSleep is thread safe, while right now it is still racy.

Paolo


