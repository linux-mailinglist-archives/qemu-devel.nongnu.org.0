Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C78237092F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:25:23 +0200 (CEST)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcy37-00087O-Q1
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcy24-0007ZU-Nb
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcy22-0000Oe-7H
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619907853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MuaLmZ9c8TYz83S97fJohihh8jWN2HtbczG9ZHrqjk=;
 b=Oa0WVuwi72Ads+CYs4zWXTu6NgA8uztMl6pn0+qjhUFfPM07wWSYKsmlh80VIZvphtmYp1
 QYrokWkKgol3PIyw8tlvndnhBv3tu07cKDUrTf1n/3NVLs3aabkWizIFssUSEc16pqCdXR
 5u2cy8nhnBkP0O2T7IpYX/HDFG6uQXE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-dUGyeQ7kNGq_G4saajlUsw-1; Sat, 01 May 2021 18:24:11 -0400
X-MC-Unique: dUGyeQ7kNGq_G4saajlUsw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so1251598wre.22
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9MuaLmZ9c8TYz83S97fJohihh8jWN2HtbczG9ZHrqjk=;
 b=oQdOHnJFewJ5HSnC1VivcT2QgjZhsZXIlpp3QQ4+oaI65WtE6JRRA+tfTcVQjsJvVx
 TQGaK++w/nhArtaqStc+LYr3FQSIfUBpgGsqalqSAJXVp5iJcXbQfA8rwyqnpBBCPeHI
 UiTgo1E17MFonfuULJG1PZg1BTZNWX6sQ+Y7dRlSoU9vZg7eq5FP8daiVaW/ogleyBlg
 SpwwUcuvNA4twwP6kmhk0vjuQTl+I1NAkk6M2Zq6o85oZVFESoqTiiJ3qGyaTYJf/tZM
 yMpLA723dyGQWHG6EF1jDBV0seL1pe8BvNsi3tIsrt2TvNiPdTXeKgWNK6wLKvmWMSCc
 kuUA==
X-Gm-Message-State: AOAM533M2862ksS9KuUJP7kDrJy4S2/5eBhNRWfBjOTFVQdz6/QpM6fp
 NcR1s5Xi2O3wsH3YPZGDYCiN+7QreWhzSFRMA0QF3Q+7NGde4MuzGpX0Vv4TVEdPW03fsTOQqjz
 HjLxHiGQ5tviZq4I=
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr16012595wro.293.1619907850526; 
 Sat, 01 May 2021 15:24:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBgzwQH6BGEtBRcAGRbRMWzMX34TEakgD8Ib2ErTFvdp2WP5Fv9mSgKagxGkaLDoWjFESjJQ==
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr16012567wro.293.1619907850340; 
 Sat, 01 May 2021 15:24:10 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id l25sm6728390wmi.17.2021.05.01.15.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 15:24:09 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] accel: Introduce 'query-accels' QMP command
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-3-philmd@redhat.com>
 <2f6ef548-cff4-273f-5680-f79bda85e197@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b126892b-de53-bfe0-33fe-4757797affda@redhat.com>
Date: Sun, 2 May 2021 00:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2f6ef548-cff4-273f-5680-f79bda85e197@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 9:03 PM, Eric Blake wrote:
> On 4/15/21 11:32 AM, Philippe Mathieu-Daudé wrote:
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
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Since v3: Simplify over-engineered AcceleratorInfo (Markus, kept Eric R-b)
>> Since v2: @since 6.0 -> 6.1, added note (Eric)
>> Since v1: 'type' -> 'name' in comments
> 
>> +++ b/qapi/machine.json
>> @@ -1274,3 +1274,50 @@
>>  ##
>>  { 'event': 'MEM_UNPLUG_ERROR',
>>    'data': { 'device': 'str', 'msg': 'str' } }
>> +
>> +##
>> +# @Accelerator:
>> +#
>> +# An enumeration of accelerator names.
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'enum': 'Accelerator',
>> +  'data': [ 'qtest', 'tcg', 'kvm', 'hax', 'hvf', 'whpx', 'xen' ] }
> 
> There's no requirement for enums to be in any order, although if the
> list is likely to get larger over time, lexicographic order makes it
> easier to know where to insert new entries.  Up to you whether it is
> worth sorting, and your decision does not invalidate my R-b.

OK will do, thanks!


