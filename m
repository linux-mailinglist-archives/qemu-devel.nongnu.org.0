Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE533C14D8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:05:18 +0200 (CEST)
Received: from localhost ([::1]:43566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UeT-0006Z3-2W
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1UdP-0005kG-67
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1UdK-00004y-W0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625753046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YcX2Lvqt+vIdwaTglzNdAulbCTUevQmfpy03+mV5gwg=;
 b=MQhs8RYPAyvTlxQFv/0TIgTDDXM11nFjxsEXcI9cImkqVNmZeo9nqOJHm45gLawRdN0pu5
 GIAc6oyuTIMxYC9kh0lJtAdnLA8j2b0dXY7MW2VwjwRbYqcYKGMEEyhrMC4IoDbTsz9/4O
 KlooQU2StKex1hrxg+6r8jOt58Wf6z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-URbXCbERP5qcXKZgVL_f-g-1; Thu, 08 Jul 2021 10:04:03 -0400
X-MC-Unique: URbXCbERP5qcXKZgVL_f-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 995B9100D69D;
 Thu,  8 Jul 2021 14:04:01 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C38E101E5AF;
 Thu,  8 Jul 2021 14:03:54 +0000 (UTC)
Date: Thu, 8 Jul 2021 09:03:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/2] qemu-img: Require -F with -b backing image
Message-ID: <20210708140352.frlzq6qxofpir4fj@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
 <20210503213600.569128-3-eblake@redhat.com>
 <YOb29Jy1rjyfyf25@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YOb29Jy1rjyfyf25@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 03:00:36PM +0200, Kevin Wolf wrote:
> Am 03.05.2021 um 23:36 hat Eric Blake geschrieben:
> > @@ -17,7 +14,7 @@ qemu-io: can't open device TEST_DIR/t.qcow2: Could not open backing file: Unknow
> >  no file open, try 'help open'
> >  read 4096/4096 bytes at offset 0
> >  4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> > -qemu-img: warning: Deprecated use of backing file without explicit backing format, use of this image requires potentially unsafe format probing
> > +qemu-img: Could not change the backing file to '/home/eblake/qemu/build/tests/qemu-iotests/scratch/t.qcow2.base': Invalid argument
> >  read 4096/4096 bytes at offset 0
> >  4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> 
> This is not exactly an improvement for the error message. Maybe worth a
> follow-up patch?

Sure, will do.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


