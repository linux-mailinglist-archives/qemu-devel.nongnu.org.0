Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE32658406A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:54:58 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3yb-0003Fx-Ne
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oH3lf-0007qh-Hj
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:41:35 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oH3ld-0004nL-Ex
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:41:35 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id v2so1399689qvs.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uLeC6BaFfPn4L8Lcg/PUOK341RICRqQMTnKtPybdXG0=;
 b=FVYIPWR1EacKpg8IjCeuAkO838VETbyFoaWkIPtHcrWUVlPcyxYoehvv4R+2AXsS8u
 kSUfzLowyHJS1ZAj62Ixyf2QLjnxeEKIOmm6wdOGfa6O0Cef6TSB8ch6c1LVcdITp3eF
 NCz7xr7FZMYPyojYk/MaVbqfw7WD+xCUMl+JL7e7vqQKNjr2rKY6YpGY/yyy3ca7BN9x
 d1ptN9PfYqjFoHfGRwKHrquOTp5pRMrxF62C6ChGNQua1IlRPKcJDGS5bMIWxGIjK4J7
 NdLS5AQCfuVPtZIzBooczNo4BAuStq51QlOE1HogLkWa2hBConV9YB8MmF7QrTufkaGG
 ftAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uLeC6BaFfPn4L8Lcg/PUOK341RICRqQMTnKtPybdXG0=;
 b=h3/+XQcwGaghFwtmd99vsVf5C9yAoIXi5IFV9QTIrFN0kV5ljyFjGsB67EnG0gPY3a
 vutU7Mh/v2graKEALmDrpF7FINacJYZuchEgb/cmlPfvHYN0qQSanwG6e7tIdFfLsJOl
 eRESxO0l7EePo3nB/legknSHWI15Go+8dEiff9djvC50WPqgj4KqtBxLrPr9OkNlXH6K
 u+N0pFhaq/NnQGMk3n6X+UilnHS0yhBPgxeXg/EHKT2qHxtZx52Io/DbTfgGGZ8ekDtU
 L+5AeO+PbPjFGCJsO/SjOmdyFMSBTaAL6a/sovC0g1b5UfIni+sr6Sxn74M3GLjZlPbo
 e+Kg==
X-Gm-Message-State: AJIora8FQnU69aRxIiW9wsOYMwCYj82KWL4y2ECBzgLJdRtHK0Xn+r3r
 to/K0o4KifGZ8S0qzkiNGLKHnnsBhle5LSNyQYo=
X-Google-Smtp-Source: AGRyM1vPBtjkaIM/CnFchxoEgkLeWx1mMSLGTXYw/vAE9aeMkQBqiMqNznbw24MxlaEjodkgQoFiGuG/8FartfLC8Fo=
X-Received: by 2002:a05:6214:5195:b0:474:454a:cfe7 with SMTP id
 kl21-20020a056214519500b00474454acfe7mr17894597qvb.85.1659015692276; Thu, 28
 Jul 2022 06:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-5-bmeng.cn@gmail.com>
 <CAPMcbCo81iCA7ZnvWY7=OqA7vrAuhx7jA5EPiqJLnq4LzpKstA@mail.gmail.com>
 <CAEUhbmWXhXYSYtBUy1vnaa7uaZ10Z9ybjh3ZZmaJAW7K7fV08w@mail.gmail.com>
 <CAJ+F1C+5r2_qwsynRc4V2qiaZYEs8HhvJ9TGZUkGa0g6hTHAhg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+5r2_qwsynRc4V2qiaZYEs8HhvJ9TGZUkGa0g6hTHAhg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Jul 2022 21:41:21 +0800
Message-ID: <CAEUhbmUUFJ19xfuQgoVOsF3FtjkjQzjk6KxJXeotKjB9s_5oOA@mail.gmail.com>
Subject: Re: [PATCH 4/5] util/qemu-sockets: Enable unix socket support on
 Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 QEMU <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
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

On Thu, Jul 28, 2022 at 9:11 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Jul 27, 2022 at 2:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Wed, Jul 27, 2022 at 4:53 PM Konstantin Kostiuk <kkostiuk@redhat.com>=
 wrote:
