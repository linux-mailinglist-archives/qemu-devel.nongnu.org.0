Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B66446E67
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 15:54:38 +0100 (CET)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjN5a-0003Sj-1g
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 10:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjN4S-0002dT-Fz
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjN4O-0004aJ-It
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636210402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqX//TN5efMN1JRLZhCjZB6XWxeQAeaXjPU+B/aR9L8=;
 b=PbusboJwedoWmTAkydSIIGZvH9Vubkg8KeTCkbJbliiYDX6iq1Z55B9nuQoj0+9zmDhVUL
 n7PdxAPyVR/vXbZ1UHHFO2If/HRBnRj+5SMIxh4NaAky4rsKF/aosErG3329rB0/paG5F3
 2b6+YdWvxyUbresoVBQxjvBUcVbZ1G0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-YUPFGd7dNxCB1aHT_QmH5Q-1; Sat, 06 Nov 2021 10:53:18 -0400
X-MC-Unique: YUPFGd7dNxCB1aHT_QmH5Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so11252221edl.17
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 07:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gqX//TN5efMN1JRLZhCjZB6XWxeQAeaXjPU+B/aR9L8=;
 b=bUWSPnKdLs6tFhbbXUGZTA6AGFf/cuJKiZqeODWCm6nZ3USV+jjYHhETCUBvZkM/M3
 efg24Trfkis05N23pRAGMRuP+9R8rqed91+NYSC2nxtQO4e22vo4m1tym9bNqM/5Mbmi
 +KtszdD7HeXuwiUQP0dIi/UCJbeAw7vgDyxPmgrTxJD/PvplROW4e9yUWsMBXmJtPT7Z
 N+oM/BakdfOvToO7McLcNOGhMfPwvQftJE2SQZnWXhYpBeXJBOQDSzNffx+tozl6lVnY
 jZOeTKXfz3Ft7mYiS19ms3BRWUSuwh5RCC3mTjEZBM3UyQBb1BCsFOpF7cn0u/YR6T/8
 hbsQ==
X-Gm-Message-State: AOAM533RydaZ9zXIiqwXLH37F4gd1wXKPy16oKJq98zSgLu4wTnvWTPB
 pM2f3HKLaHP/crLzmd3uqDfJzUPSA04AS5yheVcMl/nfrd/6q4xt9UkD82hhcuar6vgJDV1lNuN
 nhqNK8DHe3Yzbi/36ZYAXUEw4NOddLzA=
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr83762816eje.341.1636210397512; 
 Sat, 06 Nov 2021 07:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3H4rLYh/SNZ85zvqKx4m+ggrL4n6mavgyBguKBT9EyPQLefbFa3bWOjBvWpLlTSaGw+8Rj3oygp9rHB/n8Xo=
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr83762792eje.341.1636210397340; 
 Sat, 06 Nov 2021 07:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210521103423.2780345-1-philmd@redhat.com>
 <7d9abdeb-575d-3ec5-904b-bc676313ca14@vivier.eu>
In-Reply-To: <7d9abdeb-575d-3ec5-904b-bc676313ca14@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Sat, 6 Nov 2021 15:53:06 +0100
Message-ID: <CAP+75-U0wK7BKxFywWr8tWUbZ-nc5W8cdcOWM=gPp162gPAtiQ@mail.gmail.com>
Subject: Re: [PATCH] meson: Fix 'interpretor' typo
To: Laurent Vivier <laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping...

https://lore.kernel.org/qemu-devel/20210521103423.2780345-1-philmd@redhat.c=
om/

On Sat, Jun 5, 2021 at 9:03 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 21/05/2021 =C3=A0 12:34, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > Fix a typo from commit fa2f7b0b9b7 ("meson: Warn when TCI is
> > selected but TCG backend is available").
> >
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 1559e8d873a..230a0e4b558 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -247,7 +247,7 @@
> >        error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format=
(cpu))
> >      endif
> >    elif get_option('tcg_interpreter')
> > -    warning('Use of the TCG interpretor is not recommended on this hos=
t')
> > +    warning('Use of the TCG interpreter is not recommended on this hos=
t')
> >      warning('architecture. There is a native TCG execution backend ava=
ilable')
> >      warning('which provides substantially better performance and relia=
bility.')
> >      warning('It is strongly recommended to remove the --enable-tcg-int=
erpreter')
> >
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>


