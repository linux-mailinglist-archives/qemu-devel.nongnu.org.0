Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3393313F03
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:31:33 +0100 (CET)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CFw-0000Hw-DD
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l963o-0005mB-BI
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:54:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l963g-0003Ez-L7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612788857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhvsvCpbGl9246nn8gV+UTTkif0J5S0NQr5Jgyt3L3Y=;
 b=GXPsXZsKSucqyEQWE4E5YtFK1BzF5ncHxj+xnKok48i2uDQxRmrSLuh1DhmyUnhmQ0hZSi
 XmStbouhlfxIiVxheSrVB6ItBQboCwUrfSkEgZglVW1khL1lUyPG9ULAy4GAoU5R+l/Rcf
 5JL6sAtGoPP5T2tI0So8ihmZd/NnfZs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-01tUlmI2PKa-MoP7epv3tQ-1; Mon, 08 Feb 2021 07:54:14 -0500
X-MC-Unique: 01tUlmI2PKa-MoP7epv3tQ-1
Received: by mail-wr1-f71.google.com with SMTP id e11so257630wro.19
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zhvsvCpbGl9246nn8gV+UTTkif0J5S0NQr5Jgyt3L3Y=;
 b=JRmRo/YxbR8YPtY509Qrc8o/MMt4tK2msR9AE//ofqGBxfeBmUd+yE7iTrdekNkqBd
 yntd4D9cr1QFJdDbah6XZCACPASiXxnXBbysDmbYBcQBPMOZsNH/ijZrnGfqvg6g/dCK
 9YQGwNlQIltKXWzsIzshLSBkyan9mDL/33jOc+IxVIg1lPoOidg+K8ReYvBxj2zCs31x
 QHfSuqmuz8nFKmWfm13ngylTBQ7Lw5XiED/qfT0hwBNUYL/aIEWPG65QXxMvDkF+2Ded
 Ei70uF5tNUUcPyF4CSqNOU4E8R9aDVpxI/IWkPjHu69pNyXekTrEYkvYtrcERT7PwxXK
 y8Ew==
X-Gm-Message-State: AOAM532AavRuRJSCwXPdU0QWRVSrlwT1xt1moRRY1k9GtK3MJEJ7DGD/
 EgC7gmXYetA4frqOix8HncMXJgyQ70Y9FsjjRhyMSUJUs+qO+qMYQ+SvQphrBzbmS1Vz7BNgLb+
 lumA3WmNbjv6EEXlW4fPAxE5/sD0gmBAhA+9sIJC2Vq7Luzy32uHbMObs8W7asX6e
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr14477126wmr.179.1612788853406; 
 Mon, 08 Feb 2021 04:54:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVCqFx0Cvquv3UOBS8S8nQSJ4WVcTJ2r/cQjKVX8Lt4jENgaScQ/O4uQ5c6Kz5FJCMO3qUUg==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr14477099wmr.179.1612788853189; 
 Mon, 08 Feb 2021 04:54:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b19sm20103858wmj.22.2021.02.08.04.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 04:54:12 -0800 (PST)
Subject: Re: [PATCH v16 21/23] accel: introduce new accessor functions
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-22-cfontana@suse.de>
 <2bb1cba6-e1a0-80a7-4c05-fb221f4f8230@linaro.org>
 <16c471e4-06a9-92bf-2d6f-0da0b0fc5a50@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <055de896-2354-ebce-baed-11c801e53964@redhat.com>
Date: Mon, 8 Feb 2021 13:54:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <16c471e4-06a9-92bf-2d6f-0da0b0fc5a50@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 1:50 PM, Claudio Fontana wrote:
> On 2/5/21 9:14 PM, Richard Henderson wrote:
>> On 2/4/21 6:39 AM, Claudio Fontana wrote:
>>> @@ -6725,10 +6722,8 @@ static void x86_cpu_initfn(Object *obj)
>>>          x86_cpu_load_model(cpu, xcc->model);
>>>      }
>>>  
>>> -    /* if required, do the accelerator-specific cpu initialization */
>>> -    if (cc->accel_cpu) {
>>> -        cc->accel_cpu->cpu_instance_init(CPU(obj));
>>> -    }
>>> +    /* if required, do accelerator-specific cpu initializations */
>>> +    accel_cpu_instance_init(CPU(obj));
>>>  }
>>
>> Why is this only done for x86?
>>
>>
>> r~
>>
> 
> It makes sense to include the other architectures.
> 
> As the next step I would like to apply this to ARM, but to me it makes sense to first complete Philippe's series,
> which reshuffles things so that TCG-only / KVM-only builds are both possible and error-free:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777627.html

TBH this series is very unlikely to be merged before yours,
so go ahead... (eventually you can cherry-pick what you need
from it).


