Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A41A12B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 19:28:47 +0200 (CEST)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLs1m-0004ly-7O
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 13:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLs10-0004Mk-FP
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 13:27:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLs0z-00063h-0A
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 13:27:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51589
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLs0y-000636-Sx
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 13:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586280476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MmrCcqoBQeB7m+MLa5IlYlJifU3xKGR78XHv/5QTbQ=;
 b=TtFBToMpq122rSmqtbL1jaFCT4vrdBJHTKelRSUVZ7r6HQeBGec8zgVqev6TP7iT78/jn2
 7YHGmIzDecfvssBMRUE0sX+PzDU/9IuD2zlx3SEpBq80XUrcrvOaoaRHTJIowA1OmMDUgB
 zKXGIsGY0CPBRWqvZeh+Zkpoiy5tLNs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-nQUz0yorNQq_S7f7ylktRg-1; Tue, 07 Apr 2020 13:27:52 -0400
X-MC-Unique: nQUz0yorNQq_S7f7ylktRg-1
Received: by mail-ed1-f72.google.com with SMTP id w6so4068475edq.3
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 10:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SeX1gMHX2RM6mfLUysGP2j+o9yioNwDT4EYaPV4vOHs=;
 b=gYLtbWB/jVxAS/OV+m/FZT7WGRovwItJa2muDlWmtJNgxkTG5BBQ3FyFQMlabal3Hd
 4ZiCkHiBryYaIzBtZ6nBiTOltcTsEO07PxiZ/n+XJ5QwMZ6EA3dMBeDEUna0m5pN7MMb
 p067uTWIbneO+yzjj/YpBL6beWo9ZkTUyykdhlwq/AtHUjHg3tI/oq2A0xLVivZJPREx
 HGXt8rHRUoKKpIy0kEDheGdx3vb3+b3VhyjbpFER0nuO1i01LjlW2RsOryxto/eWKVV8
 RBWcpJqhX4DF5tPhO/xloTTiReVIPim49HgEpJeGPm0z5eYPrevd/SJueHT/Ts04BlzG
 BhcQ==
X-Gm-Message-State: AGi0PuZcl0cLWBRAZ8VJ+g+9gavxA+7T3fFqesWq8wQZI5fj75qN/Ddx
 XCw5HYOxmUrHmC6bXIETwIy8YBZQJgklNHymx9NhJk+sGL39TugBawO1+l9bUpOko7t6IxMBn3f
 hPkqvyDg0Q+0NXg0=
X-Received: by 2002:a17:907:4334:: with SMTP id
 ni4mr3114068ejb.304.1586280471644; 
 Tue, 07 Apr 2020 10:27:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypKXtlAXj5BcJUTrv5F92hxps9P477RZ+Vgk4oFqP/jvbQvGAyTKLWxBUVUG25/DqiF8qKuLTw==
X-Received: by 2002:a17:907:4334:: with SMTP id
 ni4mr3114035ejb.304.1586280471308; 
 Tue, 07 Apr 2020 10:27:51 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id t3sm924055ejr.6.2020.04.07.10.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2020 10:27:50 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v2 48/54] scripts/coccinelle: Use &error_abort in
 TypeInfo::instance_init()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-49-f4bug@amsat.org>
 <04663728-06f3-85bf-74b7-45184f90aa0a@virtuozzo.com>
 <ac7213fd-3ea2-e80c-7308-5f2de02c341c@redhat.com>
 <ae9ced39-f039-ffb5-b33b-df93b0f35e36@virtuozzo.com>
 <ffd970c9-c8f3-b6c4-3592-cbace296f986@redhat.com>
Message-ID: <50d08d50-3ce2-2ee1-7529-5cfbfbcc5331@redhat.com>
Date: Tue, 7 Apr 2020 19:27:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ffd970c9-c8f3-b6c4-3592-cbace296f986@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/20 3:07 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/7/20 3:01 PM, Vladimir Sementsov-Ogievskiy wrote:
>> 07.04.2020 14:03, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 4/7/20 9:07 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> 06.04.2020 20:47, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> The instance_init() calls are not suppose to fail. Add a
>>>>> Coccinelle script to use &error_abort instead of ignoring
>>>>> errors by using a NULL Error*.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>> ---
>>>>> =C2=A0 .../use-error_abort-in-instance_init.cocci=C2=A0=C2=A0=C2=A0 |=
 52=20
