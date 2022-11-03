Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6C6183B0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqch8-0000c0-5H; Thu, 03 Nov 2022 12:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcgp-0000H0-20; Thu, 03 Nov 2022 12:03:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcgn-00063g-7r; Thu, 03 Nov 2022 12:03:34 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MZCKd-1oUGS90Nfd-00V5l3; Thu, 03 Nov 2022 17:03:28 +0100
Message-ID: <98b8b2e3-636d-a550-1eb2-e2e2d3d24959@vivier.eu>
Date: Thu, 3 Nov 2022 17:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] tests/unit: simpler variable sequence for test-io-channel
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20221103102329.2581508-1-alex.bennee@linaro.org>
 <94f8b6c2-ca50-9f4b-cf9d-d4cc8aa569c5@vivier.eu> <87wn8cjmqh.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87wn8cjmqh.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PCxyFPGxm5ZonqSMmlZ1iRy9bqLN4Qqxx/9V4s+BYEIU8tcIBLR
 O+Me/Cd0/C4QHziqH+0/CewT6VeEx0xkyOTGE4UHF6oDGAUg0yhzDld5ze76BmRTmqurE3+
 BGyvmtV6h5et5o9/wc9t9D6OGNnhh4xF4BtRmwkonVnu4cACP/OFTTWRY6WNMDDbmMzthaA
 WHZ6g+HvJCKFGY0azfl5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xC47mMGqyhk=:WF3sn+Png6jEDeEP2jILR5
 er3hQp1JrH6BiXqgLzj7Xv2fS7oh8eQ9q8jVz4s9pZ0X2FmuNgw+AqmG0PXSP7ke2EKyO7OIX
 jWO56+IwXKZKoUrg1SBRzTiomVyLmQG7o7XwSKAuoZ8SBHVqYK3AYSzw3dUVp+snaVtBqW7WV
 AzgkAI8yiIo7rCJFkkMtHlkYEFXpcXgwM4mW747SGua/G+49A0kgoi68/MQ1XKhz6jDj7AizH
 GC0PZCpJySNbzzcJjfZxu0pzhdQQNhny18kSTvdDOoFVBECbDkWvcg86eZgiKy7szVH4t2vsH
 kSU/WzdHsLfCMUfI4ELVjFJfd5eQiW3H4RroM4SqRQk4JxT/7fIU6BN/Vly3TXhD0kyLDq21s
 BqAT/Qh7Md6oHYo58tJwRiOccdM+4oINFRNXLclDpZyr53lRbYuc456DN+kAqchqOS04MWcE+
 FuuSHHc+wZEMJEnu3ZrugC8aTT9VuEnY5roo6GEftAHh1+whSSdLbbjQrdiIlnRc5KCTXdoZY
 k2j8u9PLAEz5BZMjOwuvjqMAeU8aZzYRiWssiiTKqY7VWqxnByU3+6WX/JoiGXez1KqUak9V8
 Cg5660qCHo82ydt5d2o5lyJIWfgd63CV/oi51E2DVeNPXf5WkNRUiwK6StSyEp2e5fhjhF7Ro
 ziFPL0Kaoh1jczBw7sCMs4nT6NbqmvyAlmtoTFPSwrPQuKZz0cYvu4rFVPuDMvMm1nB9X99iM
 v+Zhbx9jgFLd25iU4/cj/u7cUz4683v7Mwo6iAeFyiOXh0TynBZfdVuHDizfvpwPCHabBmbiD
 z/HSDQf
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 03/11/2022 à 12:32, Alex Bennée a écrit :
> 
> Laurent Vivier <laurent@vivier.eu> writes:
> 
>> Le 03/11/2022 à 11:23, Alex Bennée a écrit :
>>> This avoids some compilers complaining about a potentially
>>> un-initialised [src|dst]argv. In retrospect using GString was overkill
>>> for what we are constructing.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/unit/test-io-channel-command.c | 14 ++++----------
>>>    1 file changed, 4 insertions(+), 10 deletions(-)
>>> diff --git a/tests/unit/test-io-channel-command.c
>>> b/tests/unit/test-io-channel-command.c
>>> index 43e29c8cfb..19f72eab96 100644
>>> --- a/tests/unit/test-io-channel-command.c
>>> +++ b/tests/unit/test-io-channel-command.c
>>> @@ -33,19 +33,13 @@ static void test_io_channel_command_fifo(bool async)
>>>    {
>>>        g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
>>>        g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
>>> -    g_autoptr(GString) srcargs = g_string_new(socat);
>>> -    g_autoptr(GString) dstargs = g_string_new(socat);
>>> -    g_auto(GStrv) srcargv;
>>> -    g_auto(GStrv) dstargv;
>>> +    g_autofree gchar *srcargs = g_strdup_printf("%s - PIPE:%s,wronly", socat, fifo);
>>> +    g_autofree gchar *dstargs = g_strdup_printf("%s PIPE:%s,rdonly -", socat, fifo);
>>> +    g_auto(GStrv) srcargv = g_strsplit(srcargs, " ", -1);
>>> +    g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
>>>        QIOChannel *src, *dst;
>>>        QIOChannelTest *test;
>>>    -    g_string_append_printf(srcargs, " - PIPE:%s,wronly", fifo);
>>> -    g_string_append_printf(dstargs, " PIPE:%s,rdonly -", fifo);
>>> -
>>> -    srcargv = g_strsplit(srcargs->str, " ", -1);
>>> -    dstargv = g_strsplit(dstargs->str, " ", -1);
>>> -
>>>        src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
>>>                                                        O_WRONLY,
>>>                                                        &error_abort));
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>
>> Do you want this be merged via trivial branch?
> 
> I'm easy either way. I've got a for-7.2/misc-fixes branch which I'll
> send once I can figure out whats going on with the avocado console
> interaction code.

Applied to my trivial-patches branch.

Thanks,
Laurent



