Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E52D6157
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:13:02 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOYv-0002fd-ND
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOVZ-00086C-KE
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:09:33 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOVX-00009r-6l
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:09:32 -0500
Received: by mail-ed1-x535.google.com with SMTP id v22so6069903edt.9
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a07edl11fE8vxidlzWsmYsGN3CO0YVFeCoIYGybu4Fg=;
 b=TmDRKZ2bz1PhKTatSEn1uq8yvJYoZolBfSQqElXpQoii81XFN5XdR6uEub9N/rnujv
 xVSpQyuFB7L3noHG1X/yRF5JevC8qgm6qrAnhFVI/hYZzffiOC3+ZZvEoYQ0+/vNUFmd
 eDx43xYH59ZKKbV2BD4dxpkPI5hzZhAMshirDx2hMgRAHEmgRyF42C63TuZtc1U4CTwY
 uoC2nh3vldzufNwagAhpUQTBtYKuqafDIKwtRXHdLt6R8IByhPRMiZws7MoWN6s3kp7Q
 noIhWFAds2Z+ACnq/pHgkm3KykxMQdJSve6gF3/+ax20heLqoFv8R9qU64PrTvSSyQrJ
 rf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a07edl11fE8vxidlzWsmYsGN3CO0YVFeCoIYGybu4Fg=;
 b=bzfpEZWhcxd5bViCKquhcZMNmutpRuEMiksTmt/dVWXqGRakACOr1TLbgYjDjI2AWh
 v8FbqRmekpIcEUsIahiiF7odkz2OTh3uVt3m66v7nL8NZvE9eTOkBpjd3RWaEx5nWO+D
 EV8+mq85PNxbzabh1JWkA9mY6VZ7MUKM8JlSLL5yXyUZqr4W3cc5XrdVoIB7IoKkXWMZ
 WSOSCFeS/Gimxnk4IqLvOcmPudO/lLg3+EIcCRkAYj46c+4dhnW3mCkhClsG4wRBUptr
 vciLZAxCO5I9IaVWkwvIYMBfM2vvbTWlNNH9te7/d3kcxeqisMfmtKpFBxdCxQ5Vehoy
 bhwA==
X-Gm-Message-State: AOAM530+z1Tx0vXNubD9uPcy8GC+ktdW1+bm2bx/kBRAo7mEBGaWq4W3
 SG+w0zug5/4F75jv1MtPRFMaxgAmpjfAjZ3mNhr9gw==
X-Google-Smtp-Source: ABdhPJysUfLAw9E7a/izYVqEYoHvxv/liwukBjuNHOqV2afdBa6wktJ4WQcPdo//NAEWA3BgJsrf146wbpE6BE2xvGU=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr7441381edw.52.1607616568100;
 Thu, 10 Dec 2020 08:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20201209180546.721296-1-mst@redhat.com>
 <20201209180546.721296-49-mst@redhat.com>
In-Reply-To: <20201209180546.721296-49-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 16:09:16 +0000
Message-ID: <CAFEAcA9tgAJeTVPauNEvRfK8d9_-wAH_aQM6K+bXfweoX78m-Q@mail.gmail.com>
Subject: Re: [PULL v2 48/65] libvhost-user: make it a meson subproject
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> By making libvhost-user a subproject, check it builds
> standalone (without the global QEMU cflags etc).
>
> Note that the library still relies on QEMU include/qemu/atomic.h and
> linux_headers/.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20201125100640.366523-6-marcandre.lureau@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Hi. This commit (now 0df750e9d3a5fea5e1 in master)
seems to have broken building the system emulator with --static:
it now fails at final link (of all binaries, not just this test
binary) with:

cc  -o tests/check-qlist tests/check-qlist.p/check-qlist.c.o
-Wl,--as-needed -Wl,--no-undefined -Wl,--warn-common -Wl,-z,relro
-Wl,-z,now -static -m64 -fstack-protector-strong -Wl,--start-group
libqemuutil.a subprojects/libvhost-user/libvhost-user-glib.a
subprojects/libvhost-user/libvhost-user.a -pthread -lutil -lm
-lgthread-2.0 -lglib-2.0 -lpcre
/usr/lib/x86_64-linux-gnu/libglib-2.0.so -Wl,--end-group
/usr/bin/ld: attempted static link of dynamic object
`/usr/lib/x86_64-linux-gnu/libglib-2.0.so'
collect2: error: ld returned 1 exit status

because it's somehow ended up with the absolute path to the
dynamic library version of libglib in the link options rather
than the static library version (or better still, just -lglib !).

Looking at the commit, it's not clear to me why the
vhost-user changes have resulted in all binaries getting
a change to their link line. Paolo ?

thanks
-- PMM

