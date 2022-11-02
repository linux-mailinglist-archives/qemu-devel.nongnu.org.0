Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156CD616B54
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 18:57:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqHyF-0006DO-9f; Wed, 02 Nov 2022 13:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqHyD-0006Cr-BJ; Wed, 02 Nov 2022 13:56:09 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqHy9-0004hS-4k; Wed, 02 Nov 2022 13:56:08 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N5G5b-1p0M5g3z8P-0116l8; Wed, 02 Nov 2022 18:55:58 +0100
Message-ID: <3510749f-eef6-c581-7978-7274e677b40b@vivier.eu>
Date: Wed, 2 Nov 2022 18:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] tests/unit/test-io-channel-command: Silence GCC error
 "maybe-uninitialized"
Content-Language: fr
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org
References: <20221101213937.21149-1-shentey@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221101213937.21149-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+RvXt9ymMG05kzXvTRfTm8X8B8NFt6n6aA3dxqw4Uglm7ZxB14V
 91O6arqk6d9rxVrgi3d0hsqmFjCNV1KKXM7/swi3vjGMEDJcqdN+7lu/PwqL7bl7bwC9F1h
 zc4oC3oApt/eMsZ2r1EAqjWUBmJDeFRe5JQHj0CWFyVEUUCafqx7lYGvd7RdVtD7//NaK5M
 WccrT2r12slOakoUwKLsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wf9nCYrHFp8=:ASNeMhpzEyqW443FZjUHWH
 EM35HO8VHxPXUFDaU44YDgKaAs+Q03DxR/wNktTi16ZvvLdqjfrDb2l/MsX5BtQI7vW/2nJ5u
 LNIOvsZC1KDD1p1B3VBZS/OsF2hQVUHQgjtSdOW877yPAEJCtzDEv7WLSSPqt8Bx5vvtJV/bm
 kAiefDxNAvlToTqOLnxGc9aMZU22a7kpaEeEwx9UnWJCy61bZEVUbMCts7xk0UGbBoAPZb4gM
 IS2rMdjqxprk/9ZYlTV7VKe7WOoSX9cuZqlTm/eodkERIl8YshN2VzH8OHfR526z8HDoEb7aM
 +92Owv0Ia1g78K7jiyklnyMRhC/Dl2grzIj1Ba1eF/VddD+twgx9wi+SmNRKneew54OtQ7XqH
 2sM/Ma9vCFNd67fi3AGagiyY5DAeqoyK9RI5kMYZadWkMnYCfGljpOSTldKcudCq6kPsk049f
 K6mfxQgE6xDhSdLdWyUJ9G9hEPO24WWKJvBmHJRejbGrYld7K9MAxSpnYdLjiic/2ampZIV63
 u8COdbmSefs07bBIIx59yN8ej4H2hZUOBFEHrWSUnYtEjn6/mxlTt0rwuzVSjCVdvMhHRmlIQ
 KZAFrtb0a0ySMEBGnUKzp9SyindAl9JjkjdsrhZV7pTdkfDNlKiFZe+nb3aYF7ZnDRD1QABXy
 jdTE983zyEtNme+zJVmKxYo2rVGy7UDnkGTaj9QKEoWFCGeLDuZrohOxEIodH0852dKiA+leK
 jhSkzHEYm0XDEOnf+/HbiJNa8G2xNH4ig66bds+nx7R6FqNHR/ACs7d+6DDH4oJnLoKQP+L0j
 8r8mwFR
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 01/11/2022 à 22:39, Bernhard Beschow a écrit :
> GCC issues a false positive warning, resulting in build failure with -Werror:
> 
>    In file included from /usr/lib/glib-2.0/include/glibconfig.h:9,
>                     from /usr/include/glib-2.0/glib/gtypes.h:34,
>                     from /usr/include/glib-2.0/glib/galloca.h:34,
>                     from /usr/include/glib-2.0/glib.h:32,
>                     from ../src/include/glib-compat.h:32,
>                     from ../src/include/qemu/osdep.h:144,
>                     from ../src/tests/unit/test-io-channel-command.c:21:
>    /usr/include/glib-2.0/glib/gmacros.h: In function ‘test_io_channel_command_fifo’:
>    /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘dstargv’ may be used uninitialized [-Werror=maybe-uninitialized]
>     1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none) (func) (*_ptr); }     \
>          |                                                                                                         ^
>    ../src/tests/unit/test-io-channel-command.c:39:19: note: ‘dstargv’ was declared here
>       39 |     g_auto(GStrv) dstargv;
>          |                   ^~~~~~~
>    /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘srcargv’ may be used uninitialized [-Werror=maybe-uninitialized]
>     1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none) (func) (*_ptr); }     \
>          |                                                                                                         ^
>    ../src/tests/unit/test-io-channel-command.c:38:19: note: ‘srcargv’ was declared here
>       38 |     g_auto(GStrv) srcargv;
>          |                   ^~~~~~~
>    cc1: all warnings being treated as errors
> 
> GCC version:
> 
>    $ gcc --version
>    gcc (GCC) 12.2.0
> 
> Fixes: 68406d10859385c88da73d0106254a7f47e6652e ('tests/unit: cleanups for test-io-channel-command')
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   tests/unit/test-io-channel-command.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 43e29c8cfb..ba0717d3c3 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -35,8 +35,8 @@ static void test_io_channel_command_fifo(bool async)
>       g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
>       g_autoptr(GString) srcargs = g_string_new(socat);
>       g_autoptr(GString) dstargs = g_string_new(socat);
> -    g_auto(GStrv) srcargv;
> -    g_auto(GStrv) dstargv;
> +    g_auto(GStrv) srcargv = NULL;
> +    g_auto(GStrv) dstargv = NULL;
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
>   

Applied to my trivial-patches branch.

Thanks,
Laurent


