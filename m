Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4533227C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:01:06 +0100 (CET)
Received: from localhost ([::1]:49694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZAm-000749-Rd
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJZ9S-0006ej-FE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:59:42 -0500
Received: from mail-io1-f49.google.com ([209.85.166.49]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJZ9O-0004pP-Bf
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:59:42 -0500
Received: by mail-io1-f49.google.com with SMTP id u20so13215578iot.9
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HYNIz5yWilzMI7bZ3jOnOzOFGdzAGVlE/knSsPfOnhs=;
 b=KHur/19Ze3ZPGIOI/NAPlvubpu/OnFJowOkfy5VC/cK0N6IuVhLbzNxhvKypPWJvFt
 L5sr7x7nGFLRau24LHyZDO8CteABC1fO9SBYUvfXY6P0UJfCqMQyJb/OkYiqQS263rWA
 2aQUkKBfa4d2ZE/p/zW5ERu4UACI8nO1sIfa14EarO4P1osd3gabAyZrw/AKhWu9gyP2
 1vQ0vEbq7grzVdZ8Yoik9wL6YjrLfyc0+hObyzvhEgIOGywBAtUWNPOEJCpkgvwBXRU4
 xm7Nq5urknYgIKTBpjBGpfTOprCpmKBvDZi2oxkhKxp/pwG/8KzmCtwtJmoWXfcFG5OT
 Patg==
X-Gm-Message-State: AOAM533BNCvGqc/cRtgsELCz1PUfkpDcszSNn6pfN0I14vAHS5nkGInP
 Zavzi/Kdnv8fqdFnW5rpjjbLOcYKkF4=
X-Google-Smtp-Source: ABdhPJyweehfSYpXM3usq1vOx4cUnnQDU4XXUfokA6DFC6nyaN0BkRYWtjeCjG+JlVcrg28WZmsiCQ==
X-Received: by 2002:a5e:8e41:: with SMTP id r1mr22549137ioo.5.1615283976675;
 Tue, 09 Mar 2021 01:59:36 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id f15sm6544348ilj.24.2021.03.09.01.59.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:59:36 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id i8so13227198iog.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:59:36 -0800 (PST)
X-Received: by 2002:a6b:760d:: with SMTP id g13mr22286311iom.84.1615283976082; 
 Tue, 09 Mar 2021 01:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20210309032637.41778-1-j@getutm.app> <YEdBce6TWCVpSph9@redhat.com>
In-Reply-To: <YEdBce6TWCVpSph9@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 9 Mar 2021 01:59:25 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
Message-ID: <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.49; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 1:36 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Mon, Mar 08, 2021 at 07:26:36PM -0800, Joelle van Dyne wrote:
> > iOS does not support ucontext natively for aarch64 and the sigaltstack =
is
> > also unsupported (even worse, it fails silently, see:
> > https://openradar.appspot.com/13002712 )
> >
> > As a workaround we include a library implementation of ucontext and add=
 it
> > as a build option.
>
> The README here:
>
>   https://github.com/kaniini/libucontext
>
> indicates that it is intentionally limiting what registers it saves
> and restores, explicitly excluding FPU.
>
> Peter & Paolo expressed concern about this, indicating FPU reg support
> was a requirement for QEMU:
>
>    https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05525.html
>
Does it make a difference if this is provided as an option and not as
a replacement? Would it make sense to add some warning at configure
time? Right now none of the concurrency backends are supported on iOS
and it's possible support will go away on macOS as well in the future.
QEMU would not be able to run at all.

-j

> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

