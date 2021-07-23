Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169043D3D6B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:19:51 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xtu-00078s-51
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m6xt9-0006IL-N6
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m6xt8-0007Xl-3D
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627057140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gIY8iU3tWE+z8Zf+bZYZYnf42kpGzlZ/+1OpyKvPH9k=;
 b=iuUiSqN7rJ4BS1LSFvSi7dT68m4+mViY8UKAAev4mNABCWPGAwXHz5Q89/u4lFDSUoak9f
 t429ycyNseMNJv4q1J24XTv6GvkYbAAkiddWOB6/8Gv4b8U27uL4UMiR3EoHyD4sJSIeux
 5TB/c7Lx6q0Cg/VeUo4/Wa+iJ3uLIuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-URDhtawrNeC-hegExSRE2A-1; Fri, 23 Jul 2021 12:18:59 -0400
X-MC-Unique: URDhtawrNeC-hegExSRE2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CF4810086C7;
 Fri, 23 Jul 2021 16:18:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-114.ams2.redhat.com [10.36.113.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A155F6A05B;
 Fri, 23 Jul 2021 16:18:56 +0000 (UTC)
Date: Fri, 23 Jul 2021 18:18:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Add --selinux-label option
Message-ID: <YPrr72N494WKnJA5@redhat.com>
References: <20210723103303.1731437-1-rjones@redhat.com>
 <20210723103303.1731437-2-rjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723103303.1731437-2-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: berrange@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.07.2021 um 12:33 hat Richard W.M. Jones geschrieben:
> Under SELinux, Unix domain sockets have two labels.  One is on the
> disk and can be set with commands such as chcon(1).  There is a
> different label stored in memory (called the process label).  This can
> only be set by the process creating the socket.  When using SELinux +
> SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> you must set both labels correctly first.
> 
> For qemu-nbd the options to set the second label are awkward.  You can
> create the socket in a wrapper program and then exec into qemu-nbd.
> Or you could try something with LD_PRELOAD.
> 
> This commit adds the ability to set the label straightforwardly on the
> command line, via the new --selinux-label flag.  (The name of the flag
> is the same as the equivalent nbdkit option.)
> 
> A worked example showing how to use the new option can be found in
> this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

I suppose this would also be relevant for the built-in NBD server,
especially in the context of qemu-storage-daemon?

If so, is this something specific to NBD sockets, or would it actually
make sense to have it as a generic option in UnixSocketAddress?

Kevin


