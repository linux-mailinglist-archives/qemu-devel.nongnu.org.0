Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9421F849
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 19:33:36 +0200 (CEST)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvOoB-0001Os-VE
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 13:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1jvOmb-0000ch-Es
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 13:31:57 -0400
Received: from do158-143.mg.gitlab.com ([192.237.158.143]:28160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1jvOmT-0006td-Il
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 13:31:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.gitlab.com;
 q=dns/txt; 
 s=mailo; t=1594747909; h=List-Id: Content-Transfer-Encoding:
 Content-Type: Mime-Version: Subject: Message-ID: Reply-To: From: Date:
 Sender; bh=f6epZAV8yFQFvKCZZUTDorYHvgEZ2cPHAxQZQRfxEdg=;
 b=iXXTPqUfbKkKbq0CwrnkqRycUNjxgiWR7scxSyFMrW7z7iFXGdWoumOqENK08gGV5WSOFuTA
 lzwfqHw6OLu/OvjXE3VHQoIdPnTj+9V4HfvA2UNcCGvihuttfaMejsNlD3lQKeuzltWAwXaS
 0VXn/Fdh/7WEoR4BpQEX4W390Eo=
X-Mailgun-Sending-Ip: 192.237.158.143
X-Mailgun-Sid: WyI3MWYzYSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOTQ3YjQiXQ==
Received: from mg.gitlab.com (69.90.74.34.bc.googleusercontent.com
 [34.74.90.69]) by smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f0debedc9bd2efa2ec0b9ab (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 14 Jul 2020 17:31:25 GMT
Date: Tue, 14 Jul 2020 17:31:23 +0000
Message-ID: <5f0debeb5366d_279d3fcc4ae940fc152518@sidekiq-catchall-01-sv-gprd.mail>
Subject: QEMU | Pipeline #166519289 has failed for master | beff47a2
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_5f0debeb2f885_279d3fcc4ae940fc1524aa";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitLab-Project: QEMU
X-GitLab-Project-Id: 11167699
X-GitLab-Project-Path: qemu-project/qemu
X-GitLab-Pipeline-Id: 166519289
X-GitLab-Pipeline-Ref: master
X-GitLab-Pipeline-Status: failed
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All
Received-SPF: pass client-ip=192.237.158.143;
 envelope-from=bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com;
 helo=do158-143.mg.gitlab.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 13:31:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, REPLYTO_WITHOUT_TO_CC=1.552,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: GitLab <noreply@gitlab.com>, GitLab <gitlab@mg.gitlab.com>
From: GitLab via <qemu-devel@nongnu.org>


----==_mimepart_5f0debeb2f885_279d3fcc4ae940fc1524aa
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable



Your pipeline has failed.

Project: QEMU ( https://gitlab.com/qemu-project/qemu )
Branch: master ( https://gitlab.com/qemu-project/qemu/-/commits/master )

Commit: beff47a2 ( https://gitlab.com/qemu-project/qemu/-/commit/beff47a2=
f6a8295161f98a9dac94e18e5376e749 )
Commit Message: Merge remote-tracking branch 'remotes/juanquint...
Commit Author: Peter Maydell ( https://gitlab.com/pm215 )

Pipeline #166519289 ( https://gitlab.com/qemu-project/qemu/-/pipelines/16=
6519289 ) triggered by Alex Benn=C3=A9e ( https://gitlab.com/stsquad )
had 23 failed builds.

Job #638340650 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340650/ra=
w )

Stage: containers-layer2
Name: alpha-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-alpha-cross', '-f', '/tmp/docker_buildt9mhh238/tmpgx2ncssc.docker',=
 '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildt9mhh238']=
' returned non-zero exit status 1.
section_end:1594747877:step_script
=1B[0Ksection_start:1594747877:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747877:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340669 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340669/ra=
w )

Stage: containers-layer2
Name: ppc64el-debian-cross-container
Trace: #4 [1/4] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/4] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-ppc64el-cross', '-f', '/tmp/docker_build9_ml3ufi/tmpn39x30m7.docker=
', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_build9_ml3ufi=
']' returned non-zero exit status 1.
section_end:1594747877:step_script
=1B[0Ksection_start:1594747877:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747877:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340657 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340657/ra=
w )

Stage: containers-layer2
Name: armel-debian-cross-container
Trace: #4 [1/3] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/3] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-armel-cross', '-f', '/tmp/docker_buildchuzceo8/tmpl3ei3fnu.docker',=
 '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildchuzceo8']=
' returned non-zero exit status 1.
section_end:1594747876:step_script
=1B[0Ksection_start:1594747876:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747877:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340663 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340663/ra=
w )

Stage: containers-layer2
Name: mips-debian-cross-container
Trace: #4 [1/5] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/5] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-mips-cross', '-f', '/tmp/docker_build99zl3pka/tmpsgqlk7np.docker', =
'--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_build99zl3pka']'=
 returned non-zero exit status 1.
section_end:1594747876:step_script
=1B[0Ksection_start:1594747876:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747877:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340652 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340652/ra=
w )

Stage: containers-layer2
Name: amd64-debian-user-cross-container
Trace: #4 [1/3] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/3] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-all-test-cross', '-f', '/tmp/docker_buildags3z11x/tmpsp5pyl9f.docke=
r', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildags3z11=
x']' returned non-zero exit status 1.
section_end:1594747876:step_script
=1B[0Ksection_start:1594747876:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747877:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340673 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340673/ra=
w )

Stage: containers-layer2
Name: sparc64-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-sparc64-cross', '-f', '/tmp/docker_build2addff9v/tmpz_2kp__n.docker=
', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_build2addff9v=
']' returned non-zero exit status 1.
section_end:1594747876:step_script
=1B[0Ksection_start:1594747876:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747877:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340668 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340668/ra=
w )

Stage: containers-layer2
Name: ppc64-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-ppc64-cross', '-f', '/tmp/docker_buildc8sq0svi/tmpyth0eu9r.docker',=
 '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildc8sq0svi']=
' returned non-zero exit status 1.
section_end:1594747876:step_script
=1B[0Ksection_start:1594747876:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747876:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340672 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340672/ra=
w )

Stage: containers-layer2
Name: sh4-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-sh4-cross', '-f', '/tmp/docker_buildr2zvkxg1/tmp1ol547s4.docker', '=
--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildr2zvkxg1']' =
returned non-zero exit status 1.
section_end:1594747875:step_script
=1B[0Ksection_start:1594747875:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747876:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340667 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340667/ra=
w )

Stage: containers-layer2
Name: powerpc-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-powerpc-cross', '-f', '/tmp/docker_build62lwjzb8/tmptmeqtopf.docker=
', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_build62lwjzb8=
']' returned non-zero exit status 1.
section_end:1594747875:step_script
=1B[0Ksection_start:1594747875:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747876:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340661 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340661/ra=
w )

