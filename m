Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E472438C389
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 11:41:44 +0200 (CEST)
Received: from localhost ([::1]:46004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk1f5-0006Yh-RH
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 05:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk1da-0005Jt-H6
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk1dX-0007ng-FB
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621590005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtTjoCbt0Q+wjbo9sZ1I95VKzqUM35tSuExMYQ2HZFU=;
 b=i/QoCdBYxQEwutrJyJz+yO0+4yAJnsj6WNibYDWCO3B34tEGgYzN2jYpwnM2FxqC89UJ1R
 9NoxAsL4/ureSA6frMTY2siFcYkJ4+rOU0AGKEt9fULx7eDKAk8TeYe6plt5ft3C8O5pWY
 Fqp5qawpSm9awAELIbx/+WI30Vr/h00=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-BTpmU_KQMnqUHBEnLWkPKA-1; Fri, 21 May 2021 05:40:01 -0400
X-MC-Unique: BTpmU_KQMnqUHBEnLWkPKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b206-20020a1c1bd70000b02901713122405eso2616765wmb.1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 02:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GtTjoCbt0Q+wjbo9sZ1I95VKzqUM35tSuExMYQ2HZFU=;
 b=sAo3+D8/u2IgW27k5e/EwvrhOONb1alsclPUZO3qcVmLuJWn7Oeuvjqtfc3e3SGwoB
 8kPrqpwHiYg8YKLWJPbmJAal+G+T1clw+aCQqea2xiQlv1v5Tler3gSRpXG1q+JPoS2t
 Nsa66wPfsIxHguhKY0QqIl8jxTDTDALM7oobzuJ6DF7c5SOBkgHJu0tlpbKVUy3UqObK
 QmDrJPetfIVlszdJRkEDYWF76WPkxs7WA85yVOstQUShaqG4Qp5lmHe5GMtGv5Je8TjH
 GF7P7GZP9i5Bsi+XsMcx3EAO0RFYtB8F7AeoJkT5Q2QN3QxDdleHJzE+UszHN6xVjYUh
 asGQ==
X-Gm-Message-State: AOAM531eJDcBA0AxfIEdV4F+nIwYOzaPzYrNVxb2d0fOY10Ok01cRgZN
 /fhLNPhe+VTSP8qXE/0iZrak+Er0uiCm5ln2omqIgZbkqvUNKpYVVFplci8/MEW4LsAT6Iajka4
 eAL5UO2QNnit4j+g=
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr8945963wru.396.1621590000843; 
 Fri, 21 May 2021 02:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4UKPWfoz3RzquMyJnQ+0jSkFSxj3kP69yVbc3AmYgpmAm9JodMD/TVzHHVnmq9eWci2PZow==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr8945944wru.396.1621590000669; 
 Fri, 21 May 2021 02:40:00 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v11sm1794897wrs.9.2021.05.21.02.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 02:40:00 -0700 (PDT)
Subject: Re: [PATCH v7 02/12] accel: Introduce 'query-accels' QMP command
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
 <20210505125806.1263441-3-philmd@redhat.com>
 <20210505194103.bwdjnbanrdwcvrxo@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <53bb31b6-9e1a-0972-e022-0ce732e82caa@redhat.com>
Date: Fri, 21 May 2021 11:39:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505194103.bwdjnbanrdwcvrxo@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 9:41 PM, Eduardo Habkost wrote:
> On Wed, May 05, 2021 at 02:57:56PM +0200, Philippe Mathieu-Daudé wrote:
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
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "name": "qtest"
>>             },
>>             {
>>                 "name": "kvm"
>>             }
>>         ]
>>     }
>>
>> Note that we can't make the enum values or union branches conditional
>> because of target-specific poisoning of accelerator definitions.
> 
> I assume this will be clarified in v8, based on your reply to v5.
> I don't understand what "target-specific poisoning of accelerator
> definitions" means.

$ git grep poison
...
include/exec/poison.h:88:#pragma GCC poison CONFIG_HAX
include/exec/poison.h:89:#pragma GCC poison CONFIG_HVF
include/exec/poison.h:90:#pragma GCC poison CONFIG_LINUX_USER
include/exec/poison.h:91:#pragma GCC poison CONFIG_KVM
include/exec/poison.h:92:#pragma GCC poison CONFIG_SOFTMMU
include/exec/poison.h:93:#pragma GCC poison CONFIG_WHPX
include/exec/poison.h:94:#pragma GCC poison CONFIG_XEN

I thought QAPI was target agnostic, but I just found:

  if module.endswith('-target')
    qapi_specific_outputs += qapi_module_outputs

  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])

So instead of adding this to qapi/machine.json I'll see
if I can add it to qapi/machine-target.json and use
conditionals.


