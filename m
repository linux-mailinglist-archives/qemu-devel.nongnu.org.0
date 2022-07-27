Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFE5823D2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:07:43 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdx2-0006ln-QA
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGdrt-0002nm-TV
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:02:17 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGdrn-0000Pq-Lu
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:02:17 -0400
Received: by mail-qk1-x736.google.com with SMTP id m16so12878616qka.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUGs4ScrELJvNdfGNVjyyeeYl2EGww8NNjv1wOzy/5Y=;
 b=qGixSNITKrKxAaP99kjm1AITCUZMbl0yXP/V2HjLW2rKAQekY6O22hKoZVQ4SEfBOs
 HWJJ+FTxf8OxA7hC7zw5frfuqKVqmHtRgVk3ky9AaRU/iIipfLEht16lk09uNO/3WO2X
 70hL9ldWg82C60WlfEKa56quTlILFLJJvN8p75L7i+A4N4Q5fShEkd9vlcPrkbfH0DdG
 mHcop/FLhczxYOOvbIz0kDpzukP3L16qvV4V0tr3atCYHcE1KbQCBGj61wP/PXRBB4pT
 IT3JhiH3l5IxN8Za8dSaK+ZERZRskZOxSQlTLSuq9osQXfvGi32/B+XCpSvXZ4iSGCQj
 mYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUGs4ScrELJvNdfGNVjyyeeYl2EGww8NNjv1wOzy/5Y=;
 b=Wfd68o2qO4ob/r3hsj97OS0psTm3gjs9bXgMjIte1/qGa9kZMJVE1jtOL7wFbrPxDs
 YA98cg9Tfdg66c3t41qy9lqeSNU7A+p7EbtOMdxTWJURe/CIqkGYXNHQBy+YGijhI/41
 gbSQJYDTl8tT0f0oaLOjBAUu1P2vDbxhG7F4CubsQLTSD8p9lJ3S3ry6WdB7nd048RbX
 uaBG1kDVMJcRS5+ydBP6Ti5bqZ7GkZtCIvSrFmeD+gJ6n/qu13jjlc9pGHsE8bVX5Wzv
 ev0npmfjtnJ50HjFvQ81VMqdmLirgohSfY4OFDKfjqtnwqKyjt4sX0dERDnFwM4Zv8bc
 Fe+g==
X-Gm-Message-State: AJIora+VTEPgz44YO4EqZk1WO7n734tReLRjy4iCdc5KbXa6k41NytOc
 G8InWaVcav8uiX3nkWnL/hyzV2AEz3nIjsgHmWc=
X-Google-Smtp-Source: AGRyM1tmFeBZbVO89oONff1/l6mHyv1RgdoWfP7I/RYDJ1d+B8wbf8Cl43aT99euiRN3oNI2VCMEBfVSRBsqpaO1b2g=
X-Received: by 2002:a05:620a:2894:b0:6b6:53c1:5ad4 with SMTP id
 j20-20020a05620a289400b006b653c15ad4mr11618413qkp.94.1658916116226; Wed, 27
 Jul 2022 03:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-5-bmeng.cn@gmail.com>
 <CAPMcbCo81iCA7ZnvWY7=OqA7vrAuhx7jA5EPiqJLnq4LzpKstA@mail.gmail.com>
In-Reply-To: <CAPMcbCo81iCA7ZnvWY7=OqA7vrAuhx7jA5EPiqJLnq4LzpKstA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 18:01:44 +0800
Message-ID: <CAEUhbmWXhXYSYtBUy1vnaa7uaZ10Z9ybjh3ZZmaJAW7K7fV08w@mail.gmail.com>
Subject: Re: [PATCH 4/5] util/qemu-sockets: Enable unix socket support on
 Windows
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 QEMU <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
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

On Wed, Jul 27, 2022 at 4:53 PM Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
>
>
>
>
> On Wed, Jul 27, 2022 at 10:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Support for the unix socket has existed both in BSD and Linux for the
>> longest time, but not on Windows. Since Windows 10 build 17063 [1],
>> the native support for the unix socket has came to Windows. Starting
>> this build, two Win32 processes can use the AF_UNIX address family
>> over Winsock API to communicate with each other.
>>
>> Introduce a new build time config option CONFIG_AF_UNIX when the build
>> host has such a capability, and a run-time check afunix_available() for
>> Windows host in the QEMU sockets util codes.
>>
>> [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
>>
>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  meson.build         |  6 ++++++
>>  util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++-------
>>  2 files changed, 47 insertions(+), 7 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 75aaca8462..73e5de5957 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2327,6 +2327,12 @@ have_afalg = get_option('crypto_afalg') \
>>    '''), error_message: 'AF_ALG requested but could not be detected').allowed()
>>  config_host_data.set('CONFIG_AF_ALG', have_afalg)
>>
>> +if targetos != 'windows'
>> +  config_host_data.set('CONFIG_AF_UNIX', true)
>> +else
>> +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
>> +endif
>> +
>>  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
>>    'linux/vm_sockets.h', 'AF_VSOCK',
>>    prefix: '#include <sys/socket.h>',
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index 0e2298278f..d85f3ea3ee 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -17,6 +17,15 @@
>>   */
>>  #include "qemu/osdep.h"
>>
>> +#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
>> +# include <afunix.h>
>> +/*
>> + * AF_UNIX support is available since Windows 10 build 17063
>> + * See https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
>> + */
>> +# define WIN_BUILD_AF_UNIX 17063
>> +#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
>> +
>>  #ifdef CONFIG_AF_VSOCK
>>  #include <linux/vm_sockets.h>
>>  #endif /* CONFIG_AF_VSOCK */
>> @@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
>>  }
>>  #endif /* CONFIG_AF_VSOCK */
>>
>> -#ifndef _WIN32
>> +#ifdef CONFIG_AF_UNIX
>>
>>  static bool saddr_is_abstract(UnixSocketAddress *saddr)
>>  {
>> @@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress *saddr)
>>  #endif
>>  }
>>
>> +#ifdef CONFIG_WIN32
>> +static bool afunix_available(void)
>> +{
>> +    OSVERSIONINFOEXW os_version = { 0 };
>> +
>> +    os_get_win_version(&os_version);
>> +
>> +    return os_version.dwBuildNumber >= WIN_BUILD_AF_UNIX;
>
>
> I think this is a bad variant to check feature support by checking
> Windows build. From my point, you should try to create an AF_UNIX
> socket and if it fails then fall back to the old behavior.
>

The caller intends to create an AF_UNIX socket, and if Windows does
not have the capability, it fails, and we return -1 to the caller.
I am not sure what old behavior we should fall back to.

Regards,
Bin

