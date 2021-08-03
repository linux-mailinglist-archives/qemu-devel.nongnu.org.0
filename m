Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332483DF3CE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:19:01 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAy4B-0004mR-O3
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAy3B-0003yJ-HT
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAy38-0004di-LY
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 13:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628011073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooo5gkTK52crXEspwGEuVYUXFgAGDz22OzeO8FqXOhI=;
 b=NzSyVQbII9RLEuxLZZHuXXjXU+G7zHWq1ECdST08S/TPq4mJNzG3LOGfHEa7CssSO5MkFg
 zWNt1wMkVHwG4B8HXvNahSQNGAfLZs+GCz1bC52tkOyVvXYgrcVZJkJkOhmahczpWSt5c0
 Ej6eIvGYiDY4f0y3vKpPNQ9w5nqIr8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-vUd8SiD6OniefrMLFQ29Fw-1; Tue, 03 Aug 2021 13:17:51 -0400
X-MC-Unique: vUd8SiD6OniefrMLFQ29Fw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5FEA801AEB;
 Tue,  3 Aug 2021 17:17:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D5B5E26A;
 Tue,  3 Aug 2021 17:17:48 +0000 (UTC)
Date: Tue, 3 Aug 2021 19:17:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Failing iotest 206
Message-ID: <YQl6O8z0LIOXHzlV@redhat.com>
References: <87d526f8-53bc-c196-6d5c-72b78a49518b@redhat.com>
 <20210720011151.l66z3q5hfc7urcfv@redhat.com>
 <YPaKMLGBINB+uSXz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YPaKMLGBINB+uSXz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.07.2021 um 10:32 hat Daniel P. Berrangé geschrieben:
> On Mon, Jul 19, 2021 at 08:12:58PM -0500, Eric Blake wrote:
> > On Mon, Jul 19, 2021 at 10:06:01AM +0200, Thomas Huth wrote:
> > >  Hi,
> > > 
> > > iotest 206 fails for me with:
> > > 
> > 
> > > --- 206.out
> > > +++ 206.out.bad
> > > @@ -99,55 +99,19 @@
> > > 
> > >  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options":
> > > {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode":
> > > "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg":
> > > "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file":
> > > {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
> > >  {"return": {}}
> > > +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
> > >  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
> > >  {"return": {}}
> > 
> > > 
> > > Looks like it is missing a check for the availability of the corresponding
> > > crypto stuff? Does anybody got a clue how to fix this?
> > 
> > What system is this on? Which crypto library versions are installed?
> > I suspect this is related to Dan's effort to speed up crypto by
> > favoring gnutls over nettle, where the switch in favored libraries
> > failed to account for whether twofish-128 is supported?
> > 
> > https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03886.html
> 
> Yes, the gnutls provider doesn't support twofish. This doesn't matter
> in real world usage because no one is seriously going to ask for twofish
> instead of AES for luks encryption.
> 
> I guess that test suite was simply trying to ask for some non-default
> values though.

Do we already have a patch somewhere that makes it use a different
value? Or if not, which value would be most likely to work everywhere?

Kevin


