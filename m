Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658EC17C48C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 18:36:41 +0100 (CET)
Received: from localhost ([::1]:40217 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAGts-00068Q-E2
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 12:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jandryuk@gmail.com>) id 1jAGqu-0000po-QE
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 12:33:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jandryuk@gmail.com>) id 1jAGqr-00065X-Ta
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 12:33:36 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:42950)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jandryuk@gmail.com>) id 1jAGqr-00062y-Lt
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 12:33:33 -0500
Received: by mail-lj1-x236.google.com with SMTP id q19so3045201ljp.9
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 09:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eijE0ycxMZz5nfPaqfYDIiyOBeNFjIfRksRWHONug+w=;
 b=ACtgPYPH46+6siS5M/Amt9Tb2vF/kYd9u+RS9jScz/QE568jLdhpvye4nnYLnWVXqz
 YmmTdFAgcC6YvcZfkEuzltOiqMlGi/WTQEu1TZJg7b+XOPQoe/PxSaUQii1v+QoMs5JC
 /FZHyXxj4vgRmV1veykk5SERkeXul1FKbQ03HKC7JD8lNm+RH+o3ycWUBfy5KG1Ql8fb
 C0QLasvOb4b8yRspoAnaOq2XsERbL7kc3GXrhHmhi8oRC5hXZULrJV+RX66TpKP0sgxT
 nXIwEgABK4QQ8jN8dguii5XXAFetnm+k0XCsbrMTQRzAwWrRWjJhrkg+KNa33D9V61XW
 RJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eijE0ycxMZz5nfPaqfYDIiyOBeNFjIfRksRWHONug+w=;
 b=tUVLGeWqtqRMeoCSWUbQU9aGQZTprCwTjXRbD0h+3awY4q1iMGD8AZynZyqTe83dWE
 NDwC/wL0Wv1H2u5wm59+zoauzerUbtfzm3qKgsnNo4OJ/mH+CV7ljUPQtgxTSttZkkog
 2Dy3SUYcJg1V2iOPF3zwHV7lOXWV9BBBTvargRauJkXDsPc41bCbGcPpILTytF9lDtci
 PSMoNMc7da/vDQJrbiCNOaq9O7YSICMU4aHVAxUZQC+Q2LLjWLNL1hh7yza2gBC37Z2j
 vvRfY6t8Vle6D9DWdRnp103NSy1g+qHUghlCW3kT6Jz1U2IEX95AKRQTPrYI/hGVN+Zk
 oJHQ==
X-Gm-Message-State: ANhLgQ3kyeNCqkon4c7yr8HvK6QEuej2fUsGsSvXpgngjWdDHCHDYibq
 uDhoceP2IcmASKzB09rUJ9ONn2Mo16nwXIyZFc3+0w==
X-Google-Smtp-Source: ADFU+vs8KjIYkm31rX48B6FLhkmjm9JeOhXahvvNb6pHG+SBD8GmREOhkp/arEa3wPhdtEM+eRAQIlJJoPCrNsRODAM=
X-Received: by 2002:a2e:2c13:: with SMTP id s19mr2574415ljs.210.1583516011751; 
 Fri, 06 Mar 2020 09:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20200306140917.26726-1-jandryuk@gmail.com>
 <158351119581.14529.12409093643313383178@39012742ff91>
In-Reply-To: <158351119581.14529.12409093643313383178@39012742ff91>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 6 Mar 2020 12:33:20 -0500
Message-ID: <CAKf6xpvVJd-ObnFcZLHte78-m1ebzaULx922n4aXXdOEUEiVOg@mail.gmail.com>
Subject: Re: [PATCH] usb-serial: wakeup device on input
To: QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::236
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 6, 2020 at 11:13 AM <no-reply@patchew.org> wrote:
>
> Patchew URL: https://patchew.org/QEMU/20200306140917.26726-1-jandryuk@gma=
il.com/
>
>
>
> Hi,
>
> This series failed the docker-clang@ubuntu build test. Please find the te=
sting commands and
> their output below. If you have Docker installed, you can probably reprod=
uce it
> locally.
>
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> make docker-image-ubuntu V=3D1 NETWORK=3D1
> time make docker-test-clang@ubuntu SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D

I ran these two commands locally and they completed successfully.

>   LINK    fp-test
> ---
> dbus-daemon[5453]: Could not get password database information for UID of=
 current process: User "???" unknown or no memory to allocate password entr=
y

Was there a problem with this container's password db and/or
out-of-memory like this message states?

Regards,
Jason

> **
> ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-test.c:114:get_connecti=
on: assertion failed (err =3D=3D NULL): The connection is closed (g-io-erro=
r-quark, 18)
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-test.=
c:114:get_connection: assertion failed (err =3D=3D NULL): The connection is=
 closed (g-io-error-quark, 18)
> Aborted (core dumped)
> cleaning up pid 5453
> make: *** [/tmp/qemu-test/src/tests/Makefile.include:632: check-qtest-i38=
6] Error 1
> make: *** Waiting for unfinished jobs....
>
> Looking for expected file 'tests/data/acpi/pc/FACP.bridge'
> ---
> dbus-daemon[6892]: Could not get password database information for UID of=
 current process: User "???" unknown or no memory to allocate password entr=
y
>
> **
> ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-test.c:114:get_connecti=
on: assertion failed (err =3D=3D NULL): The connection is closed (g-io-erro=
r-quark, 18)
> Aborted (core dumped)
> cleaning up pid 6892
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/qtest/dbus-vmstate-test.=
c:114:get_connection: assertion failed (err =3D=3D NULL): The connection is=
 closed (g-io-error-quark, 18)
> make: *** [/tmp/qemu-test/src/tests/Makefile.include:632: check-qtest-x86=
_64] Error 1
>   TEST    check-qtest-arm: tests/qtest/test-hmp
>   TEST    check-qtest-arm: tests/qtest/qos-test
>   TEST    check-qtest-aarch64: tests/qtest/test-hmp
> ---
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['sudo', '-n', 'docker', 'run', '=
--label', 'com.qemu.instance.uuid=3D2e42e92cfb504ed5b5cb56b2c8b512df', '-u'=
, '1003', '--security-opt', 'seccomp=3Dunconfined', '--rm', '-e', 'TARGET_L=
IST=3D', '-e', 'EXTRA_CONFIGURE_OPTS=3D', '-e', 'V=3D', '-e', 'J=3D14', '-e=
', 'DEBUG=3D', '-e', 'SHOW_ENV=3D1', '-e', 'CCACHE_DIR=3D/var/tmp/ccache', =
'-v', '/home/patchew2/.cache/qemu-docker-ccache:/var/tmp/ccache:z', '-v', '=
/var/tmp/patchew-tester-tmp-dwbsabkq/src/docker-src.2020-03-06-10.32.46.219=
4:/var/tmp/qemu:z,ro', 'qemu:ubuntu', '/var/tmp/qemu/run', 'test-clang']' r=
eturned non-zero exit status 2.
> filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D2e42e92cfb504ed5b5cb=
56b2c8b512df
> make[1]: *** [docker-run] Error 1
> make[1]: Leaving directory `/var/tmp/patchew-tester-tmp-dwbsabkq/src'
> make: *** [docker-run-test-clang@ubuntu] Error 2
>
> real    40m29.624s
> user    0m9.675s
>
>
> The full log is available at
> http://patchew.org/logs/20200306140917.26726-1-jandryuk@gmail.com/testing=
.docker-clang@ubuntu/?type=3Dmessage.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