Stage: containers-layer2
Name: mips64-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-mips64-cross', '-f', '/tmp/docker_buildjq3feqv_/tmp10aiee0d.docker'=
, '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildjq3feqv_'=
]' returned non-zero exit status 1.
section_end:1594747875:step_script
=1B[0Ksection_start:1594747875:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747876:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340662 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340662/ra=
w )

Stage: containers-layer2
Name: mips64el-debian-cross-container
Trace: #4 [1/4] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/4] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-mips64el-cross', '-f', '/tmp/docker_build22k0lc0z/tmpbvkby578.docke=
r', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_build22k0lc0=
z']' returned non-zero exit status 1.
section_end:1594747875:step_script
=1B[0Ksection_start:1594747875:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747876:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340660 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340660/ra=
w )

Stage: containers-layer2
Name: m68k-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-m68k-cross', '-f', '/tmp/docker_buildygafwdc7/tmpytynr38w.docker', =
'--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildygafwdc7']'=
 returned non-zero exit status 1.
section_end:1594747875:step_script
=1B[0Ksection_start:1594747875:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747875:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340671 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340671/ra=
w )

Stage: containers-layer2
Name: s390x-debian-cross-container
Trace: #4 [1/6] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/6] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-s390x-cross', '-f', '/tmp/docker_buildvlx4qcyn/tmpvnzwrqi3.docker',=
 '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildvlx4qcyn']=
' returned non-zero exit status 1.
section_end:1594747874:step_script
=1B[0Ksection_start:1594747874:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747875:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340659 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340659/ra=
w )

Stage: containers-layer2
Name: hppa-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-hppa-cross', '-f', '/tmp/docker_buildxz714zzu/tmp1bt6f7rg.docker', =
'--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildxz714zzu']'=
 returned non-zero exit status 1.
section_end:1594747874:step_script
=1B[0Ksection_start:1594747874:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747875:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340670 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340670/ra=
w )

Stage: containers-layer2
Name: riscv64-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-riscv64-cross', '-f', '/tmp/docker_build76brvsjh/tmpnrwmiof0.docker=
', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_build76brvsjh=
']' returned non-zero exit status 1.
section_end:1594747874:step_script
=1B[0Ksection_start:1594747874:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747874:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340665 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340665/ra=
w )

Stage: containers-layer2
Name: mipsel-debian-cross-container
Trace: #4 [1/5] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/5] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-mipsel-cross', '-f', '/tmp/docker_buildioph0ci8/tmpjwqd8ldx.docker'=
, '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildioph0ci8'=
]' returned non-zero exit status 1.
section_end:1594747874:step_script
=1B[0Ksection_start:1594747874:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747874:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340658 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340658/ra=
w )

Stage: containers-layer2
Name: armhf-debian-cross-container
Trace: #4 [1/5] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/5] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-armhf-cross', '-f', '/tmp/docker_build0xsr_oqi/tmp3po94kpb.docker',=
 '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_build0xsr_oqi']=
' returned non-zero exit status 1.
section_end:1594747874:step_script
=1B[0Ksection_start:1594747874:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747874:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340653 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340653/ra=
w )

Stage: containers-layer2
Name: amd64-debian-container
Trace: #4 [1/11] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/11] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-amd64', '-f', '/tmp/docker_buildvjq29yz4/tmp1achewgy.docker', '--bu=
ild-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildvjq29yz4']' retu=
rned non-zero exit status 1.
section_end:1594747873:step_script
=1B[0Ksection_start:1594747873:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747874:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340654 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340654/ra=
w )

Stage: containers-layer2
Name: arm64-debian-cross-container
Trace: #4 [1/5] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/5] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-arm64-cross', '-f', '/tmp/docker_buildqahdfmn9/tmp8uvgj4yk.docker',=
 '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildqahdfmn9']=
' returned non-zero exit status 1.
section_end:1594747873:step_script
=1B[0Ksection_start:1594747873:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747874:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340651 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340651/ra=
w )

Stage: containers-layer2
Name: amd64-debian-cross-container
Trace: #4 [1/4] FROM docker.io/qemu/debian10:latest
#4 resolve docker.io/qemu/debian10:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian10:latest:
------
------
 > [1/4] FROM docker.io/qemu/debian10:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-amd64-cross', '-f', '/tmp/docker_buildbqow_eaj/tmpyf3d23q5.docker',=
 '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildbqow_eaj']=
' returned non-zero exit status 1.
section_end:1594747873:step_script
=1B[0Ksection_start:1594747873:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747874:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340674 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340674/ra=
w )

Stage: containers-layer2
Name: tricore-debian-cross-container
Trace: #4 [1/2] FROM docker.io/qemu/debian9:latest
#4 resolve docker.io/qemu/debian9:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian9:latest:
------
------
 > [1/2] FROM docker.io/qemu/debian9:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-tricore-cross', '-f', '/tmp/docker_buildi1mo3gu8/tmpir46lj85.docker=
', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildi1mo3gu8=
']' returned non-zero exit status 1.
section_end:1594747863:step_script
=1B[0Ksection_start:1594747863:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747864:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340649 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340649/ra=
w )

Stage: containers-layer2
Name: amd64-debian9-mxe-container
Trace: #4 [1/4] FROM docker.io/qemu/debian9:latest
#4 resolve docker.io/qemu/debian9:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian9:latest:
------
------
 > [1/4] FROM docker.io/qemu/debian9:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian9-mxe', '-f', '/tmp/docker_buildpza5amti/tmpfbk8rtri.docker', '--bui=
ld-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildpza5amti']' retur=
ned non-zero exit status 1.
section_end:1594747862:step_script
=1B[0Ksection_start:1594747862:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747863:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #638340656 ( https://gitlab.com/qemu-project/qemu/-/jobs/638340656/ra=
w )

Stage: containers-layer2
Name: arm64-test-debian-cross-container
Trace: #4 [1/3] FROM docker.io/qemu/debian11:latest
#4 resolve docker.io/qemu/debian11:latest 0.1s done
#4 ERROR: pull access denied, repository does not exist or may require au=
thorization: server message: insufficient_scope: authorization failed
------
 > [internal] load metadata for docker.io/qemu/debian11:latest:
------
------
 > [1/3] FROM docker.io/qemu/debian11:latest:
