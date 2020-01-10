Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D239F1367B6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 07:55:15 +0100 (CET)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipoCQ-0001rs-Ev
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 01:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1ipoBd-0001Qt-H4
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 01:54:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1ipoBa-0003VB-GE
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 01:54:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33282
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1ipoBZ-0003Mn-TD
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 01:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578639260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R38BXOVaAEhOgu+o4PqIc1O4CDfT01MGqjdZ1FUaPi8=;
 b=UJX5vQeoeERzrrE7DRZkLe1yP0yN1vb/p/BPSJvoPscRku2zfsDkBP7OxxjM+25UGTyUrO
 qZPCyjei8bxmFhlzCBZeqpor9QYaoC8JYhMNpFu+uqkzX0VZXkgz3/nlWxxzSWRqMDAORc
 LvIF092s1WManu1EdXMZI+w8sEPSemA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-3D6qQULoOFuUGXAg2Xe_-w-1; Fri, 10 Jan 2020 01:54:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E65210054E3;
 Fri, 10 Jan 2020 06:54:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 301125C1D4;
 Fri, 10 Jan 2020 06:54:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6397D31F62; Fri, 10 Jan 2020 07:54:15 +0100 (CET)
Date: Fri, 10 Jan 2020 07:54:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: padmashree mandri <padmashree9107@gmail.com>
Subject: Re: Audio pace issue with qemu4.2
Message-ID: <20200110065415.xpdxjzhsgorsastq@sirius.home.kraxel.org>
References: <CANT-jrJ=oiO23sB9fL86Kowt0rBWijvGBars1euVJQRqJ+72iA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANT-jrJ=oiO23sB9fL86Kowt0rBWijvGBars1euVJQRqJ+72iA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3D6qQULoOFuUGXAg2Xe_-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

On Fri, Jan 10, 2020 at 11:30:24AM +0530, padmashree mandri wrote:
> Hi all,
>=20
>     I am trying to run qemu4.2 with ALSA. Playback pace is fast. Where ca=
n
> i set sampling rate and all parameters related to audio in qemu?

https://www.kraxel.org/blog/2020/01/qemu-sound-audiodev/

HTH,
  Gerd