>> >
>> >
>> >
>> >
>> >
>> > On Wed, Jul 27, 2022 at 10:47 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >>
>> >> From: Bin Meng <bin.meng@windriver.com>
>> >>
>> >> Support for the unix socket has existed both in BSD and Linux for the
>> >> longest time, but not on Windows. Since Windows 10 build 17063 [1],
>> >> the native support for the unix socket has came to Windows. Starting
>> >> this build, two Win32 processes can use the AF_UNIX address family
>> >> over Winsock API to communicate with each other.
>> >>
>> >> Introduce a new build time config option CONFIG_AF_UNIX when the buil=
d
>> >> host has such a capability, and a run-time check afunix_available() f=
or
>> >> Windows host in the QEMU sockets util codes.
>> >>
>> >> [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windo=
ws/
>> >>
>> >> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >> ---
>> >>
>> >>  meson.build         |  6 ++++++
>> >>  util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++-----=
--
>> >>  2 files changed, 47 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/meson.build b/meson.build
>> >> index 75aaca8462..73e5de5957 100644
>> >> --- a/meson.build
>> >> +++ b/meson.build
>> >> @@ -2327,6 +2327,12 @@ have_afalg =3D get_option('crypto_afalg') \
>> >>    '''), error_message: 'AF_ALG requested but could not be detected')=
.allowed()
>> >>  config_host_data.set('CONFIG_AF_ALG', have_afalg)
>> >>
>> >> +if targetos !=3D 'windows'
>> >> +  config_host_data.set('CONFIG_AF_UNIX', true)
>> >> +else
>> >> +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
>> >> +endif
>> >> +
>> >>  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
>> >>    'linux/vm_sockets.h', 'AF_VSOCK',
>> >>    prefix: '#include <sys/socket.h>',
>> >> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> >> index 0e2298278f..d85f3ea3ee 100644
>> >> --- a/util/qemu-sockets.c
>> >> +++ b/util/qemu-sockets.c
>> >> @@ -17,6 +17,15 @@
>> >>   */
>> >>  #include "qemu/osdep.h"
>> >>
>> >> +#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
>> >> +# include <afunix.h>
>> >> +/*
>> >> + * AF_UNIX support is available since Windows 10 build 17063
>> >> + * See https://devblogs.microsoft.com/commandline/af_unix-comes-to-w=
indows/
>> >> + */
>> >> +# define WIN_BUILD_AF_UNIX 17063
>> >> +#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
>> >> +
>> >>  #ifdef CONFIG_AF_VSOCK
>> >>  #include <linux/vm_sockets.h>
>> >>  #endif /* CONFIG_AF_VSOCK */
>> >> @@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr, =
const char *str,
>> >>  }
>> >>  #endif /* CONFIG_AF_VSOCK */
>> >>
>> >> -#ifndef _WIN32
>> >> +#ifdef CONFIG_AF_UNIX
>> >>
>> >>  static bool saddr_is_abstract(UnixSocketAddress *saddr)
>> >>  {
>> >> @@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress *sa=
ddr)
>> >>  #endif
>> >>  }
>> >>
>> >> +#ifdef CONFIG_WIN32
>> >> +static bool afunix_available(void)
>> >> +{
>> >> +    OSVERSIONINFOEXW os_version =3D { 0 };
>> >> +
>> >> +    os_get_win_version(&os_version);
>> >> +
>> >> +    return os_version.dwBuildNumber >=3D WIN_BUILD_AF_UNIX;
>> >
>> >
>> > I think this is a bad variant to check feature support by checking
>> > Windows build. From my point, you should try to create an AF_UNIX
>> > socket and if it fails then fall back to the old behavior.
>> >
>>
>> The caller intends to create an AF_UNIX socket, and if Windows does
>> not have the capability, it fails, and we return -1 to the caller.
>> I am not sure what old behavior we should fall back to.
>>
>
> I agree with Konstantin, we shouldn't check the Windows version, but assu=
me the socket creation can work, and just report a regular error if not.
>
> (you can drop some of the preliminary patch then)
>

Sure, will do in v3.

Regards,
Bin

