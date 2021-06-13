Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94D3A55F9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 03:41:42 +0200 (CEST)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsF88-0005HU-SB
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 21:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lsF7G-0004ba-Vu
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 21:40:47 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:46214
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lsF7F-00015j-89
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 21:40:46 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4G2cjB2q6Vz8PbN;
 Sat, 12 Jun 2021 21:40:30 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=v2xfQcFfd
 CbVegjDxQ74ocBN+fg=; b=KkKXvSCGQaY+3x/9Sk8/4uHPr4ALrRvjh5trv0nJX
 ZC7a+pvxyv8SdJIvBcEU0TQu2u/Ff5vjLLo2zwqX8RUamlCtXmXZIsp5B5Jyu3mD
 0CPxBKCVcovhQmQcW3vkq0JUZuyEpYWLPMFPBTcGqOY8KGAzF1dglkPdmMuh7X31
 hY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Pr1
 yJuF0hzicFGuujPAVQKPpkfqZTTzW0+RNh+c+whpMv7gPRezn+h4XH4YddGaLyO1
 MCSRPjjOQ/Mv4ZIBlJf9n6r6Xz54W/pFlbBpytrR6ey6/auLM2mpKDojNlbnrsaE
 sJ+wvMXqpaOOuSwZmh82gHtDu8DmA8C6+a+WAYic=
Received: from [192.168.6.30]
 (bras-base-toroon2719w-grc-50-142-114-10-211.dsl.bell.ca [142.114.10.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4G2cjB1lKYz8PbK;
 Sat, 12 Jun 2021 21:40:30 -0400 (EDT)
Message-ID: <202eedd1-eb24-5463-c17a-64e146b95421@comstyle.com>
Date: Sat, 12 Jun 2021 21:40:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [PATCH] meson.build: Support ncurses on MacOS
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210612080358.61176-1-sw@weilnetz.de>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20210612080358.61176-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This same problem also applies to OpenBSD as we have the same
version of ncurses with support for wide characters. I have a similar
patch in our QEMU port.

On 6/12/2021 4:03 AM, Stefan Weil wrote:
> MacOS provides header files for curses 5.7 with support
> for wide characters, but requires _XOPEN_SOURCE_EXTENDED=3D1
> to activate that.
>
> By default those old header files are used even if there
> is a newer Homebrew installation of ncurses 6.2 available.
>
> Change also the old macro definition of NCURSES_WIDECHAR
> and set it to 1 like it is done in newer versions of
> curses.h when _XOPEN_SOURCE_EXTENDED=3D1 is defined.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   meson.build | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index d2a9ce91f5..3ca8faa264 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -606,7 +606,11 @@ if have_system and not get_option('curses').disabl=
ed()
>       endif
>     endforeach
>     msg =3D get_option('curses').enabled() ? 'curses library not found'=
 : ''
> -  curses_compile_args =3D ['-DNCURSES_WIDECHAR']
> +  if host_machine.system() =3D=3D 'darwin'
> +    curses_compile_args =3D [ '-D_XOPEN_SOURCE_EXTENDED=3D1']
> +  else
> +    curses_compile_args =3D ['-DNCURSES_WIDECHAR=3D1']
> +  endif
>     if curses.found()
>       if cc.links(curses_test, args: curses_compile_args, dependencies:=
 [curses])
>         curses =3D declare_dependency(compile_args: curses_compile_args=
, dependencies: [curses])

