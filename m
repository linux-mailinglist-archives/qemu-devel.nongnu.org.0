Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC8410319
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 04:55:48 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRQW2-0006hT-PP
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 22:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mRQUc-00062T-Au
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 22:54:18 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mRQUa-0007zm-UF
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 22:54:18 -0400
Received: by mail-ua1-x936.google.com with SMTP id f24so7271092uav.8
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 19:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=iyb2i5FryVZ5a4P+EAjK7OrNw9aSI52rTSPnRnS8/xo=;
 b=XiE7nQ/y3yZrzJNtnuzOA9G3ab2eeKBy2uqafA0j5MgHtYQGtiQxtBxGQD5edImvLz
 vhvPKYOKoVivOOyj8iBYA4/fLzOkkcxRUzmo24OvC/GQ4g19FPqhc3N/42sp9LNyqJer
 4OxLvvUq6wCHr5NMbCv9LxfRuG2dpOr4AVPtWTBtv1rhqpNuF/aHvSzvooXCqBEJZ5CS
 G/UopnOpeUlryn1c36KP3+7TtWB9ColeQFf6gWHKtVgimtj0+kG3LvFTY0dOFuWPWiFW
 DIMiOKVy+l14AXm0jUZoezT37aPzcjbgp88mjGHJbjKg78FavjlzyKwlpq0Fk83pEuNL
 fX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iyb2i5FryVZ5a4P+EAjK7OrNw9aSI52rTSPnRnS8/xo=;
 b=1y2+CH9w4rpLN+RVuhb8vDI6D6yrMmfaGMZ0QN4e3/GmM24d8x+zAtkNOmt2W2g3eL
 mBXVdFbGMKuArKeIpfvtrtxicO+0IzqBgRQPPv3tf6Qw2nfxR0EBtCYI6cdqvOM6oq3k
 FDiwJYKKlKUC+uULMsMiShf+S+VykP0TIb6u28M21SZrMlKKVX4uQsxtzJp9CZZ+5wCq
 m2A1s01jHHifQgsMCl41fBLxvc5VIY68XyHURD9Usm7uZv3W5zFS012QtJj1KimrFX3y
 I+7G3IQzO3DI0wxNp31qrEm2U1cirn9zejJdOsV2JsjOjapjr49yJJfp1JdpJXMSQRM5
 QS6g==
X-Gm-Message-State: AOAM530mnfrwFSWJGNCHncVDdVhloQ5Gkcl2GnXhQsKuu9HMwBiJ0xBr
 yBNR0Lb6yWrrdqsx6QzDout+R5khxqfwMKxpht9rcD65QZWTJi8K
X-Google-Smtp-Source: ABdhPJw1z+S3y8Jl+jCyZG5PapLw6yhKwiIvENO33xWCN1PvZs3Dd9yJcww156U9St64kf+HmTCP6fcQVuM+OJf3jmg=
X-Received: by 2002:ab0:1697:: with SMTP id e23mr7724936uaf.40.1631933654632; 
 Fri, 17 Sep 2021 19:54:14 -0700 (PDT)
MIME-Version: 1.0
From: Duo jia <jiaduo19920301@gmail.com>
Date: Sat, 18 Sep 2021 10:54:04 +0800
Message-ID: <CALUzjTY_-tms4RjWXDzZJb2+fpentTO3J6TB3n4tHwTu9huNmA@mail.gmail.com>
Subject: =?UTF-8?Q?How_to_fill_a_memory_region_with_specific_bytes=EF=BC=9F?=
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c80e3105cc3c295b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c80e3105cc3c295b
Content-Type: text/plain; charset="UTF-8"

Many SOCs have unique id, which is a fixed string of bytes.
I use "memory_region_init_ram" and "memory_region_add_subregion" to
simulate this region, how can I initialize specific bytes to fill?


thks~~~

--000000000000c80e3105cc3c295b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Many SOCs have unique id, which is a fixed string of bytes=
.<br>I use &quot;memory_region_init_ram&quot; and &quot;memory_region_add_s=
ubregion&quot; to simulate this region, how can I initialize specific bytes=
 to fill?<br><div><br></div><div><br></div><div>thks~~~</div></div>

--000000000000c80e3105cc3c295b--

