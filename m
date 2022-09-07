Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C355B0BC6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 19:48:10 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVz9k-0004rs-Gz
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 13:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVz2X-00012S-45
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:40:41 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVz2U-0005GF-Rb
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:40:40 -0400
Received: by mail-yb1-xb33.google.com with SMTP id f131so7092205ybf.7
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Z6x46Rdi735PyBiwidhmpn60bv/pd/TJLauRCpO8Q4Q=;
 b=Fsw67hbGFWiTAW2kj9TLrirayzg8sGYx2D2T28ssGJNM3zKRvfre09DSU0V9MbNZ8Y
 +Yy1YSionw47WWfQWGV0O6gn14ifoDRIMhGJQ/9yNhGkJ+haGw/fKKd4lNgnsx3+csnF
 oI7BLrCu9IZ7V1UWtnYc7JWyillScFT22kwLjzGvsgRtg7cPno3GYdAgZxZPHdvPyy/D
 W5+I5kl09Z3AORtJI4scmyDXSFJHzJPGsS7tExoiJcEu0Z8OW0iuda/bylulhszefa4F
 IBrBzfK+0Y3S6kJ52gJOEMiziWDfcSCTBBDyd6yrMC1AR48fq8muMvoadMHXkhuNOkLI
 JLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Z6x46Rdi735PyBiwidhmpn60bv/pd/TJLauRCpO8Q4Q=;
 b=N0rO5mP1fL/Ir/Jr9LLtOQd2M56/u2M1UlSVQVEv6xjT1XWcAs44nRVEKoABnArvHr
 6ZPz0Zef2K5nnHR1j3FEIiXPympaski/Uve1/hTB60YWdIGIvi+oopfkT55+KI1Wo531
 pazjIkeutMaUtA+8maIuw6OJ7UFdzPWx25LvAFaatuZZKLdzC/KrtVywSV9TD3UtsP5d
 +MzluOpu/zgJhWnEDcOD/dp9g4FI/JL5Jy3MTYgPsFVl6fg0Jw9wPjiKFQk16ahiT3lt
 7pJ6cgn+9P/KaXphqc4Uhbgs2kREl1zbRI+n5PW45FlJYTabUukrYsYUUdq4geU6/3I3
 441Q==
X-Gm-Message-State: ACgBeo1KAhnU5KiWoAVh7fZ8pk88+Gro9bt8MxmaqjR3M/B/0QaZbbyH
 nEv9v0dCK1ZI1kf/ZS0pap3VZRmqcArUOtQ7dHOSxg==
X-Google-Smtp-Source: AA6agR4xwr2uwgwZ9qQOdbWb3mje7d/UieDLJYk5CzV0KihllxiUhp6wC9Z1TMWV+Dq6PoUEtEyUBEyf14deir6RDK4=
X-Received: by 2002:a05:6902:1612:b0:6a8:e6b3:36e1 with SMTP id
 bw18-20020a056902161200b006a8e6b336e1mr3900993ybb.39.1662572437167; Wed, 07
 Sep 2022 10:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwARj6d+UygiU4-JBKMJtyOhHmcNFp7C5jwqJReFT-kew@mail.gmail.com>
In-Reply-To: <CAO=notwARj6d+UygiU4-JBKMJtyOhHmcNFp7C5jwqJReFT-kew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Sep 2022 18:40:26 +0100
Message-ID: <CAFEAcA9brqMEZfyB-c2OjYFWuQPSS28u9_8vFte=zGwePh_Srw@mail.gmail.com>
Subject: Re: Seeing qtest assertion failure with 7.1
To: Patrick Venture <venture@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 7 Sept 2022 at 16:39, Patrick Venture <venture@google.com> wrote:
>
> # Start of nvme tests
> # Start of pci-device tests
> # Start of pci-device-tests tests
> # starting QEMU: exec ./qemu-system-aarch64 -qtest unix:/tmp/qtest-1431.s=
ock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1431.qmp,id=3Dch=
ar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -M virt, -cpu max -dr=
ive id=3Ddrv0,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don,format=3Dra=
w -object memory-backend-ram,id=3Dpmr0,share=3Don,size=3D8 -device nvme,add=
r=3D04.0,drive=3Ddrv0,serial=3Dfoo -accel qtest
>
> # ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_qmp_=
handshake: assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> stderr:
> double free or corruption (out)
> socket_accept failed: Resource temporarily unavailable
> **
> ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_qmp_ha=
ndshake: assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> ../../src/qemu/tests/qtest/libqtest.c:165: kill_qemu() detected QEMU deat=
h from signal 6 (Aborted) (core dumped)
>
> I'm not seeing this reliably, and we haven't done a lot of digging yet, s=
uch as enabling sanitizers, so I'll reply back to this thread with details =
as I have them.
>
> Has anyone seen this before or something like it?

Have a look in the source at what exactly the assertion
failure in libqtest.c is checking for -- IIRC it's a pretty
basic "did we open a socket fd" one. I think sometimes I
used to see something like this if there's an old stale socket
lying around in the test directory and the randomly generated
socket filename happens to clash with it.

Everything after that is probably follow-on errors from the
tests not being terribly clean about error handling.

Are you running 'make check' with a -j option for parallel?
(This is supposed to work, and it's the standard way I run
'make check', so if it's flaky we need to fix it, but it
would be interesting to know if the issue repros at -j1.)

-- PMM

