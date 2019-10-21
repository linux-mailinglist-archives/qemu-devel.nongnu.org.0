Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6384DF265
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 18:07:01 +0200 (CEST)
Received: from localhost ([::1]:44694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMaCx-0005JK-U9
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 12:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iMa8M-00011T-2N
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iMa8J-0002fa-R4
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:02:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39955
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iMa8J-0002ef-GM
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 12:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571673730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2O9ikDTM+eojr3daTosbTUIXWyqIj2tZgfsnLa8Onc=;
 b=a0tFnv1oEETUBG6vA44BAoUSzxApZiWSkQUDfKP/YNBFLFG/APKCJ3FlnBzf5Vtl5QkInw
 c9feFYpxGTsho6Aw3GyIVJxeOXrleAw7CsrxE15Vyp+18KwmfxYjxc87BwXjnGOLJM+ZLp
 As4134c45PyKqOztS+nAPtQLUTp8GCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-LHuaHmN1NvatrKLM8VLChQ-1; Mon, 21 Oct 2019 12:02:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAACF800D41;
 Mon, 21 Oct 2019 16:02:00 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D157196AE;
 Mon, 21 Oct 2019 16:01:54 +0000 (UTC)
Date: Mon, 21 Oct 2019 18:01:52 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] s390x/tcg: Vector instruction fixes
Message-ID: <20191021180152.78fa879d.cohuck@redhat.com>
In-Reply-To: <20191021085715.3797-1-david@redhat.com>
References: <20191021085715.3797-1-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: LHuaHmN1NvatrKLM8VLChQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Thomas Huth <thuth@redhat.com>, Ivan Warren <ivan@vmfacility.fr>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Oct 2019 10:57:09 +0200
David Hildenbrand <david@redhat.com> wrote:

> Ivan reported that a simple
>     $ go get -v -d github.com/FactomProject/factom
>=20
> Will result in errors when vector instructions are in use. Turns out
> golang makes excessive use of vector instructions, e.g., for crypto, hash=
es
> but also basic math.
>=20
> I tracked the involved vector instructions and started writing more
> tests for them (will upstream them once they are in a better shape). Turn=
s
> out there are quite some issues remaining. golang uses instructions not
> yet used by the kernel or by glibc.
>=20
> With these patches, "go get" works again. It wouldn't surprise me if ther=
e
> are more BUGs in the vector instructions. Will continue writing more test=
s.
>=20
> Cc: Ivan Warren <ivan@vmfacility.fr>
>=20
> v1 -> v2:
> - "s390x/tcg: Fix VECTOR SUBTRACT COMPUTE BORROW INDICATION"
> -- Fix by inverting the result
> - "s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW INDICATION"
> -- Reuse gen_ac2_i64()
> - "s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW COMPUTE BORROW INDICATION"
> -- Reuse gen_accc2_i64()
> - Ran against more tests
>=20
> David Hildenbrand (6):
>   s390x/tcg: Fix VECTOR MULTIPLY LOGICAL ODD
>   s390x/tcg: Fix VECTOR MULTIPLY AND ADD *
>   s390x/tcg: Fix VECTOR SHIFT RIGHT ARITHMETIC BY BYTE
>   s390x/tcg: Fix VECTOR SUBTRACT COMPUTE BORROW INDICATION
>   s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW INDICATION
>   s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW COMPUTE BORROW INDICATION
>=20
>  target/s390x/translate_vx.inc.c | 30 ++++++++++++------------------
>  target/s390x/vec_int_helper.c   | 18 ++++++++++--------
>  2 files changed, 22 insertions(+), 26 deletions(-)
>=20

Thanks, applied.


