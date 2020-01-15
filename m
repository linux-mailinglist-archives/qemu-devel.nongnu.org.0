Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0937213C5E2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 15:24:55 +0100 (CET)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irjbJ-0000GK-EC
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 09:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1irja8-0007hT-2i
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 09:23:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1irja4-00045e-2O
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 09:23:38 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25431
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1irja1-0003wm-Fc
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 09:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579098208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1wJb2wTQkhpKr33xMbYrNPpEuN/e+heYFw5FlSNOpI=;
 b=S4H3nwNDbMdGKLoqBkAl6iycKb5V7QUS9RHfY57Niqnl97uzHTfRHPXASmUUc4vaIJTLxd
 L5me3dV7sbMkEWjB6ZtrnAaRcEBRPuBFyklBDSLs+EWeSwSvYugSQVQu4EFx94bahAw12Q
 hv43cvvbZbHPyH3U512NVjiH2cEil2o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-YBrqsXVKOmax69H1AXCcrQ-1; Wed, 15 Jan 2020 09:23:26 -0500
Received: by mail-wr1-f71.google.com with SMTP id o6so8017566wrp.8
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 06:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VeYd4OkPQ1qdfI+5grGWexExr4iYypGx1wm2p22P4kI=;
 b=nY1lBhszlSlfAw8OXfSgGsSlGhSJDd18of2GzAc1GqDWpXK9QQEiky/eAm0W+KZCyu
 XKcMuOUMP5E3n9zA0UqsCPnXo3J6sKN5Lbxs1/yw2wDIrdcXpRo4l0JU9QMdBhST8KTu
 GpEeNaeZ2HJRks73vQ1Vv7nsxnOLE5JipBuCMMC2LIXZ7JYhcCAd8GxA8aj5afN58gIe
 tDuoM/YX0g2qGPRubfmWyv1B2ihShdZEDFMAx29BDky4XHNGHMDfRjX5Xc9dx5eBeuMr
 zk/Js3BzeshdaVjep2R4fPeFsIxDTgjXHL6SBY2QzCbmckTNkyzKK9ZvfiWSV9nMsuPR
 jNPw==
X-Gm-Message-State: APjAAAU1VvJYQZvIlhBjNS8KDMN+PRc3KMqOtR9Oq6WtvCmtxOggJtri
 Ps6rLSQl+BUIRBxFDBiViF4akZQ9KVK011Ne9lzMZJqa8ma8b+JBjLPLHNM0su/NJPn8tWgDhOD
 eEeYRwNTCt/exNek=
X-Received: by 2002:a1c:8116:: with SMTP id c22mr33149291wmd.27.1579098205389; 
 Wed, 15 Jan 2020 06:23:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZFZv6mR3tjBf3nEcjKPJ5GKrMxIgdRzXz43kP8Mk4F5bmg8cTQkdzfYGFX8fq2tQoJ2hllQ==
X-Received: by 2002:a1c:8116:: with SMTP id c22mr33149271wmd.27.1579098205168; 
 Wed, 15 Jan 2020 06:23:25 -0800 (PST)
Received: from [192.168.1.24] (lfbn-mon-1-1519-115.w92-167.abo.wanadoo.fr.
 [92.167.83.115])
 by smtp.gmail.com with ESMTPSA id f207sm3965wme.9.2020.01.15.06.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 06:23:24 -0800 (PST)
Subject: Re: [PATCH] qcow2: Use a GString in report_unsupported_feature()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200114145437.28382-1-berto@igalia.com>
 <87blr5nc6z.fsf@linaro.org> <b9059159-9d86-fbb6-71a1-51b1dfc3aab7@redhat.com>
 <878sm9n2lo.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <67d95f87-f9d0-4f98-3bf4-32a573ea72d7@redhat.com>
