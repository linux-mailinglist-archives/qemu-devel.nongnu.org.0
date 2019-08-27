Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F09E9A9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 15:40:44 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2biF-00031N-5z
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 09:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1i2bgl-0002W1-Ol
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1i2bgi-0006yj-Ov
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:39:09 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1i2bgi-0006y4-H2
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:39:08 -0400
Received: by mail-wr1-x443.google.com with SMTP id j16so18834165wrr.8
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6nMO4AGoGhQn6/ZJr8niYpnNPKzJXRd82lgEZJBb4zo=;
 b=nkNZAi3iGsF3VMuFZg2gkxudAFZw0YINbrgnkmFzG0c0Erdf1xMFVqCcvvyEqw5M0M
 rreSkhxBuYtZFwOvLA0jrAPkFVGS+nuxNWcX+G/5qvJmOyUYyvjFZMTlM7gkhEIs+qiz
 BynxS8OXJ4byuM7SIu4eLbAm0moVosFYIX6csfunTPUrGZ/nIJoZXplGptd70OpCPJK8
 6cesAjKjlssTW7TSPS4kAYQMkSugYU57KQQ8xsBTJMU4FnpY0UISjA0dJkPZr0zFWVde
 qB+0/T0f5l6xjeMK9V7WWVr63cwVTSGDaXqYdUbajuQurDpMXeQhWcHCHzPCT7NllZWr
 Xgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6nMO4AGoGhQn6/ZJr8niYpnNPKzJXRd82lgEZJBb4zo=;
 b=nNztbhqQ1vgr4hNjiLq/wXLl+lzOgFhj7cpcv1hcgqpCjO/8bBQ/E3JWtHlRxFd/uX
 e5BgMDZdUwZ+SOY2McTIUAg+czQvXBZnl6ijapvghKeqHQcTbwEaPdctWMrZk9EKfcZt
 5rdcBt4CXc35lmFSxj3JY0Ht+/q+Oxi0uB+qJ4b350IxnbXflHVLREzHNmJ8OjYwIV+1
 r9uws1hEQOHzbza3mPKhXs4XdMxvZveQU7chNNiyICc1HcE7DfjkhpwC6/stnB1IlRv7
 msiorSyOsrkQuDzxfb3RbcPQQ/aEOBDp0bF5CZgnpQSh/PH/cmNXJyxuyQsfFncF3DeC
 7o8g==
X-Gm-Message-State: APjAAAUH2L2qrqqV0aNeIB1LwspFfcF3WA9d6IsFtr4yvipL6CIVHEat
 DQEGIEq8LDsJTMWvz9xztNKB9cOdOSxZYad63Cs=
X-Google-Smtp-Source: APXvYqxNi4q36BxQDA4jV6TrzINmle1VvIm1Eecvi503fyUCGDRVUH5hku+4Ra7EEFBBp7aSIIu6yXKHke3qOgfPIH0=
X-Received: by 2002:a05:6000:1284:: with SMTP id
 f4mr30500555wrx.89.1566913147055; 
 Tue, 27 Aug 2019 06:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <1566495734-23297-1-git-send-email-pbonzini@redhat.com>
 <9492af41-2125-9543-203a-312f0cd9087c@redhat.com>
 <CAFEAcA__BNnW4oSyv4iTAd7rsMUfcjyNJgk0nOwbkRQtmLj9jQ@mail.gmail.com>
 <dd473e9b-716d-cd9f-47bd-433d2b17687d@redhat.com>
 <CAFEAcA81qUSMqpMTCrs9-vgj7Wmji2dCDkYrQ91wxmhTiP83Xw@mail.gmail.com>
 <dd60f779-8349-1d0d-eb86-645e2e1b0808@redhat.com>
 <CAFEAcA9i1p6XR8Bc83uHD88EWrtmU-aN_PsuZYNAAFgpgWoZgQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9i1p6XR8Bc83uHD88EWrtmU-aN_PsuZYNAAFgpgWoZgQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Aug 2019 17:38:54 +0400
Message-ID: <CAJ+F1CL6dXxH2MgZU=DaCeqHFu2LtDiYsve+gwsJym5APDH9kw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH] modules-test: fix const cast
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Aug 27, 2019 at 4:02 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Fri, 23 Aug 2019 at 13:10, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 23/08/19 14:07, Peter Maydell wrote:
> > >> Are you going to apply this and "[PATCH] modules-test: ui-spice-app =
is
> > >> not built as module" to qemu.git directly?
> > > Is the other one also needed as a build fix ?
> >
> > Yes, otherwise the test fails (it didn't fail in the meson tree).
>
> Both this fix and the ui-spice-app one are now in master, but
> the 'enable-modules' Travis build still seems to be consistently
> failing -- could somebody take a look, please?
>

I am looking at, it seems to be related to default machine

MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_BINARY=3Daarch64-softmmu/qemu-system-aarch64
QTEST_QEMU_IMG=3Dqemu-img tests/modules-test -m=3Dquick -k --tap <
/dev/null | ./scripts/tap-driver.pl --test-name=3D"modules-test"

qemu-system-aarch64: -machine accel=3Dqtest: No machine specified, and
there is no default

Use -machine help to list supported machines

  TEST    iotest-qcow2: 159

socket_accept failed: Resource temporarily unavailable

**

ERROR:tests/libqtest.c:268:qtest_init_without_qmp_handshake: assertion
failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)

tests/libqtest.c:137: kill_qemu() tried to terminate QEMU process but
encountered exit status 1

Aborted (core dumped)

ERROR - too few tests run (expected 9, got 0)

/home/travis/build/elmarco/qemu/tests/Makefile.include:900: recipe for
target 'check-qtest-arm' failed



--=20
Marc-Andr=C3=A9 Lureau

