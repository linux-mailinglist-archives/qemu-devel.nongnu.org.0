Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E7617AD2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXTU-0000lR-5G; Thu, 03 Nov 2022 06:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqXT6-0000eq-Ry
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:29:05 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqXT3-0003oI-TF
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:29:04 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWRe1-1oW0R91zAZ-00Xr4Q; Thu, 03 Nov 2022 11:28:56 +0100
Message-ID: <94f8b6c2-ca50-9f4b-cf9d-d4cc8aa569c5@vivier.eu>
Date: Thu, 3 Nov 2022 11:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] tests/unit: simpler variable sequence for test-io-channel
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221103102329.2581508-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221103102329.2581508-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V/3liEN854bIsNKbOrAU9Z9SNjh4UiLIYRYf3Yzp/JwFxFRRC9T
 WhRdt/uS73ovP+Pi5e7dsunQIZKG2rAdDUKaUTlCeqp1KNXJNyu2usJKGDTPRgmvlGUnr/E
 mBj12SdOdXIabWUYkbHqabk1b6TvBcw5IRB3hzYD3Gw1bBdzfZn6IlyI4C5WCLwyvATDGLg
 9xMISYxDg4LzQ0QK4l8OQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8CONUd7hML8=:yzQr7GSx1oS94cgsK+GQiG
 6qUabLH1HRsqcRTFsCtQYHhp22idrgK6g4mR9qJ+VmAlVMXgDUBpbphOO3K/1iVFdzwL7Nxia
 1fpJ/q/JW1EazVtRuMTQ4FzEEoFNd7MeoYe57FtZd0I4hk3ckz2cYXy18E1Id/fM+S9IAjlKj
 Z28DOKsvrs+JI+MJqM1cbIiDcN3Mn0YPS3wvSgCk2s4B6bMpOrbkmNdY+7LdoRuPpo9m+PxpQ
 RuUTzwrEidSGsN9e6bCaUYWyx3tmh8B8YtgS4lmkFNaIgavaXz0PH+WdjKMa/BE+CcjChpMmu
 q1xF+ZbAFcgiSbAgCsrhuivmmZnXhogqoi1nTp779C+goT0rH+zlD7naFNt7jHMffGNdBpvKA
 uZFPVy/vX9JZTzD7l7SaZwhHy67iR4UvpmU2/ExvtKatXAoeytSKM59Zpq8JWPFuBFQvMAUfa
 9rmh7D5I7ERSyCsiDPjyL+U8BA8xdYnvcAGn/03fA9Yr8nQPky6LaLDcaG70+U7IO3N2/lZ1g
 9hG+uhv+U9guxIFjYCuUXzBP0LKjtdl+LOTkXGnCKJBeZacBOlGHLie7BHa65EWxkkmgfNPOw
 76i7xFN3rDTdj8drQmD8Coh4mBwPCxT16OT6tsedL42olxO5YKYkSYc2m2QSzE1bSMZfaDe8n
 /R/sc2tc622cVerbql7VF2c0gtzyw0rhpO/IVW583fZjUmlBcZWK0h2BCLB6PL0pmuHv/R4jT
 ApW4wvpdSot+CijCY6Hcqf53crqSx1W57leYVp2/Rghmwvp/XZZq3ZIyBUi+iERMjV28OzSsG
 +k5Wa6a
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 03/11/2022 à 11:23, Alex Bennée a écrit :
> This avoids some compilers complaining about a potentially
> un-initialised [src|dst]argv. In retrospect using GString was overkill
> for what we are constructing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 43e29c8cfb..19f72eab96 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
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
>                                                       &error_abort));

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Do you want this be merged via trivial branch?

Thanks,
Laurent

