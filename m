Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304001040B9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 17:25:29 +0100 (CET)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXSnI-0007s9-3A
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 11:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1iXSlS-0005gi-Ff
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:23:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1iXSlR-0003Me-1d
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:23:34 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:36628)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>) id 1iXSlQ-0003M2-NT
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:23:32 -0500
Received: by mail-oi1-x232.google.com with SMTP id j7so300539oib.3
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 08:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=qdhNuzi/payofw7XQewUqB9bumo/LSHmhAc9iCwjmGw=;
 b=Fw2PULsWzNJhOL2HLlJvjh2uCT+WRwoWLa7DANu30fJOspZ93HMGLR921bDXKUwXwG
 nESCwF5kqqSVKh9M4r/u8xwpcBxPucwzef5RCsPICuuVgAZ4MxgyX7XcQKA/Ps4zCGCi
 H2jMYa0M46bKfxsvREn1Wv3CAXyoPwXG+SK5PxCWmThNG1gU0SXQ9wCTN88I/RS59uAS
 Lsrlnk/8XeTdJNUXFdTxci37yd0RXSKHuxdSmOgyYLUKkrMHOTNlqqnN61iTzzYbjFRS
 UuwkNN16JDaLndZJuGxbXkMowiRtcivxyYGJArJBQdb6pz1VkvdBOa+g0hb3pBol7pC+
 sddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=qdhNuzi/payofw7XQewUqB9bumo/LSHmhAc9iCwjmGw=;
 b=meObpq71eTwJllzs8GQV/vZMdGDiaple4OIixrUzoqtyzg9SuXKbQ55XucoE1W8FH/
 LhwgInVgKTbTVQKBBiY2uOr456E3ZvaR4p89wUf9g+hXH49P2uzBsRibmxVTogMaNDuz
 7s9XUxU3P5RomInwqcZ550bukM9NMexgOWATlgK9bdG1lg1E7PK2rc2AnuuA/HehOUGH
 /+zJB7NuOkpEz2Gp8A230w+2FCNv7GboMF4uOSj5rn2Zgdf30H/ny9m0Kuz2Xk0DNjUy
 wdNWOdYppq0vsgjU1Diip/js/9A7isk/EG8jyVgsMja3HfaZ50cX4FNjehwGHRJfIQLr
 E9MA==
X-Gm-Message-State: APjAAAUvtcL00sIf3xPXL7gl7XMhjrEQ8glwmFSc1qsrxi30MwoOsD++
 7hzM9vVnm52O1SlDXqxHfgQ=
X-Google-Smtp-Source: APXvYqyg78/zZZ9pe55zwj981zp9i/ImcB6uOjlxGe6WOKV4L3D4mvoGeGm0yIIGuJe9V2v9OD9j3g==
X-Received: by 2002:aca:d496:: with SMTP id l144mr3663625oig.56.1574267010498; 
 Wed, 20 Nov 2019 08:23:30 -0800 (PST)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id 63sm8569371oty.58.2019.11.20.08.23.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Nov 2019 08:23:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: no-reply@patchew.org, qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <157423033042.2797.15950947649776190513@37313f22b938>
References: <157423033042.2797.15950947649776190513@37313f22b938>
Message-ID: <157426700550.3335.16748606368540493053@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH v2] virtio-pci: disable vring processing when
 bus-mastering is disabled
Date: Wed, 20 Nov 2019 10:23:25 -0600
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
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
Cc: aik@ozlabs.ru, david@gibson.dropbear.id.au, qemu-devel@nongnu.org,
 dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting no-reply@patchew.org (2019-11-20 00:12:11)
> Patchew URL: https://patchew.org/QEMU/20191120005003.27035-1-mdroth@linux=
.vnet.ibm.com/
> =

> =

> =

> Hi,
> =

> This series failed the docker-quick@centos7 build test. Please find the t=
esting commands and
> their output below. If you have Docker installed, you can probably reprod=
uce it
> locally.
> =

> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> make docker-image-centos7 V=3D1 NETWORK=3D1
> time make docker-test-quick@centos7 SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> =

>   TEST    check-unit: tests/test-thread-pool
> wait_for_migration_fail: unexpected status status=3Dwait-unplug allow_act=
ive=3D1
> **
> ERROR:/tmp/qemu-test/src/tests/migration-test.c:908:wait_for_migration_fa=
il: assertion failed: (result)
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/migration-test.c:908:wai=
t_for_migration_fail: assertion failed: (result)

Seems to be an unrelated issue noted in this thread:

  https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg01326.html

I'm running the centos docker test in a loop but haven't been able to repro=
duce
so far after 7 attempts

> make: *** [check-qtest-aarch64] Error 1
> make: *** Waiting for unfinished jobs....
>   TEST    check-unit: tests/test-hbitmap
>   TEST    check-unit: tests/test-bdrv-drain
> ---
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['sudo', '-n', 'docker', 'run', '=
--label', 'com.qemu.instance.uuid=3Dc863e15882a747a88c290575505cc1de', '-u'=
, '1001', '--security-opt', 'seccomp=3Dunconfined', '--rm', '-e', 'TARGET_L=
IST=3D', '-e', 'EXTRA_CONFIGURE_OPTS=3D', '-e', 'V=3D', '-e', 'J=3D14', '-e=
', 'DEBUG=3D', '-e', 'SHOW_ENV=3D1', '-e', 'CCACHE_DIR=3D/var/tmp/ccache', =
'-v', '/home/patchew/.cache/qemu-docker-ccache:/var/tmp/ccache:z', '-v', '/=
var/tmp/patchew-tester-tmp-wg70rgpu/src/docker-src.2019-11-20-01.02.57.1241=
2:/var/tmp/qemu:z,ro', 'qemu:centos7', '/var/tmp/qemu/run', 'test-quick']' =
returned non-zero exit status 2.
> filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3Dc863e15882a747a88c29=
0575505cc1de
> make[1]: *** [docker-run] Error 1
> make[1]: Leaving directory `/var/tmp/patchew-tester-tmp-wg70rgpu/src'
> make: *** [docker-run-test-quick@centos7] Error 2
> =

> real    9m13.236s
> user    0m8.131s
> =

> =

> The full log is available at
> http://patchew.org/logs/20191120005003.27035-1-mdroth@linux.vnet.ibm.com/=
testing.docker-quick@centos7/?type=3Dmessage.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