------
failed to solve with frontend dockerfile.v0: failed to build LLB: failed =
to load cache key: pull access denied, repository does not exist or may r=
equire authorization: server message: insufficient_scope: authorization f=
ailed
Traceback (most recent call last):
  File "./tests/docker/docker.py", line 702, in <module>
    sys.exit(main())
  File "./tests/docker/docker.py", line 698, in main
    return args.cmdobj.run(args, argv)
  File "./tests/docker/docker.py", line 492, in run
    dkr.build_image(tag, docker_dir, dockerfile,
  File "./tests/docker/docker.py", line 347, in build_image
    self._do_check(build_args,
  File "./tests/docker/docker.py", line 244, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['docker', 'build', '-t', 'qemu/d=
ebian-arm64-test-cross', '-f', '/tmp/docker_buildfale0r4o/tmpozg9usxk.doc=
ker', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/tmp/docker_buildfale0=
r4o']' returned non-zero exit status 1.
section_end:1594747858:step_script
=1B[0Ksection_start:1594747858:after_script
=1B[0K=1B[0K=1B[36;1mRunning after_script=1B[0;m
=1B[0;m=1B[32;1mRunning after script...=1B[0;m
=1B[32;1m$ docker logout=1B[0;m
Removing login credentials for https://index.docker.io/v1/
section_end:1594747858:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m


-- =

You're receiving this email because of your account on gitlab.com.




----==_mimepart_5f0debeb2f885_279d3fcc4ae940fc1524aa
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://ww=
w.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml" lang=3D"en" xml:lang=3D"en">=

<head>
<meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Type" =
/>
<meta content=3D"width=3Ddevice-width, initial-scale=3D1" name=3D"viewpor=
t" />
<meta content=3D"IE=3Dedge" http-equiv=3D"X-UA-Compatible" />
<title>QEMU | Pipeline #166519289 has failed for master | beff47a2</title=
>
<style data-premailer=3D"ignore" type=3D"text/css">
body,table,td,a{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}t=
able,td{mso-table-lspace:0pt;mso-table-rspace:0pt}img{-ms-interpolation-m=
ode:bicubic}.hidden{display:none !important;visibility:hidden !important}=
a[x-apple-data-detectors]{color:inherit !important;text-decoration:none !=
important;font-size:inherit !important;font-family:inherit !important;fon=
t-weight:inherit !important;line-height:inherit !important}div[style*=3D'=
margin: 16px 0']{margin:0 !important}@media only screen and (max-width: 6=
39px){body,#body{min-width:320px !important}table.wrapper{width:100% !imp=
ortant;min-width:320px !important}table.wrapper td.wrapper-cell{border-le=
ft:0 !important;border-right:0 !important;border-radius:0 !important;padd=
ing-left:10px !important;padding-right:10px !important}}

</style>

<style>body {
margin: 0 !important; background-color: #fafafa; padding: 0; text-align: =
center; min-width: 640px; width: 100%; height: 100%; font-family: "Helvet=
ica Neue", Helvetica, Arial, sans-serif;
}
</style></head>
<body style=3D"text-align: center; min-width: 640px; width: 100%; height:=
 100%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-se=
rif; margin: 0; padding: 0;" bgcolor=3D"#fafafa">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" id=3D"body" style=
=3D"text-align: center; min-width: 640px; width: 100%; margin: 0; padding=
: 0;" bgcolor=3D"#fafafa">
<tbody>
<tr class=3D"line">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; height: 4px; font-size: 4px; line-height: 4px;" bgcolor=3D"#6b=
4fbb"></td>
</tr>
<tr class=3D"header">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; font-size: 13px; line-height: 1.6; color: #5c5c5c; padding: 25=
px 0;">

<img alt=3D"GitLab" src=3D"https://gitlab.com/assets/mailers/gitlab_heade=
r_logo-153749eaa7ea6fafcb995161abd3247bc4c4500f31498b0c4024f50093983ac0.g=
if" width=3D"55" height=3D"50" />
</td>
</tr>
<tr>
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"wrapper"=
 style=3D"width: 640px; border-collapse: separate; border-spacing: 0; mar=
gin: 0 auto;">
<tbody>
<tr>
<td class=3D"wrapper-cell" style=3D"font-family: &quot;Helvetica Neue&quo=
t;, Helvetica, Arial, sans-serif; border-radius: 3px; overflow: hidden; p=
adding: 18px 25px; border: 1px solid #ededed;" align=3D"left" bgcolor=3D"=
#fff">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"content"=
 style=3D"width: 100%; border-collapse: separate; border-spacing: 0;">
<tbody>
<tr class=3D"alert">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 3px; font-size: 14px; line-height: 1.3; overflow: hidden; co=
lor: #ffffff; padding: 10px;" align=3D"center" bgcolor=3D"#d22f57">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse; margin: 0 auto;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #ffffff; padding-right: 5px; line-height: 1;" align=3D"center" valig=
n=3D"middle">
<img alt=3D"&#10006;" height=3D"13" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-inverted-06edddd39ba2a7f9a32f6201e420=
175db85a4b6ac0348203fdc069001b440149.gif" style=3D"display: block;" width=
=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #ffffff;" align=3D"center" valign=3D"middle">
Your pipeline has failed.
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr class=3D"spacer">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; he=
ight: 18px; font-size: 18px; line-height: 18px;">
&#160;
</td>
</tr>
<tr class=3D"section">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 3px; overflow: hidden; padding: 0 15px; border: 1px solid #e=
deded;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"table-in=
fo" style=3D"width: 100%;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; margin=
: 0; padding: 14px 0;">Project</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; color: #333333; width:=
 75%; margin: 0; padding: 14px 0 14px 5px;">
<a class=3D"muted" href=3D"https://gitlab.com/qemu-project" style=3D"colo=
r: #333333; text-decoration: none;">
QEMU
</a>
/
<a class=3D"muted" href=3D"https://gitlab.com/qemu-project/qemu" style=3D=
"color: #333333; text-decoration: none;">
QEMU
</a>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">Branch</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; color: #333333; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" height=3D"13" src=3D"https://gitlab.com/assets/mailers/ci_p=
ipeline_notif_v1/icon-branch-gray-53618a7fc19d4d32ccbabac2f6d59bebe67202a=
9f2f1255e3f72c69756c0dd9c.gif" style=3D"display: block;" width=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a class=3D"muted" href=3D"https://gitlab.com/qemu-project/qemu/-/commits=
/master" style=3D"color: #333333; text-decoration: none;">
master
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">Commit</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 400; color: #333333; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" height=3D"13" src=3D"https://gitlab.com/assets/mailers/ci_p=
ipeline_notif_v1/icon-commit-gray-c10243ac24cde64b549aec91de35e6b49c8739b=
506b86472b54614c10d8b4aac.gif" style=3D"display: block;" width=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/beff47a2f6a82951=
61f98a9dac94e18e5376e749" style=3D"color: #3777b0; text-decoration: none;=
">
beff47a2
</a>
</td>
</tr>
</tbody>
</table>
<div class=3D"commit" style=3D"color: #5c5c5c; font-weight: 300;">
Merge remote-tracking branch 'remotes/juanquint...
</div>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">Commit Author</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; color: #333333; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" class=3D"avatar" height=3D"24" src=3D"https://secure.gravat=
ar.com/avatar/98261ce19b4e9da714d577154686723a?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a class=3D"muted" href=3D"https://gitlab.com/pm215" style=3D"color: #333=
333; text-decoration: none;">
Peter Maydell
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr class=3D"spacer">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; he=
ight: 18px; font-size: 18px; line-height: 18px;">
&#160;
</td>
</tr>
<tr class=3D"pre-section">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #333333; font-size: 15px; font-weight: 400; line-height: 1.4; paddin=
g: 15px 5px 0;" align=3D"center">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse; margin: 0 auto;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; font-weight: 500; line-height: 1.4;" valign=3D"baseline">
Pipeline
<a href=3D"https://gitlab.com/qemu-project/qemu/-/pipelines/166519289" st=
yle=3D"color: #3777b0; text-decoration: none;">
#166519289
</a>
triggered by
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px; padding-left: 5px;" =
width=3D"24" valign=3D"middle">
<img alt=3D"" class=3D"avatar" height=3D"24" src=3D"https://secure.gravat=
ar.com/avatar/a7d7f408c0b3370bbbeb98833d6c50e4?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; font-weight: 500; line-height: 1.4;" valign=3D"baseline">
<a class=3D"muted" href=3D"https://gitlab.com/stsquad" style=3D"color: #3=
33333; text-decoration: none;">
Alex Benn&#233;e
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; color: #333333; font-size: 14px; font-weight: 400; line-heigh=
t: 1.4; padding: 0 8px 16px;" align=3D"center">
had
23
failed
builds.
</td>
</tr>
<tr class=3D"table-warning">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 4px 4px 0 0; overflow: hidden; color: #d22852; font-size: 14=
px; line-height: 1.4; padding: 8px 16px; border-color: #ededed; border-st=
yle: solid; border-width: 1px 1px 0;" align=3D"center" bgcolor=3D"#fdf4f6=
">
Logs may contain sensitive data. Please consider before forwarding this e=
mail.
</td>
</tr>
<tr class=3D"section">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; ov=
erflow: hidden; border-radius: 0 0 4px 4px; padding: 0 16px; border-color=
: #ededed; border-style: solid; border-width: 0 1px 1px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"builds" =
style=3D"width: 100%; border-collapse: collapse;">
<tbody>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340650" style=3D=
"color: #3777b0; text-decoration: none;">
alpha-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-alpha-cross', '-f', '/tmp/docke=
r_buildt9mhh238/tmpgx2ncssc.docker', '--build-arg', 'BUILDKIT_INLINE_CACH=
E=3D1', '/tmp/docker_buildt9mhh238']' returned non-zero exit status 1.<br=
 /></span><div class=3D"section-start" data-timestamp=3D"1594747877" data=
-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-=
cyan term-bold section section-header js-s-after-script">Running after_sc=
ript</span><span class=3D"section section-header js-s-after-script"><br /=
></span><span class=3D"term-fg-l-green term-bold section line js-s-after-=
script">Running after script...</span><span class=3D"section line js-s-af=
ter-script"><br /></span><span class=3D"term-fg-l-green term-bold section=
 line js-s-after-script">$ docker logout</span><span class=3D"section lin=
e js-s-after-script"><br />Removing login credentials for https://index.d=
ocker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after=
-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed:=
 exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340669" style=3D=
"color: #3777b0; text-decoration: none;">
ppc64el-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/4] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/4]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-ppc64el-cross', '-f', '/tmp/doc=
ker_build9_ml3ufi/tmpn39x30m7.docker', '--build-arg', 'BUILDKIT_INLINE_CA=
CHE=3D1', '/tmp/docker_build9_ml3ufi']' returned non-zero exit status 1.<=
br /></span><div class=3D"section-start" data-timestamp=3D"1594747877" da=
ta-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-=
l-cyan term-bold section section-header js-s-after-script">Running after_=
script</span><span class=3D"section section-header js-s-after-script"><br=
 /></span><span class=3D"term-fg-l-green term-bold section line js-s-afte=
r-script">Running after script...</span><span class=3D"section line js-s-=
after-script"><br /></span><span class=3D"term-fg-l-green term-bold secti=
on line js-s-after-script">$ docker logout</span><span class=3D"section l=
ine js-s-after-script"><br />Removing login credentials for https://index=
.docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"aft=
er-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job faile=
d: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340657" style=3D=
"color: #3777b0; text-decoration: none;">
armel-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/3] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/3]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-armel-cross', '-f', '/tmp/docke=
r_buildchuzceo8/tmpl3ei3fnu.docker', '--build-arg', 'BUILDKIT_INLINE_CACH=
E=3D1', '/tmp/docker_buildchuzceo8']' returned non-zero exit status 1.<br=
 /></span><div class=3D"section-start" data-timestamp=3D"1594747876" data=
-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-=
cyan term-bold section section-header js-s-after-script">Running after_sc=
ript</span><span class=3D"section section-header js-s-after-script"><br /=
></span><span class=3D"term-fg-l-green term-bold section line js-s-after-=
script">Running after script...</span><span class=3D"section line js-s-af=
ter-script"><br /></span><span class=3D"term-fg-l-green term-bold section=
 line js-s-after-script">$ docker logout</span><span class=3D"section lin=
e js-s-after-script"><br />Removing login credentials for https://index.d=
ocker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after=
-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed:=
 exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340663" style=3D=
"color: #3777b0; text-decoration: none;">
mips-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/5] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/5]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-mips-cross', '-f', '/tmp/docker=
_build99zl3pka/tmpsgqlk7np.docker', '--build-arg', 'BUILDKIT_INLINE_CACHE=
=3D1', '/tmp/docker_build99zl3pka']' returned non-zero exit status 1.<br =
/></span><div class=3D"section-start" data-timestamp=3D"1594747876" data-=
section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-c=
yan term-bold section section-header js-s-after-script">Running after_scr=
ipt</span><span class=3D"section section-header js-s-after-script"><br />=
</span><span class=3D"term-fg-l-green term-bold section line js-s-after-s=
cript">Running after script...</span><span class=3D"section line js-s-aft=
er-script"><br /></span><span class=3D"term-fg-l-green term-bold section =
line js-s-after-script">$ docker logout</span><span class=3D"section line=
 js-s-after-script"><br />Removing login credentials for https://index.do=
cker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after-=
script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed: =
exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340652" style=3D=
"color: #3777b0; text-decoration: none;">
amd64-debian-user-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/3] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/3]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-all-test-cross', '-f', '/tmp/do=
cker_buildags3z11x/tmpsp5pyl9f.docker', '--build-arg', 'BUILDKIT_INLINE_C=
ACHE=3D1', '/tmp/docker_buildags3z11x']' returned non-zero exit status 1.=
<br /></span><div class=3D"section-start" data-timestamp=3D"1594747876" d=
ata-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg=
-l-cyan term-bold section section-header js-s-after-script">Running after=
_script</span><span class=3D"section section-header js-s-after-script"><b=
r /></span><span class=3D"term-fg-l-green term-bold section line js-s-aft=
er-script">Running after script...</span><span class=3D"section line js-s=
-after-script"><br /></span><span class=3D"term-fg-l-green term-bold sect=
ion line js-s-after-script">$ docker logout</span><span class=3D"section =
line js-s-after-script"><br />Removing login credentials for https://inde=
x.docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"af=
ter-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job fail=
ed: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340673" style=3D=
"color: #3777b0; text-decoration: none;">
sparc64-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-sparc64-cross', '-f', '/tmp/doc=
ker_build2addff9v/tmpz_2kp__n.docker', '--build-arg', 'BUILDKIT_INLINE_CA=
CHE=3D1', '/tmp/docker_build2addff9v']' returned non-zero exit status 1.<=
br /></span><div class=3D"section-start" data-timestamp=3D"1594747876" da=
ta-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-=
l-cyan term-bold section section-header js-s-after-script">Running after_=
script</span><span class=3D"section section-header js-s-after-script"><br=
 /></span><span class=3D"term-fg-l-green term-bold section line js-s-afte=
r-script">Running after script...</span><span class=3D"section line js-s-=
after-script"><br /></span><span class=3D"term-fg-l-green term-bold secti=
on line js-s-after-script">$ docker logout</span><span class=3D"section l=
ine js-s-after-script"><br />Removing login credentials for https://index=
.docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"aft=
er-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job faile=
d: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340668" style=3D=
"color: #3777b0; text-decoration: none;">
ppc64-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-ppc64-cross', '-f', '/tmp/docke=
r_buildc8sq0svi/tmpyth0eu9r.docker', '--build-arg', 'BUILDKIT_INLINE_CACH=
E=3D1', '/tmp/docker_buildc8sq0svi']' returned non-zero exit status 1.<br=
 /></span><div class=3D"section-start" data-timestamp=3D"1594747876" data=
-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-=
cyan term-bold section section-header js-s-after-script">Running after_sc=
ript</span><span class=3D"section section-header js-s-after-script"><br /=
></span><span class=3D"term-fg-l-green term-bold section line js-s-after-=
script">Running after script...</span><span class=3D"section line js-s-af=
ter-script"><br /></span><span class=3D"term-fg-l-green term-bold section=
 line js-s-after-script">$ docker logout</span><span class=3D"section lin=
e js-s-after-script"><br />Removing login credentials for https://index.d=
ocker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after=
-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed:=
 exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340672" style=3D=
"color: #3777b0; text-decoration: none;">
sh4-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-sh4-cross', '-f', '/tmp/docker_=
buildr2zvkxg1/tmp1ol547s4.docker', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D=
1', '/tmp/docker_buildr2zvkxg1']' returned non-zero exit status 1.<br /><=
/span><div class=3D"section-start" data-timestamp=3D"1594747875" data-sec=
tion=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-cyan=
 term-bold section section-header js-s-after-script">Running after_script=
</span><span class=3D"section section-header js-s-after-script"><br /></s=
pan><span class=3D"term-fg-l-green term-bold section line js-s-after-scri=
pt">Running after script...</span><span class=3D"section line js-s-after-=
script"><br /></span><span class=3D"term-fg-l-green term-bold section lin=
e js-s-after-script">$ docker logout</span><span class=3D"section line js=
-s-after-script"><br />Removing login credentials for https://index.docke=
r.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after-scr=
ipt"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed: exi=
t code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340667" style=3D=
"color: #3777b0; text-decoration: none;">
powerpc-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-powerpc-cross', '-f', '/tmp/doc=
ker_build62lwjzb8/tmptmeqtopf.docker', '--build-arg', 'BUILDKIT_INLINE_CA=
CHE=3D1', '/tmp/docker_build62lwjzb8']' returned non-zero exit status 1.<=
br /></span><div class=3D"section-start" data-timestamp=3D"1594747875" da=
ta-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-=
l-cyan term-bold section section-header js-s-after-script">Running after_=
script</span><span class=3D"section section-header js-s-after-script"><br=
 /></span><span class=3D"term-fg-l-green term-bold section line js-s-afte=
r-script">Running after script...</span><span class=3D"section line js-s-=
after-script"><br /></span><span class=3D"term-fg-l-green term-bold secti=
on line js-s-after-script">$ docker logout</span><span class=3D"section l=
ine js-s-after-script"><br />Removing login credentials for https://index=
.docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"aft=
er-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job faile=
d: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340661" style=3D=
"color: #3777b0; text-decoration: none;">
mips64-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-mips64-cross', '-f', '/tmp/dock=
er_buildjq3feqv_/tmp10aiee0d.docker', '--build-arg', 'BUILDKIT_INLINE_CAC=
HE=3D1', '/tmp/docker_buildjq3feqv_']' returned non-zero exit status 1.<b=
r /></span><div class=3D"section-start" data-timestamp=3D"1594747875" dat=
a-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l=
-cyan term-bold section section-header js-s-after-script">Running after_s=
cript</span><span class=3D"section section-header js-s-after-script"><br =
/></span><span class=3D"term-fg-l-green term-bold section line js-s-after=
-script">Running after script...</span><span class=3D"section line js-s-a=
fter-script"><br /></span><span class=3D"term-fg-l-green term-bold sectio=
n line js-s-after-script">$ docker logout</span><span class=3D"section li=
ne js-s-after-script"><br />Removing login credentials for https://index.=
docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"afte=
r-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed=
: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340662" style=3D=
"color: #3777b0; text-decoration: none;">
mips64el-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/4] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/4]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-mips64el-cross', '-f', '/tmp/do=
cker_build22k0lc0z/tmpbvkby578.docker', '--build-arg', 'BUILDKIT_INLINE_C=
ACHE=3D1', '/tmp/docker_build22k0lc0z']' returned non-zero exit status 1.=
<br /></span><div class=3D"section-start" data-timestamp=3D"1594747875" d=
ata-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg=
-l-cyan term-bold section section-header js-s-after-script">Running after=
_script</span><span class=3D"section section-header js-s-after-script"><b=
r /></span><span class=3D"term-fg-l-green term-bold section line js-s-aft=
er-script">Running after script...</span><span class=3D"section line js-s=
-after-script"><br /></span><span class=3D"term-fg-l-green term-bold sect=
ion line js-s-after-script">$ docker logout</span><span class=3D"section =
line js-s-after-script"><br />Removing login credentials for https://inde=
x.docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"af=
ter-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job fail=
ed: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340660" style=3D=
"color: #3777b0; text-decoration: none;">
m68k-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-m68k-cross', '-f', '/tmp/docker=
_buildygafwdc7/tmpytynr38w.docker', '--build-arg', 'BUILDKIT_INLINE_CACHE=
=3D1', '/tmp/docker_buildygafwdc7']' returned non-zero exit status 1.<br =
/></span><div class=3D"section-start" data-timestamp=3D"1594747875" data-=
section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-c=
yan term-bold section section-header js-s-after-script">Running after_scr=
ipt</span><span class=3D"section section-header js-s-after-script"><br />=
</span><span class=3D"term-fg-l-green term-bold section line js-s-after-s=
cript">Running after script...</span><span class=3D"section line js-s-aft=
er-script"><br /></span><span class=3D"term-fg-l-green term-bold section =
line js-s-after-script">$ docker logout</span><span class=3D"section line=
 js-s-after-script"><br />Removing login credentials for https://index.do=
cker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after-=
script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed: =
exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340671" style=3D=
"color: #3777b0; text-decoration: none;">
s390x-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/6] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/6]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-s390x-cross', '-f', '/tmp/docke=
r_buildvlx4qcyn/tmpvnzwrqi3.docker', '--build-arg', 'BUILDKIT_INLINE_CACH=
E=3D1', '/tmp/docker_buildvlx4qcyn']' returned non-zero exit status 1.<br=
 /></span><div class=3D"section-start" data-timestamp=3D"1594747874" data=
