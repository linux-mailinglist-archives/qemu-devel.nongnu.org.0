Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E63EBCE1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 05:44:38 +0100 (CET)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQOnd-0004QV-08
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 00:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zar1969@gmail.com>) id 1iQNwa-0002sc-FX
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 23:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zar1969@gmail.com>) id 1iQNwY-0003FO-85
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 23:49:47 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35540)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zar1969@gmail.com>) id 1iQNwY-00034w-0a
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 23:49:46 -0400
Received: by mail-ot1-x32e.google.com with SMTP id z6so7352796otb.2
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 20:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BR6RjgWpanteidCvVykeoO64mYbiSr+rPrQxoxnMDBo=;
 b=dqcJCMQJpXt6uYgUbMBTPgcw1WNIy4xK+CtKWQAzGOxAhPEVP+7n4M3c7Bgq6CtMjB
 OdpDdIX6BoUu4SDHWAZxp9jsuuHF9rua+HCYjxi82jnYUM8hONlvNoYxEy/MYROje5F/
 is747L4NNTUXG+4l2zv2xstu6qcakBFi8/UYJPcZ+RYrgG9hmbI7YKaRjymL5knQgbpK
 NOy7IvI1JH+k++zjIuFhtlub0umlm8XVp5RZVid45/8O2VhLk451TanJAkrSrJEc/vH9
 EianlKMCMdMXPYGe5UgcRnGYWHRqjXfH3KmCvaLXvI1fTct0y2wT3JDVk/AlR+laVYnI
 cunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BR6RjgWpanteidCvVykeoO64mYbiSr+rPrQxoxnMDBo=;
 b=nZcpUz5E/K4vsEvhK9L+ommxpbL7ga0GVLUIpTeD+Cq3u6W+8Hj8aU22wPwwhoH0IY
 bb5QglL2smOXWnrD7tkzcUhO+uXgjKKULQQtqsbmfdAuwhTUEk0uRN6awK1pUDfTDtl2
 TPYtpTTef4rW2lQ65GACrO24WMzbYbDQCPswzOuLoQH+sRfskq75NfbmkvSSUnoaw1sY
 qgIJRwr4ejGA2SPm83xlrv9mADv5ZC/Cq9h0j+J4jMB+XvhzvwSDnC9tEwteYGw793ak
 4Qf0hLta5oGdcSki0fe9m79O9t5nDbNzC81y3RRZGe7/Jn0E5sbVB2izQXeZuTDQ3QJI
 i3YA==
X-Gm-Message-State: APjAAAWGy/B+j/wOXXqjH2EK0B8l9OtjgFl2K63N4KdOZJmtUW0o33in
 s+ScSdYxwM1HHe8Pu8GwyocOaFjD3Qt3kF07xbdgM0ub
X-Google-Smtp-Source: APXvYqwGA3XsPhGtgDFIZaxdLfp1A46pojlTl81BBY18hB+JXkoXCoGPYH/mijKxkkbUU0L2SQUAZxEjtMFrdKJH7gg=
X-Received: by 2002:a9d:77d8:: with SMTP id w24mr113844otl.156.1572580183760; 
 Thu, 31 Oct 2019 20:49:43 -0700 (PDT)
MIME-Version: 1.0
From: Zainuddin AR <zar1969@gmail.com>
Date: Fri, 1 Nov 2019 11:49:33 +0800
Message-ID: <CA+gXNfhCRT1kPq4KVumXwRiJvVaXYZZBRhs-QsVNKv+WzeMM+A@mail.gmail.com>
Subject: Sparc Solaris 10
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003be4fb059640db47"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
X-Mailman-Approved-At: Fri, 01 Nov 2019 00:43:03 -0400
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

--0000000000003be4fb059640db47
Content-Type: text/plain; charset="UTF-8"

Hi,

I like to find to find out if you have a working qemu on solaris 10 or 11.
I have tried the qemu-sun4vniagara but without networking. Is the
networking support for niagara version available?

Regards

Zai

--0000000000003be4fb059640db47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I like to find to find out if you h=
ave a working qemu on solaris 10 or 11. I have tried the=C2=A0qemu-sun4vnia=
gara but without networking. Is the networking support for niagara version =
available?</div><div><br></div><div>Regards</div><div><br></div><div>Zai</d=
iv></div>

--0000000000003be4fb059640db47--

