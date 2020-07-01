Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0412109AD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 12:51:00 +0200 (CEST)
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqaKQ-00085j-HK
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 06:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqaJ3-0007bB-Mb
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 06:49:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53136
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqaJ1-0001ki-0S
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 06:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593600569;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDTKjRdsw3hDG40bCn4ZAnpYTUR+sagDzugS0M4lIoo=;
 b=fOjcURsqIgWMZbXlRlf4lR7vZy8CsHCUm4xgIEXeoN0/3c68z2NwOzSuXYklKPRwywGANw
 DueiyElgsfadWxtAHxagH86Nvc3pdSW/PxvFy326Wvig9gthZpfS4lOgs4x+fMlJxmIAGe
 ib1GUN+v6/vJJLDLEpwZUKZF4Db4TXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362--wLYPa01OnSIc7xZ_I6pag-1; Wed, 01 Jul 2020 06:49:13 -0400
X-MC-Unique: -wLYPa01OnSIc7xZ_I6pag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D809107ACF4;
 Wed,  1 Jul 2020 10:49:12 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9F95DD61;
 Wed,  1 Jul 2020 10:49:09 +0000 (UTC)
Date: Wed, 1 Jul 2020 11:49:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: Re: [PATCH v2 0/6] hw/mips/malta: Add the 'malta-strict' machine,
 matching Malta hardware
Message-ID: <20200701104906.GF1427561@redhat.com>
References: <20200630145236.27529-1-f4bug@amsat.org>
 <CAHiYmc4=pmzEyhVTHaqxBnCotE8V+vaptMFincyurvAyDHNn6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiYmc4=pmzEyhVTHaqxBnCotE8V+vaptMFincyurvAyDHNn6g@mail.gmail.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 01:05:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yunqiang Su <ysu@wavecomp.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 30, 2020 at 05:38:25PM +0200, Aleksandar Markovic wrote:
> уто, 30. јун 2020. у 16:52 Philippe Mathieu-Daudé <f4bug@amsat.org> је
> написао/ла:
> >
> > Hi,
> >
> > This series add a new 'malta-strict' machine, that aims to properly
> > model the real hardware (which is not what the current 'malta'
> > machine models).
> >
> > As a bonus for Debian builders, a 'malta-unleashed' machine RFC
> > patch is included. This might start another endless discussion
> > upstream, but this is not the point of, so I still include it
> > for people to test. The rest of the series is candidate for merging
> > in mainstream QEMU.
> >
> > Philippe Mathieu-Daudé (6):
> >   hw/mips/malta: Trivial code movement
> >   hw/mips/malta: Register the machine as a TypeInfo
> >   hw/mips/malta: Introduce MaltaMachineClass::max_ramsize
> >   hw/mips/malta: Introduce the 'malta-strict' machine
> >   hw/mips/malta: Verify malta-strict machine uses correct DIMM sizes
> >   hw/mips/malta: Introduce the 'malta-unleashed' 64-bit machine
> >
> >  hw/mips/malta.c | 125 ++++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 111 insertions(+), 14 deletions(-)
> >
> > --
> 
> This whole series is based on idea of emulating physically
> non-existing feature, and as such violates the fundamental principles
> of QEMU.

On x86 we model a i440fx from 1995. Max RAM in 1995 was on the order
of 10's of MB, but we run it with *multi-TB* of RAM in QEMU. There's
examples of this all over QEMU.

> As such, not acceptable for upstreaming.

I think this is quite unreasonable, especially considering this series is
addressing a real world problem that users of QEMU malta are facing with
insufficient RAM. QEMU exists to help users get their work done

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