-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-=
cyan term-bold section section-header js-s-after-script">Running after_sc=
ript</span><span class=3D"section section-header js-s-after-script"><br /=
></span><span class=3D"term-fg-l-green term-bold section line js-s-after-=
script">Running after script...</span><span class=3D"section line js-s-af=
ter-script"><br /></span><span class=3D"term-fg-l-green term-bold section=
 line js-s-after-script">$ docker logout</span><span class=3D"section lin=
e js-s-after-script"><br />Removing login credentials for https://index.d=
ocker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after=
-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed:=
 exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340659" style=3D=
"color: #3777b0; text-decoration: none;">
hppa-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-hppa-cross', '-f', '/tmp/docker=
_buildxz714zzu/tmp1bt6f7rg.docker', '--build-arg', 'BUILDKIT_INLINE_CACHE=
=3D1', '/tmp/docker_buildxz714zzu']' returned non-zero exit status 1.<br =
/></span><div class=3D"section-start" data-timestamp=3D"1594747874" data-=
section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-c=
yan term-bold section section-header js-s-after-script">Running after_scr=
ipt</span><span class=3D"section section-header js-s-after-script"><br />=
</span><span class=3D"term-fg-l-green term-bold section line js-s-after-s=
cript">Running after script...</span><span class=3D"section line js-s-aft=
er-script"><br /></span><span class=3D"term-fg-l-green term-bold section =
line js-s-after-script">$ docker logout</span><span class=3D"section line=
 js-s-after-script"><br />Removing login credentials for https://index.do=
