Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97F17E5B2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 18:29:54 +0100 (CET)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBMDx-0000xc-TH
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 13:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <adema.yergara@nu.edu.kz>) id 1jBMCz-0000HU-6k
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 13:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <adema.yergara@nu.edu.kz>) id 1jBMCx-0003CA-VB
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 13:28:52 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:38361)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <adema.yergara@nu.edu.kz>)
 id 1jBMCx-0003Ac-6s
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 13:28:51 -0400
Received: by mail-ot1-x336.google.com with SMTP id i14so10388326otp.5
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 10:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nu.edu.kz; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=boJva+31ApixO4UD+3LP1R9Jz3A1nPdZfXgebCQsAUg=;
 b=aRZC9AmLlv1qDajlxyTlVXQ2/5gGDiTmV0bAkq9qqvANYWjm7NAkOm2sv/Z7WMYBBW
 SWyLbJhESsHrDLZHz3OWfUBqe6nVzRO4t+QHbU+GrCkTKpG79bUvJ081G5/0N0m7nZOG
 9aIjyvEqmUU9fV83PukqScOHX3WE069OoHC8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=boJva+31ApixO4UD+3LP1R9Jz3A1nPdZfXgebCQsAUg=;
 b=pmYSuWlFHLvRWEVP9qb5HFw1QFUqO5RjSiUq+O5Qek20CKkdOCpecvgxECe9LHyj/Z
 GGC2uwIYZMaCd4KJAkXxPaEnnifBLctw+Wkw6wIxIIDGV0a811bkP4bLGGLZB/TGKtSN
 eTC1aUalvS2HFAh1i1PG5oZJeMwU+wFw0cVlsGRPennPWBQmeCsLs2ijlekrRc8bfIUS
 wbepEz0+8ysJ9j33Qrnvm/OeNEGRlvFTCsl/jPIBg/rBnCChBfbNf1AbQ2QNhqobisMh
 oAe0Of2rfNvIiPjfoFDaI5jMQz44hbHMp/vQzI+W81Sn29Xtn1uGdoXP09ihzFe3UwI2
 ydaQ==
X-Gm-Message-State: ANhLgQ0/jkrAN+Fx5n12BRfwLemacrQRy8xN1uu4J9CGf6JijpnKoeKK
 wA5U0h2Qs57gr8qxXlxbeZ7Zm46RqDNEzqgmjEugAb37FFA=
X-Google-Smtp-Source: ADFU+vsWlct83aAjuXqP4B0fMmEp7hwrzXbY2EJROfK7dyr1VprMxvXts2BFC4KCoZctW6mV5oK7cukPBjQJ4uNwLdM=
X-Received: by 2002:a05:6830:15d3:: with SMTP id
 j19mr13669997otr.51.1583774927137; 
 Mon, 09 Mar 2020 10:28:47 -0700 (PDT)
MIME-Version: 1.0
From: Adema Yergara <adema.yergara@nu.edu.kz>
Date: Mon, 9 Mar 2020 23:29:34 +0600
Message-ID: <CAFTFcbCVQxiH-acfX4rPmnNp6M4cREExaj0FEnB3KgqaBjdq0A@mail.gmail.com>
Subject: 
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000efc47105a06f5591"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::336
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

--000000000000efc47105a06f5591
Content-Type: text/plain; charset="UTF-8"

I understand that I subscribed to your mailing lit now but what about the
point
- To create an account in the QEMU wiki, you must ask on the mailing list
for someone else to do it on your behalf (self-creation is prohibited to
cut down on spam accounts)
Who can create this for me?

--000000000000efc47105a06f5591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I understand=C2=A0that I subscribed to your mailing lit no=
w but what about the point=C2=A0<div><span style=3D"font-family:sans-serif;=
font-size:14px">- To create an account in the QEMU wiki, you must ask on th=
e mailing list for someone else to do it on your behalf (self-creation is p=
rohibited to cut down on spam accounts)</span></div><div><span style=3D"fon=
t-family:sans-serif;font-size:14px">Who can create this for me?</span></div=
></div>

--000000000000efc47105a06f5591--

