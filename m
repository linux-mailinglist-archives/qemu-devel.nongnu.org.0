Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFFC1091EF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 17:35:29 +0100 (CET)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZHKh-0000fC-Si
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 11:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iZHFz-0005XB-Mv
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:30:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iZHFy-0007sv-LP
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:30:35 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:36425)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iZHFy-0007s3-C2
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 11:30:34 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M2OEq-1iWXh23nDy-003qt9; Mon, 25 Nov 2019 17:30:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Linux user for 4.2 patches
Date: Mon, 25 Nov 2019 17:30:13 +0100
Message-Id: <20191125163014.16789-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CWUkKztl0BU7kGxpDCLYzYtH/iUxT1DZfr5XwpiHo4Kz6wYsxVR
 A6rQbz2jt3BGm7Ic38OxM9LGklSrHQ1Lc7w9Q1zMm179ljpUk1fPazIaZbW7GrYyXGt5bPC
 ol+tbX0/MBfQdwKkrQcBWYCUvve1F3SaK89FLCTpCf+phXHZgiOTU/n1XZPlYDc94YtXuTh
 piGIHmj9SpyBTNrApuupQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:38NOmragl60=:uVxAtwElNXnsnSP65gvkqJ
 PCQCQMvDw1c9FfpktugGnbEHpbPARjMX/b+qtphX4M3VtLmnG2yvbhJKnHvDPJUP8/6VLjrTU
 Csg+jpJiFaFTckN8rGpCXIxo3OlkuaPtPODOkmDbsLJ2FreZqlAdamJc4gjQZDOocOnCKVw11
 CDixcKxhMZweTff9XV+ylsfY9pVOh60hzh6StsRRU0BeEBuCdk1or5BIc+gn07i3BxRnnvi/Y
 yG+dlhHmteZZHcCTnjJ18zFBZkjffXOmDlTVD5+V2MsVD1SATVOL7/PvKTdst1yd6MASREIU0
 dbCNCeD3C/oZcciZ7E93hgDUneExZ+0jhODAPEQ5pZqAAzp8mXnRtNnukshRsz/eLQOdnTOkG
 xMnkHbnXSrCoszYz6m8jMmNRKiZUpRczg770rZycsvloPf4mram79mKkWdsxRsKAgoTaD9win
 jobxfRUT09/e0up1yya5unCZM6R2cU9LXthbUD7SCpDkFLWJ0or9hWA9QiFkOPta+oFaMAajC
 lLnmJfZyb7bCmlT5hBAmg9iTl4jC17snKtFHaNPsJqmIigprD5fP11bOhXgkwjqG9UOG0zYeL
 3Bpq9ef2pOURcuyzvWX9Vgl3hB0vzLfsr1RdkXYjw0d8g/rgs92CUhJHG+a7FI6pNNdLhdkgh
 hvuseD3W+C5MxwhrD0fuWuoHogE9NRVrrKm+fJr7KMx1zmbXJY7XyhgtPvYvPUbh5DllJiHON
 NqeaEdCDA0DjDVP8WQkLwr9EndQ54AgxiYm1s85uBF6Yx7KdUq0EtT0mjXEUMnEpMgXzlFUGU
 N2htaGmYF3zRsdtXf4AZ+mnM3bba3mDHJ1k62kIsp0WVw8G9ngUQA6qhDsevb1JjJscxdGdPr
 ix7uK53J16YZVRJNBx+tBvZbLk54EyNWSTqXHUgts=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.74
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2061735ff09f9d5e67c501a96227b470e7de69b1:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2019-11-21 17:18:40 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/linux-user-for-4.2-pull-request

for you to fetch changes up to d1e26707410067891ab5199f7e9d09afa2fbc0f6:

  linux-user: fix translation of statx structures (2019-11-25 12:57:58 +0100)

----------------------------------------------------------------
fix translation of statx structures

----------------------------------------------------------------

Ariadne Conill (1):
  linux-user: fix translation of statx structures

 linux-user/syscall.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.21.0


