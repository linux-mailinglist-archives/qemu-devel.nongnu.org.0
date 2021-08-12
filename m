Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C913EA437
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:01:32 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9Or-0003PR-E4
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9Mx-0002dN-7q
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:59:31 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9Mv-0006of-Ie
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:59:30 -0400
Received: by mail-ej1-x62a.google.com with SMTP id qk33so11004451ejc.12
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+kaVxDXxpVxmGDIV6L0SwqwvQwRGw59nLqFJ+h0kM4=;
 b=ygBVQv0EckIjOloj5i6oXqnh3oRj2huBkyA6u+7sXRQhloPvRdUKLExHBu+eJbcch4
 2x9H+lX3rqZ5nGI2UR/+CUpUw4iaBSfQXeJqNSy4Ml15hEiIQvHP5GPSTmLdWe6WrO6f
 7Jt/4Ba3F5JzisDN9k6B5BCLEuo1BUX2Ojxl7Z/+ICQabaLFz6RRQO600yJDh+XDaema
 4ncDb0BuMJemEZ4PK9UNO9bnWu3zkn/Sbeu1yKMA2KwM+ciEF+8LcB3ZWAHVIecnxbYl
 2xtXMzFOJ6o/AGnuNibPq5ej2G4xu9jRzcv4QMKcyVoRT/xa9JH/88UdOZC6Un2RrJa2
 Z31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+kaVxDXxpVxmGDIV6L0SwqwvQwRGw59nLqFJ+h0kM4=;
 b=mjCnlBEAJHgzml50fB+u8H7zkI1qDioRQWmDXaDTrpEM1Eo/90nm6mn7Jt1PAopqyc
 GyZTUqh7au+0life/FtQHrzjxJ9yxf6RbFJqBKPiI2Kh4bp/bvpil5nJMVC6N4jja0/W
 0jHbqeKw55+2Vr1nViR8uPfZUmmdOHyzpw9/kpWrKfcGCFDKGem0D/3FYfv3MDb361WY
 9UkhcEHNzWBYcm2chix1cypXWDDACCZWTk2/5V6euEgEDUsONq5PwIT8eEAav+M00ALW
 01NYRcIXbO2iuivY8qpVhljwXApHjCaAYrVTM6omHPhxVXzRgqa90HHMgl3D34NT9p26
 u+jA==
X-Gm-Message-State: AOAM530ojMtMq59HiacCmqpcERFarDtJ4U8ocW6tR7SLYSOrw2tJdDY1
 o4PxpOdVChN3MXNiJoOKZJh3iRA8ai390lIwMueuBQ==
X-Google-Smtp-Source: ABdhPJyif6WBdC2g7vs7QN9+R89fHyZYDVQtuDaCPhWl/oLrPmXordjV4GDCRDHb5Ocl+yWmio7I5cN332qZkfp2aZk=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr3366895ejb.4.1628769567799; 
 Thu, 12 Aug 2021 04:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210812110942.19065-1-dgilbert@redhat.com>
In-Reply-To: <20210812110942.19065-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 12:58:42 +0100
Message-ID: <CAFEAcA9dp-kM_cB9g=7kpeCbFVxiwoQ14L+mymc_pHwZ_1UDnA@mail.gmail.com>
Subject: Re: [PATCH] configure: Remove spurious [] from tr
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 12:11, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> ShellCheck points out that tr '[a-z]' actually replaces the []'s
> and only the a-z is needed.
>
> Remove the spurious [] - although in this use it will make no
> difference.
>
> Fixes: bb55b712e8dc4d4eb515144d5c26798fea178cba
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 9a79a004d7..5bb8c2a59d 100755
> --- a/configure
> +++ b/configure
> @@ -4549,7 +4549,7 @@ if test "$gprof" = "yes" ; then
>  fi
>  echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
>  for drv in $audio_drv_list; do
> -    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
> +    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr 'a-z' 'A-Z')
>      echo "$def=y" >> $config_host_mak
>  done
>  if test "$alsa" = "yes" ; then
> -

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(Is this the only thing shellcheck complains about in configure?
I'm guessing not...)

thanks
-- PMM

