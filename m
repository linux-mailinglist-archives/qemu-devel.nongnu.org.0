Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524C5401DFD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 18:03:35 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNH5p-0005sV-QE
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 12:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mNH1s-0002xc-Vd
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mNH1r-0008Jo-8w
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630943966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zuxuyK2dE2WP8HJWbPjd74Fnxn986kdxEY5t1QA/lP4=;
 b=LhIlPq+UJoK0LKHcBgSkf9mjoM0B4flRQ4+R22OMzGsPOPiM9RU9FmdVwP67SJtwz3qy4c
 d6gm/fU+7B6rnatspeqrz4weVjOhiW7MAPrDGDCpLMWQUTC/LOfGhp4aB7JOABCFRh2fDM
 ic8eZ68Ap58dmxTChSBKzPC2UbxsTBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-VWXsqZjGOqKVTlthsXPW-g-1; Mon, 06 Sep 2021 11:59:23 -0400
X-MC-Unique: VWXsqZjGOqKVTlthsXPW-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80C05107ACC7;
 Mon,  6 Sep 2021 15:59:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28E5C26E7B;
 Mon,  6 Sep 2021 15:59:21 +0000 (UTC)
Date: Mon, 6 Sep 2021 16:59:21 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Konstantin Kostiuk <konstantin@daynix.com>
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
Message-ID: <20210906155921.GU26415@redhat.com>
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
 <YTDTc9NC9k7hJjpx@redhat.com> <20210902135509.GU26415@redhat.com>
 <CAJ28CFQgKDjSeF8vDCVefKtQkRPoZ5EbJz=n8CXZZtX1SnAzyQ@mail.gmail.com>
 <CAJ+F1CLJhN6hx7Z6KOYRqEkctf0-xQx4nyvsZMOazgZEbo3d6g@mail.gmail.com>
 <CAJ28CFQKbmbPk-+X882zraNp+ToT+BKJC5hV-c+i1Fe2VzTWaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ28CFQKbmbPk-+X882zraNp+ToT+BKJC5hV-c+i1Fe2VzTWaA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Yan Vugenfirer <yan@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 06:45:08PM +0300, Konstantin Kostiuk wrote:
> Hi All,
> 
> I reviewed glib, libguestfs, and libosinfo tools. All tools read the registry
> to get information about Windows but read different registry values. All
> information is returned in a localized form.
> Related key: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion
> We can get 'pretty-name' from 'ProductName' value (all tools use it).
> About 'version' there is three variant:
> 1. Set 'version' equals to 'kernel-version'. libguestfs and libosinfo have this
> behavior.
> 2. Read 'version' from 'ReleaseId' value. glib has this behavior. In the case
> of Windows Server 2022, 'ReleaseId' equals 2009.
> 3. Read 'version' from 'DisplayVersion' value. In the case of Windows Server
> 2022, 'DisplayVersion' equals 21H2.

The important point is, however you get it, return the information as
a libosinfo short value ("win2k22" in this case).

> What do you think about this solution instead of using a conversion matrix?
> What version we should use in this case?

If you need to cover old and new versions of Windows then there's no
good way.  You just need lots of conditionals and to constantly evolve
the code as new versions come out.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


