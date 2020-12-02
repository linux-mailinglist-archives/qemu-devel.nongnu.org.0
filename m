Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E152E2CBD5B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:54:16 +0100 (CET)
Received: from localhost ([::1]:52420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkReB-00041q-V3
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkRcd-0003Jp-SY
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:52:39 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkRcV-0006Wl-Cv
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:52:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e7so3806363wrv.6
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 04:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=GNsymJgB82g1y3CStBobkSjd2+AeHYjw+Ym0W5/jw2M=;
 b=n8Yj4op9z9mqEjCX1GMw43W5nvNhCzaDxXlnpJ1gHlT/Gz2HxYPvTx9mOhyCEzN2a9
 U+dlXbAgxqn+LwgIgN2J4TwHhjNoyd1yTHtw28FnJFYxm3FSjKEZ2bdyNl/bSExyjdvA
 pDuaLm56ro2LAKVHGyD0Vr138lqvyw0wU6lkbRSKtF+gaNXiJ6lRAdeuO6u/We0JtANB
 FtQa6NJ9yx+NvtZW8OIGYn9CzDdPrIt0WFv1gchckgPWFzpzcntg23KjrSapK/zZhclm
 Dadwf4Zm8EgAyjoLkQimUiSpb2uMT+UvuHpEluqdMmc8RIt4zk+/Fl9E70/3o1GQ+j3K
 K7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=GNsymJgB82g1y3CStBobkSjd2+AeHYjw+Ym0W5/jw2M=;
 b=XzOUfPvGEwtn1rsbj75pj2cEe3IW1rzYZQE9yjwaZ4q+V2CHpCjIlSVS+tTkqZHeI6
 NBl/GyDHR5Ey1Lu+7E4UhOdovrvunvV4MvSAME4FU0wfZtfw8CTBs4ucptZonWpaO/wm
 eySq2JpEQL0vlWAd2BR8bTxYvNbW7kcFVBfkeTmrbsBdoc+LsUaOTl/6ZI8smOY2hHcw
 27GT2BTCHTwvZqGuCnazbeRYlzEVhEdvu8E75pAWQd41qZYUG4QVLV82Kj9Qt4hRls+P
 iLXo75uM64EAkc1gHhaJwUfMI4DEAkREpMfD8SIM6DArV39mbJMZlufsSPJ2orjdzX9+
 ZGGA==
X-Gm-Message-State: AOAM530LHtmqJJNV14QLgf/nDHoK1P5PXcEyOEmu4LKs2Jlfq1SxkctF
 id9j7hzvt9QyTPxNpElFNGauNcvO79QyLw==
X-Google-Smtp-Source: ABdhPJxPKiv2PbdMIHKJKA2HRG9h02eMoELwLNeTvXy/WX6TiFfO70F+sJ3miwildr9pMWIAaPqEHA==
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr3336105wrn.15.1606913548776; 
 Wed, 02 Dec 2020 04:52:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b18sm2145007wrt.54.2020.12.02.04.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 04:52:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78B311FF7E;
 Wed,  2 Dec 2020 12:52:26 +0000 (GMT)
References: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
 <87v9dksbkb.fsf@linaro.org> <b39faaa4-3be7-2e05-226c-7a3e50ab75af@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: check-tcg errors (build-user, build-user-plugins) again
In-reply-to: <b39faaa4-3be7-2e05-226c-7a3e50ab75af@suse.de>
Date: Wed, 02 Dec 2020 12:52:26 +0000
Message-ID: <87pn3ss73p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 12/2/20 12:16 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> Hi Alex and all,
>>>
>>> when trying to use check-tcg (master), I am getting often these errors:
>>>
>>> $ ../configure --disable-system --disable-tools
>>>
>>> $ make -j12 check-tcg
>>>
>>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges foun=
d for group "claudio" in /etc/subgid=20
>>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges foun=
d for group "claudio" in /etc/subgid=20
>>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges foun=
d for group "claudio" in /etc/subgid=20
>>> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian11...
>>> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/fedora-cris-c=
ross...
>>> Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian10...
>>> ERRO[0000] cannot find mappings for user claudio: No subgid ranges foun=
d for group "claudio" in /etc/subgid=20
>>>
>>> [...]
>>>   TEST    linux-test on x86_64
>>> timeout: failed to run command =E2=80=98/home/claudio/git/qemu/build/qe=
mu-x86_64=E2=80=99timeout: : No such file or directoryfailed to run command=
 =E2=80=98/home/claudio/git/qemu/build/qemu-x86_64=E2=80=99
>>>
>>> [...]
>>>
>>>
>>> Is there some pre-configuration on the host necessary to be able to
>>> run check-tcg?
>>=20
>> There shouldn't be but those errors remind me of some of the tweaks I
>> had to make to me Gentoo system when using podman (instead of docker).
>> In the end I think I just ended up adding the lines:
>>=20=20=20
>>   alex:100000:65536
>>=20
>> to /etc/subgid and /etc/subgid-
>>=20
>> Marc-Andr=C3=A9 may have some better pointers as he added podman support=
 to
>> the builder scripts.
>
>
> I did that and things seem a bit better, but still a lot of errors:
>
>
> 63      ../sysdeps/x86_64/start.S: No such file or directory.
>
> Error: error creating build container: The following failures happened wh=
ile trying to pull image specified by "debian:bullseye-slim" based on searc=
h registries in /etc/containers/registries.conf:
> * "localhost/debian:bullseye-slim": Error initializing source docker://lo=
calhost/debian:bullseye-slim: error pinging docker registry localhost: Get =
https://localhost/v2/: dial tcp [::1]:443: connect: connection refused
> * "docker.io/library/debian:bullseye-slim": Error committing the finished=
 image: error adding layer with blob "sha256:ae63fcbbc3b289e425e4c8840ccde4=
314f4a060cbc0345e6871a28bdc72f6fe8": Error processing tar file(exit status =
1): there might not be enough IDs available in the namespace (requested 0:4=
2 for /etc/gshadow): lchown /etc/gshadow: invalid argument
> Traceback (most recent call last):
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", lin=
e 709, in <module>
>     sys.exit(main())
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", lin=
e 705, in main
>     return args.cmdobj.run(args, argv)
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", lin=
e 501, in run
>     extra_files_cksum=3Dcksum)
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", lin=
e 354, in build_image
>     quiet=3Dquiet)
>   File "/home/claudio/git/qemu-pristine/qemu/tests/docker/docker.py", lin=
e 244, in _do_check
>     return subprocess.check_call(self._command + cmd, **kwargs)
>   File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
>     raise CalledProcessError(retcode, cmd)
>
>
> [...]
> Error: error pulling image "registry.gitlab.com/qemu-project/qemu/qemu/fe=
dora-cris-cross": unable to pull registry.gitlab.com/qemu-project/
>

