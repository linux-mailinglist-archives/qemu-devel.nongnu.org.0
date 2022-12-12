Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8F649A2F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eLl-00043q-2c; Mon, 12 Dec 2022 03:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eLf-00043H-Ks
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:39:43 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eLe-0005xa-0x
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:39:43 -0500
Received: by mail-lj1-x229.google.com with SMTP id f16so11731582ljc.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r66W6EgF4uWE2fVTpK01QBYDfqbBvvRrfXByFfg+cD4=;
 b=NAL4GYakSg5SvO4avxoQeUtbxOuTrhwwpPvnnGhmEvG7ovjrg+eIfNcrurBYAGufYo
 UrkZnkdxtYU/i9bJ+2m/jy9lIltAInfjfGNeG5cHml6wfMBQPWN0xG8ifTmJQRB2rOgj
 SJHqWUD4y5uR7eXGGskndXHH7ZgIwe91nM9Jdxq8/BEZ4ed+wkZwwJQr7GBVg31x8N5w
 B/hGIvr0WZxYtgHxtEeW4KsSGo2HTRBtaLAeh2cWVxhdnhiLfcXfMeqlTf9ceG4gIkM/
 sthfEJz4ao8+NRh+M1nr4hqbDnFoTBexNK0PJe5OJhEt/6foUSpeViGOMfduZkzpoyhE
 /4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r66W6EgF4uWE2fVTpK01QBYDfqbBvvRrfXByFfg+cD4=;
 b=Xrjx1WnJPHHluTbq3GRSxto9BnxW7qWWL/fcIGImpWqfSQFnuh8FGKz3eJ81/MvKtj
 se/JW61rnR53P2RYxjvf0bCPFKQxgL/iATGemd+KGAGrjK4TNPhIaRkqZFNlbdjGnRHD
 a/J6dkMzxf0617nSXzk5mgsH4ss86/UA5Hed5tN7ZIhpQ3E0tbMtAmVK14ii09CXLziX
 lG7d+5AlFZJwqSz+B5lOXP0fthsNGaYTcmA4wSzjrhpdXQQ9aWOF8xJaM7UzRNgpxpIj
 Njn/5SyLHx2LeAvs+HYPcpW23s+B7qr7cGzeNx4Zb0XigU6uMOCxoH4xEyU+OKPjA3mO
 C6HQ==
X-Gm-Message-State: ANoB5pnNSXESLXRNF+6ex2hkatIwx5y2I/d0PNT5bULwhVL4qjHI7PDD
 ips37LSDreMrbQxqOI0+HtbuRhMP1MnpUNIQx1A=
X-Google-Smtp-Source: AA0mqf555PvzfRejH9aIYb/AJ1yR0pw8e+cl+Nnd9WLo09Ns0aY8qSQmLVP5qIy6EIyoSFsFVx77f2+tDpgNRchKYOI=
X-Received: by 2002:a05:651c:38a:b0:26e:85d5:7e8 with SMTP id
 e10-20020a05651c038a00b0026e85d507e8mr28900360ljp.449.1670834379862; Mon, 12
 Dec 2022 00:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-12-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-12-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 12:39:27 +0400
Message-ID: <CAJ+F1CKBBGrOMRHB1nfNTHLt6+DsGhg619G+BwfQnCSfWMTbJQ@mail.gmail.com>
Subject: Re: [PATCH 11/30] meson: cleanup dummy-cpus.c rules
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Fri, Dec 9, 2022 at 3:48 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Now that qtest is available on all targets including Windows, dummy-cpus.=
c
> is included unconditionally in the build.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

(and doesn't have to be target specific)

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  accel/meson.build | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/accel/meson.build b/accel/meson.build
> index 259c35c4c882..3a480cc2efef 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -11,10 +11,5 @@ if have_system
>    subdir('stubs')
>  endif
>
> -dummy_ss =3D ss.source_set()
> -dummy_ss.add(files(
> -  'dummy-cpus.c',
> -))
> -
> -specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: dummy_ss)
> -specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> +# qtest
> +softmmu_ss.add(files('dummy-cpus.c'))
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

