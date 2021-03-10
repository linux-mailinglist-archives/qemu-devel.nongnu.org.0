Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E2333A82
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:46:14 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwM1-0001VC-9I
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJwKI-0000Uq-1s
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:44:26 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJwKE-0000Wm-8c
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:44:24 -0500
Received: by mail-ej1-x62e.google.com with SMTP id mm21so37650910ejb.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lRCKeHuwG8Zdkc3p5ZZDTNiAgN2sVWjrx+2iuD6Uskk=;
 b=TpGmFP2cmNdGNtIgglwARY7+wO18K5gsnF3r+N948zYvpszlgUivnnK4SvmstyPEH/
 8hK2N4bPA/hlmx5K2gMPtBc0P2az9+l0AFwRPtzXscJ1XdL2uNDmRKncbx4xaI/wfqBX
 HrIkuY3NGLeQXdQmQBNqfnK38zc7bi0OpASYT0WxZcW6uBWvt2PzaxrCV7QoscelHmTp
 nB4h0b6SLcdY+wHCHVpG5a9TlWuKpG1xSOO9MpUXTiIlx6e0SHkriLSHflUayPGCzOdI
 Z8h25oVMveh2CiB5qUd8w48OWX7d9a3S9SkHgPdxPOKklWzzgi9srR7Imif6G1GCUV18
 ozyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lRCKeHuwG8Zdkc3p5ZZDTNiAgN2sVWjrx+2iuD6Uskk=;
 b=NH+PxZkqBpgcnBOARQ1WBOv0dUjOGqsNMMuEtuLXWlbj+fEqB2uQO163/FJzbPbNv4
 jxE1Cts239TwNbYh1x/lkG07uWVY9S60LTHEU3OOe1W0yKfOSyrnfjzOOaSFcIGCq7Op
 CKdrvO8aZI0owj6qcRVoxWNBRskY6kXTuqcLq5MI0la01A5y9IoTKL2i+IH0X1nz8Ru0
 OPRoQTTSSd7mdhVi3HAIVU/2dVD0nE8fbBaDHdaWF7XZhEokI0Baa413CGPWRi7qlPCq
 cGCr6ASKHI/umWnalEWEldIgGj7DOdqcsVU8Ezd8VFFlwlxFV3z7NAWxuEKFWPCeNGpc
 HEgQ==
X-Gm-Message-State: AOAM5306rNecdMlb7rnWIy2m3cfaKF8hsy//2GUhn52BGuWIg9cEZwXK
 w9LozCMur8/UCDD/jYGDqmcNIA==
X-Google-Smtp-Source: ABdhPJw1mUS3cHrIYWIyosUkEoZycKTWxPklIyQ2QsoqJqpKL3zNtp7GwqEHbj0zO6tCu+2W0ZPcLQ==
X-Received: by 2002:a17:907:9870:: with SMTP id
 ko16mr2910180ejc.227.1615373059889; 
 Wed, 10 Mar 2021 02:44:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b18sm9627406ejb.77.2021.03.10.02.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:44:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AC6B1FF7E;
 Wed, 10 Mar 2021 10:44:18 +0000 (GMT)
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
Date: Wed, 10 Mar 2021 10:41:04 +0000
In-reply-to: <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
Message-ID: <87czw78f0d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 8 Mar 2021 at 13:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac=
9e1:
>>
>>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-2021030=
5' into staging (2021-03-05 19:04:47 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-docs-xen-updates=
-080321-1
>>
>> for you to fetch changes up to 8109b8cadf5979a29b4b6e1ca7288bc0ee676426:
>>
>>   semihosting: Move hw/semihosting/ -> semihosting/ (2021-03-08 12:15:05=
 +0000)
>>
>> ----------------------------------------------------------------
>> Testing, guest-loader and other misc tweaks
>>
>>   - add warning text to quickstart example
>>   - add support for hexagon check-tcg tests
>>   - add CFI tests to CI
>>   - use --arch-only for docker pre-requisites
>>   - fix .editorconfig for emacs
>>   - add guest-loader for Xen-like hypervisor testing
>>   - move generic-loader docs into manual proper
>>   - move semihosting out of hw/
>
> Fails on x86-64 trying to do something with docker:
>
> make: Entering directory
> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static'
> /home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
> auto build -t qemu/debian-hexagon-cross -f
> /home/petmay01/linaro/qemu-for-merges/tests/docker/dockerfiles/debian-hex=
agon-cross.docker
>   --registry registry.gitlab.com/qemu-project/qemu --add-current-user
> --extra-files /home/petmay01/linaro/qemu-for-merges/tests/docker/dockerfi=
les/debian-hexagon-cross.docker.d/build-toolchain.sh
> Using default tag: latest
> latest: Pulling from qemu-project/qemu/qemu/debian10
> Digest: sha256:4f96b88d2c3cf59d46d6173d86f240ef7b4f2b68509e6e5eec7b179aa1=
bfbf74
> Status: Image is up to date for
> registry.gitlab.com/qemu-project/qemu/qemu/debian10:latest
> Using default tag: latest
> latest: Pulling from qemu-project/qemu/qemu/debian-hexagon-cross
> 45b42c59be33: Already exists
> 7a55fd5ded7c: Already exists
> [...]
>
> 40ae5f465547: Pull complete
> Digest: sha256:c5f3e6f6a761c17570945059e60297352380379f9222fe444f998c6ea7=
e9d4ce
> Status: Downloaded newer image for
> registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross:latest
>
> #1 [internal] load build definition from tmplp8d2u1p.docker
> #1       digest:
> sha256:639f37ba0ced2cf59254e62ec107d1d7ccd627d6876fb2b465f50c88c4baa44d
> #1         name: "[internal] load build definition from tmplp8d2u1p.docke=
r"
> #1      started: 2021-03-09 16:53:55.092177401 +0000 UTC
> #1    completed: 2021-03-09 16:53:55.092271396 +0000 UTC
> #1     duration: 93.995=C2=B5s
> #1      started: 2021-03-09 16:53:55.092598107 +0000 UTC
> #1    completed: 2021-03-09 16:53:55.188002068 +0000 UTC
> #1     duration: 95.403961ms
> #1 transferring dockerfile: 1.26kB done
>
> [...]
> #9 [internal] load build context
> #9      started: 2021-03-09 16:53:56.338003711 +0000 UTC
> #9    completed: 2021-03-09 16:53:56.42858509 +0000 UTC
> #9     duration: 90.581379ms
> #9 transferring context: 4.19kB done
>
>
> #7 [2/6] RUN apt update &&     DEBIAN_FRONTEND=3Dnoninteractive eatmydata=
    ...
