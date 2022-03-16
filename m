Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D964DB21C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:02:50 +0100 (CET)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUEj-0008N3-8J
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:02:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTmn-0005A5-Lm
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTml-0005h8-Vl
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVXhblBb5SreSeVVw+xb8VxFfEeV/tL7QjK64epniIU=;
 b=H/yY9FGMRlnQ0mADi/v3H0KNIxUGuCzogJEV+iFBrkd1hcufaV4X52UECeB0B0ViEZ1XuQ
 wYWcKMjLznT3rop2ZvYobK8T8gQOzyJ5a3wpUjr2kJd40N60gAFlKfOuvb+qVdN+WJiXmx
 H+7CLl/UqmR8f1WdMBO491BSZ294EyA=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-1QNCjp2jMwaygkRTHLxqeg-1; Wed, 16 Mar 2022 09:33:51 -0400
X-MC-Unique: 1QNCjp2jMwaygkRTHLxqeg-1
Received: by mail-yb1-f200.google.com with SMTP id
 h8-20020a25e208000000b00628c0565607so1998061ybe.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tVXhblBb5SreSeVVw+xb8VxFfEeV/tL7QjK64epniIU=;
 b=G2wRzCo4gh66X7qig+4SbacgLzyUHUQAVbnuPZKM3qG88lyN0RXWAU10hEW0e97ffG
 j7Gj6aJS3KwwiSPIq+Kexn/Q439DJ+BIdB7TLo5j0n7o6ZPw6aMkQM0iKOacp9OiDtEi
 GmUu6uGI4YUHeuDRNwERg6PBinPNnTQBs1vxueKoktXAWdDwzRdL3T0UkaMYd+RtjoPi
 +45TDlaKBBZvaeb1Rg/74EXdNSi2tjsacbEsI4BhSTMN9qWStBZqkNvyKujJ5QevmCN/
 tv0MNsM36/ZrNVXRk0yo8FbbtHFELsBQMbrFPbZlQpXMko8JB9L8FbMOAAlMroPjtl6y
 Az3A==
X-Gm-Message-State: AOAM532HdMp0eqYj7XFUrfZRYiDvEEQgjRMK71EqPlyui+knhdAZL1AJ
 KiXkeKtLWLiCrL+0kklA+CTG5JsKcndnzh/MXr7eZHxy+OyNzPByW80i7Xtl9aHuBmEl4uIR2rs
 YBFl45wEAR46Qur6hq93lcxI/wj1uaxA=
X-Received: by 2002:a05:690c:10f:b0:2e0:f11a:b3fc with SMTP id
 bd15-20020a05690c010f00b002e0f11ab3fcmr29274326ywb.267.1647437630846; 
 Wed, 16 Mar 2022 06:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd+fGnhMwpIXXBVeuxcYAvCN4MAT6xHvnnj/sg34jGu9nhEMsL2aZ6KJPJIR+r76H9SnkTm8FmDanqg/NI+b4=
X-Received: by 2002:a05:690c:10f:b0:2e0:f11a:b3fc with SMTP id
 bd15-20020a05690c010f00b002e0f11ab3fcmr29274278ywb.267.1647437630545; Wed, 16
 Mar 2022 06:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
 <YjHmLTI+geU4S9Wq@redhat.com>
In-Reply-To: <YjHmLTI+geU4S9Wq@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 17:33:39 +0400
Message-ID: <CAMxuvaz=+wsAA5QXkV8TmgPpXZJxwGYk1HXoCwQH2u9i2dGaqA@mail.gmail.com>
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:blkverify" <qemu-block@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiri Pirko <jiri@resnulli.us>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Thomas Huth <huth@tuxfamily.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Mar 16, 2022 at 5:30 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Mar 16, 2022 at 01:52:48PM +0400, marcandre.lureau@redhat.com wro=
te:
> > diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> > index 3baa5e3790f7..f2bd050e3b9a 100644
> > --- a/include/qemu/compiler.h
> > +++ b/include/qemu/compiler.h
> > @@ -79,19 +79,12 @@
> >  #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x))=
 - \
> >                                     sizeof(QEMU_BUILD_BUG_ON_STRUCT(x))=
)
> >
> > -#if defined(__clang__)
> > -/* clang doesn't support gnu_printf, so use printf. */
> > -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> > -#else
> > -/* Use gnu_printf (qemu uses standard format strings). */
> > -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> > -# if defined(_WIN32)
> > +#if !defined(__clang__) && defined(_WIN32)
> >  /*
> >   * Map __printf__ to __gnu_printf__ because we want standard format st=
rings even
> >   * when MinGW or GLib include files use __printf__.
> >   */
> > -#  define __printf__ __gnu_printf__
> > -# endif
> > +# define __printf__ __gnu_printf__
> >  #endif
>
> I'm not convinced we shold have this remaining define, even
> before your patch.
>
> For code we've implemented, we should have used __gnu_printf__
> already if we know it uses GNU format on Windows.
>
> For code in GLib, its header file uses __gnu_printf__ for anything
> that relies on its portable printf replacement, which is basically
> everything in GLib.
>
> For anything else we should honour whatever they declare, and not
> assume their impl is the GNU one.
>
>
> I guess it is easy enough to validate by deleting this and seeing
> if we get any warnings from the mingw CI jobs about printf/gnu_printf
> mismatch.

Please comment on that thread:
https://patchew.org/QEMU/20220224183701.608720-1-marcandre.lureau@redhat.co=
m/20220224183701.608720-6-marcandre.lureau@redhat.com/

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


