Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0593C17AF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:02:08 +0200 (CEST)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XPb-00051X-Gw
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1Wsd-0007DB-SU
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:28:03 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1Wsc-0004bp-0N
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:28:03 -0400
Received: by mail-qv1-xf32.google.com with SMTP id g14so3086787qvo.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NiGFqLpFr8W5rzzFkFd66VOb8XhiObUUZnTa5L/Ruig=;
 b=XL/pLPuUTaMojjZtkU3VfzZXACkNCxlP5QlTjZrcC0ooZWhgtLzcqIvm2zcHJdTT6A
 PK6JLfMs9tLd54+ZZl5xihKAh1Ny6pPZHgi39GGUTXdFtHR5Unic1mUNLGVV1vbPe+yz
 j+JM5S7lgFfyh9cLR3GVeg5NiQMi5lt4VPQJBuUhhvXePqZhV5BjlazsJ+mY0PX3tEXu
 PCJNAkEjS70Kdy9/s8ScPptW704sTx2aj5ZkYu9YgMysozOgDVrFa5n6opB8Lg420zaS
 8p28QbbW5Yv3T20mIosKjql1M6eDmnZwZbPOmJtxiPmYiBeOyODg+pN2U6Dkrjjj4ajk
 IKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NiGFqLpFr8W5rzzFkFd66VOb8XhiObUUZnTa5L/Ruig=;
 b=tqqU2zLcB8FquDMxiYMrI6rcgDoeuSVHeWZiVOZxzNbMywx8m3e2u7TvsGjvjhKJfy
 ScMvH+btfiMLjZMkrqAUkKq2zrQnwBCivlBhFkmR63apT1RclPSFM9ZZrDdvdQCh/w2h
 sb3fWuBXtQGuUoBWLawHAFWizSdIinB7MeEAbEWPCSMj9ScLdmT/5C2hiB6jZPEaqvwW
 /jmgpFRkb4NgKZUWor8ouoV7PtFb/XLepvQAuknsS84kHQQ2fc7DFA3Znb8UEEaO9Lyv
 vteLviKOZBKIL3848jX1anQi6IxNStY6FnuuBv0K2xnkADSh2vLWQh+UnBzzlAwwU3jC
 g0KQ==
X-Gm-Message-State: AOAM532hmbURMqRKuiAxKc2vc2SXn7gza93Dt1Gfc9DUJbyZkHPQQ9vH
 u/S4lC9vZ0RwP1J9LycjzVo=
X-Google-Smtp-Source: ABdhPJwAz9KqCHmCocd/wOqQL5b/ZGR9ag1P0pfsXIMqUAwcPxdMrOY2/xww2F3RS9EhtRrZg5AVYg==
X-Received: by 2002:a0c:db01:: with SMTP id d1mr16007552qvk.38.1625761681023; 
 Thu, 08 Jul 2021 09:28:01 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id j20sm1114621qtq.14.2021.07.08.09.28.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:28:00 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Picture missing in About dialog on cocoa ui
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
Date: Thu, 8 Jul 2021 12:27:59 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf32.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 8, 2021, at 1:37 AM, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>=20
> Hi,
>=20
> My installation correctly shows the picture. Please make sure you
> install it and run the installed binary (not the binary located in the
> build directory). The new code should work reliably once you install
> it while the old code may or may not work depending on how you execute
> the binary.
>=20
> Regards,
> Akihiko Odaki

The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it requires =
a picture file to be found in a certain path. My original code used =
QEMU's icon to obtain a picture. The reason why the picture in the About =
dialog stopped appearing was because of the move to the meson build =
system. A new patch has just been committed that fixes the missing icon =
issue. Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes =
the missing picture issue in the About dialog.

Thank you.

>=20
> On Thu, Jul 8, 2021 at 2:00 AM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>=20
>> Hello, now that the code to add the icon to QEMU has been restored =
for Mac OS, I think it is time to revert patch =
e31746ecf8dd2f25f687c94ac14016a3ba5debfc. This patch was made to fix the =
missing icon in the About dialog but it doesn't seem to work any more. I =
do not see a picture in the About dialog on Mac OS 11.1. The easiest fix =
for this issue is to revert the mentioned patch. When I ran
>> 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' the picture in =
the About dialog appeared again.


