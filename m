Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CBC32D62C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:13:34 +0100 (CET)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpfR-0004eH-NY
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lHpZV-0003zo-6W
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:07:25 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lHpZP-0007Oi-RE
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:07:24 -0500
Received: by mail-qk1-x730.google.com with SMTP id g185so8755117qkf.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=F5mL/bMVnqHkq35/yZ5PDdRu+1C3xIkRbx8KUyvtpVQ=;
 b=tMXUiziehoc2TMcrCaSnpGOVKKCJWDlkV7h7oI+0ZgbTqd0P8HN3M9v86iNBaoFWaN
 1BFIfdBBG5k+rfHssyBOmGTTBTCbFQZ0TgolKQyUgFXr4XCyQehYTybzhyqHD1qRTKWQ
 zQum55RbvIZR02oZUkjkL7GAdZZujoyANl40s+5YOGOIggGJDh/yD82+xGRalWLFHckn
 wpCaaZlFxzbrdW3pLuoOGi0KpmOFNi3Mp48a4FB6bzLf5uGl5Ssv8xSVRrJ1XOWJBgUk
 QhVQlCx1C5akITluMJB7eabVHB66+Ay0CvNXwYk3mFxYUi4EvddN5CZYXzsxCphGCiPk
 tBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=F5mL/bMVnqHkq35/yZ5PDdRu+1C3xIkRbx8KUyvtpVQ=;
 b=WaovONTZbfDGD2i7Tg3Z0HAPjloJRBqFs/38xlYmWybu8ZYw8Bc3zZY/aS+1ucXgxS
 rqhpd7aOD75usUfrGiZ/+DMaHOwIZ0nRE/c+M8KcZyAVA7aRqrnZNP/3kqGxDhXcM/85
 PYoCN7ozJeexxLmflzQgdBDIaacYxWMI88DKcbV1Qon/UQtxjYsmzPHKa1gyjpEWv2E/
 V5G/wslqGOFBITT2RRjl/wA/O3ADFjYknQx6Wlo13jPHirX47G7V2qbKuiLEfsx9WdQ9
 xhfLy5qcv/cEtIWGZlLNOsKzhDPpRDy3BTzNIBXdBL8jaorSxoo2FK1gzTZwJ9GBF6kA
 Dt4Q==
X-Gm-Message-State: AOAM532/ztS7pPbBFRqTNMQm4TZ+/XV46/1Kn003AM6TvJ3e0AVGHivP
 yIXxuLOK80xz4W97IMskXtibbJ4h8Lk=
X-Google-Smtp-Source: ABdhPJzaASgolWGCAwkyWkUedMWKQgSxkUnh/8QG0U2z4fITF5p5cGBIEgiHx6+uEV0JRx2vJhpD2w==
X-Received: by 2002:a05:620a:854:: with SMTP id
 u20mr4415779qku.106.1614870437718; 
 Thu, 04 Mar 2021 07:07:17 -0800 (PST)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id r125sm5486833qkf.132.2021.03.04.07.07.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Mar 2021 07:07:17 -0800 (PST)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Qemu-devel Digest, Vol 216, Issue 57
Date: Thu, 4 Mar 2021 10:07:16 -0500
References: <mailman.5018.1614765575.30242.qemu-devel@nongnu.org>
To: QEMU devel list <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <mailman.5018.1614765575.30242.qemu-devel@nongnu.org>
Message-Id: <BE1A7AC3-5C89-4D23-A83A-1FA8ABED1562@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



> On Mar 3, 2021, at 4:59 AM, qemu-devel-request@nongnu.org wrote:
>=20
> Message: 1
> Date: Wed, 3 Mar 2021 10:22:50 +0100
> From: Gerd Hoffmann <kraxel@redhat.com>
> To: Akihiko Odaki <akihiko.odaki@gmail.com>
> Cc: qemu-devel@nongnu.org
> Subject: Re: [PATCH 1/2] coreaudio: Drop support for macOS older than
> 	10.6
> Message-ID: <20210303092250.x7j6kcyrv3qjghrl@sirius.home.kraxel.org>
> Content-Type: text/plain; charset=3Dus-ascii
>=20
> On Mon, Mar 01, 2021 at 08:45:53PM +0900, Akihiko Odaki wrote:
>> Mac OS X 10.6 was released in 2009.
>=20
> Also minimum version required my qemu is 10.13 (I think),
> so any code for older macos versions is dead anyway.
>=20
> take care,
>  Gerd

This stinks. Older versions of Mac OS X were perfectly fine for running =
QEMU on. All my intel Macs run  Mac OS X versions before 10.13. I'm =
thinking we should at least support Mac OS 10.10 and higher.=

