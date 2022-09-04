Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555EF5AC4A3
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 16:09:33 +0200 (CEST)
Received: from localhost ([::1]:39980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUqJX-00040P-Lw
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 10:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqHt-00020G-T9
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:07:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqHp-0002Ni-8H
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:07:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e13so8203689wrm.1
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=JWKkGG/fYNoiDDFxToejzbeMD3CZW/aQf/9st40lew0=;
 b=hNx3mGsg3nTuyh/j2W+PTCbMYbXUyaGX4kTvdVJBs+gUxbOJHdPBm+skrqFkiV9s1X
 rUerfc3wN/UfXN3bf7ket2p4UnIhHhrFDOnzEz8NtSHOLzBCwI5rxXLwAD+/h4/kaaDZ
 Gt784E1klyYoabTDZcVoyaXrW3kIESH6jtjEguob1/Li4ZQflpKDfv2AvN5qahvb1/dA
 ihIfcVkpBgJFWqauM2S8pHbwVipBJiLJZjpf1wMU3odjjjg/nk7DRZa2FCjRlh6FkaOZ
 UohPZpew001FH5crr+5SAGAxIXgBeBJFPyJSQHBwC7AH2oddtkKpBeqn7CD/H8HpbOCv
 vJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=JWKkGG/fYNoiDDFxToejzbeMD3CZW/aQf/9st40lew0=;
 b=O5i1tlECmSEub3fndS/JGUrjQjqmmki3n/teUhzDzKHfoR81f5CgYHYUkmCvL994vD
 vMD3bptSWDF90Q+NFVTsx2Gl7QpZloCk4WYqnKIjKVtjSUbNq5H38lzEPlZlU2MhdoqM
 hrJSmBu65GNEsou4FvpGh/AMdZOBtHpfbyHp36wOJQGjZen2RQqFxnkdehq8MfW8OpuW
 YjWquPn5r8nB5mvmvV5taPcSvzvTCE2g9tD+v8dlk9J0dBa7RIAZTgRQvldY3khm7ICm
 iLFvBaNzE2Gy1w4ld5R0b/LHiACqdxqk9A+YgAOB+O8WA///KCHQbuqNfeSU+yo1pqlt
 qM9w==
X-Gm-Message-State: ACgBeo0XshH11yRb2e3lj5gyS3cv+4mYuSXusRXHNscapvjmriw5BX4Z
 0InwSwGPOgpbJItCXFtjDhg=
X-Google-Smtp-Source: AA6agR6MCw+1em2WaQ50VF0Cl/C3uCV+UCnE0+S8hWNjtJsLowehqHqvHcbrkhLUP2sEcZ2NBBJDzw==
X-Received: by 2002:adf:f791:0:b0:225:8741:87aa with SMTP id
 q17-20020adff791000000b00225874187aamr23193824wrp.73.1662300463701; 
 Sun, 04 Sep 2022 07:07:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d4304000000b002238ea5750csm7567082wrq.72.2022.09.04.07.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 07:07:43 -0700 (PDT)
Message-ID: <7bb4abf1-dc0f-d364-7e3c-c63fa4da6046@amsat.org>
Date: Sun, 4 Sep 2022 16:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 22/51] tests/qtest: qmp-test: Skip running test_qmp_oob
 for win32
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-23-bmeng.cn@gmail.com> <87y1v7nqe9.fsf@pond.sub.org>
 <CAEUhbmVryzMRNJiOzev6cjHCN2FBNHEYqCwhcwh0P0HuymHX8A@mail.gmail.com>
 <87ler7m6mg.fsf@pond.sub.org>
In-Reply-To: <87ler7m6mg.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 29/8/22 17:06, Markus Armbruster wrote:
> Bin Meng <bmeng.cn@gmail.com> writes:
> 
>> Hi Markus,
>>
>> On Mon, Aug 29, 2022 at 9:14 PM Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> Bin Meng <bmeng.cn@gmail.com> writes:
>>>
>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>
>>>> The test_qmp_oob test case calls mkfifo() which does not exist on
>>>> win32. Exclude it.
>>>>
>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>> ---
>>>>
>>>>   tests/qtest/qmp-test.c | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
>>>> index b950dbafaf..4a165447f8 100644
>>>> --- a/tests/qtest/qmp-test.c
>>>> +++ b/tests/qtest/qmp-test.c
>>>> @@ -159,6 +159,8 @@ static void test_qmp_protocol(void)
>>>>       qtest_quit(qts);
>>>>   }
>>>>
>>>> +#ifndef _WIN32
>>>> +
>>>>   /* Out-of-band tests */
>>>>
>>>>   char *tmpdir;
>>>> @@ -279,6 +281,8 @@ static void test_qmp_oob(void)
>>>>       qtest_quit(qts);
>>>>   }
>>>>
>>>> +#endif /* _WIN32 */
>>>> +
>>>>   /* Preconfig tests */
>>>>
>>>>   static void test_qmp_preconfig(void)
>>>> @@ -338,7 +342,9 @@ int main(int argc, char *argv[])
>>>>       g_test_init(&argc, &argv, NULL);
>>>>
>>>>       qtest_add_func("qmp/protocol", test_qmp_protocol);
>>>> +#ifndef _WIN32
>>>>       qtest_add_func("qmp/oob", test_qmp_oob);
>>>> +#endif
>>>>       qtest_add_func("qmp/preconfig", test_qmp_preconfig);
>>>>       qtest_add_func("qmp/missing-any-arg", test_qmp_missing_any_arg);
>>>
>>> I'd appreciate a comment explaining why we have to disable this test on
>>> Windows.
>>
>> The reason is explained in the commit message.
> 
> Yes, and putting it there is a good idea.  But I'd appreciate if you
> *also* put it in the code, so future readers of the code don't have to
> dig through git history.

This could be self-explicit using instead:

   #if HAVE_POSIX_MKFIFO

