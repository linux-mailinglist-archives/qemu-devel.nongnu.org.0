Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD5C33D9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 14:09:15 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFGxu-0002Da-4t
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 08:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <devtoe82@gmail.com>) id 1iFGvw-0001FE-88
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <devtoe82@gmail.com>) id 1iFGvv-0004JG-59
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:07:12 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:43538)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <devtoe82@gmail.com>) id 1iFGvv-0004HN-08
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 08:07:11 -0400
Received: by mail-ot1-x32a.google.com with SMTP id o44so11278028ota.10
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 05:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=F4WslLhxM/Imny2bD+SFiVOISR6oQYtNnk2QrgPfVTg=;
 b=vhnUyemtCpmrJpdEL6LXzqvm2JRE+a4plenb9jDzC2kCxo0E0wKzp9A8yTWjvL/LvB
 3XMEtt0a9CAVHP1fApIVTVeuq/UeoD2HR9KvdRyR5mBmK4SLG0MxQCWfVc7znFhSwmRS
 03XW9B6VsnXKk23gk2awI3zDvcaXsNwp3McjkPVjqK/4swTQdl6EFm1OtRXHlTdkotJp
 140lMTWyZZzCi1DGEaWVkFJtA8OENSnWfplGbDQcynJTrWHMVideQ7fpqlCKKm8FF8tH
 0hFjPHUuk/r3AVgbtXhVOttbIHBHNrwFl3jbsV8Gl0e54zU44GWqcPPN0uVSdgCPgXac
 RkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=F4WslLhxM/Imny2bD+SFiVOISR6oQYtNnk2QrgPfVTg=;
 b=ckt9ScJ3cPfb8kb9KMM7qCqxkyiB7oRmMcK0NIlWoAG4+W1knhED1wgbgT5sSJdt4i
 RAjjXRFsk3JKL4KL6dl/Wun6IPV9fpjfkHgdu8kY9Q4Yk3Opu4eaZeQI2OdlG/gQP4e4
 Ms6cct5+6Cd24W51skUWlNk0th5sQj7dErrmmulnRJH1Wsq1dLQZ9hSpFcRynvOmqcOy
 Ha+W7MlL9D3TBmoEr0dg4cL2SFFRlzBFzxfsi9qScGkix299O+JqGFd9Hq+5ZoZDJx12
 h2X80FDQSjgehxMUCi6YeL5FoHXy7cXiLZDFMNYSqMH+phyOJWpweYL+uWK8blXIX7xX
 e9yQ==
X-Gm-Message-State: APjAAAUO79PxaNonVvJNq2P/Vzl4opdWVP+pSn6hQCQ8+XCcOUfdvRNX
 5IhFlgDkA8IxMNqbF9NMDAuw9KBsSqsq3k6qNhHNcgbz
X-Google-Smtp-Source: APXvYqwCcLxEZdP7QVanDvCp5/u8Y1GqduGUBg0LWTXkSKcGKwKRSmE+nDC+LGBDMjGkBWUb/tYZsZvGaW2ZdJEE+bo=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr4450512otj.272.1569931629298; 
 Tue, 01 Oct 2019 05:07:09 -0700 (PDT)
MIME-Version: 1.0
From: Toe Dev <devtoe82@gmail.com>
Date: Tue, 1 Oct 2019 15:06:56 +0300
Message-ID: <CAN+O=TKeG=K3AdiSEKhzySNKeSWzCwtz7UKq6=re2YYEm5rwAg@mail.gmail.com>
Subject: header not included but used in vl.c
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000160a5f0593d8314f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32a
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

--000000000000160a5f0593d8314f
Content-Type: text/plain; charset="UTF-8"

Hello,
 does it have a reason why the file vl.c lacks reference
 #include "qemu/module.h" ?
 but still uses the defines include their(for example the enum value:
MODULE_INIT_OPTS)?
I'm using eclipse so I was notified by the IDE immediately.

Thanks for yours help :)

--000000000000160a5f0593d8314f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div dir=3D"ltr">Hello,</div><div dir=3D"ltr">=C2=A0does i=
t have a reason why the file vl.c lacks reference</div><div dir=3D"ltr">=C2=
=A0#include &quot;qemu/module.h&quot; ?</div><div dir=3D"ltr">=C2=A0but sti=
ll uses the defines include their(for example the enum value: MODULE_INIT_O=
PTS)?</div><div dir=3D"ltr">I&#39;m using eclipse so I was notified by the =
IDE immediately.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks fo=
r yours help :)</div></div>

--000000000000160a5f0593d8314f--

