Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB93BBB7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 20:18:37 +0200 (CEST)
Received: from localhost ([::1]:48828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haOsO-0000nX-A6
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 14:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1haOpc-0000Ii-Li
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 14:15:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1haOpa-00081G-M5
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 14:15:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:37340)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1haOpa-0007ye-GN
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 14:15:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1haOpU-0001xP-D1
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 18:15:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5D47A2E802E
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 18:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Jun 2019 18:03:53 -0000
From: Troy Fine <1832250@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: tfine
X-Launchpad-Bug-Reporter: Troy Fine (tfine)
X-Launchpad-Bug-Modifier: Troy Fine (tfine)
Message-Id: <156018983401.31409.602642212914113436.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18978";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 1b2949edd124c35b7564a2eedce555a9dd54e8fd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1832250] [NEW] arm32v6/golang:1.10-alpine is
 broken for qemu 2.8 on MacOS cross-compilation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1832250 <1832250@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

FROM arm32v6/golang:1.10-alpine

docker build -t openhorizon/ibm.gps_arm:2.0.7 -f ./Dockerfile.arm .
Sending build context to Docker daemon  110.6kB
Step 1/12 : FROM arm32v6/golang:1.10-alpine
1.10-alpine: Pulling from arm32v6/golang
05276f4299f2: Pull complete =

5657e63df536: Pull complete =

febca98d0249: Pull complete =

5053a7aa5dea: Pull complete =

d048463a3701: Pull complete =

b628c679d668: Pull complete =

Digest: sha256:94c5fd97b17d0e9fe89e011446bedda4784cb0af7a60494989e2a21c0dcb=
a92f
Status: Downloaded newer image for arm32v6/golang:1.10-alpine
 ---> 3110964e8c9a
