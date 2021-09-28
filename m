Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D271641AAE3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 10:45:28 +0200 (CEST)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV8ju-0004qf-OE
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 04:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirajsorathiya101@gmail.com>)
 id 1mV8ig-00044S-56
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 04:44:10 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:43530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirajsorathiya101@gmail.com>)
 id 1mV8ie-0005BD-2z
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 04:44:09 -0400
Received: by mail-vs1-xe31.google.com with SMTP id n17so21170925vsr.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=bnREi4OURo9hXJBNfY8Q5TYG70v3M6GwAxKGm2oDHKg=;
 b=aMaWWokueAr4DGhWmIxIgilUzNA0T8/AKmUNKT4zeBv3buV1dI/E5cW3sPR6jxIy3p
 IICJIsqfwwJa6DRWSf7x+Dy6+IBwI7kJ1UE/NNzBva4kx5RqalOCKM5/keofsg1tpcwr
 4+GbU4pcptaqhWpKpYA7lAP3N0OuIoRL+KMNHz1/KHKPVJHtqBusoJqCwkn7NuqNQD5t
 cjm/ucf6BlgqmqlAIOiZQRxfhCg4zNpkG4XphWyvmwnxa5bDn2qUBTDZov9Rbbrqje+v
 UFqjoCpo47tR1H1eJ6qQydTFiqafz4ifEMqklpQNSUa5SopQp+1zueZWJcZ3bcEmMwZn
 Ix6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bnREi4OURo9hXJBNfY8Q5TYG70v3M6GwAxKGm2oDHKg=;
 b=1uo3dIXwgbCaik0Xj/Scw55Xq07bVp6FssGSpui2U7mj+2kwzqdvVoGgVn/USHIrD+
 UfpUsPycfO4KQHR12qi2sXHQuu0IQQkDP1my4STo11j8K6HpkB/ka4EW2W93qPASp51L
 +adOlZBwa2S1aEWtahB36KerzuV1WocLVTfBR6P3Dt8X0USn5fBqQwbnn26LLw/qUQYG
 BFS18VfplG4ni9Tlh8IBL3obUhXGqGY1eZ8utXPa6K79f218srYpMOHFd9+Xi97Hbqry
 IF1IwpHfXzWEKzr0JC1dEPV6xHb+OMtMG47P+Nts3WKWRQPLekDiKT5jpQoFlr/C6w2p
 fwRA==
X-Gm-Message-State: AOAM53215Lj6Wed+1ulSttPTvNe+mPEAVRIiRnAV3eDJKmdK+kyXuVbg
 dtCzJdXm5JvuJkxB77iQycBrEmvKkH4uuMrQnpazu2LP
X-Google-Smtp-Source: ABdhPJyMYjFpdhWx8D6/eeLQ3IkDJulI5az1+eutXeN19QtPRxQcL3i42RjZlPLnMetbl9KYVSeUmcy66I+xKv4Qeo4=
X-Received: by 2002:a67:c81c:: with SMTP id u28mr3826794vsk.36.1632818646501; 
 Tue, 28 Sep 2021 01:44:06 -0700 (PDT)
MIME-Version: 1.0
From: Niraj Sorathiya <nirajsorathiya101@gmail.com>
Date: Tue, 28 Sep 2021 10:43:34 +0200
Message-ID: <CAFT0Dp1CmK9zKcKrpRO=pQKZTUD-ax1zVg-uEofjnior8Fi_YQ@mail.gmail.com>
Subject: Emulation of IOT hardware
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000684d8d05cd0a37fb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=nirajsorathiya101@gmail.com; helo=mail-vs1-xe31.google.com
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

--000000000000684d8d05cd0a37fb
Content-Type: text/plain; charset="UTF-8"

Hello Team,

Would you please give me some suggestions on how I should proceed to build
an IOT (Internet of Things) emulator ? What aspects do I need to consider
?  IOT can be anything like a smart light ,smart bulb ,smart lock ,etc.
Here smart means that the device can be controlled via the internet.


-- 


Best Regards,
Niraj

--000000000000684d8d05cd0a37fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Team,<div><br></div><div>Would you please give me so=
me suggestions on how I should proceed to build an IOT (Internet of Things)=
 emulator ? What aspects do I need to consider ?=C2=A0 IOT can be anything =
like a smart light ,smart bulb ,smart lock ,etc. Here smart means that the =
device can be controlled via the internet.<br clear=3D"all"><div><br></div>=
<div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><br><div><br></div><div>Best Rega=
rds,</div><div>Niraj=C2=A0<br></div><div><br></div></div></div></div></div>

--000000000000684d8d05cd0a37fb--

