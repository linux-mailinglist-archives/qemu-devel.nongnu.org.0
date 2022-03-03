Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35704CC90D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 23:33:15 +0100 (CET)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPu0Y-0003lu-Q7
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 17:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPtz0-0002vQ-4M
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:31:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPtyy-0005ME-7y
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646346695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCJBFKHTpep5AaWwuHMj2b6muuamh3OfAbxD77zfgWk=;
 b=Rqs09T3wxaKF2dMKhPwuE4wbORWWZqEptdIlyI6UDspeW1qel9rAV9/f1+IJnxIe3Ha5n+
 4bNpgmWycbVCS5yxlXtifhExcDuglU6rf81bzhFGu995Oek/hUCRNK/bE5T0YeeQnrKbEc
 1fIb2a0N9YM5D07u8LgLsL1Xkqk73Gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-gpXQWCrAMxi7DyC5tk-fbg-1; Thu, 03 Mar 2022 17:31:34 -0500
X-MC-Unique: gpXQWCrAMxi7DyC5tk-fbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A95801AAD;
 Thu,  3 Mar 2022 22:31:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7374D45C8E;
 Thu,  3 Mar 2022 22:31:32 +0000 (UTC)
Date: Thu, 3 Mar 2022 16:31:30 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 3/4] qsd: Add --daemonize
Message-ID: <20220303223130.vr2d7qi2lfh5pg26@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
 <20220303164814.284974-4-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303164814.284974-4-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 05:48:13PM +0100, Hanna Reitz wrote:
> To implement this, we reuse the existing daemonizing functions from the
> system emulator, which mainly do the following:
> - Fork off a child process, and set up a pipe between parent and child
> - The parent process waits until the child sends a status byte over the
>   pipe (0 means that the child was set up successfully; anything else
>   (including errors or EOF) means that the child was not set up
>   successfully), and then exits with an appropriate exit status
> - The child process enters a new session (forking off again), changes
>   the umask, and will ignore terminal signals from then on
> - Once set-up is complete, the child will chdir to /, redirect all
>   standard I/O streams to /dev/null, and tell the parent that set-up has
>   been completed successfully
> 
> In contrast to qemu-nbd's --fork implementation, during the set up
> phase, error messages are not piped through the parent process.
> qemu-nbd mainly does this to detect errors, though (while os_daemonize()
> has the child explicitly signal success after set up); because we do not
> redirect stderr after forking, error messages continue to appear on
> whatever the parent's stderr was (until set up is complete).
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  docs/tools/qemu-storage-daemon.rst   |  7 +++++++
>  storage-daemon/qemu-storage-daemon.c | 15 +++++++++++++++
>  2 files changed, 22 insertions(+)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


