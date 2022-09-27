Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4B5EC040
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:01:00 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8Kh-0006Ix-DB
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8Eu-0008MT-DE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8El-0001zK-IU
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664276090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRz3+xnTJhLPLvVOmpERXX5Iv+a2KYIQjq2gOjZyinU=;
 b=M2pzPrylrWFCCVpGX3QB4lhyr1zVSb5wG+yHDKn2nCzaBj0auavYzjBDycPuD+Wu757GYs
 Br7gXr94L347Uabyacb0Z1Fq74yDTX+2foegjnrdYZkFnJc1V1cq5B4jcpxtvPCY1kYIkz
 TOA5wO4od8PduMcTg7VEfWuAN+MDNgk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-tkWv7M_KMKiWH-_bmP-HxQ-1; Tue, 27 Sep 2022 06:54:48 -0400
X-MC-Unique: tkWv7M_KMKiWH-_bmP-HxQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 f16-20020a05680814d000b003506268b99fso3091697oiw.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XRz3+xnTJhLPLvVOmpERXX5Iv+a2KYIQjq2gOjZyinU=;
 b=BtHNHv2JT2i/hIyJHELRiU1R2tSZxqdG9zjVVvqduBVDhHnTEcv9vBrL2nvqbQ0cDU
 QRsDEj95JXRItZwy0ku3ZWtGUv24OvMBUXgaMLi7ZhNc/kmmgnVlorwzg0mfx7orj4Fy
 cqf+pXvDaJ4N2ZMc5cOfmSwhkIXadkpVHDZlw/lH+bSF94QJ1IVb8zF0PsYQ0lb0LxRg
 qZx4WdYGIS4/NEmME7qjVzUkqP/8y5IQquE4LAHMyG8NwHOHhi7OVLjULx1cbtwF5eRO
 O7aD9SLhjNf03BQLOUdOiTl5SkgCXfxRpnFU4O5rlcbd5lpCD23XPIDo6eWr9CU5XI8G
 VKtg==
X-Gm-Message-State: ACrzQf10LU5k0opfubZtugBrRWg1Q1YHpyZlX9cn5F2QYuSQUfJOMwys
 seMAYOSJZLSkFj00OR+rc3/wR1fWqpvJYx6cep+rgY88IFTqlxQRd8rQnreddGmJq1rtsUx8iSo
 DYlNi1S/x2xdTIj9xvRjGAts/qxwzLWA=
X-Received: by 2002:a4a:928e:0:b0:476:6c03:f0c5 with SMTP id
 i14-20020a4a928e000000b004766c03f0c5mr4831877ooh.78.1664276088364; 
 Tue, 27 Sep 2022 03:54:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49U3hubSc6YNKfTDxXa2j1D3bLJHwfzGsLNhQgXJY4Db213VpAiU9G2kjiGG8flqPiiaUYZHEx7o4NAKXz6R4=
X-Received: by 2002:a4a:928e:0:b0:476:6c03:f0c5 with SMTP id
 i14-20020a4a928e000000b004766c03f0c5mr4831874ooh.78.1664276088173; Tue, 27
 Sep 2022 03:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-4-pbonzini@redhat.com>
In-Reply-To: <20220927095921.261760-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 14:54:36 +0400
Message-ID: <CAMxuvay81M-eGCW71tyZ4vPXf856S3HnfUxjbcK_3nGn2c9bTA@mail.gmail.com>
Subject: Re: [PATCH 3/5] meson: multiple names can be passed to dependency()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 1:59 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This is new in Meson 0.60.0.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 8be01ba1c3..e1700d1d55 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -825,14 +825,10 @@ if have_system and get_option('curses').allowed()
>      }'''
>
>    curses_dep_list =3D targetos =3D=3D 'windows' ? ['ncurses', 'ncursesw'=
] : ['ncursesw']
> -  foreach curses_dep : curses_dep_list
> -    if not curses.found()
> -      curses =3D dependency(curses_dep,
> -                          required: false,
> -                          method: 'pkg-config',
> -                          kwargs: static_kwargs)
> -    endif
> -  endforeach
> +  curses =3D dependency(curses_dep_list,
> +                      required: false,
> +                      method: 'pkg-config',
> +                      kwargs: static_kwargs)
>    msg =3D get_option('curses').enabled() ? 'curses library not found' : =
''
>    curses_compile_args =3D ['-DNCURSES_WIDECHAR=3D1']
>    if curses.found()
> --
> 2.37.3
>