cker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after-=
script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed: =
exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340670" style=3D=
"color: #3777b0; text-decoration: none;">
riscv64-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/2]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-riscv64-cross', '-f', '/tmp/doc=
ker_build76brvsjh/tmpnrwmiof0.docker', '--build-arg', 'BUILDKIT_INLINE_CA=
CHE=3D1', '/tmp/docker_build76brvsjh']' returned non-zero exit status 1.<=
br /></span><div class=3D"section-start" data-timestamp=3D"1594747874" da=
ta-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-=
l-cyan term-bold section section-header js-s-after-script">Running after_=
script</span><span class=3D"section section-header js-s-after-script"><br=
 /></span><span class=3D"term-fg-l-green term-bold section line js-s-afte=
r-script">Running after script...</span><span class=3D"section line js-s-=
after-script"><br /></span><span class=3D"term-fg-l-green term-bold secti=
on line js-s-after-script">$ docker logout</span><span class=3D"section l=
ine js-s-after-script"><br />Removing login credentials for https://index=
.docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"aft=
er-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job faile=
d: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340665" style=3D=
"color: #3777b0; text-decoration: none;">
mipsel-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/5] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/5]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-mipsel-cross', '-f', '/tmp/dock=
er_buildioph0ci8/tmpjwqd8ldx.docker', '--build-arg', 'BUILDKIT_INLINE_CAC=
HE=3D1', '/tmp/docker_buildioph0ci8']' returned non-zero exit status 1.<b=
r /></span><div class=3D"section-start" data-timestamp=3D"1594747874" dat=
a-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l=
-cyan term-bold section section-header js-s-after-script">Running after_s=
cript</span><span class=3D"section section-header js-s-after-script"><br =
/></span><span class=3D"term-fg-l-green term-bold section line js-s-after=
-script">Running after script...</span><span class=3D"section line js-s-a=
fter-script"><br /></span><span class=3D"term-fg-l-green term-bold sectio=
n line js-s-after-script">$ docker logout</span><span class=3D"section li=
ne js-s-after-script"><br />Removing login credentials for https://index.=
docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"afte=
r-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed=
: exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340658" style=3D=
"color: #3777b0; text-decoration: none;">
armhf-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/5] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/5]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-armhf-cross', '-f', '/tmp/docke=
r_build0xsr_oqi/tmp3po94kpb.docker', '--build-arg', 'BUILDKIT_INLINE_CACH=
E=3D1', '/tmp/docker_build0xsr_oqi']' returned non-zero exit status 1.<br=
 /></span><div class=3D"section-start" data-timestamp=3D"1594747874" data=
