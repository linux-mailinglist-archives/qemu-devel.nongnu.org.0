Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F273DA3A0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:01:32 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95fH-000666-S2
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95ck-0004cw-5c
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:58:54 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95ch-00073D-R1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:58:53 -0400
Received: by mail-ed1-x52f.google.com with SMTP id da26so8120120edb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0lXqeVVDt4MCLBgGCz8Hb63Bb6AQwmRQEQdLZkNdNSA=;
 b=tsAa0cwTPWyjlG9/LGeB+ZFpDrg0TCQh7jpdjk5QWwSIvzjYkffwRTHxno+iVA+6MN
 GJsoLvIAkgS7H3C8hU4IXkn9ntRr/pCWv//mb/Tu8VGovxadyxes/ZHw8/m2yVRJMqnm
 gt0gCTGyKda19dcqfZVciYW8C04ir5PEY3Spqi3ulJJV/gyIORTTfry1w9vLU+hlExlK
 LmFlLyQTLn4zXUAQTw6CosDFI9Iqg4stbrWFmrnF005we+XB7i/jZbOngONV69ds+QKb
 1vTQ5Q5/td/FvOzSTOxno8qiQhwSX/enqE/p8hBOkpiD5Z1QLqaD0LgjIzDO9OUwShwz
 Y6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lXqeVVDt4MCLBgGCz8Hb63Bb6AQwmRQEQdLZkNdNSA=;
 b=hBcz6WTSkN4RLtrLHR3urco9sLykMxiTHOsdYcnFjasCtovvDCxaV+fDsRwjXPO9Zy
 n55BjFiMlbWMdvsksO9KVuOYBw3ipw93lOWLZ4jknYCab8eZ8f/aAYOhYRjyZQGTmV6v
 /3K6XTx+Wifd7R50emqAaVoZvS1Kf+I2mtuRqAvc8in4qBF3fe8gIn9eeizSPvfExMaW
 VjjXNOabakgSGYyj5z3SlThxEDPGbhT4+yeXCC2URCXjqgkH4L5P4adafiQWUas9I0cp
 EnmnzkytJtaC/gJMl5aj4sFVugv6m+MROhnJIFB8fCMdtPckXxomxyS+Y3QmMAeqeXsu
 yYDw==
X-Gm-Message-State: AOAM533JzS3ZJT4msE/R+LU0I8mfsycsOvJK0Fo7gzZbyIOOpN+UyNzn
 j6CyhwYnd85MXQj+q9hQGePxV7E+VuBu6loKTO54+38rowM=
X-Google-Smtp-Source: ABdhPJxi2H7dhJLCgc0U0N2DY66cmh8bhLD6DrQ2r/FfDTAov6C5iByzmsFpIVL3V4xV48KK8vONJUf9QVBNlDVaUps=
X-Received: by 2002:a50:f615:: with SMTP id c21mr6064663edn.146.1627563529694; 
 Thu, 29 Jul 2021 05:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210729124713.208422-1-pbonzini@redhat.com>
 <20210729124713.208422-7-pbonzini@redhat.com>
In-Reply-To: <20210729124713.208422-7-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 13:58:06 +0100
Message-ID: <CAFEAcA8UO1J-N1cXdJiaeXUEX_MkhmTqHzgdSHNmogtTcpkqtQ@mail.gmail.com>
Subject: Re: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user
 subproject
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 13:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Meson now checks that subprojects do not access files from parent
> project. While we all agree this is best practice, libvhost-user also
> want to share a few headers with QEMU, and libvhost-user isn't really a
> standalone project at this point (although this is making the dependency
> a bit more explicit).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20210505151313.203258-1-marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  subprojects/libvhost-user/include/atomic.h       | 1 +
>  subprojects/libvhost-user/libvhost-user.c        | 2 +-
>  subprojects/libvhost-user/meson.build            | 6 +-----
>  subprojects/libvhost-user/standard-headers/linux | 1 +

> diff --git a/subprojects/libvhost-user/include/atomic.h b/subprojects/lib=
vhost-user/include/atomic.h
> new file mode 120000
> index 0000000000..8c2be64f7b
> --- /dev/null
> +++ b/subprojects/libvhost-user/include/atomic.h
> @@ -0,0 +1 @@
> +../../../include/qemu/atomic.h
> \ No newline at end of file

> diff --git a/subprojects/libvhost-user/standard-headers/linux b/subprojec=
ts/libvhost-user/standard-headers/linux
> new file mode 120000
> index 0000000000..15a2378139
> --- /dev/null
> +++ b/subprojects/libvhost-user/standard-headers/linux
> @@ -0,0 +1 @@
> +../../../include/standard-headers/linux
> \ No newline at end of file


Should these really be missing the trailing newline ?

-- PMM

