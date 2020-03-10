Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772E180AEF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 22:55:08 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBmqB-0000mT-Gb
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 17:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35807)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jBmp4-00084d-3g
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 17:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jBmp3-0004JJ-7Y
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 17:53:58 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jBmp3-0004Go-1v
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 17:53:57 -0400
Received: by mail-wm1-x344.google.com with SMTP id f7so3092456wml.4
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XhyXbvBCeJlDfuSwlmsnRwnAkZH5zIa02jwioq1Fx0I=;
 b=GEbUmRG+Mx4g/i0/JiU9MLzHXTwa0k2+0qKnljiKelG3x8M0GRZWKCTcHW7NsAXWP+
 NWFy09k41CY6O/xnDK93nvRPWAdiZE53j5X0Gcg/LdSkJ3UwWviFA6vLG87uMgHU4cGG
 +heJFBi/t0a7SUO/AuSt6lKRxQgAKe98SZdbSiiIGa6soNrtdhYy9Z6xLPMdAOvOIYIj
 4WElRmkHH4iNOWXbKSwR4eFy+WpYLESc0VDonoWN8NLyfOp4k95wNW/oUXnP4yflcPj7
 H7DTxe11Wiwd5hIECJOg6Pz4Dk6EKVyrRZIDfPRPTDW3SpE7eDMkIV+cKuj2AmCV8trO
 9kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XhyXbvBCeJlDfuSwlmsnRwnAkZH5zIa02jwioq1Fx0I=;
 b=oM5ENqOssvJGEr6Q8FRYUnae2hwRgzH8yYQUHl6G9a7KQLMSGzeE3234lzL2YsJ5CC
 MiwtJVofWz8D2I/AY48vlTev0pN5vwWDH3PpBkjjIkFKeOwynS1AuwwEK6WNk11bCg99
 EPoitgQ3bemGx2WW96P8tqjqUsL7hTRKfJfGEswLt+vEmfH33oX52O8d9EyCPbr0/ZGB
 gx7VWll3WQbTLthQ13CuaOjYYiJG3SxYtf4Dhy9rKtLrkexzpiQASgPgjkL/fsAD19Po
 uCxZksHaB3Snu5qql1+fxV1/IYJlVoKGEsbExqgdkN5E1Sar6tW+vBDcPXIDZS/gQ4q/
 5QuQ==
X-Gm-Message-State: ANhLgQ1n70wf8JEDmvpi3YCSfF4CrMfT9HWLyfgs0+kRL3/OZc4kIoCd
 DW3KQfZVdhqXFFN5DBSfFS9BNDyXBJ0Q18kZd0Y=
X-Google-Smtp-Source: ADFU+vtLGu4HGbvhIfuAKZH70G26DyrQhAbZI/T+ynkQlB4cLe2U+5C+F72YhbZK2m7eocmkmMp0JErBWVy3IxKWyfc=
X-Received: by 2002:a7b:c153:: with SMTP id z19mr3873073wmi.37.1583877235091; 
 Tue, 10 Mar 2020 14:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200310152141.13959-1-peter.maydell@linaro.org>
 <99854e03-fe9e-e6a9-d9ba-3abf8d9acf98@redhat.com>
In-Reply-To: <99854e03-fe9e-e6a9-d9ba-3abf8d9acf98@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 10 Mar 2020 22:53:43 +0100
Message-ID: <CAJ+F1CKbt3robdtFw4jB2J13H6D2PKBHNdNOqxDac1cqGZy9Ng@mail.gmail.com>
Subject: Re: [PATCH] tests: Disable dbus-vmstate-test
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Mar 10, 2020 at 4:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 10/03/20 16:21, Peter Maydell wrote:
> >
> >   dbus-daemon[9321]: Could not get password database information for UI=
D of current process: User "???" unknown or no memory to allocate password =
entry
> >
> >   **
> >   ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-test.c:114:get_conn=
ection: assertion failed (err =3D=3D NULL): The connection is closed (g-io-=
error-quark, 18)
> >   cleaning up pid 9321
> >   ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-t=
est.c:114:get_connection: assertion failed (err =3D=3D NULL): The connectio=
n is closed (g-io-error-quark, 18)
> >   make: *** [/tmp/qemu-test/src/tests/Makefile.include:632: check-qtest=
-x86_64] Error 1
> >   make: *** Waiting for unfinished jobs....
> >
> > It's not clear why this is happening (perhaps a recently revealed
> > race condition or a change in the patchew build environment?).
> >
> > For the moment, disable this test so that patchew test runs are
> > useful and don't email the list with spurious failure mails.

I tried to reproduce on a fresh ubuntu 19.10, with make
docker-test-debug@fedora there, and the dbus-vmstate test pass, as
well as the rest for the build.

Any help on how to reproduce appreciated.

--=20
Marc-Andr=C3=A9 Lureau

