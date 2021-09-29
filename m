Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83C41BF0F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 08:19:41 +0200 (CEST)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVSwN-0003NW-M9
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 02:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVSv4-0002Yr-5U
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 02:18:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVSv1-0004nq-3i
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 02:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632896293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKTNtD/l2SH330Bsfw9/g03xATVj+75Elsx8/sTygvk=;
 b=gpYD5o+9vzk2LBrkD5r+1+blqq4BG13H1F2rIx4vcsfm97MDfX8rfBt4mLYJHOuAuDRBAh
 TMUEjBMyP9ts1xbZBBEn3tK8BhACZsTOxfHu1yfBwgI2DSKiQiHQ8lhxUTbjP9DgKQpdxz
 i2L/5Vju34sz1XpuDc00ksQDmTpvhzs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-O0XMzfYdPUeIXYDJRSoq_Q-1; Wed, 29 Sep 2021 02:18:01 -0400
X-MC-Unique: O0XMzfYdPUeIXYDJRSoq_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so717705wmc.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 23:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nKTNtD/l2SH330Bsfw9/g03xATVj+75Elsx8/sTygvk=;
 b=sml0x0kQKDZcbFGeLyt3CyfvIytYAhG9hDgyKh6wLbREu/GX/Vg84TuzRm3TIUxudx
 1lrLH4Fth9BJglTITmivQJJUu8mG8gKUS1FDi4AKHcog1F21CXQ/vUOGE/n6no9UWr7N
 drSEZWkLYxlzsSzFQTXeFbSjbmBKv4Fp9JUtuyh6X0088eachp2zDsoqv6IkVc++J3vp
 mrBKv79dJz2tucG0qwc/573LlwkquR8gFDRupf2U2WBPpVXvYuunL7PXY11wPd9mRZdU
 AXZmjEjwsYsOZ0LkGA05Jig73ifXmo8hCriCcu0/uX6u+utjxJ69ABVcwV4tLkbnqWZ/
 GJJw==
X-Gm-Message-State: AOAM532XaD3iwb1lGVJVvFg87A/ZpM6FtjyWVnkGzm3RVB9yC3GuXWQo
 FGHZUkVsmZtG+sov2ml0UdEsPOv8mIYGjj4dGn2WdOcCjvpZc0Pj24jV89LXRLENZJpgYfqf26j
 CFQNgtGfl3NEIZL4=
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr8533607wmp.73.1632896280358; 
 Tue, 28 Sep 2021 23:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy92sMWXJu4T63e0Qe8pesbCEf9Db7rxwmqpUtljHdL9E1zhBEbIujrwEF033IHxYK6j66SRg==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr8533585wmp.73.1632896280153; 
 Tue, 28 Sep 2021 23:18:00 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id i1sm1174176wrb.93.2021.09.28.23.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 23:17:59 -0700 (PDT)
Subject: Re: [PATCH] qapi: Make some ObjectTypes depend on the build settings
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210928160232.432980-1-thuth@redhat.com>
 <c85745b0-d913-5f64-4c08-c2d03542107e@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0ddcdd25-55d9-f782-2bc3-a11d7078b337@redhat.com>
