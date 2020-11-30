Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B92C88B7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:57:46 +0100 (CET)
Received: from localhost ([::1]:60154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlYf-0000Tn-HK
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjlW1-0008On-C6
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:55:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjlVz-0003EZ-PV
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606751699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A4agKHT8CqpqogblM8S12D2SHDpnL0QNIkDG74Mtnvc=;
 b=baRiCzagqlBaQUetU2WuMz9rWbxntdkkCJmI7BSnGUGeJKPam85JZ6pJJNuiLmRO3I1T8s
 p3Sds6xEI7bdbf9THhTmMnoz6nLm+JQT5/SeGp6LSiKgSFmdwZJ7IhlhxngJLCwhKcjIRR
 +nmTiSRzeqalLAlhW1j0bVprH8EcQYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-56Y995u8OvaocTbPd6-t7A-1; Mon, 30 Nov 2020 10:54:13 -0500
X-MC-Unique: 56Y995u8OvaocTbPd6-t7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59AB61084C81;
 Mon, 30 Nov 2020 15:54:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5125D6A8;
 Mon, 30 Nov 2020 15:54:09 +0000 (UTC)
Date: Mon, 30 Nov 2020 16:54:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/18] qapi/qom: Add ObjectOptions for iothread
Message-ID: <20201130155408.GD5078@merkur.fritz.box>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <20201130122538.27674-2-kwolf@redhat.com>
 <48386682-4637-b6e8-47c8-dd4922407146@redhat.com>
MIME-Version: 1.0
In-Reply-To: <48386682-4637-b6e8-47c8-dd4922407146@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.11.2020 um 16:00 hat Paolo Bonzini geschrieben:
> On 30/11/20 13:25, Kevin Wolf wrote:
> > +##
> > +# @IothreadProperties:
> > +#
> > +# Properties for iothread objects.
> > +#
> > +# @poll-max-ns: the maximum number of nanoseconds to busy wait for events.
> > +#               0 means polling is disabled (default: 32768 on POSIX hosts,
> > +#               0 otherwise)
> > +#
> > +# @poll-grow: the multiplier used to increase the polling time when the
> > +#             algorithm detects it is missing events due to not polling long
> > +#             enough. 0 selects a default behaviour (default: 0)
> > +#
> > +# @poll-shrink: the divisor used to decrease the polling time when the
> > +#               algorithm detects it is spending too long polling without
> > +#               encountering events. 0 selects a default behaviour (default: 0)
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'IothreadProperties',
> > +  'data': { '*poll-max-ns': 'int',
> > +            '*poll-grow': 'int',
> > +            '*poll-shrink': 'int' } }
> > +
> 
> Documentation is the main advantage of the ObjectOptions concept. However,
> please use the version where each object and property was introduced for the
> "since" value.  Otherwise the documentation will appear to show that none of
> these objects was available before 6.0.
> 
> Yes, there is no documentation at all right now for QOM objects. However,
> wrong documentation sometimes is worse than non-existing documentation.

I think we generally use the version when the schema was introduced (so
blockdev-add has 2.9 for most things even if they existed before in
-drive and drive_add), but I agree that your suggestion is more useful.
And object-add isn't a new command, we're just giving it a schema now.

So let's first discuss the general direction, but if we agree on that,
using the version numbers where objects and properties were first
introduced makes sense.

Maybe if maintainers can include the right version numbers in the review
of the patch for "their" object, that would help me updating the
patches.

Kevin


