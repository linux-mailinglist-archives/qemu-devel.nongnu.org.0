Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5033ADF34F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 18:40:09 +0200 (CEST)
Received: from localhost ([::1]:45217 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMaj2-0000z6-Ca
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 12:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMaeU-0005dF-O3
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMaeT-0003fL-EU
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:35:26 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42743)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iMaeT-0003fC-54; Mon, 21 Oct 2019 12:35:25 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2etD-1iJYFM2ipL-004Eah; Mon, 21 Oct 2019 18:35:19 +0200
Subject: Re: [PATCH v2] Do not use %m in common code to print error messages
From: Laurent Vivier <laurent@vivier.eu>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20191018130716.25438-1-thuth@redhat.com>
 <5996ace1-f288-2fe7-95a1-86455df4cdc0@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <30ed1114-2220-7517-c651-59565ba34775@vivier.eu>
Date: Mon, 21 Oct 2019 18:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <5996ace1-f288-2fe7-95a1-86455df4cdc0@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s5ftosXzyj0w4BwenamHLgVTrOESvvrnw1V3aFCOy50Lf3Jvy4d
 WwJAKvjN7T3zCiHyBPxo5HZGlRGVaWUmu1HfvOLOhu1XaohAT4B0PWz6lrdq8yetoBeNf8G
 lSPXfxllJ9m5V7Uuo1wfCIHs7BKgCGWPubbiRUAlad/akM48t1YRsXuSQuuGnGyZYXxZNv5
 nuZ9HMgSc9RNzslwmCHgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BfEmfF2yNNo=:15xt5rbONKHiY2fdJWqjai
 PslgJ4Xut/sp7QA78oZN3YRO5/nQ86aLkOyus4mbMzniaAPiPOetVwfD2tFE82KeXerTXVYe0
 WEiExoDNbZwfBPyUmlrxbp16WL6tJ2MeUfg+JtXu6YDvBg4WtXhxqULZrca2e1yifknrMGFSo
 wrgmUXOnqbP3P4Wl/y1xZDb1LFmoKIkFQMguhUJViK+0AM4KRG7JHmFn2VnRsgH5jHsZgigSI
 YMwj5yBCJzNHAN6mvYWPQwtXqdTmEWxxceKNNNnWyLp4jILZfEyL5EfMGVEJVPNBkJ4OeyPtF
 mERTtd35Ee8bfmJO5URcabovtguhF/nTeRE3u/vTqYQ1suONKMgVb2XnOKlEylsbX44bZ6vaS
 qkZTfs0+l4EgSj5dWOj18lUnO0hkvAOLyA0MtmWbn/og0UJJsxWvg7oZlFHYKBC1qKEI4sy9w
 dCtevpQXtw8HtWd+86ow1cVAyhuGBywaDT961PpKYtW/ljUok+r3e54N9X5gxh8pjQeqjGbGw
 5m2yf6dqA/HlcGOvhHGcQP1xo3tf6L9UmJoLUYGmXYjbhbox+C6UxBV7Ni9NabVkCClK6rx3j
 i2ZeXhLFD0qD7iBk+77VLUlywucKvSJXQPI8zm2tml65MXBQacJQBSmSmuMOt8ekxOnuwbM1c
 uSYo2+Eo/kJZug+1P7gakjtgX6CVW4mhKoxskUgxh9nWWKxS9JHdI73LbZZCQaWn38qfWNeYy
 VwGCzEay8OD/3H6A8lg/onXvluuKfIOOHWJpwNWLNKbWmV23+25ewvh2udL0rsXU7hjvLW+vs
 O0tYm4+PWjoBRHwKO0X45yHO1jXZ3wMaVF5K4KcE/3M65fgHrqIxQ/JSVZ0IgTjok+Tjf7PRz
 YDLkP9nRbcNDYAPFkMs+7mtwZ/iYHd0+8Lv74tvsk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/10/2019 à 18:29, Laurent Vivier a écrit :
> Le 18/10/2019 à 15:07, Thomas Huth a écrit :
>> The %m format specifier is an extension from glibc - and when compiling
>> QEMU for NetBSD, the compiler correctly complains, e.g.:
>>
>> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c: In function 'sigfd_handler':
>> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c:64:13: warning: %m is only
>>  allowed in syslog(3) like functions [-Wformat=]
>>              printf("read from sigfd returned %zd: %m\n", len);
>>              ^
>> Let's use g_strerror() here instead, which is an easy-to-use wrapper
>> around the thread-safe strerror_r() function.
>>
>> While we're at it, also convert the "printf()" in main-loop.c into
>> the preferred "error_report()".
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v2: Do not try to g_free() the strings
>>
>>  hw/misc/tmp421.c | 4 ++--
>>  util/main-loop.c | 3 ++-
>>  util/systemd.c   | 4 ++--
>>  3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
>> index 9f044705fa..c0bc150bca 100644
>> --- a/hw/misc/tmp421.c
>> +++ b/hw/misc/tmp421.c
>> @@ -120,7 +120,7 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
>>      int tempid;
>>  
>>      if (sscanf(name, "temperature%d", &tempid) != 1) {
>> -        error_setg(errp, "error reading %s: %m", name);
>> +        error_setg(errp, "error reading %s: %s", name, g_strerror(errno));
>>          return;
>>      }
>>  
>> @@ -160,7 +160,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
>>      }
>>  
>>      if (sscanf(name, "temperature%d", &tempid) != 1) {
>> -        error_setg(errp, "error reading %s: %m", name);
>> +        error_setg(errp, "error reading %s: %s", name, g_strerror(errno));
>>          return;
>>      }
>>  
>> diff --git a/util/main-loop.c b/util/main-loop.c
>> index e3eaa55866..eda63fe4e0 100644
>> --- a/util/main-loop.c
>> +++ b/util/main-loop.c
>> @@ -61,7 +61,8 @@ static void sigfd_handler(void *opaque)
>>          }
>>  
>>          if (len != sizeof(info)) {
>> -            printf("read from sigfd returned %zd: %m\n", len);
>> +            error_report("read from sigfd returned %zd: %s", len,
>> +                         g_strerror(errno));
>>              return;
>>          }
>>  
>> diff --git a/util/systemd.c b/util/systemd.c
>> index d22e86c707..1dd0367d9a 100644
>> --- a/util/systemd.c
>> +++ b/util/systemd.c
>> @@ -60,8 +60,8 @@ unsigned int check_socket_activation(void)
>>               * and we should exit.
>>               */
>>              error_report("Socket activation failed: "
>> -                         "invalid file descriptor fd = %d: %m",
>> -                         fd);
>> +                         "invalid file descriptor fd = %d: %s",
>> +                         fd, g_strerror(errno));
>>              exit(EXIT_FAILURE);
>>          }
>>      }
>>
> 
> Applied to my trivial-patches branch.

As Paolo has already queued it, I remove it from my queue.

Thanks,
Laurent