Date: Wed, 29 Sep 2021 08:17:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c85745b0-d913-5f64-4c08-c2d03542107e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/2021 19.39, Philippe Mathieu-Daudé wrote:
> On 9/28/21 18:02, Thomas Huth wrote:
>> Some of the ObjectType entries already depend on CONFIG_* switches.
>> Some others also only make sense with certain configurations, but
>> are currently always listed in the ObjectType enum. Let's make them
>> depend on the correpsonding CONFIG_* switches, too, so that upper
>> layers (like libvirt) have a better way to determine which features
>> are available in QEMU.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   qapi/qom.json | 30 ++++++++++++++++++++----------
>>   1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index a25616bc7a..78b60433a9 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -777,7 +777,8 @@
>>       'authz-pam',
>>       'authz-simple',
>>       'can-bus',
>> -    'can-host-socketcan',
>> +    { 'name': 'can-host-socketcan',
>> +      'if': 'CONFIG_LINUX' },
>>       'colo-compare',
>>       'cryptodev-backend',
>>       'cryptodev-backend-builtin',
>> @@ -791,20 +792,24 @@
>>       'filter-replay',
>>       'filter-rewriter',
>>       'input-barrier',
>> -    'input-linux',
>> +    { 'name': 'input-linux',
>> +      'if': 'CONFIG_LINUX' },
>>       'iothread',
>>       'memory-backend-file',
>>       { 'name': 'memory-backend-memfd',
>>         'if': 'CONFIG_LINUX' },
>>       'memory-backend-ram',
>>       'pef-guest',
>> -    'pr-manager-helper',
>> +    { 'name': 'pr-manager-helper',
>> +      'if': 'CONFIG_LINUX' },
>>       'qtest',
>>       'rng-builtin',
>>       'rng-egd',
>> -    'rng-random',
>> +    { 'name': 'rng-random',
>> +      'if': 'CONFIG_POSIX' },
>>       'secret',
>> -    'secret_keyring',
>> +    { 'name': 'secret_keyring',
>> +      'if': 'CONFIG_SECRET_KEYRING' },
>>       'sev-guest',
>>       's390-pv-guest',
>>       'throttle-group',
>> @@ -835,7 +840,8 @@
>>         'authz-listfile':             'AuthZListFileProperties',
>>         'authz-pam':                  'AuthZPAMProperties',
>>         'authz-simple':               'AuthZSimpleProperties',
>> -      'can-host-socketcan':         'CanHostSocketcanProperties',
>> +      'can-host-socketcan':         { 'type': 'CanHostSocketcanProperties',
>> +                                      'if': 'CONFIG_LINUX' },
>>         'colo-compare':               'ColoCompareProperties',
>>         'cryptodev-backend':          'CryptodevBackendProperties',
>>         'cryptodev-backend-builtin':  'CryptodevBackendProperties',
>> @@ -849,19 +855,23 @@
>>         'filter-replay':              'NetfilterProperties',
>>         'filter-rewriter':            'FilterRewriterProperties',
>>         'input-barrier':              'InputBarrierProperties',
>> -      'input-linux':                'InputLinuxProperties',
>> +      'input-linux':                { 'type': 'InputLinuxProperties',
>> +                                      'if': 'CONFIG_LINUX' },
>>         'iothread':                   'IothreadProperties',
>>         'memory-backend-file':        'MemoryBackendFileProperties',
>>         'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
>>                                         'if': 'CONFIG_LINUX' },
>>         'memory-backend-ram':         'MemoryBackendProperties',
>> -      'pr-manager-helper':          'PrManagerHelperProperties',
>> +      'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
>> +                                      'if': 'CONFIG_LINUX' },
>>         'qtest':                      'QtestProperties',
>>         'rng-builtin':                'RngProperties',
>>         'rng-egd':                    'RngEgdProperties',
>> -      'rng-random':                 'RngRandomProperties',
>> +      'rng-random':                 { 'type': 'RngRandomProperties',
>> +                                      'if': 'CONFIG_POSIX' },
>>         'secret':                     'SecretProperties',
>> -      'secret_keyring':             'SecretKeyringProperties',
>> +      'secret_keyring':             { 'type': 'SecretKeyringProperties',
>> +                                      'if': 'CONFIG_SECRET_KEYRING' },
>>         'sev-guest':                  'SevGuestProperties',
>>         'throttle-group':             'ThrottleGroupProperties',
>>         'tls-creds-anon':             'TlsCredsAnonProperties',
>>
> 
> I quickly opened qapi/qom.json and spotted another one:
> 
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -870,3 +870,4 @@
>         'tls-cipher-suites':          'TlsCredsProperties',
> -      'x-remote-object':            'RemoteObjectProperties'
> +      'x-remote-object':            { 'type': 'RemoteObjectProperties',
> +                                      'if': 'CONFIG_MULTIPROCESS' },
>     } }

No, CONFIG_MULTIPROCESS is in config-poison.h (it's target specific), so 
that won't work here. We can only use the CONFIG switches from config-host.h 
here.

> While your change is correct, this isn't maintainable long term.
> Not sure how we could improve that :/ But having to handle similar
> information in 3 different places (configure, meson.build, qapi json)
> is error prone. Thoughts?

The current situation is just that bad since we didn't have these 'if:' 
statements in the past. For future code, I think we just have to be more 
careful during code review...
(and for configure vs. meson.build the answer is clear: Move more stuff from 
the configure script into meson.build, so that configure finally is only a 
stupid simple wrapper script)

  Thomas