Date: Wed, 15 Jan 2020 15:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <878sm9n2lo.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: YBrqsXVKOmax69H1AXCcrQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/20 10:35 PM, Alex Benn=C3=A9e wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> On 1/14/20 7:08 PM, Alex Benn=C3=A9e wrote:
>>> Alberto Garcia <berto@igalia.com> writes:
>>>
>>>> This is a bit more efficient than having to allocate and free memory
>>>> for each item.
>>>>
>>>> The default size (60) is enough for all the existing incompatible
>>>> features.
>>>>
>>>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>>>> ---
>>>>    block/qcow2.c | 24 ++++++++++++------------
>>>>    1 file changed, 12 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/block/qcow2.c b/block/qcow2.c
>>>> index cef9d72b3a..ecf6827420 100644
>>>> --- a/block/qcow2.c
>>>> +++ b/block/qcow2.c
>>>> @@ -453,16 +453,15 @@ static void cleanup_unknown_header_ext(BlockDriv=
erState *bs)
>>>>    static void report_unsupported_feature(Error **errp, Qcow2Feature *=
table,
>>>>                                           uint64_t mask)
>>>>    {
>>>> -    char *features =3D g_strdup("");
>>>> -    char *old;
>>>> +    GString *features =3D g_string_sized_new(60);
>>>          g_autoptr(GString) features =3D g_string_sized_new(60);
>>> will save you the clean-up later.
>>
>> Does this work with g_string_free() too?
>=20
> It does:
>=20
> static inline void g_autoptr_cleanup_gstring_free (GString *string)
> {
>          if (string)
>             g_string_free (string, TRUE);
> }

The implicit use of free_segment=3DTRUE was not obvious to me.
Thanks for checking it in glib source.

> If you want to keep the allocated string but drop the GString you are
> still best doing that yourself.

I agree. I asked because I had the other patch from Alberto in mind:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg669862.html

In this case we can not use the g_autoptr feature.

>>>>          while (table && table->name[0] !=3D '\0') {
>>>>            if (table->type =3D=3D QCOW2_FEAT_TYPE_INCOMPATIBLE) {
>>>>                if (mask & (1ULL << table->bit)) {
>>>> -                old =3D features;
>>>> -                features =3D g_strdup_printf("%s%s%.46s", old, *old ?=
 ", " : "",
>>>> -                                           table->name);
>>>> -                g_free(old);
>>>> +                if (features->len > 0) {
>>>> +                    g_string_append(features, ", ");
>>>> +                }
>>>> +                g_string_append_printf(features, "%.46s",
>>>>        table->name);
>>> We have a number of cases of this sort of idiom in the code base. I
>>> wonder if it calls for a utility function:
>>>          qemu_append_with_sep(features, ", ", "%.46s", table->name)
>>
>> Good idea for https://wiki.qemu.org/Contribute/BiteSizedTasks
>>
>>> Anyway not mandatory for this patch so with the autoptr fix:
>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>
>>>>                    mask &=3D ~(1ULL << table->bit);
>>>>                }
>>>>            }
>>>> @@ -470,14 +469,15 @@ static void report_unsupported_feature(Error **e=
rrp, Qcow2Feature *table,
>>>>        }
>>>>          if (mask) {
>>>> -        old =3D features;
>>>> -        features =3D g_strdup_printf("%s%sUnknown incompatible featur=
e: %" PRIx64,
>>>> -                                   old, *old ? ", " : "", mask);
>>>> -        g_free(old);
>>>> +        if (features->len > 0) {
>>>> +            g_string_append(features, ", ");
>>>> +        }
>>>> +        g_string_append_printf(features,
>>>> +                               "Unknown incompatible feature: %" PRIx=
64, mask);
>>>>        }
>>>>    -    error_setg(errp, "Unsupported qcow2 feature(s): %s",
>>>> features);
>>>> -    g_free(features);
>>>> +    error_setg(errp, "Unsupported qcow2 feature(s): %s", features->st=
r);
>>>> +    g_string_free(features, TRUE);
>>>>    }
>>>>      /*
>>>