I'm guessing this can be fixed by adding gitlab to /etc/containers/registri=
es.conf

I'll see if I can resurrect my podman setup because it was working before
we added the caching from gitlab.

> [...]
>
>
>
>>=20
>> The main difference between the images on the registry and the local
>> versions is most add the current user so there is a clean mapping
>> between the container user and the host file-system. It's the last step
>> of the build so we still use the cached layers from the registry
>> versions.
>>=20
>>> I see these errors in gitlab also for
>>>
>>> build-user
>>> build-user-plugin
>>>
>>> Maybe this is what Philippe mentioned before though, that this is
>>> expected at the moment due to a temporary Meson shortcoming?
>>=20
>> That is odd - I'm not seeing anything like that on the master builds:
>>=20
>>   https://gitlab.com/qemu-project/qemu/-/jobs/883985106
>>   https://gitlab.com/qemu-project/qemu/-/jobs/883985113
>>=20
>> AFAIK GitLab is still using Docker to build it's containers (albeit with
>> BUILDKIT enabled).
>
>
> I am running again on gitlab the master branch, maybe there is something =
I need to fix, but to do that I need to enable check-tcg successfully I thi=
nk.
>
> Thanks!
>
> Claudio
>
>>=20=20=20
>>>
>>> Ciao,
>>>
>>> Claudio
>>=20
>>=20


--=20
Alex Benn=C3=A9e

