Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F0D5AB5B2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 17:52:22 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU8xx-0004k9-4A
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 11:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU8vL-0002ja-Uk
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 11:49:39 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:34441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU8vI-0007MP-Cq
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 11:49:39 -0400
Received: by mail-qk1-x730.google.com with SMTP id m5so2041478qkk.1
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=amnN1P1Cu8nN3WR2Ka5JQTQwWSKWuHxD1lVoIdFTdy0=;
 b=ISLBlERL+dpocHmmLsVCk/ucW1IaNQp1WzD0llteEQjr1aPyU9XkToggJizk9PWcpl
 1bkzim524ftwx9IPrahs6mq6z3R+VImMF5GcT8+NEk3ov8sZ9AnN0mA2v/4H1mpdZc77
 aU8AF84lXDOQyc1KKyCC3TAAsJHOj1Fvi1l3v0kp4LtlT106zQgk13YiEDij3+TU4CvH
 vLj3NKsNJdBK4djheY3HuV/3rYLKtmADgQ2njX2L67CA7XDDeoUvRPckGnC4nqmzZbtc
 ve9KfBv5+8wGzGarcOhswtjaqn5PxrIcQXm9S9EI5u53SgJycbqIC00m1xBPK93ACwB3
 4hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=amnN1P1Cu8nN3WR2Ka5JQTQwWSKWuHxD1lVoIdFTdy0=;
 b=vjGr30pv/1NILfljo/oTdQPt+DAQfRDx2bj9yzWlf21R0OcrKtbuIk6fYvWhhYWBhO
 oTYuaBZmCz9lXMpDSaT2t5jmpxJx4VkZ0MF8jSjF4LFyknjYcSDHMYC0wjvzRwJ9JELU
 5Av1pRYQFg1+NqU6hRyJp5dPFIUyNM9njlhKcPRoG4LAqO87BEgSk6a4EMWXWPuN5ry6
 QbekvRAMv6c0Ts7VKnwgm2Xky4P/lG/iDa+i/Zqb2jlsAI4HVy6L8wTdyhWFgkbl66Tw
 zia1tn4uA08B2dQj/tkoPWTNsAojIWrmupDUb4a1hUbLKdFeihz1iaGRanfcDaKpdheG
 RO0A==
X-Gm-Message-State: ACgBeo3+igL6yv/e02i9S7PV7OaacsWP/zn6dwgXDbeU/3N3kCkxWdqG
 7MUr/DM0enlu40NOc0yDwUYi1js2jdYgFJgBYHU=
X-Google-Smtp-Source: AA6agR59j3LS4+uU7GmAM3urAoJjQQx5qbqmVH8dIr2Jmsr+eD8ybr22addMp2zjQ/xH07SZKISPd26e8xwUaUuFK+g=
X-Received: by 2002:a05:620a:56b:b0:6bc:58c2:657d with SMTP id
 p11-20020a05620a056b00b006bc58c2657dmr23451142qkp.94.1662133775420; Fri, 02
 Sep 2022 08:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-30-bmeng.cn@gmail.com>
 <CAJ+F1C+q2OO2sN2GUFxMVJcdW9PF0wJxCkBTCSX0vCMHT=8Agw@mail.gmail.com>
In-Reply-To: <CAJ+F1C+q2OO2sN2GUFxMVJcdW9PF0wJxCkBTCSX0vCMHT=8Agw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 23:49:24 +0800
Message-ID: <CAEUhbmXpX66BWp-rUqD4y6eQfjkzTherwUbt6KjyuQbgp=11AA@mail.gmail.com>
Subject: Re: [PATCH 29/51] tests/qtest: libqtest: Install signal handler via
 signal()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 31, 2022 at 10:16 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 2:47 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> At present the codes uses sigaction() to install signal handler with
>> a flag SA_RESETHAND. Such usage can be covered by the signal() API
>> that is a simplified interface to the general sigaction() facility.
>>
>> Update to use signal() to install the signal handler, as it is
>> avaiable on Windows which we are going to support.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  tests/qtest/libqtest.c | 14 +++-----------
>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>
>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>> index 1b24a4f1f7..70d7578740 100644
>> --- a/tests/qtest/libqtest.c
>> +++ b/tests/qtest/libqtest.c
>> @@ -68,7 +68,7 @@ struct QTestState
>>  QTestState *global_qtest;
>>
>>  static GHookList abrt_hooks;
>> -static struct sigaction sigact_old;
>> +static sighandler_t sighandler_old;
>>
>>  static int qtest_query_target_endianness(QTestState *s);
>>
>> @@ -181,20 +181,12 @@ static void sigabrt_handler(int signo)
>>
>>  static void setup_sigabrt_handler(void)
>>  {
>> -    struct sigaction sigact;
>> -
>> -    /* Catch SIGABRT to clean up on g_assert() failure */
>> -    sigact =3D (struct sigaction){
>> -        .sa_handler =3D sigabrt_handler,
>> -        .sa_flags =3D SA_RESETHAND,
>> -    };
>> -    sigemptyset(&sigact.sa_mask);
>> -    sigaction(SIGABRT, &sigact, &sigact_old);
>> +    sighandler_old =3D signal(SIGABRT, sigabrt_handler);
>>  }
>>
>>  static void cleanup_sigabrt_handler(void)
>>  {
>> -    sigaction(SIGABRT, &sigact_old, NULL);
>> +    signal(SIGABRT, sighandler_old);
>>  }
>>
>>  static bool hook_list_is_empty(GHookList *hook_list)
>> --
>
>
>
> We should keep the sigaction() version for !WIN32, it has notoriously les=
s issues, more modern etc. signal() only on win32.
>
> Although in this particular usage, I don't think that makes much differen=
ce...


Yes, as I mentioned in the commit message, the codes uses sigaction()
to install signal handler with a flag SA_RESETHAND, and such can be
replaced by the signal() API.

It is still a supported API in POSIX so we should be safe to use it to
simplify the code paths. Unless you are strongly against this?

Regards,
Bin