-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-=
cyan term-bold section section-header js-s-after-script">Running after_sc=
ript</span><span class=3D"section section-header js-s-after-script"><br /=
></span><span class=3D"term-fg-l-green term-bold section line js-s-after-=
script">Running after script...</span><span class=3D"section line js-s-af=
ter-script"><br /></span><span class=3D"term-fg-l-green term-bold section=
 line js-s-after-script">$ docker logout</span><span class=3D"section lin=
e js-s-after-script"><br />Removing login credentials for https://index.d=
ocker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after=
-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed:=
 exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340653" style=3D=
"color: #3777b0; text-decoration: none;">
amd64-debian-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/11]=
 FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debia=
n10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does n=
ot exist or may require authorization: server message: insufficient_scope=
: authorization failed<br />------<br /> &gt; [internal] load metadata fo=
r docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/1=
1] FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve =
with frontend dockerfile.v0: failed to build LLB: failed to load cache ke=
y: pull access denied, repository does not exist or may require authoriza=
tion: server message: insufficient_scope: authorization failed<br />Trace=
back (most recent call last):<br />  File "./tests/docker/docker.py", lin=
e 702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/d=
ocker/docker.py", line 698, in main<br />    return args.cmdobj.run(args,=
 argv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    =
dkr.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/=
docker.py", line 347, in build_image<br />    self._do_check(build_args,<=
br />  File "./tests/docker/docker.py", line 244, in _do_check<br />    r=
eturn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/=
usr/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise =
CalledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comm=
and '['docker', 'build', '-t', 'qemu/debian-amd64', '-f', '/tmp/docker_bu=
ildvjq29yz4/tmp1achewgy.docker', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D=
1', '/tmp/docker_buildvjq29yz4']' returned non-zero exit status 1.<br /><=
/span><div class=3D"section-start" data-timestamp=3D"1594747873" data-sec=
tion=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-cyan=
 term-bold section section-header js-s-after-script">Running after_script=
