Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2D485B42
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:04:53 +0100 (CET)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EOq-0002xq-Pl
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agarwal.aakarshit13@gmail.com>)
 id 1n5Dg9-0008TS-Iw
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:18:41 -0500
Received: from [2a00:1450:4864:20::22f] (port=42770
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <agarwal.aakarshit13@gmail.com>)
 id 1n5Dg7-0006x4-HW
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:18:41 -0500
Received: by mail-lj1-x22f.google.com with SMTP id q8so857324ljp.9
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 13:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=SluVmR7Fs/trTBclQLpW3E8eiIEa8he8QqbsNo8wu04=;
 b=Kj8AliP5uGab8ESAXKN/vrnn/KgSo2aGvkXj0wqVbHFZdFtaSXDkMDZOEvkDjeX95T
 4Iy7AOtS5l0Z6xNezbNPWNnn5mu7/pelNVaBa4yJIjupL70DhhY9JJE4EK7iTpQSkayn
 anypnXn5NzsctzgHZARVn55Gt+ufPwuHv59veeeJgSXlxtlsDbhgq4mtH3Vifbqrdgdw
 ULfY2AQS70Wk3/pwsVocwHFZe+sTHs0aXZ0buCJMSn1CXTYox8jFKGNJf+pawMCWxNRP
 LelWTlQyxXxOds/2P+JSm3IpJIBVqpvGxi4ziaEe1RnKkiX/ho+NXnWzVA+V5vZ82PA9
 BzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SluVmR7Fs/trTBclQLpW3E8eiIEa8he8QqbsNo8wu04=;
 b=VMV3I3IAQJSMtIsTHE1SJwWUyBmEe+ib0225IVM/aI7Mytg5AYOkZlAmp9BSGyfl7+
 dsdR/nuoHuXcCedTodgXbOoyV7Avlkv+K52Tvr3nH0Xgczid5AB6N5PPyVRxkYyeVV5i
 NADT06NT+XqgFHN5dC3uwPC6OahTicXIkviaOzZ+Ca1iYX8kLgWMk2RGqvJw3b4/xUG/
 kmz3GzXxuELMGZRoxaGGf0B2vR+4oos532ICS8vO7wNtVhd0LUwCsHayzgVdCOMxvNsF
 iwAIiUgnXw006ttw94N4Bxv6QwCN3rI7m86BnfCJPBdhz3VZq/qBXNgiffgRzLQaKYPq
 FuGw==
X-Gm-Message-State: AOAM532taIVF0wZETrOpwpOCOLyaXBrCOldKRCzZQ4tMBNTk0NWp1Hd/
 g3DZ2OxMCerm1Q1OixUYxq6p/xy9BV0PfLuNSqeFElFyI7x/fw==
X-Google-Smtp-Source: ABdhPJxv/sPH12kJ0mVx8X42t/P4Hurpss0X6nh7/+THQWkaTB52UZX5WKOYZkcAuu4IHnA9Av5FUxadezF+GQH4ffM=
X-Received: by 2002:a2e:9011:: with SMTP id h17mr42315462ljg.528.1641417516340; 
 Wed, 05 Jan 2022 13:18:36 -0800 (PST)
MIME-Version: 1.0
From: Aakarshit Agarwal <agarwal.aakarshit13@gmail.com>
Date: Thu, 6 Jan 2022 02:48:25 +0530
Message-ID: <CALiXuoZkFzY5hLJoshwH-U=mjLssgnjGsxKOY1tSJE=k-QDhqA@mail.gmail.com>
Subject: How to get started with contribution for GSOC'22
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fd659605d4dc4be9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=agarwal.aakarshit13@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: 25
X-Spam_score: 2.5
X-Spam_bar: ++
X-Spam_report: (2.5 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_IMAGE_ONLY_08=1.651,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Jan 2022 17:00:05 -0500
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

--000000000000fd659605d4dc4be9
Content-Type: text/plain; charset="UTF-8"

Hello Sir/Ma'am,

I am Aakarshit Agarwal, final year student pursuing B.Tech in computer
science with a specialization in DevOps from UPES Dehradun. I love the
topic and technologies you used for GSoC'21. I would love to contribute to
your organization for GSoC'22 and know more about it.

Can you please tell me how to get started?

Hoping to hear from you soon.

Regards,
Aakarshit Agarwal

--000000000000fd659605d4dc4be9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Sir/Ma&#39;am,<div><br></div><div>I am Aakarshit Aga=
rwal, final year student pursuing B.Tech in computer science with a special=
ization in DevOps from UPES Dehradun. I love the topic and technologies you=
 used for=C2=A0GSoC&#39;21. I would love to contribute to your organization=
 for GSoC&#39;22 and know more about it.=C2=A0</div><div><br></div><div>Can=
 you please tell me how to get started?</div><div><br></div><div>Hoping=C2=
=A0to hear from you soon.</div><div><br></div><div>Regards,</div><div>Aakar=
shit Agarwal</div><br><br><br><img width=3D"0" height=3D"0" class=3D"mailtr=
ack-img" alt=3D"" style=3D"display:flex" src=3D"https://mailtrack.io/trace/=
mail/0c38526512abf746d053fb2f251e180aa63b4b9a.png?u=3D8054074"></div>

--000000000000fd659605d4dc4be9--

