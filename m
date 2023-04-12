Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E8A6DF0AE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 11:42:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmWzF-0004Tt-1a; Wed, 12 Apr 2023 05:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <waleedjghandour@gmail.com>)
 id 1pmWzD-0004RR-OV
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:41:55 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <waleedjghandour@gmail.com>)
 id 1pmWzB-0000V1-Ul
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:41:55 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e10so1998092ybp.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681292512; x=1683884512;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TSNjKkZ1fptYMvI5F83NU2w+7pe+kQkIYcEFoOheEyM=;
 b=H/nZ6w8I9zbu4vU+xQ3OQcrqKJLvZA9M1HlixUp9DeO6bk8HGJLukU19GBH1sZCbfs
 MrsKIucuppnBcmPBM4ks/cRZi3eMXMeucLimTWuK6Nvn5pM5yjq/mr3+Ma97DdTChZ+i
 luFcE9TDgf/pDZE/d+oregIwwTsRUZTTE6jprKZuJQHc3nKHYo50NLuUV2k1ZMTkZ2w6
 y8p2zEihQeBMYDFkLXU4V0e11Z6nx29913L0F3a4ZT3l/ZMj/oYUW6NbBcBP+xbhdJIN
 KDw7YyBtXHUJPE31TO56ozWYnqsVVUiuQIzh8v6Balc+3nMUj8SzOGdymowE7Jtf3e9m
 6PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681292512; x=1683884512;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TSNjKkZ1fptYMvI5F83NU2w+7pe+kQkIYcEFoOheEyM=;
 b=XtwBK0ZiMhv/4Ksgs4+o2P7I6BXjWADQzLBDhrNXaxSA6Fk+OQ4x7OiVvMdShtDli0
 fin7tSuqYX3m5d9Ynd5/sINAyNN6g7fdkhwiLbqEx7hr0nGc3Uu0+sTLF3oVAdyuwzaV
 9jd1vymLBA8ZVZ06ddyPvSQcN1vY/NONXhKoQd2Gbj3Vs+ifx6DH22lW14Ike9xxNTAq
 gdl3Wah6v7CNxAPiizAVRxh4q6Iw46n3k63etlKxga6e7mgot5OmXu0HGDWD2PVMy0VN
 /UpqLAS0GDfHsyi2Uh4vIO+eX6Zmyr5NKFoNYWHUim3AFyNrW6mvjQDi/eagwbRMyxq9
 +xMA==
X-Gm-Message-State: AAQBX9fbmT68/W7eNl5F5AAxAVCTv85bmFiIydWKak2hybFqT80vyzeg
 KBsGCg7OrBwh3jbWyj9bt1uyqN7t9op0qgHxvuzFKwU851U=
X-Google-Smtp-Source: AKy350aV8JqN2XMLbAgFf1lMFQnx4e0Ri8l/7/cYIClF07JJ/Kiw8B2D/pEh6n+hbczz1UyvCCNAwVGc+GtEL6xTpwA=
X-Received: by 2002:a25:76c6:0:b0:b8b:ee74:c9d4 with SMTP id
 r189-20020a2576c6000000b00b8bee74c9d4mr11715674ybc.12.1681292511829; Wed, 12
 Apr 2023 02:41:51 -0700 (PDT)
MIME-Version: 1.0
From: Walid Ghandour <waleedjghandour@gmail.com>
Date: Wed, 12 Apr 2023 11:41:41 +0200
Message-ID: <CAEQMSUtx73GosLwzMLERTMkJ=eLiU5NbwZY1K0eOmFbJ-M=4Kw@mail.gmail.com>
Subject: AVX-512 instruction set
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ee628f05f9206a98"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=waleedjghandour@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000ee628f05f9206a98
Content-Type: text/plain; charset="UTF-8"

Hello,

I am interested in adding AVX512 to qemu.

Is anyone currently working on this ?

If yes, when is it expected to be done ?

I was trying to run a C program and failed with the following error at this
instruction:




*62 f2 7d 48 18 0d fa 0c 00 00 vbroadcastss 0xcfa(%rip),%zmm1qemu: uncaught
target signal 4 (Illegal instruction) - core dumped*
I like to add support for broadcast and fmadd avx 512 instructions such as
the following one:


*62 e2 7d 48 b8 c9     vfmadd231ps %zmm1,%zmm0,%zmm17*
Thanks,
Walid

--000000000000ee628f05f9206a98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am interested in adding AVX512 to qemu.<br=
><br>Is anyone currently working on this ?<br><br>If yes, when is it expect=
ed to be done ?<br><br>I was trying to run a C program and failed with the =
following error at this instruction:<br><br><b>62 f2 7d 48 18 0d fa 0c 00 0=
0 	vbroadcastss 0xcfa(%rip),%zmm1<br><br>qemu: uncaught target signal 4 (Il=
legal instruction) - core dumped<br></b><br>I like to add support for broad=
cast and fmadd avx 512 instructions such as the following one: <br><br><b>6=
2 e2 7d 48 b8 c9 =C2=A0 =C2=A0	vfmadd231ps %zmm1,%zmm0,%zmm17<br></b><br>Th=
anks,<br>Walid<br></div>

--000000000000ee628f05f9206a98--

