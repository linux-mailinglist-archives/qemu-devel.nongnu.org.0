Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F53617A3F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 10:50:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqWqO-0000oQ-MC; Thu, 03 Nov 2022 05:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqWpb-0000by-EG; Thu, 03 Nov 2022 05:48:21 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqWpZ-00068J-JM; Thu, 03 Nov 2022 05:48:15 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mirb8-1pV6N11Hgi-00exNt; Thu, 03 Nov 2022 10:48:07 +0100
Message-ID: <0790f70d-2b8a-ade7-c847-91e856b532dc@vivier.eu>
Date: Thu, 3 Nov 2022 10:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] tests/unit/test-io-channel-command: Silence GCC error
 "maybe-uninitialized"
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20221101213937.21149-1-shentey@gmail.com>
 <875yfxkssf.fsf@linaro.org>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <875yfxkssf.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/0lAFdeYb9bsFKPtW3cIFO8aFAAj5LFisFUoXXE25srucbY/CGW
 FLIAbE0l0O7I8FK1qe9jAfwL3v689YgeuDiYxgBHeX9ESNpK6b6MTBgXsJtQVWExYPYG6xG
 puIeHOhJGkdgYV0xF2JZGQ5RAFvrdDYXyNgLRNyTutM6eJbVnjXxLsIardqlBzP/1MtWcBZ
 1VYUTingVKwgscyY5Q1Fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IXVsWJcOPaI=:GxvVTsDcPKyDGmZ7X54hsM
 6QmumtVLmGYoRIE+F+cPPpe7LKB+/RfDbkSgNmY/yhvRruZZg8W0jCOWFRbzqwqF0dgcXiVSu
 IRERlcz8MWLMsGi7nEsu79+nwmKz5Pcg/xzpwAtw5EgP/rSJzShleWc59Iy+AS9m3RX2Spxmn
 tt+AFh0y5bzX5GPltSgbPuBdr4feEAhJDJLwt8uawF/7XhP5wWlKzeSob4KRUu1QmiK5479B2
 fRdvbvOAdNsbJegHfjILBXFUi2r90NH++uNW8xnfnG0YPEngAHVlp3OSHDo2PItkva0Q19KkI
 t2rrJ3NK/PPtelIp8lknrimBU6NnX3N4zD7HAho+t6NigIlEN454+vkz8ZbmdcXJmqGOr+71I
 uhjZ6Qw9neFuoBAKOoLf9xJXu85Pg4Mrr4C/NXPMJhDbf13dG4LgN7DH1UAeYUbYdAGsDbDdS
 LAIjU17vGOyz3Av9YZK2XR0Xa/TM3eUvBsJz10Oa5J5sm1RS9m39osrsAP72rLyc61A+k8DpG
 M4vOXJQQCle9HoEsV/HaYmZmGU7cEmDNTiu8oP3DJ6nXnIYJPyzMqcJU/nUgKJXcbLcMnso9A
 8HrTK02bt0u7/0TY8z5jUqRLwILN2VyNdtdXWoafzzK5p8lQL7nf7UZlLLUefU0KXf8bEgNP6
 A9DKktH061k1BKNo2GH7AHHiEwecDRhCed4Wgr3ri9RlqbdIaD4TQpeEeh7I/g60xIhhHieZC
 CUVMgO3iypFIwuBKBA3R6V48+Agy+Iue2Pe7Z7TzDb27HuZfTPCarlc+xZk+g1+9V+T4QUtcs
 3953pFe
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 02/11/2022 à 21:24, Alex Bennée a écrit :
> 
> Bernhard Beschow <shentey@gmail.com> writes:
> 
>> GCC issues a false positive warning, resulting in build failure with -Werror:
>>
>>    In file included from /usr/lib/glib-2.0/include/glibconfig.h:9,
>>                     from /usr/include/glib-2.0/glib/gtypes.h:34,
>>                     from /usr/include/glib-2.0/glib/galloca.h:34,
>>                     from /usr/include/glib-2.0/glib.h:32,
>>                     from ../src/include/glib-compat.h:32,
>>                     from ../src/include/qemu/osdep.h:144,
>>                     from ../src/tests/unit/test-io-channel-command.c:21:
>>    /usr/include/glib-2.0/glib/gmacros.h: In function ‘test_io_channel_command_fifo’:
>>    /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘dstargv’ may be used uninitialized [-Werror=maybe-uninitialized]
>>     1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none) (func) (*_ptr); }     \
>>          |                                                                                                         ^
>>    ../src/tests/unit/test-io-channel-command.c:39:19: note: ‘dstargv’ was declared here
>>       39 |     g_auto(GStrv) dstargv;
>>          |                   ^~~~~~~
>>    /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘srcargv’ may
>> be used uninitialized [-Werror=maybe-uninitialized]
>>     1333 | static G_GNUC_UNUSED inline void
>> _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none)
>> (func) (*_ptr); } \
>>          |                                                                                                         ^
>>    ../src/tests/unit/test-io-channel-command.c:38:19: note: ‘srcargv’ was declared here
>>       38 |     g_auto(GStrv) srcargv;
>>          |                   ^~~~~~~
>>    cc1: all warnings being treated as errors
>>
>> GCC version:
>>
>>    $ gcc --version
>>    gcc (GCC) 12.2.0
>>
>> Fixes: 68406d10859385c88da73d0106254a7f47e6652e ('tests/unit: cleanups for test-io-channel-command')
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   tests/unit/test-io-channel-command.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
>> index 43e29c8cfb..ba0717d3c3 100644
>> --- a/tests/unit/test-io-channel-command.c
>> +++ b/tests/unit/test-io-channel-command.c
>> @@ -35,8 +35,8 @@ static void test_io_channel_command_fifo(bool async)
>>       g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
>>       g_autoptr(GString) srcargs = g_string_new(socat);
>>       g_autoptr(GString) dstargs = g_string_new(socat);
>> -    g_auto(GStrv) srcargv;
>> -    g_auto(GStrv) dstargv;
>> +    g_auto(GStrv) srcargv = NULL;
>> +    g_auto(GStrv) dstargv = NULL;
>>       QIOChannel *src, *dst;
>>       QIOChannelTest *test;
> 
> Another approach would be to drop the GString usage which is premature
> and then we can allocate everything in order:

