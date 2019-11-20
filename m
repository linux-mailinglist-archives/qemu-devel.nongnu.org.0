Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB71044BF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 21:05:49 +0100 (CET)
Received: from localhost ([::1]:34028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXWEV-0000Nj-T1
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 15:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iXWDF-0007eM-NZ
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:04:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iXWDC-0003WB-JF
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:04:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20673
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iXWDC-0003Vp-9E
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574280265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0iM+X1Bixvx+XZ6iLuzihZ+VIZ9uxT304NXI0NCB3s=;
 b=W0ii2y4kRiSg+H/BulPorjSqNWc16UQW8HpR+aR+YBoPV+9OPcowbkw1h6NEp549lc2Wgn
 82g2lP5r/YVUQh5H5kaM4XkdUV0MnhvoD1skbAtyHxxpOaB7MaEpY5dRK/42Ogyt6gV94b
 MNUtjbGF74yQlYKX0ESzfJz87TA87qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-q89z75k3N2eN_5WZ-B9scA-1; Wed, 20 Nov 2019 15:04:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA1741900DFB
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 20:04:22 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3769110640E0;
 Wed, 20 Nov 2019 20:04:22 +0000 (UTC)
Date: Wed, 20 Nov 2019 17:04:20 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: add support for MSR_IA32_TSX_CTRL
Message-ID: <20191120200420.GU3812@habkost.net>
References: <20191120121922.6082-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191120121922.6082-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: q89z75k3N2eN_5WZ-B9scA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On Wed, Nov 20, 2019 at 01:19:22PM +0100, Paolo Bonzini wrote:
> The MSR_IA32_TSX_CTRL MSR can be used to hide TSX (also known as the
> Trusty Side-channel Extension).  By virtualizing the MSR, KVM guests
> can disable TSX and avoid paying the price of mitigating TSX-based
> attacks on microarchitectural side channels.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Minor suggestion, though: replacing the tabs below with spaces:

[...]
> +#define ARCH_CAP_TSX_CTRL_MSR=09=09(1<<7)
[...]
> +#define MSR_IA32_TSX_CTRL=09=090x122

--=20
Eduardo


