Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA04CF9D6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:14:39 +0100 (CET)
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRANy-0005SL-Fb
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:14:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nRACO-0001bC-0r; Mon, 07 Mar 2022 05:02:40 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:51925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nRACM-0002mS-6F; Mon, 07 Mar 2022 05:02:39 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M72wZ-1nWv5Z2JWZ-008XPZ; Mon, 07 Mar 2022 11:02:26 +0100
Message-ID: <960fea17-c5e7-fa6f-c185-8a892998cff7@vivier.eu>
Date: Mon, 7 Mar 2022 11:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/5] Replace qemu_gettimeofday() with g_get_real_time()
Content-Language: fr
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20220304211618.3715999-1-marcandre.lureau@redhat.com>
 <20220304211618.3715999-5-marcandre.lureau@redhat.com>
 <CAMxuvaz_uCxtL+0e-=AFZsuomNAz6H7Y+6RbdkSzfbxcMSLGrg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAMxuvaz_uCxtL+0e-=AFZsuomNAz6H7Y+6RbdkSzfbxcMSLGrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XiqdCrs+a+zw0feEHZ08/vNiZ7cwEZCKMqXpEh5Egw4ImupKnpd
 uk8JCJWQ9ZNpVY/vZxTAfU7wDZArq4EnDSASwPXg2UOGx24QbqHo61CGOxJCBR0UB9aTtJq
 OwUqtQWKwQ5RedWu0qO7F8xJQ+ea4FiqMUv11qx5G6jj8HM9DyjkXEytsGWNLlGEUl9Zr3x
 YIdNk2n5Fr7azOundkumg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zD3pgXZo1Lk=:rJi0pFal5hMim7KaT84itX
 dgksCEOBqaGta8sgELk5W7vq3I3LH+j7/YVOSVNOKPJR2HWnjUaqtBnnxurJEXNUSAHbmEJsN
 E/gJ4+sUJH7ZgeiCp2Nn/0J2KE1QaUKd1o8Ppdk5rcrShiIo1sGay3y3h+oJGRH4YDzTgCton
 dAj6MHWoJ8v/dj3qWDePbAq/W8QsdmLVRzyLHXH24VmgbAtuga/xmoOSvWlgeXV2L8K8pP/WY
 XAEeGnBEFVjz/0PQAYnYh3yzDX9cmGSuPX0cq6B8z62YMP2cukVgOttdDmGGLS98ZMdP1UQ0V
 yOcmxBz1bN6TC671QqM6hUwFUSbm+v90LyVERuieicPNrEjeFsnmsJSFtf/my+wT5m33SA8h1
 hyAt5wo2AwHiqatu1U5tx9NokFjK+23LaFnQqS5iiIsa2jfVzQr9bqnusfGnh23zofktNaOLF
 1YwNPMvzmMMxMcbDjK5FiaayrHRflrF6Lf++GGMS7vrqgBRRJvOspeqN0hoYCIW1sItoHmKu4
 7xflmcVSB+qRuzelbWG8XqCr14Gk9mpGLKUJz/P8SzvACPV187nxCWwkx7IOkQ9mWTr9CPfuB
 KuWjDpcoQPUtBE6367eAu1QxV5nSroQDsSW229+ndjGwosU8s4twbrd0gDbt+lzC5Myngjd95
 pW6vy46DTrGVtPnvpfzhcyw18fH5TNpYPbqjofF552YyM8svPQ07PGW8Ra6yP/40VSYs=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/03/2022 à 20:17, Marc-André Lureau a écrit :
> On Sat, Mar 5, 2022 at 1:18 AM <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> GLib g_get_real_time() is an alternative to gettimeofday() which allows
>> to simplify our code.
>>
>> For semihosting, a few bits are lost on POSIX host, but this shouldn't
>> be a big concern.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   blockdev.c                 |  8 ++++----
>>   hw/rtc/m41t80.c            |  6 +++---
>>   hw/virtio/virtio-balloon.c |  9 +--------
>>   qapi/qmp-event.c           | 12 +++++-------
>>   qemu-img.c                 |  8 ++++----
>>   target/m68k/m68k-semi.c    | 22 ++++++++++------------
>>   target/nios2/nios2-semi.c  | 23 ++++++++++-------------
>>   7 files changed, 37 insertions(+), 51 deletions(-)
>>
...
>> index 19d3cd003833..025716b3ec37 100644
>> --- a/qapi/qmp-event.c
>> +++ b/qapi/qmp-event.c
>> @@ -20,15 +20,13 @@
>>
>>   static void timestamp_put(QDict *qdict)
>>   {
>> -    int err;
>>       QDict *ts;
>> -    qemu_timeval tv;
>> +    int64_t rt = g_get_real_time();
>>
>> -    err = qemu_gettimeofday(&tv);
>> -    /* Put -1 to indicate failure of getting host time */
>> -    ts = qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds': %lld }",
>> -                                 err < 0 ? -1LL : (long long)tv.tv_sec,
>> -                                 err < 0 ? -1LL : (long long)tv.tv_usec);
>> +    ts = qdict_from_jsonf_nofail("{ 'seconds': %" G_GINT64_FORMAT
>> +                                 ", 'microseconds': %" G_GINT64_FORMAT "}",
>> +                                 rt / G_USEC_PER_SEC,
>> +                                 rt % G_USEC_PER_SEC);
> 
> NACK this, fixed in v3

Why keeping the %lld is better than moving to %G_GINT64_FORMAT?

Thanks,
Laurent

