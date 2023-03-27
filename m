Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7056CA7AA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 16:29:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgnpo-0007mE-3N; Mon, 27 Mar 2023 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgnpk-0007m4-Hm
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 10:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgnpi-0000Nw-Hc
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 10:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679927305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRS0kT+fmRa3z1kw2D1Hv7esRmNosuvpAzm827De/30=;
 b=ZSiyad4jYxjVWwS7LT1ezfLsDviG0UQND1arFn4POKUgpmCjISbP+ggL4Ucp4dxx9/Xhcw
 VUav/t1DwSnR93dL/gE0Ai6D6q8GCYZ5239gosfXMQhFvWxjhNEADfbo3XrkPw45pXv3pM
 0Bo6n+CxhrpU12WZL48UBbzsgbOBVoM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-JR6H_12KPIiNkYkI2DbB3w-1; Mon, 27 Mar 2023 10:28:17 -0400
X-MC-Unique: JR6H_12KPIiNkYkI2DbB3w-1
Received: by mail-oi1-f197.google.com with SMTP id
 s63-20020acadb42000000b00388f0de0c51so1084020oig.12
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 07:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679927296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRS0kT+fmRa3z1kw2D1Hv7esRmNosuvpAzm827De/30=;
 b=Bge4ZddXAncmyp6JCJQiZiI+WeoPfbrA9rTTxU60aAzrJHNRxcdNGPpN1k3dVtuB8m
 EcI2bQAGaXvwHEAfJb0CBxELFPKmxpDNRopLv8c1jfwzwB+JGLWA3Hz0xlW17Dja4+Hq
 pTOmHJiozc1tlSOKUdSikfcYzbGYJk+KYZpNTMXQh9Spxkk5XzOhRkhD6NAmo712df23
 XEmSqtz1+pXf+B1h+xaGofQypeB3rDazC5Qq/iJlIq3ITM6i2FuawYTCL6UL4Qg4l3GU
 7AFrAofIJg14mIB/M+G2vKH5/P6h4jzxVfiw/m9ltZPHD8RvC9EzzIIp6srv3dzs7ye9
 s1Yw==
X-Gm-Message-State: AO0yUKWuoYEyWy6hNMiU5FAGkahpRFsjlHIGBkwwc9kqQzO8p8hm1Wt8
 vAe4dXE3MGlLNrCSPSPgEOPP09WslNhnJUKbN2sQGFcndPdSxsGkF/cJlkBb7vUjnAmNbEEK/Dv
 6OS9J1A49MBD0luHlD5Db7OrlEdgwcXE=
X-Received: by 2002:a05:6830:146:b0:69f:3494:9f57 with SMTP id
 j6-20020a056830014600b0069f34949f57mr3806785otp.5.1679927296398; 
 Mon, 27 Mar 2023 07:28:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set9sCbuDG8ZF/kgzjGjG32Gbkbhi13TOPfJEXOrrQvYGOblZjRdNaVzklcgjfZT31mVTJimdQYBqtg1GU2CcJIg=
X-Received: by 2002:a05:6830:146:b0:69f:3494:9f57 with SMTP id
 j6-20020a056830014600b0069f34949f57mr3806778otp.5.1679927296159; Mon, 27 Mar
 2023 07:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230326210446.66170-1-casantos@redhat.com>
 <ZCFgnySXy4TdPyQD@redhat.com>
In-Reply-To: <ZCFgnySXy4TdPyQD@redhat.com>
From: Carlos Santos <casantos@redhat.com>
Date: Mon, 27 Mar 2023 11:28:05 -0300
Message-ID: <CAC1VKkNMHbwCZLmPwLWR0XmWnbzt4tcUtagg18_n96fTRUnyZw@mail.gmail.com>
Subject: Re: [PATCH] tracing: install trace events file only if necessary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Mar 27, 2023 at 6:23=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Sun, Mar 26, 2023 at 06:04:46PM -0300, casantos@redhat.com wrote:
> > From: Carlos Santos <casantos@redhat.com>
> >
> > It is required only if linux-user, bsd-user or system emulator is built=
.
> >
> > Signed-off-by: Carlos Santos <casantos@redhat.com>
> > ---
> >  trace/meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/trace/meson.build b/trace/meson.build
> > index 8e80be895c..3fb41c97a4 100644
> > --- a/trace/meson.build
> > +++ b/trace/meson.build
> > @@ -64,7 +64,7 @@ trace_events_all =3D custom_target('trace-events-all'=
,
> >                                   input: trace_events_files,
> >                                   command: [ 'cat', '@INPUT@' ],
> >                                   capture: true,
> > -                                 install: true,
> > +                                 install: have_linux_user or have_bsd_=
user or have_system,
>
> Trace events are used by our command line tools too qemu-img, qemu-io,
> qemu-nbd, qemu-pr-helper, qemu-storage-daemon.
>
> What build scenario are you seeing that does NOT want the trace events
> to be present ?   If there is any, then I might even call that situation
> a bug, as we want trace events to be available as a debugging mechanism
> for everything we build.

I'm aiming for an embedded system or a VM image that only needs
qemu-ga, in which qemu is built with --enable-trace-backends=3Dnop.

--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


