Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D371055E8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 16:43:59 +0100 (CET)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXocg-00063X-P5
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 10:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iXoXK-0000OI-8o
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 10:38:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iXoXG-00035Z-VW
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 10:38:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25177
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iXoXF-00032z-Gm
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 10:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574350699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqEjNXo83LUu9CBJArUC2YxtCDOyri8wpBI6d0FNZkA=;
 b=DkZwa4O2FV7vDkFP51ENQ9AU3fBOUrsnYM4ltegYquA8RD/zbaDTQPgYuIVD6QaOOgAnkG
 quTinYsJMUKzI7n4+kEILhqFb0xHsQj8HI9F4Dr/uaPfCGArVrx5NCJJQLJyZs7ftVdujE
 hIrH4NBv2FFSC5a2lz7BtDDYsjrJ+VE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-Jc10AncxP0qIk3_EUy7rzQ-1; Thu, 21 Nov 2019 10:38:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31FFF91207;
 Thu, 21 Nov 2019 15:38:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0292A5F92F;
 Thu, 21 Nov 2019 15:38:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 776301138606; Thu, 21 Nov 2019 16:38:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: vandersonmr <vandersonmr2@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v8 00/11] Measure Tiny Code Generation Quality
References: <20190829173437.5926-1-vandersonmr2@gmail.com>
Date: Thu, 21 Nov 2019 16:38:13 +0100
In-Reply-To: <20190829173437.5926-1-vandersonmr2@gmail.com> (vandersonmr's
 message of "Thu, 29 Aug 2019 14:34:26 -0300")
Message-ID: <87mucp9r4q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Jc10AncxP0qIk3_EUy7rzQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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

vandersonmr <vandersonmr2@gmail.com> writes:

> This patch is part of Google Summer of Code (GSoC) 2019.
> More about the project can be found in:
> https://wiki.qemu.org/Internships/ProjectIdeas/TCGCodeQuality
>
> The goal of this patch is to add infrastructure to collect
> execution and JIT statistics during the emulation with accel/TCG.
> The statistics are stored in TBStatistic structures (TBStats)
> with each TB having its respective TBStats.
>
> We added -d tb_stats and HMP tb_stats commands to allow the control
> of this statistics collection. And info tb, tbs, and coverset commands
> were also added to allow dumping and exploring all this information
> while emulating.
>
> Collecting these statistics and information is useful to understand
> qemu performance and to help to add the support for traces to QEMU.

Are you still pursuing this?


