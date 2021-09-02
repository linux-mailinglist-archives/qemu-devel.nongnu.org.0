Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CA3FE961
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:42:11 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgQL-000572-VM
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mLgOV-0002xB-9f
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:40:15 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:42605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mLgOT-0007Ax-UF
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:40:15 -0400
Received: by mail-io1-xd2b.google.com with SMTP id b10so1126590ioq.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 23:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=TeUfFeZt/NITkPUHzW5bdaNPqCJ32GLfCYTxaA29YAM=;
 b=VTn4GwXyQJXAWatvhqy6hJyL2JWEd9OBsViDTHj3Z0XEV2864kOSuPROkPyIOYvPQF
 T6eyPGXY59x8OoeGIjigNaDfheMkSeMakA3LBR/TCvnf04/3c4GpkiYSnnTENWtPwGPI
 jTFu3yxygajpiPwAluo52H65/O2csqEThG/EEimv5dGjnvaaNOAgVGtmEGsRzBnO5N0o
 zmdJYoFHZ1BSwzseFXibc2g6+4iiJVysAMO3xww3UWUY022fz1NibTyzMj0UMtxCgXwL
 J1LBjZxDgSjyKp+zXNEFRcVVStQKt3XEehIzNIKGbec4kPamJp5A3/+Fiig5xG/NoG6w
 7UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TeUfFeZt/NITkPUHzW5bdaNPqCJ32GLfCYTxaA29YAM=;
 b=hlJ8VQCv7nYT9iCksCrQFPeXXhCVkQb98u8/MqbuO+N23kE/2UEmQ7YpOPAeA1u+z/
 Vcr/GsZkOFd0K+E3osaBhvvhhyMr9sO+3qEDUVsI1Kncm2910F+PgpnYgIwLUfmckO5E
 e8KbhshHLlp0u4pNd1LsNPIzbd93BKgFrKWHQ82n7guSR6aOCbe4LHOXLrSxc7QlM7yR
 ME4PrrClJ5sfTSCzPwttYRYc+RcyjjNW81R9NcuRO3XdrVMFUGCISK/cwn5DWYXsQvpA
 SvmqyAC3UW+dZQ+9v3P0xYKlErWFhpPK5edi6Bx4o+lMXMdFAFaa2KXXxhuOG513uNgy
 IQ8g==
X-Gm-Message-State: AOAM533lFxaP6cEdtacku/8uDjdYCZJA8tnJtvsn6CSZsZcZyFCLKBud
 lU2ZFvtg3PLt8UGxBvXM7XMfkj9HyDi2FdDKU+N7x1PS
X-Google-Smtp-Source: ABdhPJxoAfYBBZOblMNWA6UaV+rWZv68wUFUiLN00oXKvI1o9Gp2/nA6Cxx6w5+RVhbPeF+4AWpw0h0XwZaJVo2zBFE=
X-Received: by 2002:a5d:9653:: with SMTP id d19mr1519080ios.74.1630564812308; 
 Wed, 01 Sep 2021 23:40:12 -0700 (PDT)
MIME-Version: 1.0
From: Duo jia <jiaduo19920301@gmail.com>
Date: Thu, 2 Sep 2021 14:40:00 +0800
Message-ID: <CALUzjTaGXLk2SMCAm=yyWKHT4DtkwXih_jct7cx5qU-8E3iDrw@mail.gmail.com>
Subject: How to comminicate between two QOM model?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006bc2a705cafd7461"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000006bc2a705cafd7461
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI,
I has two QOM model=EF=BC=8CA and B=EF=BC=8C When A=E2=80=98s register chan=
ged=EF=BC=8CB=E2=80=99s register will
should also be change .

I dont konw  how to change B's reg in A device .

--0000000000006bc2a705cafd7461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI,</div>I has two QOM model=EF=BC=8CA and B=EF=BC=8C=
 When A=E2=80=98s register changed=EF=BC=8CB=E2=80=99s register will should=
 also be change .<div><br></div><div>I dont konw=C2=A0 how to change B&#39;=
s reg in A device .</div><div><br></div><div><br></div></div>

--0000000000006bc2a705cafd7461--

