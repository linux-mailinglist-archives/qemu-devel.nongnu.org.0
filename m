Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9811F4B7A7B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:33:12 +0100 (CET)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6Nj-0000RX-E8
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:33:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6D9-0001jZ-Q4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nK6D7-0000J2-8a
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644963732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gNOKxcrvtuowW1AkTGJ8BpTBZlhqmx2icNSw/DH/YBc=;
 b=KzV51GGu0nD2Al6xSosg9vLh1jhl/NQPZiXQRETH7bndvfkd3xysJnPq6vxxYVo3V7KlK+
 3Xq6XGro33gEilkHR24MX0KB9PcTo8XDZKl3FMdZnErlqdWdAxVdHBOHpshdieaG2CYznW
 mPIc9jKNG2OVKwmnag7N3EBUbtz65c8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-n1gwFFtpMsOrPwQKEvouaQ-1; Tue, 15 Feb 2022 17:22:11 -0500
X-MC-Unique: n1gwFFtpMsOrPwQKEvouaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84F12835B4B;
 Tue, 15 Feb 2022 22:22:10 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68BFD5E279;
 Tue, 15 Feb 2022 22:22:06 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:22:04 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 3/3] iotests/graph-changes-while-io: New test
Message-ID: <20220215222204.5f7rfyzh6plwvkij@redhat.com>
References: <20220215135727.28521-1-hreitz@redhat.com>
 <20220215135727.28521-4-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215135727.28521-4-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-322-5436a9
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 02:57:27PM +0100, Hanna Reitz wrote:
> Test the following scenario:
> 1. Some block node (null-co) attached to a user (here: NBD server) that
>    performs I/O and keeps the node in an I/O thread
> 2. Repeatedly run blockdev-add/blockdev-del to add/remove an overlay
>    to/from that node
> 
> Each blockdev-add triggers bdrv_refresh_limits(), and because
> blockdev-add runs in the main thread, it does not stop the I/O requests.
> I/O can thus happen while the limits are refreshed, and when such a
> request sees a temporarily invalid block limit (e.g. alignment is 0),
> this may easily crash qemu (or the storage daemon in this case).
> 
> The block layer needs to ensure that I/O requests to a node are paused
> while that node's BlockLimits are refreshed.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  .../qemu-iotests/tests/graph-changes-while-io | 91 +++++++++++++++++++
>  .../tests/graph-changes-while-io.out          |  5 +
>  2 files changed, 96 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/graph-changes-while-io
>  create mode 100644 tests/qemu-iotests/tests/graph-changes-while-io.out

Reviewed-by: Eric Blake <eblake@redhat.com>

Since we found this with the help of NBD, should I be considering this
series for my NBD queue, or is there a better block-related maintainer
queue that it should go through?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