Step 2/12 : RUN apk --no-cache update && apk add git
 ---> Running in 14ffb11506bb
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/armhf/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/armhf/APKINDEX.ta=
r.gz
v3.9.4-24-g4e2ff29bbe [http://dl-cdn.alpinelinux.org/alpine/v3.9/main]
v3.9.4-25-g65097c9cdc [http://dl-cdn.alpinelinux.org/alpine/v3.9/community]
OK: 9547 distinct packages available
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/armhf/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/armhf/APKINDEX.ta=
r.gz
(1/7) Installing nghttp2-libs (1.35.1-r0)
(2/7) Installing libssh2 (1.8.2-r0)
(3/7) Installing libcurl (7.64.0-r2)
(4/7) Installing libgcc (8.3.0-r0)
(5/7) Installing expat (2.2.6-r0)
(6/7) Installing pcre2 (10.32-r1)
(7/7) Installing git (2.20.1-r0)
Executing busybox-1.29.3-r10.trigger
OK: 18 MiB in 22 packages
Removing intermediate container 14ffb11506bb
 ---> 6890ea7ed09b
Step 3/12 : RUN mkdir -p /build/bin
 ---> Running in 44e52d78d7b4
Removing intermediate container 44e52d78d7b4
 ---> 0763afda41d1
Step 4/12 : COPY src /build/src
 ---> 05bab9a72a34
Step 5/12 : WORKDIR /build
 ---> Running in 5a663caff249
Removing intermediate container 5a663caff249
 ---> 5a6ca53c00de
Step 6/12 : RUN env GOPATH=3D/build GOOPTIONS_ARM=3D'CGO_ENABLED=3D0 GOOS=
=3Dlinux GOARCH=3Darm GOARM=3D6' go get github.com/kellydunn/golang-geo
 ---> Running in 05b09ee0c206
Removing intermediate container 05b09ee0c206
 ---> e68c6e222e51
Step 7/12 : RUN env GOPATH=3D/build GOOPTIONS_ARM=3D'CGO_ENABLED=3D0 GOOS=
=3Dlinux GOARCH=3Darm GOARM=3D6' go build -o /build/bin/armv6_gps /build/sr=
c/main.go
 ---> Running in ea6d2707e35f
qemu-arm: /build/qemu-rwi8RH/qemu-2.8+dfsg/translate-all.c:175: tb_lock: As=
sertion `!have_tb_lock' failed.
qemu-arm: /build/qemu-rwi8RH/qemu-2.8+dfsg/translate-all.c:175: tb_lock: As=
sertion `!have_tb_lock' failed.
The command '/bin/sh -c env GOPATH=3D/build GOOPTIONS_ARM=3D'CGO_ENABLED=3D=
0 GOOS=3Dlinux GOARCH=3Darm GOARM=3D6' go build -o /build/bin/armv6_gps /bu=
ild/src/main.go' returned a non-zero code: 139
make: *** [build] Error 139

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832250

Title:
  arm32v6/golang:1.10-alpine is broken for qemu 2.8 on MacOS cross-
  compilation

Status in QEMU:
  New

Bug description:
  FROM arm32v6/golang:1.10-alpine

  docker build -t openhorizon/ibm.gps_arm:2.0.7 -f ./Dockerfile.arm .
  Sending build context to Docker daemon  110.6kB
  Step 1/12 : FROM arm32v6/golang:1.10-alpine
  1.10-alpine: Pulling from arm32v6/golang
  05276f4299f2: Pull complete =

  5657e63df536: Pull complete =

  febca98d0249: Pull complete =

  5053a7aa5dea: Pull complete =

  d048463a3701: Pull complete =

  b628c679d668: Pull complete =

  Digest: sha256:94c5fd97b17d0e9fe89e011446bedda4784cb0af7a60494989e2a21c0d=
cba92f
  Status: Downloaded newer image for arm32v6/golang:1.10-alpine
   ---> 3110964e8c9a
  Step 2/12 : RUN apk --no-cache update && apk add git
   ---> Running in 14ffb11506bb
  fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/armhf/APKINDEX.tar.gz
  fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/armhf/APKINDEX.=
tar.gz
  v3.9.4-24-g4e2ff29bbe [http://dl-cdn.alpinelinux.org/alpine/v3.9/main]
  v3.9.4-25-g65097c9cdc [http://dl-cdn.alpinelinux.org/alpine/v3.9/communit=
y]
  OK: 9547 distinct packages available
  fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/armhf/APKINDEX.tar.gz
  fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/armhf/APKINDEX.=
tar.gz
  (1/7) Installing nghttp2-libs (1.35.1-r0)
  (2/7) Installing libssh2 (1.8.2-r0)
  (3/7) Installing libcurl (7.64.0-r2)
  (4/7) Installing libgcc (8.3.0-r0)
  (5/7) Installing expat (2.2.6-r0)
  (6/7) Installing pcre2 (10.32-r1)
  (7/7) Installing git (2.20.1-r0)
  Executing busybox-1.29.3-r10.trigger
  OK: 18 MiB in 22 packages
  Removing intermediate container 14ffb11506bb
   ---> 6890ea7ed09b
  Step 3/12 : RUN mkdir -p /build/bin
   ---> Running in 44e52d78d7b4
  Removing intermediate container 44e52d78d7b4
   ---> 0763afda41d1
  Step 4/12 : COPY src /build/src
   ---> 05bab9a72a34
  Step 5/12 : WORKDIR /build
   ---> Running in 5a663caff249
  Removing intermediate container 5a663caff249
   ---> 5a6ca53c00de
  Step 6/12 : RUN env GOPATH=3D/build GOOPTIONS_ARM=3D'CGO_ENABLED=3D0 GOOS=
=3Dlinux GOARCH=3Darm GOARM=3D6' go get github.com/kellydunn/golang-geo
   ---> Running in 05b09ee0c206
  Removing intermediate container 05b09ee0c206
   ---> e68c6e222e51
  Step 7/12 : RUN env GOPATH=3D/build GOOPTIONS_ARM=3D'CGO_ENABLED=3D0 GOOS=
=3Dlinux GOARCH=3Darm GOARM=3D6' go build -o /build/bin/armv6_gps /build/sr=
c/main.go
   ---> Running in ea6d2707e35f
  qemu-arm: /build/qemu-rwi8RH/qemu-2.8+dfsg/translate-all.c:175: tb_lock: =
Assertion `!have_tb_lock' failed.
  qemu-arm: /build/qemu-rwi8RH/qemu-2.8+dfsg/translate-all.c:175: tb_lock: =
Assertion `!have_tb_lock' failed.
  The command '/bin/sh -c env GOPATH=3D/build GOOPTIONS_ARM=3D'CGO_ENABLED=
=3D0 GOOS=3Dlinux GOARCH=3Darm GOARM=3D6' go build -o /build/bin/armv6_gps =
/build/src/main.go' returned a non-zero code: 139
  make: *** [build] Error 139

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832250/+subscriptions