</span><span class=3D"section section-header js-s-after-script"><br /></s=
pan><span class=3D"term-fg-l-green term-bold section line js-s-after-scri=
pt">Running after script...</span><span class=3D"section line js-s-after-=
script"><br /></span><span class=3D"term-fg-l-green term-bold section lin=
e js-s-after-script">$ docker logout</span><span class=3D"section line js=
-s-after-script"><br />Removing login credentials for https://index.docke=
r.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after-scr=
ipt"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed: exi=
t code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340654" style=3D=
"color: #3777b0; text-decoration: none;">
arm64-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/5] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/5]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-arm64-cross', '-f', '/tmp/docke=
r_buildqahdfmn9/tmp8uvgj4yk.docker', '--build-arg', 'BUILDKIT_INLINE_CACH=
E=3D1', '/tmp/docker_buildqahdfmn9']' returned non-zero exit status 1.<br=
 /></span><div class=3D"section-start" data-timestamp=3D"1594747873" data=
-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-=
cyan term-bold section section-header js-s-after-script">Running after_sc=
ript</span><span class=3D"section section-header js-s-after-script"><br /=
></span><span class=3D"term-fg-l-green term-bold section line js-s-after-=
script">Running after script...</span><span class=3D"section line js-s-af=
ter-script"><br /></span><span class=3D"term-fg-l-green term-bold section=
 line js-s-after-script">$ docker logout</span><span class=3D"section lin=
e js-s-after-script"><br />Removing login credentials for https://index.d=
ocker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after=
-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed:=
 exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340651" style=3D=
"color: #3777b0; text-decoration: none;">
amd64-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/4] =
FROM docker.io/qemu/debian10:latest<br />#4 resolve docker.io/qemu/debian=
10:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian10:latest:<br />------<br />------<br /> &gt; [1/4]=
 FROM docker.io/qemu/debian10:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-amd64-cross', '-f', '/tmp/docke=
r_buildbqow_eaj/tmpyf3d23q5.docker', '--build-arg', 'BUILDKIT_INLINE_CACH=
E=3D1', '/tmp/docker_buildbqow_eaj']' returned non-zero exit status 1.<br=
 /></span><div class=3D"section-start" data-timestamp=3D"1594747873" data=
-section=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-=
cyan term-bold section section-header js-s-after-script">Running after_sc=
ript</span><span class=3D"section section-header js-s-after-script"><br /=
></span><span class=3D"term-fg-l-green term-bold section line js-s-after-=
script">Running after script...</span><span class=3D"section line js-s-af=
ter-script"><br /></span><span class=3D"term-fg-l-green term-bold section=
 line js-s-after-script">$ docker logout</span><span class=3D"section lin=
e js-s-after-script"><br />Removing login credentials for https://index.d=
ocker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after=
-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed:=
 exit code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340674" style=3D=
"color: #3777b0; text-decoration: none;">
tricore-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/2] =
FROM docker.io/qemu/debian9:latest<br />#4 resolve docker.io/qemu/debian9=
:latest 0.1s done<br />#4 ERROR: pull access denied, repository does not =
exist or may require authorization: server message: insufficient_scope: a=
uthorization failed<br />------<br /> &gt; [internal] load metadata for d=
ocker.io/qemu/debian9:latest:<br />------<br />------<br /> &gt; [1/2] FR=
OM docker.io/qemu/debian9:latest:<br />------<br />failed to solve with f=
rontend dockerfile.v0: failed to build LLB: failed to load cache key: pul=
l access denied, repository does not exist or may require authorization: =
server message: insufficient_scope: authorization failed<br />Traceback (=
most recent call last):<br />  File "./tests/docker/docker.py", line 702,=
 in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/docker/=
docker.py", line 698, in main<br />    return args.cmdobj.run(args, argv)=
<br />  File "./tests/docker/docker.py", line 492, in run<br />    dkr.bu=
ild_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/docker=
.py", line 347, in build_image<br />    self._do_check(build_args,<br /> =
 File "./tests/docker/docker.py", line 244, in _do_check<br />    return =
subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/usr/li=
b/python3.8/subprocess.py", line 364, in check_call<br />    raise Called=
ProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Command '[=
'docker', 'build', '-t', 'qemu/debian-tricore-cross', '-f', '/tmp/docker_=
buildi1mo3gu8/tmpir46lj85.docker', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D=
1', '/tmp/docker_buildi1mo3gu8']' returned non-zero exit status 1.<br /><=
/span><div class=3D"section-start" data-timestamp=3D"1594747863" data-sec=
tion=3D"after-script" role=3D"button"></div><span class=3D"term-fg-l-cyan=
 term-bold section section-header js-s-after-script">Running after_script=
</span><span class=3D"section section-header js-s-after-script"><br /></s=
pan><span class=3D"term-fg-l-green term-bold section line js-s-after-scri=
pt">Running after script...</span><span class=3D"section line js-s-after-=
script"><br /></span><span class=3D"term-fg-l-green term-bold section lin=
e js-s-after-script">$ docker logout</span><span class=3D"section line js=
-s-after-script"><br />Removing login credentials for https://index.docke=
r.io/v1/<br /></span><div class=3D"section-end" data-section=3D"after-scr=
ipt"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed: exi=
t code 1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340649" style=3D=
"color: #3777b0; text-decoration: none;">
amd64-debian9-mxe-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/4] =
FROM docker.io/qemu/debian9:latest<br />#4 resolve docker.io/qemu/debian9=
:latest 0.1s done<br />#4 ERROR: pull access denied, repository does not =
exist or may require authorization: server message: insufficient_scope: a=
uthorization failed<br />------<br /> &gt; [internal] load metadata for d=
ocker.io/qemu/debian9:latest:<br />------<br />------<br /> &gt; [1/4] FR=
OM docker.io/qemu/debian9:latest:<br />------<br />failed to solve with f=
rontend dockerfile.v0: failed to build LLB: failed to load cache key: pul=
l access denied, repository does not exist or may require authorization: =
server message: insufficient_scope: authorization failed<br />Traceback (=
most recent call last):<br />  File "./tests/docker/docker.py", line 702,=
 in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/docker/=
