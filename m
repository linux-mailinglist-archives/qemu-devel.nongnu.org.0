Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A34332FA8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:12:37 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiia-0007M0-VQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJgq2-0006Tg-UX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:12:10 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJgq0-0003N5-LF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:12:10 -0500
Received: by mail-ed1-x534.google.com with SMTP id d13so22175751edp.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eUN+gN9EpLogUSmnsuCXGwRZznyAZ+Icx00gPngUdAI=;
 b=y3v+QxYE2YyWX2cAUpZXie2TfZm71NenW8f77L8o21IKW913OnkbNvo/2Cq6eJzbZa
 R/TdInnAysD9x/ZbesDTBkeVdfHXls2I3PXGwXITcY/6vAxXOR+sRLrQxjwhN/JbLWlR
 uAY5T3uSL6LSBO5bwLN2hUhiv7v13pVwXg8Z7AeaZOGs367FbJwCtJP7uyoCYQEXpYyW
 6bSvb/5KGhGMEiYKrJjelI2fDzxqArnehEfJI0rY3Z+89iGIh2jyff/FnK6tdNo0mlia
 JGyYXhNCL3ONhVbrsMlVJxbiYqPIUfLh/riaCb7Kohu/zq8ghtHc++2XQT2vDf36Upeh
 VgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eUN+gN9EpLogUSmnsuCXGwRZznyAZ+Icx00gPngUdAI=;
 b=k6TEs0xtE2xD6UfM89ViE0Mfl4+H/ke+EfiV3jx8g9XM8EesULRT3ag8HUdwNh8KZ0
 lcTnMgiB3LHSB1JcN9TUS5UXNypUEQT3/VqI/iZyZsuRpU2Z2GyLY8WFf4h4ygrNwn07
 BW7G1NmOi+Nni3Nyskb/y8sXk9Gy3MFMBFphY+ftbsYKLDzC3AKyjuhkh4mkQIFZ+skj
 mupdcT2ILOxh2vPPWNoAiYL/KEgn85kgLgXsrU+oBtHGSkQ8EZkpSyY75fk1TgW821Jz
 R1glcJdgh8g43MpFq0fDHaMJ5w2mdcAOJpmSfqOEWm+8PfwE4NYqKXWhVI6kswMb8NHo
 g/ig==
X-Gm-Message-State: AOAM533eof+6WKC9D7tP/ZKP255AGi+IHaR8umLPIeOjJEs6cEz40AlI
 jhL3d/l/4Fqpp9IB2JSivAQ/+mMnZlcfcsTuR7Aamw==
X-Google-Smtp-Source: ABdhPJxXipIEnWTXhuzBAHbiqp7hmichME8OE/sIDuSweFrezFCGy+2bwT4653cUfBOAOAZXDAYTp8socCXJtNSM8T0=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr5571432edu.100.1615313527067; 
 Tue, 09 Mar 2021 10:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20210308135104.24903-1-alex.bennee@linaro.org>
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 18:11:48 +0000
Message-ID: <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Mon, 8 Mar 2021 at 13:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9=
e1:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305=
' into staging (2021-03-05 19:04:47 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-docs-xen-updates-=
080321-1
>
> for you to fetch changes up to 8109b8cadf5979a29b4b6e1ca7288bc0ee676426:
>
>   semihosting: Move hw/semihosting/ -> semihosting/ (2021-03-08 12:15:05 =
+0000)
>
> ----------------------------------------------------------------
> Testing, guest-loader and other misc tweaks
>
>   - add warning text to quickstart example
>   - add support for hexagon check-tcg tests
>   - add CFI tests to CI
>   - use --arch-only for docker pre-requisites
>   - fix .editorconfig for emacs
>   - add guest-loader for Xen-like hypervisor testing
>   - move generic-loader docs into manual proper
>   - move semihosting out of hw/

Fails on x86-64 trying to do something with docker:

make: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static'
/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
auto build -t qemu/debian-hexagon-cross -f
/home/petmay01/linaro/qemu-for-merges/tests/docker/dockerfiles/debian-hexag=
on-cross.docker
  --registry registry.gitlab.com/qemu-project/qemu --add-current-user
