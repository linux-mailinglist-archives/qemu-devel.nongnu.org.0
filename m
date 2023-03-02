Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081806A876D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:56:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmCz-0007Yc-Um; Thu, 02 Mar 2023 11:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXmCs-0007Xe-UX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:55:03 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXmCr-0000c2-5f
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:55:02 -0500
Received: by mail-pg1-x531.google.com with SMTP id s17so10171388pgv.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 08:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677776098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iRRAjdTj2OD4cnrOrOX48miCmbHGkD5hGu2y4DQ433A=;
 b=fg/xbpTvVbSjBVO3u2vbHVhxyXpwBqEa8w/PfcT0a0LNYRKj2RQ248lwBrIwf/1PX8
 4lhzqrthvLbnLXOeBJ2oiUC+xeIyUAvUhUDiikVlrXRBxKg6T/0oCFKUqlUS4OwU5Mn1
 J4Tq3RM3J6B+SU5xfCqj5tX6srtj/+L2ielciFT0JScupMYrUqZYIk87Yo1wAgOwcHzC
 cmnPX5FzaDwbsbyN86d5f0cqZKA1rD2Z5WlGXBK5/byBovz7bA+oPlJZiM7hqIVMDtAN
 4Wa/0lkDz+yEBuqNVwW+STXrY42FeF9qjEjYIM+QydiXnPFw23NUBShUDBP4tMTPTF9w
 6IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677776098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iRRAjdTj2OD4cnrOrOX48miCmbHGkD5hGu2y4DQ433A=;
 b=v0dEyUTk+SiUWA3b8Num4UtI67+1DSjOgIaPynS0PWbcOgBiySJMRBPii3lR+QLyIH
 QgH1r2jDLEE2sfHjjjont/4UoLeylRZqMMzVEaCAre5ZD80re9Qv3Mbtn0/5rija2UP1
 kS/ds+9HcXfo/X+jTwelGxReuLvFCzSa6hIiDYHwnz/LfEYnR8zFGmk9G+9gUzjEDQmu
 daAWMxsJHUkEmkpDn8SKpWP7yiU+58sHDVifZmgodbPESK878RsiuKEm+0EIygbcsabJ
 ou6NFjhpH0nEZSuaE9Zh3joFe/qaAlSl33d6JThDRxFcx5hDmr+IaoDEwWy5IxVGxZ4E
 Hkkw==
X-Gm-Message-State: AO0yUKVqldxoafbnVq36I8PNcWH0Pi8eC50CwACNKxwigW9uqCf+y4eX
 /vgQRgsmztqcdr4ts7fWYK1psdtsdSbB/f4Lwbp0Ng==
X-Google-Smtp-Source: AK7set/5Bicbc+MYv64VqlY+wmy516J4Cet6w5G1zrEW89kio5dy1v2HLEvBtjlqgCyDCSIyVZC/aT5RG4v+8BR7EQ4=
X-Received: by 2002:a63:b55a:0:b0:502:fd71:d58c with SMTP id
 u26-20020a63b55a000000b00502fd71d58cmr3725421pgo.9.1677776098661; Thu, 02 Mar
 2023 08:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20230227175524.710880-1-pbonzini@redhat.com>
 <20230227175524.710880-4-pbonzini@redhat.com>
In-Reply-To: <20230227175524.710880-4-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 16:54:47 +0000
Message-ID: <CAFEAcA8CgQ_A=CspS9YUX+VXaznCKW4aCmghqEOJyyBsOmMH5w@mail.gmail.com>
Subject: Re: [PULL 03/13] meson: stop looking for 'sphinx-build-3'
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 17:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: John Snow <jsnow@redhat.com>
>
> Once upon a time, "sphinx-build" on certain RPM platforms invoked
> specifically a Python 2.x version, while "sphinx-build-3" was a distro
> shim for the Python 3.x version.
>
> These days, none of our supported platforms utilize a 2.x version, and
> those that still have 'sphinx-build-3' make it a symbolic link to
> 'sphinx-build'.  Not searching for 'sphinx-build-3' will prefer
> pip/venv installed versions of sphinx if they're available.
>
> This adds an extremely convenient ability to test document building
> ability in QEMU across multiple versions of Sphinx for the purposes of
> compatibility testing.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Message-Id: <20230221012456.2607692-6-jsnow@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi. I've just noticed that this breaks incremental rebuilds:
meson.log says:


[Errno 21] Is a directory: '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/'
Unusable script '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/docs/'
Program  found: NO

../../docs/meson.build:1:0: ERROR: Program '' not found or not executable

>  docs/meson.build              | 9 ++-------
>  meson_options.txt             | 2 +-
>  scripts/meson-buildoptions.sh | 1 +
>  3 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index bbcdccce68a8..bb72c10ea8c5 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -1,10 +1,5 @@
> -if get_option('sphinx_build') == ''
> -  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
> -                              required: get_option('docs'))
> -else
> -  sphinx_build = find_program(get_option('sphinx_build'),
> -                              required: get_option('docs'))
> -endif
> +sphinx_build = find_program(get_option('sphinx_build'),
> +                            required: get_option('docs'))
>
>  # Check if tools are available to build documentation.
>  build_docs = false
> diff --git a/meson_options.txt b/meson_options.txt
> index 6b0900205ea7..fc9447d267bf 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -12,7 +12,7 @@ option('pkgversion', type : 'string', value : '',
>         description: 'use specified string as sub-version of the package')
>  option('smbd', type : 'string', value : '',
>         description: 'Path to smbd for slirp networking')
> -option('sphinx_build', type : 'string', value : '',
> +option('sphinx_build', type : 'string', value : 'sphinx-build',
>         description: 'Use specified sphinx-build for building document')
>  option('iasl', type : 'string', value : '',
>         description: 'Path to ACPI disassembler')
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 5d969a94c08e..009fab151571 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -55,6 +55,7 @@ meson_options_help() {
>    printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
>    printf "%s\n" '  --mandir=VALUE           Manual page directory [share/man]'
>    printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
> +  printf "%s\n" '                           [sphinx-build]'
>    printf "%s\n" '  --sysconfdir=VALUE       Sysconf data directory [etc]'
>    printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
>    printf "%s\n" '                           [NORMAL]'

I think this happens because the commit has changed the
default value of the '--sphinx-build' option, but if you're
doing an incremental rebuild then meson will get run with
the old default value (which is the empty string) and the
new meson.build doesn't expect that and falls over.

Manually rerunning configure fixes this, but ideally
incremental rebuilds should Just Work.

thanks
-- PMM

