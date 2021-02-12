Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6388A319E66
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:33:57 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXe0-0000HM-FC
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAXcy-00087P-C1
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:32:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAXcv-0004e8-O6
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613133169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=36gj2KecInShCLaQGQ1efpu73FKA0f+AALerNOGZKNk=;
 b=AP0ZWuTzvjzSoZB5ItB8DGG3Mxctmr10NxZDRuO1XuVpTgMvaclvtip05leXTnSEy+80er
 JNvIkutS0h0YmsOew8FsL7V4pmD6EpgCotOZoAwHTxHQXL7KyQ3Ln0DBnyuafdTW1BrTPt
 8vyIFGKnlrK9ESxdAEgEG2pOZCR6zS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-M91pqaAnO9mtVMtXr80Rsw-1; Fri, 12 Feb 2021 07:32:47 -0500
X-MC-Unique: M91pqaAnO9mtVMtXr80Rsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E28801962;
 Fri, 12 Feb 2021 12:32:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-163.ams2.redhat.com [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA945DEFB;
 Fri, 12 Feb 2021 12:32:45 +0000 (UTC)
Date: Fri, 12 Feb 2021 13:32:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests: Consistent $IMGOPTS boundary matching
Message-ID: <20210212123244.GG6221@merkur.fritz.box>
References: <20210210095128.22732-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210210095128.22732-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.02.2021 um 10:51 hat Max Reitz geschrieben:
> To disallow certain refcount_bits values, some _unsupported_imgopts
> invocations look like "refcount_bits=1[^0-9]", i.e. they match an
> integer boundary with [^0-9].  This expression does not match the end of
> the string, though, so it breaks down when refcount_bits is the last
> option (which it tends to be after the rewrite of the check script in
> Python).
> 
> Those invocations could use \b or \> instead, but those are not
> portable.  They could use something like \([^0-9]\|$\), but that would
> be cumbersome.  To make it simple and keep the existing invocations
> working, just let _unsupported_imgopts match the regex against $IMGOPTS
> plus a trailing space.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