> #7       digest:
> sha256:d73bbaa9b5d86f286257ada3d545250e61e000c22c1f971f003578dc00661346
> #7         name: "[2/6] RUN apt update &&
> DEBIAN_FRONTEND=3Dnoninteractive eatmydata     apt build-dep -yy qemu"
> #7      started: 2021-03-09 16:53:56.338854291 +0000 UTC
> #7 0.553
> #7 0.553 WARNING: apt does not have a stable CLI interface. Use with
> caution in scripts.
> #7 0.553
> #7    completed: 2021-03-09 16:54:00.554068941 +0000 UTC
> #7     duration: 4.21521465s
> #7        error: "executor failed running [/bin/sh -c apt update &&
>  DEBIAN_FRONTEND=3Dnoninteractive eatmydata     apt build-dep -yy qemu]:
> exit code: 137: context canceled: context canceled"
>
> error on cache query: invalid build cache from
> {MediaType:application/vnd.docker.distribution.manifest.v2+json
> Digest:sha256:c5f3e6f6a761c17570945059e60297352380379f9222fe444f998c6ea7e=
9d4ce
> Size:2009 URLs:[] Annotations:map[] Platform:<nil>}
> Traceback (most recent call last):
>   File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
> line 720, in <module>
>     sys.exit(main())
>   File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
> line 716, in main
>     return args.cmdobj.run(args, argv)
>   File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
> line 512, in run
>     extra_files_cksum=3Dcksum)
>   File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
> line 360, in build_image
>     quiet=3Dquiet)
>   File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
> line 250, in _do_check
>     return subprocess.check_call(self._command + cmd, **kwargs)
>   File "/usr/lib/python3.6/subprocess.py", line 311, in check_call
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['docker', 'build', '-t',
> 'qemu/debian-hexagon-cross', '-f',
> '/tmp/docker_buildpuzztpb1/tmplp8d2u1p.docker', '--build-arg',
> 'BUILDKIT_INLINE_CACHE=3D1', '--cache-from',
> 'registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross',
> '/tmp/docker_buildpuzztpb1']' returned non-zero exit status 1.
> /home/petmay01/linaro/qemu-for-merges/tests/docker/Makefile.include:59:
> recipe for target 'docker-image-debian-hexagon-cross' failed
> make: *** [docker-image-debian-hexagon-cross] Error 1

I think something has changed on Ubuntu, my system didn't have docker
but after auto-updating it appeared and was a snap:

  10:40 alex@bionic/x86_64  [user.static/testing/next] >which docker
  /snap/bin/docker

I had to pull the usual group shenanigans to enable:

   sudo addgroup --system docker
   sudo adduser $USER docker
   newgrp docker

And then restart it:

   snap disable docker
   snap enable docker

And then I get the same failure as you. Can you confirm the docker
version you have now?

  10:39 alex@bionic/x86_64  [user.static/testing/next] >docker version
  Client:
   Version:           19.03.13
   API version:       1.40
   Go version:        go1.13.15
   Git commit:        cd8016b6bc
   Built:             Fri Feb  5 15:56:39 2021
   OS/Arch:           linux/amd64
   Experimental:      false

  Server:
   Engine:
    Version:          19.03.13
    API version:      1.40 (minimum version 1.12)
    Go version:       go1.13.15
    Git commit:       bd33bbf
    Built:            Fri Feb  5 15:58:24 2021
    OS/Arch:          linux/amd64
    Experimental:     false
   containerd:
    Version:          v1.3.7
    GitCommit:        8fba4e9a7d01810a393d5d25a3621dc101981175
   runc:
    Version:          1.0.0-rc10
    GitCommit:
   docker-init:
    Version:          0.18.0
    GitCommit:        fec3683

--=20
Alex Benn=C3=A9e