--extra-files /home/petmay01/linaro/qemu-for-merges/tests/docker/dockerfile=
s/debian-hexagon-cross.docker.d/build-toolchain.sh
Using default tag: latest
latest: Pulling from qemu-project/qemu/qemu/debian10
Digest: sha256:4f96b88d2c3cf59d46d6173d86f240ef7b4f2b68509e6e5eec7b179aa1bf=
bf74
Status: Image is up to date for
registry.gitlab.com/qemu-project/qemu/qemu/debian10:latest
Using default tag: latest
latest: Pulling from qemu-project/qemu/qemu/debian-hexagon-cross
45b42c59be33: Already exists
7a55fd5ded7c: Already exists
[...]

40ae5f465547: Pull complete
Digest: sha256:c5f3e6f6a761c17570945059e60297352380379f9222fe444f998c6ea7e9=
d4ce
Status: Downloaded newer image for
registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross:latest

#1 [internal] load build definition from tmplp8d2u1p.docker
#1       digest:
sha256:639f37ba0ced2cf59254e62ec107d1d7ccd627d6876fb2b465f50c88c4baa44d
#1         name: "[internal] load build definition from tmplp8d2u1p.docker"
#1      started: 2021-03-09 16:53:55.092177401 +0000 UTC
#1    completed: 2021-03-09 16:53:55.092271396 +0000 UTC
#1     duration: 93.995=C2=B5s
#1      started: 2021-03-09 16:53:55.092598107 +0000 UTC
#1    completed: 2021-03-09 16:53:55.188002068 +0000 UTC
#1     duration: 95.403961ms
#1 transferring dockerfile: 1.26kB done

[...]
#9 [internal] load build context
#9      started: 2021-03-09 16:53:56.338003711 +0000 UTC
#9    completed: 2021-03-09 16:53:56.42858509 +0000 UTC
#9     duration: 90.581379ms
#9 transferring context: 4.19kB done


#7 [2/6] RUN apt update &&     DEBIAN_FRONTEND=3Dnoninteractive eatmydata  =
  ...
#7       digest:
sha256:d73bbaa9b5d86f286257ada3d545250e61e000c22c1f971f003578dc00661346
#7         name: "[2/6] RUN apt update &&
DEBIAN_FRONTEND=3Dnoninteractive eatmydata     apt build-dep -yy qemu"
#7      started: 2021-03-09 16:53:56.338854291 +0000 UTC
#7 0.553
#7 0.553 WARNING: apt does not have a stable CLI interface. Use with
caution in scripts.
#7 0.553
#7    completed: 2021-03-09 16:54:00.554068941 +0000 UTC
#7     duration: 4.21521465s
#7        error: "executor failed running [/bin/sh -c apt update &&
 DEBIAN_FRONTEND=3Dnoninteractive eatmydata     apt build-dep -yy qemu]:
exit code: 137: context canceled: context canceled"

error on cache query: invalid build cache from
{MediaType:application/vnd.docker.distribution.manifest.v2+json
Digest:sha256:c5f3e6f6a761c17570945059e60297352380379f9222fe444f998c6ea7e9d=
4ce
Size:2009 URLs:[] Annotations:map[] Platform:<nil>}
Traceback (most recent call last):
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 720, in <module>
    sys.exit(main())
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 716, in main
    return args.cmdobj.run(args, argv)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 512, in run
    extra_files_cksum=3Dcksum)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 360, in build_image
    quiet=3Dquiet)
  File "/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py",
line 250, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.6/subprocess.py", line 311, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t',
'qemu/debian-hexagon-cross', '-f',
'/tmp/docker_buildpuzztpb1/tmplp8d2u1p.docker', '--build-arg',
'BUILDKIT_INLINE_CACHE=3D1', '--cache-from',
'registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross',
'/tmp/docker_buildpuzztpb1']' returned non-zero exit status 1.
/home/petmay01/linaro/qemu-for-merges/tests/docker/Makefile.include:59:
recipe for target 'docker-image-debian-hexagon-cross' failed
make: *** [docker-image-debian-hexagon-cross] Error 1

thanks
-- PMM

