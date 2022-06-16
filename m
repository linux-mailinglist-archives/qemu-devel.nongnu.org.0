Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C2554E295
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:55:43 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pyI-0005Z1-JT
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1pSg-0004I0-Lj
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:23:02 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1pSU-0008Ul-QG
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:23:02 -0400
Received: by mail-lj1-x22b.google.com with SMTP id s10so1457386ljh.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5AovzqHFupwrAy7K6hR3DechsbCXV8xj4pQ3qCvOTmg=;
 b=AHy2RQdMKKhojXyUtoDLs8xtMRhAZA6QMEtefEKVfCzG+pKwc9GzB9IIfLF5h+Wr6G
 PnepRv6UYhw3HjEQciUMJ8owlcdKvkmK5jMeVL3vVl7Pu5eb3Bo1PLalVpO8JQ0I2Zsy
 zNKxO3HeHabvdFEGrVFS2nEVgW8Lc9/6qd/btQ5wW0yOJEJlmxbmyq7AZzwHGAx/Ea0M
 VnjaeAgP/d6VmITX+Q6nd2FnlacrllAGpLNhwSNlP1UZPLjrC5GtNhYNVmY9JW+SGkpO
 FTJ9DupjM4/OiF2Kr0e0M6RONgWYco0K4b7FCWtw6j21NJNyjkFAF6RrYcg3yWOsJm2w
 0w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5AovzqHFupwrAy7K6hR3DechsbCXV8xj4pQ3qCvOTmg=;
 b=YUJN2a/XiCuSoMEVIxcjp3MxfXsGnBzjvQ8Q/ojRBZul5wVUyxoH3Hrm19x6qF7p9u
 PQioZQYzj8ZuzhvDZ/XVhY38QxCE6h5Q4VpNKGjlUusqYGqth64OISDcZ57/4HyorRgU
 juTyvCtDE7hBEYeueNXPhvFdZDdUkK6i4uqv4sg1AYb24KduX/xiF19xnb2w0HbxOwem
 zpF+nbtMS3TPLujI3qLon1ET2KjfxCMWME9GGD/axcCiMyZcnkB/E8j3+sQmqL0bbqWy
 1KLQH6UrPQ4dD0pbQ+6/iCDeXZE6qTgjzTjqpvS+bEKiYhGYKmQDDpzzmZBOHZD3Mn9S
 srJA==
X-Gm-Message-State: AJIora/KfJV1TictG8Ff1dcBYcwG35xPKppyXKx4S3CUBxWOrYEjn63M
 LyIho0qQ63Cu8cvahghtZNK6sQ==
X-Google-Smtp-Source: AGRyM1u8UTKePQxhBtb11nRWEMfbL15WJrFx2N/tAEq8BDhuHgNvGM4AnH3CwaakTnE+A4mNqxVb4A==
X-Received: by 2002:a2e:95c8:0:b0:255:abb5:d0e7 with SMTP id
 y8-20020a2e95c8000000b00255abb5d0e7mr2471368ljh.23.1655385767472; 
 Thu, 16 Jun 2022 06:22:47 -0700 (PDT)
Received: from [192.168.0.101] ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e9941000000b00253dfbe2522sm239949ljj.100.2022.06.16.06.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 06:22:46 -0700 (PDT)
Subject: Re: [PATCH 1/8] migration: Implemented new parameter stream_content
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, 
 quintela@redhat.com, dgilbert@redhat.com
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
 <20220616102006.218693-2-nikita.lapshin@openvz.org>
 <YqsGp55KDVGtKOAH@redhat.com>
 <7d86202a-5d77-a12d-9022-5bc0315af76b@openvz.org>
 <Yqsry0i4FtC8MpnD@redhat.com>