docker.py", line 698, in main<br />    return args.cmdobj.run(args, argv)=
<br />  File "./tests/docker/docker.py", line 492, in run<br />    dkr.bu=
ild_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/docker=
.py", line 347, in build_image<br />    self._do_check(build_args,<br /> =
 File "./tests/docker/docker.py", line 244, in _do_check<br />    return =
subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/usr/li=
b/python3.8/subprocess.py", line 364, in check_call<br />    raise Called=
ProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Command '[=
'docker', 'build', '-t', 'qemu/debian9-mxe', '-f', '/tmp/docker_buildpza5=
amti/tmpfbk8rtri.docker', '--build-arg', 'BUILDKIT_INLINE_CACHE=3D1', '/t=
mp/docker_buildpza5amti']' returned non-zero exit status 1.<br /></span><=
div class=3D"section-start" data-timestamp=3D"1594747862" data-section=3D=
"after-script" role=3D"button"></div><span class=3D"term-fg-l-cyan term-b=
old section section-header js-s-after-script">Running after_script</span>=
<span class=3D"section section-header js-s-after-script"><br /></span><sp=
an class=3D"term-fg-l-green term-bold section line js-s-after-script">Run=
ning after script...</span><span class=3D"section line js-s-after-script"=
><br /></span><span class=3D"term-fg-l-green term-bold section line js-s-=
after-script">$ docker logout</span><span class=3D"section line js-s-afte=
r-script"><br />Removing login credentials for https://index.docker.io/v1=
/<br /></span><div class=3D"section-end" data-section=3D"after-script"></=
div><span class=3D"term-fg-l-red term-bold">ERROR: Job failed: exit code =
1<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
containers-layer2
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/638340656" style=3D=
"color: #3777b0; text-decoration: none;">
arm64-test-debian-cross-container
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>#4 [1/3] =
FROM docker.io/qemu/debian11:latest<br />#4 resolve docker.io/qemu/debian=
11:latest 0.1s done<br />#4 ERROR: pull access denied, repository does no=
t exist or may require authorization: server message: insufficient_scope:=
 authorization failed<br />------<br /> &gt; [internal] load metadata for=
 docker.io/qemu/debian11:latest:<br />------<br />------<br /> &gt; [1/3]=
 FROM docker.io/qemu/debian11:latest:<br />------<br />failed to solve wi=
th frontend dockerfile.v0: failed to build LLB: failed to load cache key:=
 pull access denied, repository does not exist or may require authorizati=
on: server message: insufficient_scope: authorization failed<br />Traceba=
ck (most recent call last):<br />  File "./tests/docker/docker.py", line =
702, in &lt;module&gt;<br />    sys.exit(main())<br />  File "./tests/doc=
ker/docker.py", line 698, in main<br />    return args.cmdobj.run(args, a=
rgv)<br />  File "./tests/docker/docker.py", line 492, in run<br />    dk=
r.build_image(tag, docker_dir, dockerfile,<br />  File "./tests/docker/do=
cker.py", line 347, in build_image<br />    self._do_check(build_args,<br=
 />  File "./tests/docker/docker.py", line 244, in _do_check<br />    ret=
urn subprocess.check_call(self._command + cmd, **kwargs)<br />  File "/us=
r/lib/python3.8/subprocess.py", line 364, in check_call<br />    raise Ca=
lledProcessError(retcode, cmd)<br />subprocess.CalledProcessError: Comman=
d '['docker', 'build', '-t', 'qemu/debian-arm64-test-cross', '-f', '/tmp/=
docker_buildfale0r4o/tmpozg9usxk.docker', '--build-arg', 'BUILDKIT_INLINE=
_CACHE=3D1', '/tmp/docker_buildfale0r4o']' returned non-zero exit status =
1.<br /></span><div class=3D"section-start" data-timestamp=3D"1594747858"=
 data-section=3D"after-script" role=3D"button"></div><span class=3D"term-=
fg-l-cyan term-bold section section-header js-s-after-script">Running aft=
er_script</span><span class=3D"section section-header js-s-after-script">=
<br /></span><span class=3D"term-fg-l-green term-bold section line js-s-a=
fter-script">Running after script...</span><span class=3D"section line js=
-s-after-script"><br /></span><span class=3D"term-fg-l-green term-bold se=
ction line js-s-after-script">$ docker logout</span><span class=3D"sectio=
n line js-s-after-script"><br />Removing login credentials for https://in=
dex.docker.io/v1/<br /></span><div class=3D"section-end" data-section=3D"=
after-script"></div><span class=3D"term-fg-l-red term-bold">ERROR: Job fa=
iled: exit code 1<br /></span></pre>
</td>
</tr>
</tbody>
</table>
</td>
</tr>


</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>

<tr class=3D"footer">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; font-size: 13px; line-height: 1.6; color: #5c5c5c; padding: 25=
px 0;">
<img alt=3D"GitLab" height=3D"33" src=3D"https://gitlab.com/assets/mailer=
s/gitlab_footer_logo-078860f148cc9596195e6bb3fa7db31c30538355576c5c3b569c=
414902e3d095.gif" width=3D"90" style=3D"display: block; margin: 0 auto 1e=
m;" />
<div>
You're receiving this email because of your account on gitlab.com. <a cla=
ss=3D"mng-notif-link" href=3D"https://gitlab.com/profile/notifications" s=
tyle=3D"color: #3777b0; text-decoration: none;">Manage all notifications<=
/a> &#183; <a class=3D"help-link" href=3D"https://gitlab.com/help" style=3D=
"color: #3777b0; text-decoration: none;">Help</a>
</div>
</td>
</tr>

<tr>
<td class=3D"footer-message" style=3D"font-family: &quot;Helvetica Neue&q=
uot;, Helvetica, Arial, sans-serif; font-size: 13px; line-height: 1.6; co=
lor: #5c5c5c; padding: 25px 0;">

</td>
</tr>
</tbody>
</table>
</body>
</html>

----==_mimepart_5f0debeb2f885_279d3fcc4ae940fc1524aa--

