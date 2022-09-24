Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A95E8F50
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 20:24:06 +0200 (CEST)
Received: from localhost ([::1]:33824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc9or-0005Ac-2S
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 14:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oc9nU-0003pQ-BF; Sat, 24 Sep 2022 14:22:40 -0400
Received: from mout.gmx.net ([212.227.15.19]:46391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oc9nS-00024q-4W; Sat, 24 Sep 2022 14:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664043735;
 bh=7WO7qjda96mvQIk66OB746oueGrUwsgJ5cICKrxlSJY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:References:Subject:In-Reply-To;
 b=SNXDfX13k5lPNxtWHstiOPgL/a1oMkeXlE9cBbgHfXkpeno2cJeISr7uTR2JkcWx0
 5YOsH+a/PYMWY4MQdyFfAFGjleu/jjp6hWrt5Mpky0rlHHC8BD83HbVEaqKbeA5BiE
 72gK2DQdYC2R1TwAHwSVK7o+ubDeqSmdv5RggsIs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([94.223.120.89]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsjH-1oq6o60HCX-00LBoB; Sat, 24
 Sep 2022 20:22:15 +0200
Message-ID: <20c99026-12de-e749-bee6-7072d573064c@gmx.de>
Date: Sat, 24 Sep 2022 20:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Content-Language: de-DE
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, marcandre.lureau@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 pavel.dovgaluk@ispras.ru, aurelien@aurel32.net
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
Subject: Re: [PATCH v2 0/5] Make serial msmouse work
In-Reply-To: <20220911181840.8933-1-arwed.meyer@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p76m7e1/p/v62q8H1trgaSslmTyR/ifp3ZFQnJsbR4gU3P3kSxG
 n7h9xbZt8SesZVNgZd2kPhmUdP8UHF6u4WqnvCfFpFLKxSdjyRLxSysYs45YouN4hTkYKyx
 k96e4KAaRjVCMxQS4f9xgmzkdmQ4mrVmrA2g9ogE/bxuwLSV834J6zRB9zvqVAfNPhSimld
 ANQ0wqi0JpyjRiSrRa1wQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AfqYuCm8Wac=:XQHjUXdJ4WILNW4bFhMwTd
 dbBi19nvPjPwZhE6zhbMSZI+aRjiJeBi/sGhYA8ui4ofpb+2CC+BjZpSn8TIaohE3bUGIoj2z
 YmAOYCLQd37xnQ3t9fMYah8YiteJxGO7KBzJ4tXdJndVSeCVowdHsTjb3KWdkY+4mpupoNCmj
 lbC/OdB+iy7+S8p1fTkQCZb5Pbhqt8zc3MN+SXDawnmLNiE8bhBwUSt0ezPZsOBgTeb+TOl/U
 WIk1ErpTiohxI/gjg/9E58xV1PXrve1rdZW6iYUg9gpygvU6PSWVFzZsB9WH1GGwFg3W+4UcC
 YQNEU3+fhmpog8Dz8k6K/HSfpGEj4StoxmtPTVehGLZDa+Bdkl6jG7u1dcc4TRIgli/xFFnja
 AqRLhyz+45nnAU6ojSUjHgeXX/kqltOLm0ZyTj/bIZv/wfnQeY2bIBJWxcNnznp2R+2U0lGGj
 neU4Gnnh2E6X+YLinHeojxOO6tCf778eGKwHci8DbPb/iHaPYews5ZrUj8VAlo+6i3iIXJ85u
 /dr4v4Jp4Tbq6sl9Vel0q1DOX+E7ESIAy1TAm9LVMrw+AMR7jKcS8ai8E9+O17PcfKdTSdSvs
 XWV1m9HUGaVswtEKKMeHQDfRdJ9R7+nbvEBZEuDidmyZo2fy49TIsJegoviWsFVw2teOgReb4
 +av1d2CocR2EBT1C+FVHp1PN0OYlonCWoWXlRR80YTUBGcJ//5YWNk7nteLQ66HWhUg3oXanM
 biqrCw727XXjgZO3jM+oKSqY2Jo0o32aDU5VWqshaaEShb316zjMGpXzXKS3F6mxUdT8QeTKt
 g65pl/aGhPT1EV4bUNAmYTgpr79OqPhKWBcpzoCRti2ixio0iKE6H2T4P8zZtjFSIQzcTDKnh
 FHISyQSU67FujH18OZ1/lctQ+FIP6dk0F+Kiii7uoTPjGMP2shpStda8Vt7eIvkvw9OhFGleM
 G26iBeqSNaUFfmEzd9yjx/efhdQYEQ6B0tMD+n6EcO/k0CBxHbTtUwGzEONC9yyeana46hKPD
 Ce1+wWMonga5QZ0JTzW3trZ3nLePBJS5Xsi5MboH2GoPaioi1X8TJsFyM9uFhKrNLg9dbPQO8
 3qcIqdhSJ9rLjESB7+t9Of9SeQn2SxIpcq/nx597SDTyI1OCpZD1p/Zjm5zhrKRMpVrewmxS9
 v6Kj/Zq/z8VG7ZK+lyJD62hswh
Received-SPF: pass client-ip=212.227.15.19; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

thanks for the remarks so far. Ping?

https://patchew.org/QEMU/20220911181840.8933-1-arwed.meyer@gmx.de/

Any more comments? What's next?
The v2 in the cover letter head line is a c&p error by the way. It's
really v3 and otherwise looks ok in patchew. Not sure if/how to fix this.


Regards


Am 11.09.22 um 20:18 schrieb Arwed Meyer:
> This series of patches makes `-serial msmouse` work in practice.
>
> Tested with FreeDOS/CTMouse driver `ctmouse /V` which identifies a
> Logitech compatible 3 button mouse.
> It will probably run as well with any other compatible serial mouse
> driver on Windows 9x etc.
>
> Arwed Meyer (5):
>    msmouse: Handle mouse reset
>    chardev: src buffer const for write functions
>    msmouse: Use fifo8 instead of array
>    msmouse: Add pnp data
>    serial: Allow unaligned i/o access
>
>   chardev/char.c          |   4 +-
>   chardev/msmouse.c       | 150 +++++++++++++++++++++++++++++++++-------
>   hw/char/serial.c        |   3 +
>   include/chardev/char.h  |   4 +-
>   include/sysemu/replay.h |   2 +-
>   replay/replay-char.c    |   2 +-
>   stubs/replay-tools.c    |   2 +-
>   7 files changed, 134 insertions(+), 33 deletions(-)
>
> --
> 2.34.1
>