From: Nikita <nikita.lapshin@openvz.org>
Message-ID: <67d4d19b-9086-9ada-f08d-5aa84a7623fe@openvz.org>
Date: Thu, 16 Jun 2022 16:22:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <Yqsry0i4FtC8MpnD@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/16/22 4:10 PM, Daniel P. Berrangé wrote:
> On Thu, Jun 16, 2022 at 03:53:29PM +0300, Nikita wrote:
>> On 6/16/22 1:32 PM, Daniel P. Berrangé wrote:
>>> On Thu, Jun 16, 2022 at 01:19:57PM +0300, nikita.lapshin@openvz.org wrote:
>>>> From: Nikita Lapshin <nikita.lapshin@openvz.org>
>>>>
>>>> This new optional parameter contains inormation about migration
>>>> stream parts to be sent (such as RAM, block, bitmap). This looks
>>>> better than using capabilities to solve problem of dividing
>>>> migration stream.
>>>>
>>>> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
>>>> ---
>>>>    migration/migration.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
>>>>    migration/migration.h |  2 ++
>>>>    qapi/migration.json   | 21 ++++++++++++++++---
>>>>    3 files changed, 66 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index 18e2610e88..80acf6dbc3 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -760,6 +760,12 @@
>>>>    #                        block device name if there is one, and to their node name
>>>>    #                        otherwise. (Since 5.2)
>>>>    #
>>>> +# @stream-content-list: Parameter control content of migration stream such as RAM,
>>>> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
>>>> +#                       so migration will work correctly without it.
>>>> +#                       This parameter takes string list as description of content
>>>> +#                       and include that part of migration stream. (Since 7.0)
>>>> +#
>>>>    # Features:
>>>>    # @unstable: Member @x-checkpoint-delay is experimental.
>>>>    #
>>>> @@ -780,7 +786,8 @@
>>>>               'xbzrle-cache-size', 'max-postcopy-bandwidth',
>>>>               'max-cpu-throttle', 'multifd-compression',
>>>>               'multifd-zlib-level' ,'multifd-zstd-level',
>>>> -           'block-bitmap-mapping' ] }
>>>> +           'block-bitmap-mapping',
>>>> +           'stream-content-list' ] }
>>>>    ##
>>>>    # @MigrateSetParameters:
>>>> @@ -925,6 +932,12 @@
>>>>    #                        block device name if there is one, and to their node name
>>>>    #                        otherwise. (Since 5.2)
>>>>    #
>>>> +# @stream-content-list: Parameter control content of migration stream such as RAM,
>>>> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
>>>> +#                       so migration will work correctly without it.
>>>> +#                       This parameter takes string list as description of content
>>>> +#                       and include that part of migration stream. (Since 7.0)
>>>> +#
>>>>    # Features:
>>>>    # @unstable: Member @x-checkpoint-delay is experimental.
>>>>    #
>>>> @@ -960,7 +973,8 @@
>>>>                '*multifd-compression': 'MultiFDCompression',
>>>>                '*multifd-zlib-level': 'uint8',
>>>>                '*multifd-zstd-level': 'uint8',
>>>> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>>>> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>>>> +            '*stream-content-list': [ 'str' ] } }
>>>>    ##
>>>>    # @migrate-set-parameters:
>>>> @@ -1158,7 +1172,8 @@
>>>>                '*multifd-compression': 'MultiFDCompression',
>>>>                '*multifd-zlib-level': 'uint8',
>>>>                '*multifd-zstd-level': 'uint8',
>>>> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>>>> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>>>> +            '*stream-content-list': [ 'str' ] } }
>>> These will need to be represented using an enum type rather than
>>> a string, since this value accepts a fixed pre-determined list of
>>> strings.
>>>
>>> With regards,
>>> Daniel
>> First of all thank you for your review!
>>
>> May be I misunderstood you, but is enum convenient for this purpose? List
>> for describing looks pretty good.
>>
>> Or you mean that it is better to use list of enums?
> Yes, sorry, I meant list of enums, so
>
>     '*stream-content-list': [ 'MigrationSteamContent']
>
> With regards,
> Daniel

Okay sounds good. Thank you!


Best regards,
Nikita