Yes, it looks like a better approach. I'm going to drop this patch from the trivial branch.

Could you send a patch?

Thanks,
Laurent

> 
> --8<---------------cut here---------------start------------->8---
> modified   tests/unit/test-io-channel-command.c
> @@ -33,19 +33,13 @@ static void test_io_channel_command_fifo(bool async)
>   {
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
>       g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
> -    g_autoptr(GString) srcargs = g_string_new(socat);
> -    g_autoptr(GString) dstargs = g_string_new(socat);
> -    g_auto(GStrv) srcargv;
> -    g_auto(GStrv) dstargv;
> +    g_autofree gchar *srcargs = g_strdup_printf("%s - PIPE:%s,wronly", socat, fifo);
> +    g_autofree gchar *dstargs = g_strdup_printf("%s PIPE:%s,rdonly -", socat, fifo);
> +    g_auto(GStrv) srcargv = g_strsplit(srcargs, " ", -1);
> +    g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
>   
> -    g_string_append_printf(srcargs, " - PIPE:%s,wronly", fifo);
> -    g_string_append_printf(dstargs, " PIPE:%s,rdonly -", fifo);
> -
> -    srcargv = g_strsplit(srcargs->str, " ", -1);
> -    dstargv = g_strsplit(dstargs->str, " ", -1);
> -
>       src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
>                                                       O_WRONLY,
> --8<---------------cut here---------------end--------------->8---
> 
> 
> 
> 


