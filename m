Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E345F0642
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:12:18 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeB84-0004TP-Qw
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeB1d-0006aB-QJ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeB1b-0002WX-1F
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664525133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzAYMuqLy09Sa+yT9Et5Zqedus+FRj1jNcuzGR1N7iM=;
 b=Mc7drYFPy+pbnuzefUBxIXPX73bFLwCW0KJ740JvN4EhbsCDuZaXnYJAuw/mYcc74nI7q6
 l9VtSqV42hK4frTnUQHt5mDRuXILUicqmyHy9SGfya2U4m0C+ms75TfyUlakInBAf9UXMU
 QBH1I5ldNQKg0BKKEYW8lkBPGIQt4hc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-TDeJ-ItRPQCXn6VUmSa9Dg-1; Fri, 30 Sep 2022 04:05:31 -0400
X-MC-Unique: TDeJ-ItRPQCXn6VUmSa9Dg-1
Received: by mail-ua1-f69.google.com with SMTP id
 95-20020a9f23e8000000b0038caa7cd5c1so1270565uao.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 01:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CzAYMuqLy09Sa+yT9Et5Zqedus+FRj1jNcuzGR1N7iM=;
 b=T9LCcDbtqDqmhnn26oHEfX+cgIDHlo2vfXuwcHSwpvrdWW8VdsqMPwhSeCFLRZv8fr
 xYIlg+QpsiJkxvl5CTiOGavo9t0qbuVV21LBVY3FlBamcArER2hurPu0XwHb4Urd5gt0
 im8duKgGxne+zwyU8yrrNsHZ+LMBfmU+tVhZTN3u3G/TGwwNYTRDIhMJNmN0PGX7X/DH
 MI9OHQH9nxX4U+mqJpWGSPPCxfug2xaMyP0LL057gTcN/NvdauXYEA+64bt1QamvFAqC
 V9Tmefo9XfW+5AiFuBlc9q2uHBI+eaIZmoaXHy4zjdJ1S5dHPmitCooyPhjtqk/H6fJw
 6xxQ==
X-Gm-Message-State: ACrzQf3LQ2DFftf3b41vnlCApIy/yt08r6MHwQTWl8sJqX0v3niMtFqJ
 EOiA4TF56tcUajXAfCoBm+F9PUSY4XzAfxw6iI3LP6w0VW4NFah3U/mzob+vaVDh6n0gxoRp35p
 P49s6eszGg6fqQzPFdSn47vYh84P+esk=
X-Received: by 2002:a67:c29e:0:b0:398:73e7:aa27 with SMTP id
 k30-20020a67c29e000000b0039873e7aa27mr3607583vsj.27.1664525131260; 
 Fri, 30 Sep 2022 01:05:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6g7M82MunnGtrxcjyVB04NaaCAYwfzLyI1HwQ7+g4XBsynzWzo6735LVC7VFIB3aQGWZO+6IT4L+Z01KAJUys=
X-Received: by 2002:a67:c29e:0:b0:398:73e7:aa27 with SMTP id
 k30-20020a67c29e000000b0039873e7aa27mr3607575vsj.27.1664525130979; Fri, 30
 Sep 2022 01:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220930075324.13550-1-pbonzini@redhat.com>
 <CAJ+F1CKWo5ati_Kj=X9-Vp-GCSqncTP1eP=4bn5WdC+6F387HA@mail.gmail.com>
In-Reply-To: <CAJ+F1CKWo5ati_Kj=X9-Vp-GCSqncTP1eP=4bn5WdC+6F387HA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 Sep 2022 10:05:19 +0200
Message-ID: <CABgObfZTDC4zQWO+293gXznBQqo1=ebBAOJ=k2yY_yv-VDUVZw@mail.gmail.com>
Subject: Re: [PATCH] meson: -display dbus and CFI are incompatible
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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

On Fri, Sep 30, 2022 at 9:59 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Fri, Sep 30, 2022 at 11:53 AM Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
>>
>> The generated skeletons for DBus call the finalize method of the parent
>> type using code like
>>
>>     G_OBJECT_CLASS (qemu_dbus_display1_chardev_skeleton_parent_class)->f=
inalize (object);
>>
>> However, the finalize method is defined in a shared library that is not
>> compiled with CFI.  Do not enable anything that uses gdbus-codegen if
>> --enable-cfi was specified.
>
> I had the same analysis. But what if gdbus (or other dependencies) is com=
piled with CFI ? Note: I have no idea if CFI is meant to be usable in produ=
ction or just for developers.

Yeah, in theory it's possible but I think it's very unlikely. For
libslirp QEMU ignores that possibility and requires a version with a
fixed API, but that's not really possible for the gdbus superclasses.

Paolo

>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>>
>> ---
>>  meson.build | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index f6962834a3..6106daf267 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -515,6 +515,7 @@ meson.override_dependency('glib-2.0', glib)
>>
>>  gio =3D not_found
>>  gdbus_codegen =3D not_found
>> +gdbus_codegen_error =3D '@0@ requires gdbus-codegen, please install lib=
gio'
>>  if not get_option('gio').auto() or have_system
>>    gio =3D dependency('gio-2.0', required: get_option('gio'),
>>                     method: 'pkg-config', kwargs: static_kwargs)
>> @@ -539,6 +540,10 @@ if not get_option('gio').auto() or have_system
>>                               version: gio.version())
>>    endif
>>  endif
>> +if gdbus_codegen.found() and get_option('cfi')
>> +  gdbus_codegen =3D not_found
>> +  gdbus_codegen_error =3D '@0@ uses gdbus-codegen, which does not suppo=
rt control flow integrity')
>> +endif
>>
>>  lttng =3D not_found
>>  if 'ust' in get_option('trace_backends')
>> @@ -1697,7 +1702,7 @@ dbus_display =3D get_option('dbus_display') \
>>    .require(gio.version().version_compare('>=3D2.64'),
>>             error_message: '-display dbus requires glib>=3D2.64') \
>>    .require(gdbus_codegen.found(),
>> -           error_message: '-display dbus requires gdbus-codegen') \
>> +           error_message: gdbus_codegen_error.format('-display dbus')) =
\
>>    .require(opengl.found() and gbm.found(),
>>             error_message: '-display dbus requires epoxy/egl and gbm') \
>>    .allowed()
>> --
>> 2.37.3
>>
>>
>
>
> --
> Marc-Andr=C3=A9 Lureau


