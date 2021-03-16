Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D865133DC9B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:31:53 +0100 (CET)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMETw-0003zA-QS
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDza-00008j-3n
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDzV-0001pj-NK
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615917622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/aq40AbW+M8XRbGim5Lfa5I8urvhxjNhOkLiGDZN2s=;
 b=TsQH9Dor3bNQj+mynQikZevs4SNgI2gm2SGcKwZWjWaMXL9RDRwc/LEdjhHXeCiX5kAMB7
 HWTvybxplRXxyRsA5eZAY7XsCM0MfMr2E4rw+QOsoCUq14q++imLQHw43VCRWUB9XWc8qy
 XN6RwjDNQvhXcdubzYWrGHKTf8HQ5Rw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-1Jo4w-drMAm_z8JIJtSi4Q-1; Tue, 16 Mar 2021 14:00:18 -0400
X-MC-Unique: 1Jo4w-drMAm_z8JIJtSi4Q-1
Received: by mail-wr1-f69.google.com with SMTP id n16so15987941wro.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 11:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H/aq40AbW+M8XRbGim5Lfa5I8urvhxjNhOkLiGDZN2s=;
 b=p+dberYtYEWM3G1vJo8jMu0dcnAwNZr49OOypjqFMlqTlVcZZ/Z7VGk9xvaBC1N6mj
 jTKmqaH6vkH1z/yh8fgaWLV7xJH92OcsMSBIBOt10f9PbMzTR3AIoe9YbQRmBLaZI5Bz
 EDBCPrHWyU92j2lFu79zA57/Vr/S0VSAvaT4fPqCf3Ymq1zqHxz7pyKQu6/NdR5kN/Wv
 q0rDCBtO7J5oQ2mofQNZtrvj1aQjZ7IG6ezkhci7s5wvqe6rLFtR+l9N1T8ZHmCB+7zt
 OFoKeXKdlnwEO1Uz1c8r6dPdC3SohJVQAaHKLn6urOa1SQ7WWTxW+X3vqRuTpiGVAeDi
 KLzQ==
X-Gm-Message-State: AOAM530Pl4+wvT3O9OhXJ+LbtAil/F2OiBi9dpWGIOrNsNKn6g4xV3Wf
 4kUOJB3he2452tBi00wjOg4awQzlkgREl//V1EBhU6wUDs0o2pJocSkG9UcWWBd6lg1qGwXG6TI
 vXXAsYuNfCPtxmGA=
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr197195wrx.353.1615917617703; 
 Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcShq8UUHWLSbiLLETDYeOZPyQLOo2KXL89dgQChsvxJ43RRppTny8zwXZQ4/MTeQ7vI+ISw==
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr197167wrx.353.1615917617509; 
 Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u4sm24297120wrm.24.2021.03.16.11.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] accel: Introduce 'query-accels' QMP command
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210316172449.3148634-1-philmd@redhat.com>
 <20210316172449.3148634-2-philmd@redhat.com>
 <6f87212e-d00f-751e-1a2c-1dd4950698dc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c6bc96c9-80c1-8fbe-4fa8-9fcaf561a7e5@redhat.com>
Date: Tue, 16 Mar 2021 19:00:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6f87212e-d00f-751e-1a2c-1dd4950698dc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 6:29 PM, Eric Blake wrote:
> On 3/16/21 12:24 PM, Philippe Mathieu-Daudé wrote:
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Since v1: 'type' -> 'name' in comments
>> ---
>>  qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
>>  accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++
>>  accel/meson.build |  2 +-
>>  3 files changed, 105 insertions(+), 1 deletion(-)
>>  create mode 100644 accel/accel-qmp.c
>>
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 330189efe3d..610252fc25c 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1471,3 +1471,58 @@
>>  ##
>>  { 'event': 'MEM_UNPLUG_ERROR',
>>    'data': { 'device': 'str', 'msg': 'str' } }
>> +
>> +##
>> +# @Accelerator:
>> +#
>> +# An enumeration of accelerator names.
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'enum': 'Accelerator',
>> +  'data': [ { 'name': 'qtest' },
>> +            { 'name': 'tcg' },
>> +            { 'name': 'kvm' },
>> +            { 'name': 'hax' },
>> +            { 'name': 'hvf' },
>> +            { 'name': 'whpx' },
>> +            { 'name': 'xen' } ] }
> 
> Shorter, but semantically equivalent:
> { 'enum': 'Accelerator', 'data': [ 'qtest', 'tcg', ... ] }
> 
> I'd mention in the commit message body that we can't make the enum
> values or union branches conditional because of target-specific
> poisoning.

Good idea.

> With that,
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> If we're trying to get it into 6.0, it is a new feature, and so we
> should get it in a pull request before feature freeze today.  Otherwise
> we'll have to s/6.0/6.1/

There is no rush for this, I posted it to scratch it from my today's
TODO list and be able to focus on the next task.

I'll wait for other review and repost with 6.1 (except if someone judge
it is useful to get this for 6.0).

Thanks for your review!

Phil.


