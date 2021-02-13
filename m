Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293531AB02
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 12:28:21 +0100 (CET)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAt63-0005AU-Nh
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 06:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kdsanskar07@gmail.com>)
 id 1lAt52-0004gA-H3
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 06:27:16 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kdsanskar07@gmail.com>)
 id 1lAt51-0006EG-7W
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 06:27:16 -0500
Received: by mail-io1-xd31.google.com with SMTP id z21so1921820iob.7
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 03:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Xw9qozeZYlzuGBM/LLd21l8y4Is/KFRv7QdKSGw2VfY=;
 b=LJ0VtfZgg1etsyt/GDumR1SQLOXbUJBgba+nbiTrD26Of3i76HQTNHZ3vlYk73GM6f
 CSOfSN4S+7Fd2/xvKqnvrWZS6IWjF0aCWIHFupcN2jclW6K8WXphdaaTFaf/tq8Nep2u
 8N1jeMNp8RSOtUTy91M34MtUKds81onI+GvUQKo9j+qZcS2kuvnJBOKAhWEGDuTg7SGq
 arjy4OfGjOuMhcfsTyn7QTSlOL2b0yYWUhPoVxVcz056rgRCQEukWZKEdp8cSjYzeMyB
 eB+daTJ+HHbQqICXm2PShyDaib1l1dWu6FOw9WZqYAaZNMZ83919ybOnflqrm5KnZjRP
 LpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Xw9qozeZYlzuGBM/LLd21l8y4Is/KFRv7QdKSGw2VfY=;
 b=K82wfdVNJe5FTW5ohgfflYs3h9M4CtS1tQAMxgb5985hACWbwcw9uh+K3URfqcQ0tw
 osmXq1LwlbOzKgmHFQnGdfHxCLaUiAWjXc9c18vBL9IZM/dv6u2Z09pQqnpDJ41cJdDS
 +b8hCrVRAPPyHEURqB3u2wh1z6RxYuYW3/h1I4HgXv9DdIr3T36GOmeQnacsDrC4NSIZ
 KdoILvobZXacAFOBN52FDMqnYIcqvUgpI8WVabn3II8OBe5boIsm7JvrMsYfRA6VlZmy
 fHnpcXAtuZyNZM6HfgJrWQviNynAf59IcbwqSBJIhb2Guk96pTwUZU9JpUFlWAey7e9q
 Ankg==
X-Gm-Message-State: AOAM530Cqk2OHMEU6T8AlhOMA0f5PQrR1ga46XE3T0AAzcujNI7dTuBR
 mUzhsgyB5b5YVrklz5xYySPObcKH2p9j/1JzPvU=
X-Google-Smtp-Source: ABdhPJziTNVaQb9GKCkwwEMfQFyrcf9nhhoEQLjo/BmmBy078AOIQxgcdL+2G0YOYnaPGaGpJP3TN+C9bgttMYEJG6s=
X-Received: by 2002:a02:62c6:: with SMTP id d189mr6667872jac.144.1613215633793; 
 Sat, 13 Feb 2021 03:27:13 -0800 (PST)
MIME-Version: 1.0
From: Sanskar Khandelwal <kdsanskar07@gmail.com>
Date: Sat, 13 Feb 2021 16:57:02 +0530
Message-ID: <CACAZ_0-0Ei17mzWhQJmjiqmcGY7s7uNvX=VYh1zezoyYTreHHQ@mail.gmail.com>
Subject: hifive-unleashed board
To: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, 
 richard.henderson@linaro.org
Content-Type: multipart/alternative; boundary="000000000000cc68c805bb3608a0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=kdsanskar07@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cc68c805bb3608a0
Content-Type: text/plain; charset="UTF-8"

Hii there,

I want to know, what are the devices(e.g., networking, UART, flash, etc?)
qemu support for the platform sifive risc-v hifive unleashed board .Also if
you can share any document related to this will be a big help.

Actually I am new to embedded systems and this is for my project where I
have to add support for a few of these devices in the bsp.

Thanks in advance
--sanskar

--000000000000cc68c805bb3608a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hii there,<div><br></div><div>I want to know, what are the=
 devices(e.g., networking, UART, flash, etc?) qemu support for the platform=
 sifive risc-v hifive unleashed board .Also if you can share any document r=
elated to this will be a big help.</div><div><br></div><div>Actually=C2=A0I=
 am new to embedded systems and this is for my project=C2=A0where=C2=A0I ha=
ve to=C2=A0add support for a few of these devices in the bsp.</div><div><br=
></div><div>Thanks in advance=C2=A0</div><font color=3D"#888888"><div>--san=
skar</div></font></div>

--000000000000cc68c805bb3608a0--

