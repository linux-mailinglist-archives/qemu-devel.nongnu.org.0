Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C143317010
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 20:25:01 +0100 (CET)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9v6i-0001HI-1c
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 14:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l9v3b-00077I-UT
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:21:47 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l9v3Z-0002Zu-Dy
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 14:21:47 -0500
Received: by mail-qk1-x72b.google.com with SMTP id m144so2794743qke.10
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 11:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kmDAf5tpUerLBcPZg3Q9W0sdW7v3InSb+YIjDQiQtNk=;
 b=j1+eVnKojPFAxYnVnsOLZJIIJ/hg1s8WHVFBvrxFwjNZlZkjWKm1yvCSMzXtSCs8mt
 kP8Ex2qgXz206h420saU+qVXQ2h+RB12tyb45AllMEc6TKmBITxTuwMhi4F4EiWplM6+
 QHqtWi47yWamCwQGB644WaH86yEWLNSn2+6IcLhr/WZfqz3HgYslxfutfjjJ/fqvNB/v
 I9oxJpZP9A9xop0Z/9x7L0YJkzt32r2ydXbxQXC3+quaI2LR+mnmHzpY1Am1y/l14who
 /YyuUvFj7OIah74lUcC5ilqrbVr1goQvMpSJsURBVI9NvKu4LFjYjF8KIvWqm4je0kmg
 BzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kmDAf5tpUerLBcPZg3Q9W0sdW7v3InSb+YIjDQiQtNk=;
 b=P3LloXgnibpQIT1zAMsuP/8RN0nnICOHUOooTgOQ5e00txEsE2D+LcTzkoHyfyVLlQ
 QgSHgx1rNusmg8IKkzGaitUycc6ek5Kc8fOxj48Corg+HOatqCEoUT5On+lQXqD8IhRd
 Mwf5UY5sx/jKhIJCMrly4/piAq1VSeWlZeud7Sf6XboUxz1b71S0GWvUEpEOl1X5k7Ti
 Eo3ORX5VeTPoecU82lvJrvcdpvgaWfikOFckov1YyDTo//xKBQ2JZgsVqJjae0SO4D/0
 ZKpIbjd5Mh8/AftpIFPplu9wYOOL7Ih5wY5uCbWpCw6ok2GADdcXHTbO4nLMieG+lzMa
 Omxg==
X-Gm-Message-State: AOAM5327KsugEntvHdV3VIXRT+xmX1n7pB+VeblByzttF+/GCWWjgke0
 u/MTEivKdvnN2hD/QxCpUSs=
X-Google-Smtp-Source: ABdhPJw0WeD+jE5+I2pSmCS7X3TwjLfQOR66kCkLHn5LbEBNw0+EVk1j3zss/kPPUlhHM7uWgJRUoQ==
X-Received: by 2002:a05:620a:959:: with SMTP id
 w25mr3877062qkw.345.1612984903979; 
 Wed, 10 Feb 2021 11:21:43 -0800 (PST)
Received: from [192.168.0.4] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id o12sm2206623qko.117.2021.02.10.11.21.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 11:21:43 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Help with Windows XP in qemu-system-i386
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <80B1ABAB-B593-4B79-8DA4-03F64371A84E@gmail.com>
Date: Wed, 10 Feb 2021 14:21:42 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C6A0B39-770E-4018-956A-72CAD37FED07@gmail.com>
References: <BD39B53C-E0C0-4D80-B80C-08E0F2CA6500@gmail.com>
 <20210205154819-mutt-send-email-mst@kernel.org>
 <80B1ABAB-B593-4B79-8DA4-03F64371A84E@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 5, 2021, at 4:08 PM, Programmingkid <programmingkidx@gmail.com> =
wrote:
>=20
>=20
>=20
>> On Feb 5, 2021, at 3:49 PM, Michael S. Tsirkin <mst@redhat.com> =
wrote:
>>=20
>> On Fri, Feb 05, 2021 at 03:25:00PM -0500, Programmingkid wrote:
>>> Hi, I'm noticing that my Windows XP Service Pack 3 VM is causing =
qemu-system-i386 to experience 100% host cpu usage even when the guest =
is at idle. I was wondering if you are seeing this issue as well on any =
version of Windows guest? Windows 2000 doesn't seem to have this problem =
so I'm wondering if this is a bug with QEMU or a problem with my VM. Any =
help would be appreciated.
>>>=20
>>> Thank you.
>>=20
>> Just tried an xp guest, stays below 10% for me. Suggest discussing =
this
>> on the mailing list.
>=20
> Thank you for the reply. Which service pack is your Windows XP VM =
using?
>=20

Hi Michael. I noticed what was the cause of Windows XP using so much CPU =
time when idle. When I used the '-smp 4' option Windows made a change =
then restarted. After restarting the screen was black. Does this happen =
to you? Please make a backup of any image file you have before =
experimenting. Windows 7 doesn't have this problem. I am =
qemu-system-i386 at commit 1214d55d1c41fbab3a9973a05085b8760647e411.

Removing the '-smp 2' option does make Windows XP start up again, but =
the high host CPU usage at idle remains...

I reported this bug here:
https://bugs.launchpad.net/qemu/+bug/1914294=

