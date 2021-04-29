Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52336E74A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:47:30 +0200 (CEST)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2KX-0007ie-Au
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc2IH-0006MT-JV
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:45:09 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc2IE-00006q-4B
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:45:09 -0400
Received: by mail-ej1-x632.google.com with SMTP id r9so98678083ejj.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 01:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uyu3v3f+o/plcfVXPzXcHG3elCdzqOoyBs5G0JdCXVA=;
 b=tJQWHr1JYKCjFVfROg+zKPlQqy2yIgaOJcHDyqwVIXiBjX1Zu8HLY5jcA8gvcy8KM8
 5Skbw+h1ACZrWA5NPJsgzO2TtT9cEnNEQ0WmKwkXSQQEp6EWP7zg1Imjy7NjkeFZrudu
 +PSRJK8Gkf2V0AYwuOb4VKURyo46AqiFB8ZHAFuVFdlbWtSUYV2/Xpl5AwE/iMmvjrco
 VELl6yFTmy7Vy4FDACl+EvdQcEWPpr9sf6XWKoE5oy3r3YnkyOi5IvOzE08PQgl4scjM
 d4P1acEaw6rlV7+T3tz4BVTHScWw5w/epRF/jCf1UN+9tVVBg7YuMVBHScx33uqD5f+9
 XUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uyu3v3f+o/plcfVXPzXcHG3elCdzqOoyBs5G0JdCXVA=;
 b=YBkBbkPCWVj2lBGG/rPsn7ox2yaTJ3Bm0wyMvRX6pJV4pYMbU3qkyTjJATXiCExL+M
 n7flXhdYmoFn00uykxHzDMUCPUOGVjiDUmup9PFYTj6htbh5buzhWaasFP0px3Smnr2f
 J74Jv00R3UqCwmMcja7+k6xVbSam+snrxMTN9XyE1BawV5FEuCMyEDDaAT6hKwrh4OjM
 /4B9jI9OurBPTG05R+fq1nJheZQzCxe2OLf2P0rO108JH3M1JuUG37RsStShHf99FA3w
 gHbfsi085qXEs2qipLrPa4Yas5Lse8IkLgD6fA1fjRk3dZNo5Kfjgy7TQY9HJaWrpFFQ
 392g==
X-Gm-Message-State: AOAM531vO+/73cl9FQKjlnP4JLCnXKeK7hx6xvZIDcPbC7RLQ9N3ivSQ
 2zWv0YQDFQJodzvdDAL13eSGe4mh27oECbCIr3q5hA==
X-Google-Smtp-Source: ABdhPJynbXtQYHaEaYGU4mG6kq3PJtVBPed5OlC7Ma6G0jec4HqRDc+vuZdY+26ahhEEQQ1MQYlVpieKusTa3Qhb3y8=
X-Received: by 2002:a17:906:93f7:: with SMTP id
 yl23mr32395956ejb.407.1619685904065; 
 Thu, 29 Apr 2021 01:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-2-philmd@redhat.com>
In-Reply-To: <20210429083346.61030-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 09:44:03 +0100
Message-ID: <CAFEAcA-ROOwxAg5oF3hK=Qh-mBcyp3d=sb4pNuxG1ZBNLruEig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] meson: Select 'have_system' when virtiofsd is
 enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Apr 2021 at 09:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> When not explicitly select a sysemu target and building virtiofsd,
> the seccomp/cap-ng libraries are not resolved, leading to this error:
>
>   $ configure --target-list=3Di386-linux-user --disable-tools --enable-vi=
rtiofsd
>   tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires =
libcap-ng-devel and seccomp-devel
>
> Fix by enabling sysemu (have_system) when virtiofsd is built.
>
> Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8..f858935ad95 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -51,6 +51,8 @@
>    have_system =3D have_system or target.endswith('-softmmu')
>  endforeach
>  have_tools =3D 'CONFIG_TOOLS' in config_host
> +# virtiofsd depends on sysemu
> +have_system =3D have_system or not get_option('virtiofsd').disabled()

This looks odd. The natural assumption is that "have_system" ought to mean
"we are building a system emulator", not "we are building a system emulator
or virtiofsd".

thanks
-- PMM

