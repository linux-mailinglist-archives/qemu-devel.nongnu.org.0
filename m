Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4F221F766
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 18:35:14 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvNth-0005Ic-0x
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 12:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1jvNUZ-0001GA-Sm
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:09:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1jvNUY-0000go-AN
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:09:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id j4so22790073wrp.10
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vayavyalabs.com; s=vayavyalabs;
 h=mime-version:from:date:message-id:subject:to;
 bh=mcO1S7w/FCmFH8do+7KTBT1q0YR2g10b+3ffL2m8G3s=;
 b=REYNLuEaisldZqVg5tDV/4/CUWuO5DRaKarkqTTfmkRXUkHD4D+le2VaUOsqV72KTT
 sf/engmmMo6zaRy5/8KSxGWoZXfQUu2Ru41ontwCO3c0Hq5yhs246H2KlgiPyL848Tp8
 6v1xc47fkBiebLTinyXtm6POY0WbUAyNsoS80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mcO1S7w/FCmFH8do+7KTBT1q0YR2g10b+3ffL2m8G3s=;
 b=IeY0juw+YkrEJZwy5fExT7Vb0ygnW+M3R8qReDYvJxMhgP/CKmfKs61Nj7hjQSgK9A
 nyd3oNkkZbEgZQJloEVkhsTv4vLvlP3FirryKOuNdZY2+iDHyQ0TqMXoAMqU/2WCaRbV
 HhZ2+3i13PQ9a69YluJnQtFHyhJyP4yf3cvZyM0i/PrduF9WDMIo7TxUzRFPZ8wJnmiC
 1qj52IjiyTnyzk925qSOuMIEPyM66r0LXCAEn7mv+MPy6bVvydWRra6Ex1riCtOYv4gA
 IS9TmG3Aa0rZDmlN9lS9bVDMc8bQLc8vGaKwBpwXGuDHXz0GSMlNbq70Nx9bYVMTleW8
 4czQ==
X-Gm-Message-State: AOAM532/KpoUmO92tJG12NwCRFEKvoG4gpClubuY2Hlm6Ar5QpTR47wj
 noGALTeVkn82xHJAaPA3kgV0+l/xTsrtjNj8o5fiGIYD6f8=
X-Google-Smtp-Source: ABdhPJwFODYDjGseStALAn8xSglRbIiwjnoiEY0JJGwLAjMf+F6IFtqNA6gCrw8z1TpCE9DdRTiNmnDBLm5+GHVH09o=
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr6730528wrv.155.1594742951118; 
 Tue, 14 Jul 2020 09:09:11 -0700 (PDT)
MIME-Version: 1.0
From: Pratik Parvati <pratikp@vayavyalabs.com>
Date: Tue, 14 Jul 2020 21:39:00 +0530
Message-ID: <CA+aXn+EkkyiXmKpNhbggy0pjKVpiHxa+TUqEnZLB4v_D=T+7tA@mail.gmail.com>
Subject: sysbus_create_simple Vs qdev_create
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001c235105aa69074d"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=pratikp@vayavyalabs.com; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Jul 2020 12:34:12 -0400
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

--0000000000001c235105aa69074d
Content-Type: text/plain; charset="UTF-8"

Hi Support team,

Can someone please guide me to understand the difference between
*sysbus_create_simple
*and *qdev_create*?.

I understand that these two methods are used to create a new device. But,
when to use these functions is not clear to me.

Regards,
Pratik

--0000000000001c235105aa69074d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Support team,<div><br></div><div>Can someone please gui=
de me to understand the difference between <b>sysbus_create_simple </b>and =
<b>qdev_create</b>?.</div><div><br></div><div>I understand that these two m=
ethods are used to create=C2=A0a new device. But, when to use these functio=
ns is not clear to me.</div><div><br></div><div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Re=
gards,<div>Pratik</div></div></div></div></div></div>

--0000000000001c235105aa69074d--

