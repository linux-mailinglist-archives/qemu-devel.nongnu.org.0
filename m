Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191082EF7A0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:46:47 +0100 (CET)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwmb-0005eq-Lf
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzugnoni@ine.com>) id 1kxw4k-0007gf-S5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:01:26 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mzugnoni@ine.com>) id 1kxw4i-0008SU-Ky
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:01:26 -0500
Received: by mail-qt1-x82d.google.com with SMTP id b9so7141269qtr.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ine.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=ulZRNaqDu3rFjFVMoqQlwvfMfEwnXqxZheHQSlDKoTE=;
 b=VfezGvcIhqmj5WzNblIYmyXV3mlBwLquyzU+ShiYsmxd/JaHOId9ZAgDA4cUCT2dBU
 whjCrgjxjqCxot6e7/3gU7kEMNJnXlx2qUCpqhAgMxgFLUKxKogYMTSBEpL0cZk78Jse
 YgOAj8SGLmB0ItXpem8/3seIh4jKSAT2Q38l8ijFilmHbGRHm2ZMGXSzUUfFh7M3k7BY
 qEBuq+OGfGi+3F7n5/FbxuMSWjU0rBGa4ozOGOPFP6myGo71H8ex18TY6i/YbhWcLFOH
 m/FaQ7qTRS8ISgtkcmfLZjvKdZ0tjBaj9ptOPowN4ZS+Qz4nCnKhG/OdddqkXvcUov2u
 nfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ulZRNaqDu3rFjFVMoqQlwvfMfEwnXqxZheHQSlDKoTE=;
 b=TlJjwqzDUYiv65SeNGBrY6FfvsiIo3Kpfle2Z5sYJt5TZegFO39RTidfygJOOu/TJQ
 QSIfGG08MRVpUzOfYlEJ2kqxtTFqX2HMRZC48NfYhlJcUZyNm7iLfZKp28iK9VSJMrXU
 UrHsMO8xBxqhIBlnG+wxRSZywfOBVJDEKN/Hrn1W/HyhTpmUmToVUOV61x423c0H0LJC
 8hrNs+aQfvLH0pf684cyMdJBo2fBdDQo6lX4RWN1ttBuYaT0fTE1dNfGIIhooDpt8Jh6
 ZlD3vU3JjGKiCQlzEBZAFPLy//G17bRMp7k1YBFMGHAnHmXvRGnOvRrnCAlYNsiW9Hh4
 nG2A==
X-Gm-Message-State: AOAM532cAvRoT26gkZ1mxgFeKbpulVNGGNSziHI4YOnUD3mQywXx1Y/Y
 HhmwLfm+Xj2XykEEPE1f2oOQSSbEUtJa8WBrz03u7UtL+R3U9Cio6A4=
X-Google-Smtp-Source: ABdhPJzkmpPyJiORa7/0x345dtlzSbCnerjDossEeZ/++xAbyq/4j/05vB/fexKTOQ4sfPgfXaAw+/yQKvgIr2dhyhU=
X-Received: by 2002:ac8:4445:: with SMTP id m5mr4611376qtn.179.1610128882822; 
 Fri, 08 Jan 2021 10:01:22 -0800 (PST)
MIME-Version: 1.0
From: Martin Zugnoni <mzugnoni@ine.com>
Date: Fri, 8 Jan 2021 15:01:11 -0300
Message-ID: <CAHgqfKZxUBTpShaMEZX9VgDzvNGXoSURF142Yng899jLWV1M+Q@mail.gmail.com>
Subject: =?UTF-8?Q?Large_QEMU_implementation_at_INE_=E2=80=93_Searching_for_c?=
 =?UTF-8?Q?onsultants?=
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001aa4f305b8675825"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=mzugnoni@ine.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Jan 2021 13:44:47 -0500
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

--0000000000001aa4f305b8675825
Content-Type: text/plain; charset="UTF-8"

Dear QEMU devs,

I'm Martin, Director of Software at https://ine.com/. At INE we are
developing a very ambisius online platform for Networking and Cyber
Security interactive labs. We will be heavily using QEMU and KVM.

I hate spamming this mailing list with this kind of information, but truly
believe it will be interesting for the community to see an implementation
of QEMU/KVM at the scale we are targeting.

We are looking for experienced QEMU/KVM developers. If you are interested
to join us, as an employee or consultant, please feel free to reach me out
by answering this email.

Thank you all in advance.

--0000000000001aa4f305b8675825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear QEMU devs,<br></div><div><br></div><div>I&#39;m =
Martin, Director of Software at=C2=A0<a href=3D"https://ine.com/">https://i=
ne.com/</a>. At INE we are developing a very ambisius online platform for N=
etworking and Cyber Security interactive labs. We will be heavily using QEM=
U and KVM.</div><div><br></div><div>I hate spamming this mailing list with =
this kind of information, but truly believe it will be interesting for the =
community to see an implementation of QEMU/KVM at the scale we are targetin=
g.</div><div><br></div><div>We are looking for experienced QEMU/KVM develop=
ers. If you are interested to join us, as an employee or consultant, please=
 feel free to reach me out by answering this email.</div><div><br></div><di=
v>Thank you all in advance.</div></div>

--0000000000001aa4f305b8675825--

