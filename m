Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D931BDFE2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 16:18:56 +0200 (CEST)
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD886-0001hx-Tb
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 10:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iD82z-0006KW-B6
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iD82x-0005iq-UD
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:13:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33680)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iD82x-0005iJ-Of
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:13:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66E6A1895A5D;
 Wed, 25 Sep 2019 14:13:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4DC66A00;
 Wed, 25 Sep 2019 14:13:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8CE0517535; Wed, 25 Sep 2019 16:13:31 +0200 (CEST)
Date: Wed, 25 Sep 2019 16:13:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 21/24] paaudio: channel-map option
Message-ID: <20190925141331.kjxraaw3ijzkbiq4@sirius.home.kraxel.org>
References: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
 <8f650662fd6cc50baaede260581aeb560eed44fb.1568927990.git.DirtY.iCE.hu@gmail.com>
 <87o8zbma1m.fsf@dusky.pond.sub.org>
 <55ea6ac9-9651-e322-fd84-22b4bedb3a93@gmail.com>
 <87impgy3hw.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87impgy3hw.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Wed, 25 Sep 2019 14:13:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org,
 =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Oh now that I looked again at the pulseaudio docs, channel-map doesn't
> > have to be a list, it can be also a "well-known mapping name".
> 
> Unambiguous because the well-known mapping names are not valid channel
> position list members.

Do we have well-known mapping names for the common use cases?
So maybe just support these?

cheers,
  Gerd