>>>>> +++++++++++++++++++
>>>>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
>>>>> =C2=A0 2 files changed, 53 insertions(+)
>>>>> =C2=A0 create mode 100644=20
>>>>> scripts/coccinelle/use-error_abort-in-instance_init.cocci
>>>>>
>>>>> diff --git=20
>>>>> a/scripts/coccinelle/use-error_abort-in-instance_init.cocci=20
>>>>> b/scripts/coccinelle/use-error_abort-in-instance_init.cocci
>>>>> new file mode 100644
>>>>> index 0000000000..8302d74a0c
>>>>> --- /dev/null
>>>>> +++ b/scripts/coccinelle/use-error_abort-in-instance_init.cocci
>>>>> @@ -0,0 +1,52 @@
>>>>> +// Use &error_abort in TypeInfo::instance_init()
>>>>> +//
>>>>> +// Copyright: (C) 2020 Philippe Mathieu-Daud=C3=A9
>>>>> +// This work is licensed under the terms of the GNU GPLv2 or later.
>>>>> +//
>>>>> +// spatch \
>>>>> +//=C2=A0 --macro-file scripts/cocci-macro-file.h --include-headers \
>>>>> +//=C2=A0 --sp-file=20
>>>>> scripts/coccinelle/use-error_abort-in-instance_init.cocci \
>>>>> +//=C2=A0 --keep-comments --in-place
>>>>> +//
>>>>> +// Inspired by=20
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg692500.html
>>>>> +// and=20
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg693637.html
>>>>> +
>>>>> +
>>>>> +@ has_qapi_error @
>>>>> +@@
>>>>> +=C2=A0=C2=A0=C2=A0 #include "qapi/error.h"
>>>>> +
>>>>> +
>>>>> +@ match_instance_init @
>>>>> +TypeInfo info;
>>>>> +identifier instance_initfn;
>>>>> +@@
>>>>> +=C2=A0=C2=A0=C2=A0 info.instance_init =3D instance_initfn;
>>>>> +
>>>>> +
>>>>> +@ use_error_abort @
>>>>> +identifier match_instance_init.instance_initfn;
>>>>> +identifier func_with_error;
>>>>> +expression parentobj, propname, childobj, size, type, errp;
>>>>> +position pos;
>>>>> +@@
>>>>> +void instance_initfn(...)
>>>>> +{
>>>>> +=C2=A0=C2=A0 <+...
>>>>> +(
>>>>> +=C2=A0=C2=A0 object_initialize_child(parentobj, propname,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 childobj, size, type,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 errp, NULL);
>>
>> I think, it doesn't actually differs from just=20
>> object_initialize_child(..., NULL); and you don't need all these=20
>> metavaraibles
>>
>>>>> +|
>>>>> +=C2=A0=C2=A0 func_with_error@pos(...,
>>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NULL);
>>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &error_abort);
>>>>> +)
>>>>
>>>>
>>>> Hmm. I don't follow, what are you trying to achieve by this ( | )=20
>>>> construction? The second pattern (func_with_error...) will be=20
>>>> matched anyway, with or without first pattern=20
>>>> (object_initialize_child...) matched. And first pattern does nothing.
>>>
>>> Expected behavior :)
>>>
>>> If object_initialize_child() matched:
>>> =C2=A0=C2=A0 do nothing.
>>> Else:
>>> =C2=A0=C2=A0 transform.
>>
>> Ah, understand, thanks. Checked, it works.
>>
>> Possibly simpler way is just define func_with_errno identifier like this=
:
>>
>> identifier func_with_error !=3D object_initialize_child;

Thanks for the tip Vladimir, I simplified as:

@ use_error_abort @
identifier match_instance_init.instance_initfn;
identifier func_with_error !=3D {qbus_create_inplace,=20
object_initialize_child};
position pos;
@@
void instance_initfn(...)
{
    <+...
    func_with_error@pos(...,
-                           NULL);
+                           &error_abort);
    ...+>
}

BTW do you know how to automatically add an include ("qapi/error.h" below)?

>>
>>>
>>>>
>>>>
>>>>> +=C2=A0=C2=A0 ...+>
>>>>> +}
>>>>> +
>>>>> +
>>>>> +@script:python depends on use_error_abort && !has_qapi_error@
>>>>> +p << use_error_abort.pos;
>>>>> +@@
>>>>> +print('[[manual edit required, %s misses #include=20
>>>>> "qapi/error.h"]]' % p[0].file)
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 14de2a31dc..ae71a0a4b0 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -2059,6 +2059,7 @@ F: scripts/coccinelle/error-use-after-free.cocc=
i
>>>>> =C2=A0 F: scripts/coccinelle/error_propagate_null.cocci
>>>>> =C2=A0 F: scripts/coccinelle/remove_local_err.cocci
>>>>> =C2=A0 F: scripts/coccinelle/simplify-init-realize-error_propagate.co=
cci
>>>>> +F: scripts/coccinelle/use-error_abort-in-instance_init.cocci
>>>>> =C2=A0 F: scripts/coccinelle/use-error_fatal.cocci
>>>>> =C2=A0 F: scripts/coccinelle/use-error_propagate-in-realize.cocci
>>>>>
>>>>
>>>>
>>>
>>
>>


