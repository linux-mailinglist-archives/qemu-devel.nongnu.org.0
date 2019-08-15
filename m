Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA0E8EC13
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 14:56:31 +0200 (CEST)
Received: from localhost ([::1]:41628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyFIs-0003OB-Qg
	for lists+qemu-devel@lfdr.de; Thu, 15 Aug 2019 08:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyFI0-0002yF-SM
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 08:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyFHz-0004fA-2P
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 08:55:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyFHy-0004dE-RZ
 for qemu-devel@nongnu.org; Thu, 15 Aug 2019 08:55:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id k2so2149082wrq.2
 for <qemu-devel@nongnu.org>; Thu, 15 Aug 2019 05:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22k9d9Y2P8jqrSg6ODU4SetIx5kDetePwPeNQKXYV9U=;
 b=lPM+P/hS4r6P5bgdDW/5XpDbNTFLe/N1mxqD2F3nIs+fg4biDAfmS54s2qv/RCVwBd
 30S5Evdn0lgzxjIsAgyKkparXm12SQrW2/guRdzUUAbQqyjyXnUOMqaUrKN50BfFdhu5
 I2IbHXU2sAKqs2QY17LaKb+VAs2In7CxOufRc64lqag6bmvUfvofe73zkxzDw53jM7x2
 EJxqzJLtPyburLA8XWL2U4eRZv4KwMGq4fbndcJEpX4hjVE67qRow/G7FzapEh0pPP01
 6h94UXSrNv/T4QoChc5zQZkzbezCpY2ekfxgar6hEy39DJbeSfqDvNjiKrZTYObdYI/O
 JS0g==
X-Gm-Message-State: APjAAAXNEITJH1882d651u17suXTuRqVZTbouZpdqg1jCqeco5+Y0CDI
 aX5rSDDmHcaHcnJsgTvdVp2RJYpe4M8=
X-Google-Smtp-Source: APXvYqwPKxdYxXeer02TJJ/jO5AgGKrV7qRyXTQo8y5X562h4bCixbQZBpYKBjGUNjtaK2RgDSf1/A==
X-Received: by 2002:a5d:4101:: with SMTP id l1mr5635749wrp.202.1565873732104; 
 Thu, 15 Aug 2019 05:55:32 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id c201sm2154068wmd.33.2019.08.15.05.55.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 05:55:31 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190809064645.22656-1-armbru@redhat.com>
 <20190809064645.22656-21-armbru@redhat.com>
 <c76aaebc-d4bf-cb25-fe27-7a9c9ba644c9@redhat.com>
 <87k1bmpn7y.fsf@dusky.pond.sub.org> <87zhkigwhd.fsf@linaro.org>
 <87r25ske6e.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <de9a9584-006c-f110-7601-c9ce712dc91f@redhat.com>
Date: Thu, 15 Aug 2019 14:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87r25ske6e.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: [Qemu-devel] Running docker cross-tests with SELinux (was: Re:
 [PATCH v3 20/29] Include qemu/main-loop.h less)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 8/10/19 9:34 PM, Markus Armbruster wrote:
> 
> There are a few SELinux gripes in my logs, like this one:
> 
> type=AVC msg=audit(1565418107.93:125036): avc:  denied  { module_request } for  pid=19599 comm="configure" kmod="binfmt-464c" scontext=system_u:system_r:container_t:s0:c611,c653 tcontext=system_u:system_r:kernel_t:s0 tclass=system permissive=0

Few notes while chatting with Markus.

Another interesting syslog entry:

AVC avc:  denied  { mounton } for  pid=24489 comm="mount"
path="/proc/sys/fs/binfmt_misc" dev="proc" ino=3907274
scontext=system_u:system_r:container_t:s0:c497,c743
tcontext=system_u:object_r:sysctl_fs_t:s0 tclass=dir permissive=0

Distrib is Fedora 30 with SELinux:

$ getenforce
Enforcing

$ make -k docker-test-build
[...]
  BUILD   binfmt debian-powerpc-user (debootstrapped)
No binfmt_misc entry for qemu-ppc
make: *** [tests/docker/Makefile.include:66:
docker-binfmt-image-debian-powerpc-user] Error 1make -k docker-test-build
make[1]: Entering directory 'bld'
  GEN     bld/docker-src.2019-08-11-23.50.37.5117/qemu.tar
  COPY    RUNNER
    RUN test-build in qemu:debian-powerpc-user-cross
Unable to find image 'qemu:debian-powerpc-user-cross' locally
Trying to pull repository docker.io/library/qemu ...
Trying to pull repository quay.io/qemu ...
Trying to pull repository docker.io/library/qemu ...
/usr/bin/docker-current: repository docker.io/qemu not found: does not
exist or no pull access.
See '/usr/bin/docker-current run --help'.
Traceback (most recent call last):
  File "tests/docker/docker.py", line 615, in <module>
    sys.exit(main())
  File "tests/docker/docker.py", line 611, in main
    return args.cmdobj.run(args, argv)
  File "tests/docker/docker.py", line 338, in run
    return Docker().run(argv, args.keep, quiet=args.quiet)
  File "tests/docker/docker.py", line 300, in run
    quiet=quiet)
  File "tests/docker/docker.py", line 207, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib64/python2.7/subprocess.py", line 190, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['sudo', '-n', 'docker', 'run',
'--label', 'com.qemu.instance.uuid=0e8b34a8bc8211e98734d8cb8ae0c842',
'-u', '1000', '--security-opt', 'seccomp=unconfined', '--rm',
'--net=none', '-e', 'TARGET_LIST=', '-e', 'EXTRA_CONFIGURE_OPTS=', '-e',
'V=', '-e', 'J=', '-e', 'DEBUG=', '-e', 'SHOW_ENV=', '-e',
'CCACHE_DIR=/var/tmp/ccache', '-v',
'/home/armbru/.cache/qemu-docker-ccache:/var/tmp/ccache:z', '-v',
'bld/docker-src.2019-08-11-23.50.37.5117:/var/tmp/qemu:z,ro',
'qemu:debian-powerpc-user-cross', '/var/tmp/qemu/run', 'test-build']'
returned non-zero exit status 125
make[1]: *** [tests/docker/Makefile.include:207: docker-run] Error 1
make[1]: Leaving directory 'bld'
make: *** [tests/docker/Makefile.include:241:
docker-run-test-build@debian-powerpc-user-cross] Error 2

Note the "No binfmt_misc entry for qemu-ppc" and syslog entry:

'AVC denied comm="mount" path="/proc/sys/fs/binfmt_misc" dev="proc"'.

Does the selinux-policy require tuning?

