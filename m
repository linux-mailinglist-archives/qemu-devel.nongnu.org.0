Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03ADF14C2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 12:14:12 +0100 (CET)
Received: from localhost ([::1]:56005 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSJGN-0000dJ-QI
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 06:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iSJFJ-0000AO-6R
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 06:13:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iSJFH-00054D-BM
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 06:13:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40741
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iSJFH-00053v-4j
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 06:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573038781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxwq+eTe58YydzhWiuqgzyqyv/Jw3SUtsD/zLsOvYI0=;
 b=bM99rLDYokyU5R84lfzvfRjU1p/Eva04dqbhqsBw3dbsRpid/jrVSY74+wMBivQFO/DGN0
 yTvPVNqLHxEfX1RuhvKXuaItaD3QhfQ9DBAJvaGDeCYvWH8OouD4a6bn8g7R0tKIXf63HP
 4V+3cWjTV6UwcCU6ky2x1Owflli2eMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-9RIRYGA3OwaXxfhri4Hccw-1; Wed, 06 Nov 2019 06:12:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F55107ACC3;
 Wed,  6 Nov 2019 11:12:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75801600CE;
 Wed,  6 Nov 2019 11:12:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7BC3411AAA; Wed,  6 Nov 2019 12:12:55 +0100 (CET)
Date: Wed, 6 Nov 2019 12:12:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Subject: Re: [SeaBIOS] 1.13 release?
Message-ID: <20191106111255.aladyvsumr2kw47b@sirius.home.kraxel.org>
References: <20191016104412.ut3jxjwjf64qsjbk@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20191016104412.ut3jxjwjf64qsjbk@sirius.home.kraxel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 9RIRYGA3OwaXxfhri4Hccw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

On Wed, Oct 16, 2019 at 12:44:12PM +0200, Gerd Hoffmann wrote:
>   Hi,
>=20
> Almost a year since 1.12.0 was tagged (Nov 17th to be exact),
> time to plan the 1.13 release I think ...
>=20
> How about freeze in a week or two, release by mid-november?
>=20
> Pending stuff I'm aware of is the disk geometry patch series.
> The corresponding qemu series is still waiting to be merged.

It's finally merged in qemu now.  Going to push the seabios
series and prepare a seabios update for qemu, so upcoming
seabios release gets some more test coverage.

cheers,
  Gerd


