Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3023F9F47
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:55:31 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJh0k-0005HG-5J
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJgxR-0002wM-TT
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:52:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJgxP-00037l-F2
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630090321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y14Z+08XtEyfpZloUvSqxu/BoNR5FuJE158NJ/6a6fU=;
 b=ZOUVod97wtCEQlDcGRQl6vkQbtXDDZZ+PEsgy/JGTBwNDGK1S5RcfSx0aDsx+sQsm4DzRc
 xGZkzanCkCG4n0JyhYIjnHep1fKi8XJpGURmgNQTJhoiuTO9W+epTosfoRz3PwfFTKvPMz
 V6kkjZ/pqjw1pkA46nhCYrt1eIOn1qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-_P8tN4PHMhu-r0oTYRX8Wg-1; Fri, 27 Aug 2021 14:52:00 -0400
X-MC-Unique: _P8tN4PHMhu-r0oTYRX8Wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3359ACC621;
 Fri, 27 Aug 2021 18:51:59 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BB55100EBB8;
 Fri, 27 Aug 2021 18:51:50 +0000 (UTC)
Date: Fri, 27 Aug 2021 13:51:48 -0500
From: "eblake@redhat.com" <eblake@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 1/2] storage-daemon: add opt to print when initialized
Message-ID: <20210827185148.m6lvdrceygr6iz6y@redhat.com>
References: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 04:50:35PM +0000, Raphael Norwitz wrote:
> This change adds a command line option to print a line to standard out
> when the storage daemon has completed initialization and is ready to
> serve client connections.
> 
> This option will be used to resolve a hang in the vhost-user-blk-test.

Doesn't the existing --pidfile already serve the same job?  That is,
why not fix vhost-user-blk-test to take advantage of the pid-file
creation rather than output to stdout as evidence of when the storage
daemon is up and running?

Therefore, I don't think we need this patch.

> 
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Missing a corresponding change to the man page
(docs/tools/qemu-storage-daemon.rst), if we decide to go with this
after all.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


