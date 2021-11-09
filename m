Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47D44AC5F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 12:16:54 +0100 (CET)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkP7U-0003rH-OB
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 06:16:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkP63-0002Nb-84
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:15:23 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkP61-0003jT-Dq
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:15:22 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N4Q4m-1mcGRc3VhO-011TZK; Tue, 09
 Nov 2021 12:15:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] M68k for 6.2 patches
Date: Tue,  9 Nov 2021 12:15:15 +0100
Message-Id: <20211109111517.996104-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oW7xTM2SZGX5Oayr+4G0y7RSc3PNXn9RacNEgwX8k7YmzgxLtkk
 mtsrz0qdLNRWIrJKi1MQdBZrlexv3VLpy7GrUhEqaVPURlww5X11RkOW4+KR+9OiE2JbMzN
 pdZe+51d7h7J4Qw5utot5k+OpaT36fzLPY8GntSOzyhHVOkHhrpOFOpDhcLzt4CWMY2Aouo
 9p5TXqpNU9LD08CfL9fyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NKv+4OBshKw=:xn6Z0MhqHiQSHUXhycf2MF
 k6TyjI3JdnWmwdLjuRDLlmYmB8PUJOvFrGWnxyvkvmuaGnuj+KwGy9hSLDItPgFhfOdv64ghP
 vKU3kuwpKaOhzXApouKQ9ZwZhAt/8zhWSBF2ELFZAaxJqBoY/NwATXFxQb3gRUvd+y0jSdgEg
 f8aO2a+hjCAm1pvHpu3Oa/Ib4SyzD9asBNMLy5WpPXsGnlkw8a0W4nfI3DJsbl+WWKYMZZV1a
 Y6niLh9MXZ54AASOuGJz7bQVsjze/SaGrvzwGL127RC6ubToGEdqXkv13GnP3FvLFOnWpTabc
 FuEHi2PwzRVVxCmpE25Nuytv2xKDOVUMiFItPFrvT6NLpdc6JfuPBaMNV4fSFLFsRQ4wzYZ98
 rWHoNThPl8HqPI/GcZNd9cD+xYp4ORpkPEsXirrbPHE1sN3Mh+KctplWUhWRlOYWSmJeEF1xw
 m4Xri623yhoilLjo1qmo9J1B4tVrcB79aozoDD4gSEwpcErYImgWHSIVOYaow36IgyllIeF/J
 Cy6BbqJP0krAW8WrzzgjXHENKzV4K9stBD6HLgc4c5tuSh2vTJ0paVeZqL0iWid8c4wLpbpq8
 60cr2cpv/nyY6P3B3Ye7kb1+kyZbf4oXSC8QtQqveRXnVINcYdiJ6R8fmMCatjn/8VKwVQnSO
 5kzp3ggpoMW42JCrWNNTxa5gUWQxdS9vIABFycAPNwjK2V5vJLE0AAYAzbPqpmP8WCjw=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 85549204552b624fe254831537e7a0f6450228b8=
:=0D
=0D
  Merge remote-tracking branch 'remotes/juanquintela/tags/migration-2021110=
9-pull-request' into staging (2021-11-09 09:41:31 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.2-pull-request=0D
=0D
for you to fetch changes up to 6ed25621f2890d8f1c3b9e6f7a0e91c841aea1f8:=0D
=0D
  hw: m68k: virt: Add compat machine for 6.2 (2021-11-09 12:14:18 +0100)=0D
=0D
----------------------------------------------------------------=0D
m68k pull request 20211109=0D
=0D
Add virt machine types for 6.1 and 6.2=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (2):=0D
  hw: m68k: virt: Add compat machine for 6.1=0D
  hw: m68k: virt: Add compat machine for 6.2=0D
=0D
 hw/m68k/virt.c | 16 +++++++++++++++-=0D
 1 file changed, 15 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

