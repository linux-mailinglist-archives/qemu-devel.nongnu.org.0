Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8705EC0E2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:17:41 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8ap-000429-Vv
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8ME-0008Ob-Gz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8MC-0003td-Kn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664276551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkVFbLVaWxUtZrJVH1RkSJuaegFdoRgoZjUJjxoGEeo=;
 b=Y6C860zpgjjIZZAZZ133KSk5fbNKuewhfzbvV2fUvucu7mUJp03q3UEKTAV93XXIr7uTfC
 gtn1JIDdS0zWJp/QcEQELmmVlA3xPouZ949xX6Ch4e2EyycJUTQCG8oj1i9Lt7Z+TZr3yZ
 +/+0+xyT38r/CbDho8i11S37IeWs2S0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-kgs5RpqGNYeBYv9vslvi6A-1; Tue, 27 Sep 2022 07:02:30 -0400
X-MC-Unique: kgs5RpqGNYeBYv9vslvi6A-1
Received: by mail-oo1-f70.google.com with SMTP id
 x22-20020a4a3956000000b004748ff8c4b4so3970984oog.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OkVFbLVaWxUtZrJVH1RkSJuaegFdoRgoZjUJjxoGEeo=;
 b=3eGqidYr1QOr1XHlKyrT8C/NebQdgy9IWX6wkgLz3S6RVqy2vpAhOjB1z7RLUrQZLp
 rcQu7XcMsggpQ/mtTD6iS9gJDLDO8DwBP5+LiVI3PkcjsY5jRc+IABF0fl7Tb2LZXOh/
 ovj/Io8k1kARjGofVwdxAgXB3C1iVqJJbPzUlgP3EFHPT+VJ3/RQ3cEjMXhnnqPs4Kgx
 Lko8+vHyge9wx8Z93rYn/J+4bJFucZ1JXRAxQ7QveI13rgKxCPIs+AgnIoTK5tzt14M/
 8erzCcglqKj+gWE/gIgR6S4cVclJ4lYsVwE27fRgWo/hXGJYmay4Msyol7x0uMjw49m1
 +I1Q==
X-Gm-Message-State: ACrzQf2FTDxgOOJcz6Wueece9prXotNehRu8CsN7o8s/+rk/o+xfL23E
 jd6e7L5ztHpZJvqZacnXOGFr4/lBCRqzHCflmJeqQkE5NKviBPw9Xzx2Y1maJoGqxsxRpQm/aOe
 nsUFcEa/io/dqdQ76YxTbOTE/0Uc6Ct0=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1491480oib.53.1664276549190; 
 Tue, 27 Sep 2022 04:02:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KEAyEO3R/ZpdpEGkQH+VMvxTVp7i5j9OSUpA6tfIIve4bKc+9FfE/Z21U11MHrB5CvNXcVgy2/7bQVFSc7DU=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1491438oib.53.1664276548483; Tue, 27
 Sep 2022 04:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-6-pbonzini@redhat.com>
In-Reply-To: <20220927095921.261760-6-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 15:02:16 +0400
Message-ID: <CAMxuvawj4i3TfxVj++mAQwKkvAydyRoFrfcFWHthETA1AA1kTg@mail.gmail.com>
Subject: Re: [PATCH 5/5] configure, meson: move linker flag detection to meson
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
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure   | 16 ----------------
>  meson.build | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/configure b/configure
> index 0a6f57c371..e5f1eb6213 100755
> --- a/configure
> +++ b/configure
> @@ -1342,12 +1342,10 @@ EOF
>  if test "$static" =3D "yes"; then
>    if test "$pie" !=3D "no" && compile_prog "-Werror -fPIE -DPIE" "-stati=
c-pie"; then
>      CONFIGURE_CFLAGS=3D"-fPIE -DPIE $CONFIGURE_CFLAGS"
> -    QEMU_LDFLAGS=3D"-static-pie $QEMU_LDFLAGS"
>      pie=3D"yes"
>    elif test "$pie" =3D "yes"; then
>      error_exit "-static-pie not available due to missing toolchain suppo=
rt"
>    else
> -    QEMU_LDFLAGS=3D"-static $QEMU_LDFLAGS"
>      pie=3D"no"
>    fi
>  elif test "$pie" =3D "no"; then
> @@ -1369,12 +1367,6 @@ else
>    pie=3D"no"
>  fi
>
> -# Detect support for PT_GNU_RELRO + DT_BIND_NOW.
> -# The combination is known as "full relro", because .got.plt is read-onl=
y too.
> -if compile_prog "" "-Wl,-z,relro -Wl,-z,now" ; then
> -  QEMU_LDFLAGS=3D"-Wl,-z,relro -Wl,-z,now $QEMU_LDFLAGS"
> -fi
> -
>  ##########################################
>  # __sync_fetch_and_and requires at least -march=3Di486. Many toolchains
>  # use i686 as default anyway, but for those that don't, an explicit
> @@ -2247,14 +2239,6 @@ if test "$have_ubsan" =3D "yes"; then
>  fi
>
>  ##########################################
> -
> -# Exclude --warn-common with TSan to suppress warnings from the TSan lib=
raries.
> -if test "$solaris" =3D "no" && test "$tsan" =3D "no"; then
> -    if $ld --version 2>/dev/null | grep "GNU ld" >/dev/null 2>/dev/null =
; then
> -        QEMU_LDFLAGS=3D"-Wl,--warn-common $QEMU_LDFLAGS"
> -    fi
> -fi
> -
>  # Guest agent Windows MSI package
>
>  if test "$QEMU_GA_MANUFACTURER" =3D ""; then
> diff --git a/meson.build b/meson.build
> index f57a60ac4c..f8c80a5b00 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -183,6 +183,14 @@ qemu_cflags =3D config_host['QEMU_CFLAGS'].split()
>  qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
>  qemu_ldflags =3D config_host['QEMU_LDFLAGS'].split()
>
> +if enable_static
> +  qemu_ldflags +=3D get_option('b_pie') ? '-static-pie' : '-static'
> +endif
> +
> +# Detect support for PT_GNU_RELRO + DT_BIND_NOW.
> +# The combination is known as "full relro", because .got.plt is read-onl=
y too.
> +qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,-z,relro', '-Wl,-=
z,now')
> +
>  if targetos =3D=3D 'windows'
>    qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl=
,--nxcompat')
>    # Disable ASLR for debug builds to allow debugging with gdb
> @@ -265,6 +273,11 @@ if add_languages('cpp', required: false, native: fal=
se)
>    endif
>  endif
>
> +# Exclude --warn-common with TSan to suppress warnings from the TSan lib=
raries.
> +if targetos !=3D 'sunos' and not config_host.has_key('CONFIG_TSAN')
> +  qemu_ldflags +=3D linker.get_supported_link_arguments('-Wl,--warn-comm=
on')
> +endif
> +
>  add_global_link_arguments(qemu_ldflags, native: false, language: ['c', '=
cpp', 'objc'])
>
>  if targetos =3D=3D 'linux'
> --
> 2.37.3
>


