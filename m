Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA00018EF8B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 06:41:53 +0100 (CET)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGFqS-0002mW-S9
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 01:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ppandit@redhat.com>) id 1jGFpe-0002Nw-MT
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 01:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1jGFpc-0005DI-NX
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 01:41:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:56125)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1jGFpc-0005D7-H9
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 01:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584942059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PX70K/Dwj/2HJlnkHUdSrroNPkYbheNfiNoaYzwVpKU=;
 b=PtK4feNEu08cCsEfdFcWgqOCoLpVTOxsMm/1LjSbC67G5h7WmY2rzoSIykIk8kVQD1FnAF
 0DyijjIZq52Pw09A8ykzPbWF/+CFByT+r7UTWsx6y2oKQsAIdzEZBRvHzsfXW9M7HgCWr/
 xzrtCteVKwHOVJpW8AYpVWsbjFjUveU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-hkF8JOcpNX67d5IcbGdSAA-1; Mon, 23 Mar 2020 01:40:58 -0400
X-MC-Unique: hkF8JOcpNX67d5IcbGdSAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A058E107ACC4;
 Mon, 23 Mar 2020 05:40:55 +0000 (UTC)
Received: from kaapi (ovpn-112-176.phx2.redhat.com [10.3.112.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A0CD88859;
 Mon, 23 Mar 2020 05:40:51 +0000 (UTC)
Date: Mon, 23 Mar 2020 11:10:49 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 0/3] net: tulip: add checks to avoid OOB access
In-Reply-To: <nycvar.YSQ.7.76.2003231008390.5086@xnncv>
Message-ID: <nycvar.YSQ.7.76.2003231056520.5086@xnncv>
References: <20200319174050.759794-1-ppandit@redhat.com>
 <20f29d89-6d52-2edc-ef7e-13124908256a@redhat.com>
 <26c0091a-89f1-c956-efba-d1b2e4a13d76@redhat.com>
 <nycvar.YSQ.7.76.2003231008390.5086@xnncv>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-352782259-1584942055=:5086"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Sven Schnelle <svens@stackframe.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 Li Qiang <pangpei.lq@antfin.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ziming Zhang <ezrakiez@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---1463810047-352782259-1584942055=:5086
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

+-- On Mon, 23 Mar 2020, P J P wrote --+
| +-- On Mon, 23 Mar 2020, Jason Wang wrote --+
| | hw/net/tulip.c:305:20: error: initialization of =E2=80=98_Bool (*)(NetC=
lientState *)=E2=80=99
| | {aka =E2=80=98_Bool (*)(struct NetClientState *)=E2=80=99} from incompa=
tible pointer type =E2=80=98int
| | (*)(NetClientState *)=E2=80=99 {aka =E2=80=98int (*)(struct NetClientSt=
ate *)=E2=80=99}
| | [-Werror=3Dincompatible-pointer-types]
| | =C2=A0=C2=A0=C2=A0=C2=A0 .can_receive =3D tulip_can_receive,
| | =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
|=20
| Strange, I did not get it.

qemu/include/net.h:

  typedef int (NetCanReceive)(NetClientState *);

  typedef struct NetClientInfo {
    ...
    NetCanReceive *can_receive;
    ...
  }

@Jason,
  Looking at the definition above, 'NetCanReceive' is returning an 'int' ty=
pe.=20
When I change 'tulip_can_receive' to return a 'bool', I get the reverse err=
or

hw/net/tulip.c:305:20: error: initialization of =E2=80=98int (*)(NetClientS=
tate *)=E2=80=99 {aka =E2=80=98int (*)(struct NetClientState *)=E2=80=99} f=
rom incompatible pointer type =E2=80=98_Bool (*)(NetClientState *)=E2=80=99=
 {aka =E2=80=98_Bool (*)(struct NetClientState *)=E2=80=99}=20
[-Werror=3Dincompatible-pointer-types]
  305 |     .can_receive =3D tulip_can_receive,
      |                    ^~~~~~~~~~~~~~~~~

Maybe because of a stagged local change in your tree? (to confirm)

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-352782259-1584942055=:5086--


