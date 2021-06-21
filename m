Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954163AED33
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:14:14 +0200 (CEST)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMYv-0007Rs-20
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvMX9-0006Bc-NS
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvMX6-0005Tu-Bk
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624291939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AczVMFAJXNYKscNPjkqctat2H1Qf9fbQ8S72gbiSvtY=;
 b=bVPIOv0314TDXYHE4yohW1OM3L9l7JBCX+XqAvdPk3S2yMwWYCW6dMMl7SF1Hwrcwit8RT
 Adjt9HbPJQQF1i0f827ulZj7kDXEeX+qFi1Ica/bgCkq2gsgLeL7fcwqgycJJjxJnIbu8q
 khGTpr7JZY7y/+GLqaTm1NBZK+05xpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-kPaxsZ9wMhSH9k_7ohtyew-1; Mon, 21 Jun 2021 12:12:17 -0400
X-MC-Unique: kPaxsZ9wMhSH9k_7ohtyew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06F611842158;
 Mon, 21 Jun 2021 16:12:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD095D9F0;
 Mon, 21 Jun 2021 16:12:15 +0000 (UTC)
Date: Mon, 21 Jun 2021 18:12:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/4] export/fuse: Allow other users access to the export
Message-ID: <YNC6Xvcc9lKc50Sk@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210614144407.134243-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.06.2021 um 16:44 hat Max Reitz geschrieben:
> Hi,
> 
> With the default mount options, FUSE mounts are not accessible to any
> users but the one who did the mount, not even to root.  To allow such
> accesses, allow_other must be passed.
> 
> This is probably useful to some people (it certainly is to me, e.g. when
> exporting some image as my normal user, and then trying to loop mount it
> as root), so this series adds a QAPI allow-other bool that will make the
> FUSE export code pass allow_other,default_permissions to FUSE.
> 
> (default_permissions will make the kernel do the usual UNIX permission
> checks, which is something that makes a lot of sense when allowing other
> users access to the export.)
> 
> This also requires our SETATTR code to be able to handle permission
> changes, though, so the user can then run chmod/chown/chgrp on the
> export to adjust its permissions to their need.
> 
> The final patch adds a test.

If there is even a use case for leaving the option off (not trusting
root?), it must certainly be the less common case? So I'm not sure if
allow-other should be an option at all, but if it is, enabling it by
default would make more sense to me.

Is there a reason why you picked false as the default, except that it is
the old behaviour?

Kevin


