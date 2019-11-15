Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE97FDC59
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 12:37:00 +0100 (CET)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVZuN-0005To-89
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 06:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iVZtO-00051v-CK
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:35:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iVZtL-00018y-HY
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:35:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36140
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iVZtL-00018m-6s
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 06:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573817753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnjgpFLVjvD8aF4T6f7OR0rEIi7bA9L6GsFYu2DdfVY=;
 b=d1WrAuyhx2Mj7G4g3QJHBdzWyY3gl1w+ueXk0wLG8rfLTDkmFgXDZXxRbpDfkE26NNQRlo
 /bAJtbFRzOP1TjuGdEAN+szaKwYAaBHPjqqwThX+2lWUPE+me9omxiXtOxNUVMYhjN7isl
 eSS1GZP/045XAzMgOHC7IgBGrnW23Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-AaEJ9rkePyq5DdZSgPnyJQ-1; Fri, 15 Nov 2019 06:35:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D60FE800686;
 Fri, 15 Nov 2019 11:35:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75F0B60C18;
 Fri, 15 Nov 2019 11:35:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C37EC17536; Fri, 15 Nov 2019 12:35:46 +0100 (CET)
Date: Fri, 15 Nov 2019 12:35:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Eiderman <sameid@google.com>
Subject: Re: [SeaBIOS] Re: [PATCH] ahci: zero-initialize port struct
Message-ID: <20191115113546.oxsb2wipmg3rhtef@sirius.home.kraxel.org>
References: <20191113091809.31365-1-kraxel@redhat.com>
 <84d3a1aa-bbb2-d831-0abc-fe1169f8a860@redhat.com>
 <20191113140057.2ocwfa3rqqfkbg3r@sirius.home.kraxel.org>
 <CAFr6bUn5W2-w3z4Ty9XD7mh+=kxVq2rQJ3ZUz5nXA13ZdxQtsg@mail.gmail.com>
 <20191114072042.wuo572evuw4hyh3l@sirius.home.kraxel.org>
 <CAFr6bUmUxN4k4AhNOZZxwXUY3uEZZHAwuno4bCvedKFJuuRp8w@mail.gmail.com>
 <20191115065422.rqu74yt2r3asnk35@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20191115065422.rqu74yt2r3asnk35@sirius.home.kraxel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: AaEJ9rkePyq5DdZSgPnyJQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>, seabios@seabios.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I am afraid it will be slightly unreadable when looking at file histori=
es.
> > The only commit that didn't change was:
> > [SeaBIOS] [PATCH v4 2/5] boot: Reorder functions in boot.c
>=20
> Hmm, looks like there have been more changes than I remember.

Yep, v3..v4 diff is pretty big, so revert + apply v4 looks more
reasonable.  Can you have a look and double-check?

https://git.kraxel.org/cgit/seabios/log/?h=3Dlchs-fixup

thanks,
  Gerd


