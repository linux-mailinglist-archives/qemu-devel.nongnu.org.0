Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326D318879
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:48:13 +0100 (CET)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9W8-0007Cf-5l
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA9Ty-0006Xs-SH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:45:59 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA9Tv-0002Zz-MA
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:45:58 -0500
Received: by mail-ed1-x532.google.com with SMTP id q2so6400999eds.11
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+FMAKZAQEVMNBUIi9niL12y2bLyj8jjbJx0Vnd9A7VI=;
 b=E6rU89uTN90Tu1WNL61Q7rvJ2f645s587omkS2hUCHzc9btfdx6aAglG/SfrD+Kb1V
 FPuj1Yk6q4IHb06HriUAXPSuGRXQFQnUuKGf7cb7ZOcKggc3JxeoHzOXiqJv/anApB30
 MOKHFt7hs/Pk3gwFUby0kQD77gCl6zQwYhrGZeqUdlcfXFlRgLONMD9eDLPFKkLBZ6hI
 Q1VKhWrG8MuhyDFbCyN5ye9cNlpAsQ+SKkuk72ImTyR2dvUFfYbMySx2pZELwPCmF+xn
 F8z4qnll/NK4zAA5t8Du5u98axxvyFledapsa8l/61Ixar1GiGS5cmSUAQnpF2F5hJtF
 7gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+FMAKZAQEVMNBUIi9niL12y2bLyj8jjbJx0Vnd9A7VI=;
 b=H0SP/d+4z3lw6RBq6aPCg/GN2/uF2DsNdPj+0jfM8Tp16A7upSG+M52O6QlXxMoLZf
 AY4fBCvO/7OfTOjPLt4RRklUZ71o4KIR7qzSEWm+n2UcA2qjaqjSdPbIlc37WBSW4dnO
 3/MfDjL6foCKG0n3wVSYIN3EbNcKuWP3qdj/Ls+kJzn/zJCOewb05oqQiMUBzORNSnqr
 kh7bhX45VvOry3znXRoBCN94ebo+Uzer834vYrh1PYXRc6d0LJ6X+J0KbAUYVuER0q63
 SEtjpTOqnPM+SRDhOGjOcSuYKCUmjLpiE5lDo4ZY2uzuaLODmTrzakcktUqCLSwKDPqC
 b0mQ==
X-Gm-Message-State: AOAM533/q6m6EgRfncLJHq4VvkBwDXeFe6/Bw2gEiQASJUTRxl/qyNTl
 PDwQFLmCErGEHCGN6wnFypEvU8GJa7FWzQzDzIr/fux33fh/Dg==
X-Google-Smtp-Source: ABdhPJxRZdbvKuK6h+3RCQUPeDTFaf86nhf8lc3884vxVQzEOowxBypGxD5BaWeF6FN3vPV8IQmkuNKwkcGN2z3S/PA=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr7799151edc.164.1613040354217; 
 Thu, 11 Feb 2021 02:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-23-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-23-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Feb 2021 14:45:42 +0400
Message-ID: <CAJ+F1CJeDOiju8mgM2YSbTi_DS8NUHpq_7D_eX+c8fVQt4T9ow@mail.gmail.com>
Subject: Re: [PATCH 22/22] [NOTFORMERGE] Bump Avocado version to latest master
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Feb 3, 2021 at 9:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> This is intende to be replaced by a bump to Avocado 85.0, to be
> released by Feb 8 2021.
>
> Latest master contains an improvement to "avocado.utils.vmimage" that
> let's it download older Fedora images from the archive locations.
> That allows the currently set Fedora 31 images to continue being used.
>
> Reference: https://github.com/avocado-framework/avocado/milestone/11
> Reference: https://github.com/avocado-framework/avocado/commit/e4d67e96ee=
9563436dcf7dd83902723576657d29
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Although it's not a panacea to use its API, you may consider using
osinfo in the future. I gave it a 5min try to have:

import gi
gi.require_version('Libosinfo', '1.0')
from gi.repository import Libosinfo

l =3D Libosinfo.Loader.new()
l.process_system_path()
db =3D l.get_db()
os =3D db.get_os_list().get_elements()
for o in os:
    for l in o.get_image_list().get_elements():
        print(l.get_url())

> ---
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 62e8ffd28c..8ddf0d8c86 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,5 @@
>  # Add Python module requirements, one per line, to be installed
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> -avocado-framework=3D=3D83.0
> +git+https://github.com/avocado-framework/avocado@9b372adeec6dceaba276ca4=
729f2e5a2fcccaa4c#egg=3Davocado_framework
>  pycdlib=3D=3D1.11.0
> --
> 2.25.4
>
>


--=20
Marc-Andr=C3=A9 Lureau

