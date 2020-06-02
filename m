Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD4B1EBF02
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 17:29:23 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg8qw-0000oN-Dx
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 11:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jg8ps-0000Ng-EQ
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:28:16 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jg8pr-0001qS-2z
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:28:15 -0400
Received: by mail-wr1-x442.google.com with SMTP id q11so3852545wrp.3
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=xOS5Vdd1CuaNmlrGTv+unkVsjpZ8zcR6/RwStctFfBQ=;
 b=jbJemOs7qnddyfl8TFriI4v2X7t1mOcciLHNFI6TQb7p1amkuxDK9RkaAd1toXMsz+
 4nya9lnSxIFgg8Rv65lQQlprH92i3OLx9tGjq7A5OEd0Ok8nx3XEqtiFH1hnOoMiWTRo
 //XNEIR1bgkkhYgDFz9560y4VD3wOCkb8UJ9fljyGabo74kjaRAC5LeTLE56TQmyaqdv
 rN3GjE/WiZwsxa6gjuzB0dJMG+2d2LJDV2pHArR1FGSfVNriZxDObj6KUpzNFXDxgfZ7
 3uS+Q9o18HvOxq7QfRAwtqFrW27VLucsX1JZ6tPCrmZbTvm5AWCiVVOGynl0pTdO2BLp
 A+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=xOS5Vdd1CuaNmlrGTv+unkVsjpZ8zcR6/RwStctFfBQ=;
 b=TTzgMkwOK5jDaX70To37+YHwfrMgFSqAPdh+8WdoJTNEnJOabybl/VZGHDqK0Apb5Z
 uWlbhniwNAq2gNE4LBeorVbuszWB111hc4Dz6F4B8NeiEkDRqihFFWNhgnN45kGc5qsW
 EZr5AdzIGH/777re5x2DlI3/1Q9b2mJ/D1iW7Y679Q+J7OxTkdpsYgGuFYqocsFbiuzZ
 C4vlzlO+TD1d5iIe6XAyhS90pnjY8EFqeVcSyXHtH/CJx+XxPBy8ysAjAWPkcziKov3/
 VpDxJgFb6sgna7MAgaI/VQSZFQU8Sjk13eI/9jVquqYfmoFiRPtCp23HOxcPC2sKxLfI
 2USg==
X-Gm-Message-State: AOAM532JN17Pol1aTngdIHajoT3FCcgLIGNpoAadCKPyfdVwqRN5G43c
 TmbBkVLIGSeNcjeM685/lbfBeg==
X-Google-Smtp-Source: ABdhPJxFcItQTiGXOoRQdSO4P/AaHcs8JfKu/1uJkBkNdXIPRjavHhde4LX/sMHiXp458totbvXJcA==
X-Received: by 2002:adf:8041:: with SMTP id 59mr25645961wrk.278.1591111692419; 
 Tue, 02 Jun 2020 08:28:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b80sm53219wme.43.2020.06.02.08.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 08:28:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57E7D1FF7E;
 Tue,  2 Jun 2020 16:28:10 +0100 (BST)
References: <20200602113702.28549-1-f4bug@amsat.org>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] .travis.yml: Temporarily disable the aarch64 job
In-reply-to: <20200602113702.28549-1-f4bug@amsat.org>
Date: Tue, 02 Jun 2020 16:28:10 +0100
Message-ID: <87lfl57aid.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Travis-CI Aarch64 runners are currently broken, the build fails
> because the filesystem quota is full [1]:
>
>     AR      libqemuutil.a
>   nm: qemu-sockets.o: Bad value
>     LINK    qemu-ga
>   qga/main.o: In function `main':
>   /home/travis/build/qemu/qemu/qga/main.c:1494: undefined reference to `s=
ocket_local_address'
>   qga/channel-posix.o: In function `ga_channel_open':
>   /home/travis/build/qemu/qemu/qga/channel-posix.c:210: undefined referen=
ce to `socket_parse'
>   /home/travis/build/qemu/qemu/qga/channel-posix.c:193: undefined referen=
ce to `unix_listen'
>   /home/travis/build/qemu/qemu/qga/channel-posix.c:218: undefined referen=
ce to `socket_listen'
>   collect2: error: ld returned 1 exit status
>   Makefile:686: recipe for target 'qemu-ga' failed
>   make: *** [qemu-ga] Error 1
>
> Per [2], LXD container have 'approx 18GB' of storage, but our runner show:
>
>   $ df -h
>   Filesystem                                                             =
                            Size  Used Avail Use% Mounted on
>   /var/snap/lxd/common/lxd/storage-pools/instances/containers/travis-job-=
qemu-qemu-693775643/rootfs  895G   38G  854G   5% /
>
> As we suppose a filesystem quota makes our build fail,
> disable the aarch64 job as a temporary kludge.
>
> [1] https://travis-ci.org/github/qemu/qemu/jobs/693775643
> [2] https://docs.travis-ci.com/user/reference/overview/#virtualisation-en=
vironment-vs-operating-system
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .travis.yml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.travis.yml b/.travis.yml
> index 564be50a3c..3569ee99b3 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -399,6 +399,7 @@ jobs:
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
>=20=20
>      - name: "[aarch64] GCC check-tcg"
> +      if: false # Temporarily disabled due to problem in aarch64 runner.
>        arch: arm64
>        dist: xenial
>        addons:

I was experimenting with something along the lines of:

--8<---------------cut here---------------start------------->8---
.travis.yml: allow failure for unreliable hosts

They will still run but they won't get in the way of the result.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

1 file changed, 5 insertions(+)
.travis.yml | 5 +++++

modified   .travis.yml
@@ -429,6 +429,7 @@ jobs:
       env:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS}"
+        - UNRELIABLE=3Dtrue
=20
     - name: "[ppc64] GCC check-tcg"
       arch: ppc64le
@@ -493,6 +494,7 @@ jobs:
       env:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS},s390x-linux-user"
+        - UNRELIABLE=3Dtrue
       script:
         - ( cd ${SRC_DIR} ; git submodule update --init roms/SLOF )
         - BUILD_RC=3D0 && make -j${JOBS} || BUILD_RC=3D$?
@@ -535,6 +537,7 @@ jobs:
         - TEST_CMD=3D"make check-unit"
         - CONFIG=3D"--disable-containers --disable-tcg --enable-kvm
                   --disable-tools --host-cc=3Dclang --cxx=3Dclang++"
+        - UNRELIABLE=3Dtrue
=20
     # Release builds
     # The make-release script expect a QEMU version, so our tag must start=
 with a 'v'.
@@ -556,3 +559,5 @@ jobs:
         - mkdir -p release-build && cd release-build
         - ../configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exi=
t 1; }
         - make install
+  allow_failures:
+    - env: UNRELIABLE=3Dtrue
--8<---------------cut here---------------end--------------->8---



--=20
Alex Benn=C3=A9e

