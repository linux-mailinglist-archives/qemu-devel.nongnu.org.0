Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C905E9099
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 03:09:01 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocG8h-0003na-4N
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 21:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocG7F-0002MO-Lw
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 21:07:29 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocG7D-0006bA-QV
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 21:07:29 -0400
Received: by mail-qk1-x736.google.com with SMTP id h28so2316810qka.0
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 18:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=fRNdUpBL5Q1cDRMryaw2cZt94+H11yaT2Rood7S+WIY=;
 b=d1Y696eJGWwrcE6KCYcQrMT3isMeP8OZ5mrTB05VY2U3vPJ/cEfsexKmLp6uGNO0z7
 J66GBYCcnkwmpVQ/kB8HaSVdoYvkPnjCSpWexs9xRHyq47XNarkMmJX/6ZeARNWpOIuV
 jBqwn4Wo5gk688LBf5z2CsgdsJMUE3nUwqv1J5vagbps8sBGcNnGXLtheQDoDnOSrbRx
 gFRh2wcNTnLF7zoX6SofAGC3v8wFfaAH2on/yusDpedgZOKL1hTzthVpc6H7xLcCOl6V
 8DwpaA0rQ2NF0iAKc7woq/p6eb31aTlKTbRX+clgeQ9tZWL4aP1Z3xet4oFTEsVUjJwq
 bMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fRNdUpBL5Q1cDRMryaw2cZt94+H11yaT2Rood7S+WIY=;
 b=qWHcTfldDcdkkpTByDnFfnLNbsPfHjPtDxhexs1x4ynNOp40QTeJ2+lOxpK7TQArr/
 Qpt5mG5A8WgQQuyz3XQ9sxMvUzJmyFaXjNdoa9A6P7uxHn8H6eGW2JsvtFnTOL/Vg0le
 HKE+038mP4MLG5Eo+N83JD36KZHco/PvPjO9KVkBS0yEF1zVwaQXGM8ZUcClzelQZbrx
 BlYlim7JpLHRRkcgEv8yV6lLoU4XKmA92WytVHyc4zRShY2/SnVYo+vf1k6iubPzFcyH
 STS8mLzPrpDdsuwGPL/RZlRJ4gY3soHyLDrqgAAtmCArYjsk2+2ifmRUEfcMXEX+xduv
 sC0A==
X-Gm-Message-State: ACrzQf3T7yk4CaA/3J2gMpHsjU+02fKtrStYhF+IriPtA+QsXlhKEPyC
 07kH7XQOVno6+qCAsHLb1t/EgBij40Mc0fvEXhU=
X-Google-Smtp-Source: AMsMyM6rC9AzfEeAsv1BAduSAm6ECvHdR/K+lX/hxfY8p/X+FSlX2+QhUDnS9IjAwDvpjtw9RpjXgO8hRhyCkSAQ1Sc=
X-Received: by 2002:ae9:e410:0:b0:6cb:e230:8df8 with SMTP id
 q16-20020ae9e410000000b006cbe2308df8mr9944621qkc.132.1664068046850; Sat, 24
 Sep 2022 18:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <CAJ+F1CKjLyV4HJKQ7fWXgzHq6t9yFMA+s6Afwk-tv1Nq806V2Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CKjLyV4HJKQ7fWXgzHq6t9yFMA+s6Afwk-tv1Nq806V2Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 25 Sep 2022 09:07:15 +0800
Message-ID: <CAEUhbmUh+PfqhbXT=tdTd7i2kr3KLA14JjsnPkw5BKBS0A-gqw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Paolo,

On Tue, Sep 13, 2022 at 5:52 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 12:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The maximum number of wait objects for win32 should be
>> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> Changes in v3:
>> - move the check of adding the same HANDLE twice to a separete patch
>>
>> Changes in v2:
>> - fix the logic in qemu_add_wait_object() to avoid adding
>>   the same HANDLE twice
>>
>>  util/main-loop.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/util/main-loop.c b/util/main-loop.c
>> index f00a25451b..cb018dc33c 100644
>> --- a/util/main-loop.c
>> +++ b/util/main-loop.c
>> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *=
opaque)
>>  /* Wait objects support */
>>  typedef struct WaitObjects {
>>      int num;
>> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
>> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
>> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
>> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
>> +    int revents[MAXIMUM_WAIT_OBJECTS];
>> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
>> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
>> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
>>  } WaitObjects;
>>
>>  static WaitObjects wait_objects =3D {0};
>> @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectF=
unc *func, void *opaque)
>>          if (w->events[i] =3D=3D handle) {
>>              found =3D 1;
>>          }
>> +        if (i =3D=3D MAXIMUM_WAIT_OBJECTS - 1) {
>> +            break;
>> +        }
>
>
> hmm
>
>>
>>          if (found) {
>>              w->events[i] =3D w->events[i + 1];
>>              w->func[i] =3D w->func[i + 1];
>
>
> The way deletion works is by moving the i+1 element (which is always zero=
ed for i =3D=3D MAXIMUM_WAIT_OBJECTS) to i.
>
> After your patch, for i =3D=3D MAXIMUM_WAIT_OBJECTS, we no longer clear t=
he last value, and instead rely simply on updated w->num:
>
>     if (found) {
>         w->num--;
>     }
>
>  So your patch looks ok to me, but I prefer the current code.
>
> Paolo, what do you say?

Ping?

Regards,
Bin

