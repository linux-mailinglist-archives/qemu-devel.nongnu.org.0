Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE3D2C56D1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 15:15:02 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiI32-0000iL-M1
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 09:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiI1G-0008FI-7r
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:13:11 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiI1C-0002ez-5M
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:13:08 -0500
Received: by mail-ej1-x629.google.com with SMTP id a16so3142115ejj.5
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XimWCEbXrW00xCV6JYQRaFvkFQg1baM1FONaViQ5Gx0=;
 b=D5eXH+PKLjwP8dVa0m9vVmtyYjO9rjSYVO+52TSAFVlAeq3CdPCtmWR6Orm2hVds/6
 fpgyUiUjLahLblz77VlzWFbWe5gvcs/sTy0paOUFe4IyLyTA0ekg42G/gJHwWQ29JNG9
 CaUO3VmFICOYyQNhaar1vn9RZ+MFHc8TmsqzCFbqEXC35irIObwEWfmcQaP3FskZ453F
 LRWG2dt2g/Ux7rS9GEaSBiyz9IRnmfrKpaKnSusqSirNfppgyIQXV8cMVC6iQ7JuNHWk
 m5yEZCf9ZjwCQ+vkslTmU8twBbKDWilwbMqjm3qtjOFatFfaFk11/pOKMx/svaMga4Oj
 J5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XimWCEbXrW00xCV6JYQRaFvkFQg1baM1FONaViQ5Gx0=;
 b=OAkrMtq/m2Dzqv0rRe2H9R7+mJ6Dm+J70EV5+FmcYoZ9IhyHaYF4zGS22OnuB6a242
 MJkceVZeVBIGIqzDJBR+J+Qwo6SIGnjvNjVpYnK3ubaFSbAnlc//6Fec9GBM0/dYIpYz
 mutChLhd+8cV5jhm3xdAMEAy/nw2k+BnfI6BP1k+Ai1B3U9imxhVIZJesAwdThgT49jw
 vdYZDxKKIWKRPBgSVWsaKPVVmU+LLuIwo2OZ9lQ9MuDIk+GZhGviWDDCG/oFBhB275WE
 QEd+Nso9YFPf9Ucls/3fkD1exXXIUs8hdNLUEIwYLVn+XXbNouYpv0PkdE4ia+2hUlMs
 Zh5A==
X-Gm-Message-State: AOAM530Pi5Kmx31dVK11V11HsU+NImTjqUEca9AtXIcu2GtbxjviGzFA
 1RC6lUnnk1z00wz9aCRlJd76B7wNc4avzm1omOzlUA==
X-Google-Smtp-Source: ABdhPJxGVLbTDJVTlOi1PRw51NVHUjZVTqROOwus/rdU+5/PUGjswoHajdRcAIAXmj8LexSmm/dhA0PY2G2BPGHdd7g=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr2865525ejb.482.1606399984090; 
 Thu, 26 Nov 2020 06:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20201126075921.3116321-1-pbonzini@redhat.com>
In-Reply-To: <20201126075921.3116321-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 14:12:52 +0000
Message-ID: <CAFEAcA9CTpv4wMqUCop1QB2AgfxqNiotzqi=Wm_bkgqRqZO1FQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Final (?) batch of misc patches for QEMU 5.2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 08:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to dae3916d846cd88aff038a56b82fa687fd6d02a3:
>
>   nsis: Fix build for 64 bit installer (2020-11-25 17:39:12 -0500)
>
> ----------------------------------------------------------------
> Bug fixes + removing the setuptools dependency
>
> ----------------------------------------------------------------

This fails 'make check-tcg':
make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
auto cc --cc gcc -i qemu/fedora-i386-cross -s /home/p
etmay01/linaro/qemu-for-merges --   -Wall -O0 -g -fno-strict-aliasing
-m32 /home/petmay01/linaro/qemu-for-merges/tests/tcg/
i386/test-i386-bmi2.c -o test-i386-bmi2  -static
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:
In function 'main':
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:6:10:
warning: unused variable 'hello' [-Wunused-vari
able]
    6 |     char hello[16];
      |          ^~~~~
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
   39 | }
      | ^
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:39:1:
warning: unsupported size for integer register
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:
Assembler messages:
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:13:
Error: invalid instruction suffix for `pext'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:16:
Error: invalid instruction suffix for `pdep'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:19:
Error: invalid instruction suffix for `pext'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:22:
Error: invalid instruction suffix for `pdep'
Traceback (most recent call last):
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 709, in <module>
    sys.exit(main())
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 705, in main
    return args.cmdobj.run(args, argv)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 627, in run
    as_user=True)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 382, in run
    quiet=quiet)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.6/subprocess.py", line 311, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'run', '--rm',
'--label', 'com.qemu.instance.uuid=caf11ccb0f2a4871a6dc2813f93f23ca',
'-u', '1000', '-w',
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user',
'-v', '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user:/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user:rw',
'-v', '/home/petmay01/linaro/qemu-for-merges:/home/petmay01/linaro/qemu-for-merges:ro,z',
'qemu/fedora-i386-cross', 'gcc', '-Wall', '-O0', '-g',
'-fno-strict-aliasing', '-m32',
'/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c',
'-o', 'test-i386-bmi2', '-static']' returned non-zero exit status 1.
filter=--filter=label=com.qemu.instance.uuid=caf11ccb0f2a4871a6dc2813f93f23ca
../Makefile.target:103: recipe for target 'test-i386-bmi2' failed
make[2]: *** [test-i386-bmi2] Error 1
make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:64:
recipe for target 'docker-build-guest-tests' failed
make[1]: *** [docker-build-guest-tests] Error 2
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:54:
recipe for target 'build-tcg-tests-i386-linux-user' failed
make: *** [build-tcg-tests-i386-linux-user] Error 2


thanks
-- PMM

