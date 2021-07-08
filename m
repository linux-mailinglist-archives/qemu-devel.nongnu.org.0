Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777213C195B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:45:29 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Z1c-0002vc-HS
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1YuW-0006cN-Ml
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:10 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:42640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m1YuU-0003WM-LO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:08 -0400
Received: by mail-qv1-xf31.google.com with SMTP id ck17so2804336qvb.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bfbVKVLTeRpb40toZKiphgRMI/rqLJ0eB62wXvmY7IU=;
 b=t6M8Zg4rd7F/Vo73qcl5jRatpIw7mua6M3Mrn8w3eAXR2zGPvEqGM/JO1ph6wHi7zy
 HvpQ2Qbuh8S1xr1r2fYY9bZYpbKyqa+E8nZzKnLfmM4ugAWb8IF+0BYQYDTCt8oYMkOb
 3uBPgpG2+DCYYfTvuwvVLBqcSZzL0Ylfeh7bTdUj4nP2DHsdztwFfJe0dOLjMjaf5I5m
 93gRQqs/C3r7xOCAQOpSq77d6pdeyNC+8VCOkMn/caYNEHriAAyTamYJwloCShiWSvs4
 A2wxnoH+Pi9rXpqnZg/eu+gHIWdy5PNKJqxIklLhBS+kiMOD3do+qNFVp726RmKNEzHP
 Q5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bfbVKVLTeRpb40toZKiphgRMI/rqLJ0eB62wXvmY7IU=;
 b=Bxy4nCl9cSPIv4IVKH3FYxb5yIgpy3wJBIxh8VBrqPpCbhwtrEVsUlP+wmtJYB9tv0
 zHo5/mHI3VNF6bGJCw+T5L9lcOMIYjyb5pvv/0XDytvp6F49036lPRVG61VjdPxS92dK
 YejPJEqMncQENd8ZFc7GG6U/+oMnMJfIJJb8DIYuNU08aFrmaupnN17t+ZsGwVpEpxqL
 QCXA0hwpW0HWVYSnLSO1+sXZuIObiPhwxoc/sZz8wBjiD9IfoNvrn4nU5z+h/v+K5PTa
 5P9UwoYHaR8+m4DmfXSv4XmvpbUpc2dtItu01WJe4WNefHBAYR4IyyPHhFLF7xl3NOSd
 6/YA==
X-Gm-Message-State: AOAM533sEVSPXSeFGElKthRPX/K4AHGuwt4G0Si1bEa/bDbHShqa5Bsn
 pzfuQO9odKc8M2dapKHQk0c=
X-Google-Smtp-Source: ABdhPJyeKXgYsZi/CoEzfgjzmgZFy0gWl7canioTDOavwxMep1JTcD0lq0zgywV2paxQaaozhcPzvQ==
X-Received: by 2002:a0c:a1e2:: with SMTP id e89mr18827812qva.16.1625769485188; 
 Thu, 08 Jul 2021 11:38:05 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id q27sm2179qkn.118.2021.07.08.11.38.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 11:38:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Picture missing in About dialog on cocoa ui
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
Date: Thu, 8 Jul 2021 14:38:03 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <247B2DB8-1076-4617-AE63-8791571A12D4@gmail.com>
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
 <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf31.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 8, 2021, at 1:50 PM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Thu, 8 Jul 2021 at 17:28, Programmingkid =
<programmingkidx@gmail.com> wrote:
>> The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it =
requires a
>> picture file to be found in a certain path. My original code used =
QEMU's
>> icon to obtain a picture. The reason why the picture in the About =
dialog
>> stopped appearing was because of the move to the meson build system.
>> A new patch has just been committed that fixes the missing icon =
issue.
>> Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes the
>> missing picture issue in the About dialog.
>=20
> If the icon is the same (same resolution, etc) then just using it
> does seem better than loading it off the filesystem.

The picture did look nice in the About dialog.=

