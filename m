Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309A3A6E4B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 20:42:23 +0200 (CEST)
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrXS-0002GW-R7
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 14:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lsrVE-0000tD-H6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lsrV9-0005tX-Sx
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623695998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTOIoXS1gkSDW6jiG0iJB8HMYtQsK1tUe4QD4EtNAv4=;
 b=KY7YfqT4WvJnsUF0DwRNUQRf8TvX9WTiQU8swnIZB7xufYhZRajq5h3e+sdDmcS3xUfAqk
 hlSeYWjfqIe6gKUJlLDrNzp9VQ/GYRQUPb4WCVb7pE1rvBaC6YVFij1MLoziRTRtg4A1+a
 XMT+pXYG3hfBFDfY/xeCATFtfeR6v3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-6tbDlBdPN_uoXvb8fHg8Lw-1; Mon, 14 Jun 2021 14:39:55 -0400
X-MC-Unique: 6tbDlBdPN_uoXvb8fHg8Lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5E368049C5;
 Mon, 14 Jun 2021 18:39:54 +0000 (UTC)
Received: from redhat.com (ovpn-113-14.phx2.redhat.com [10.3.113.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B07410023B5;
 Mon, 14 Jun 2021 18:39:54 +0000 (UTC)
Date: Mon, 14 Jun 2021 13:39:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Zhiwei Jiang <elish.jiang@ucloud.cn>
Subject: Re: [PATCH] block: fix build waring
Message-ID: <20210614183952.do2vhrnsrricakmj@redhat.com>
References: <20210613093821.774562-1-elish.jiang@ucloud.cn>
MIME-Version: 1.0
In-Reply-To: <20210613093821.774562-1-elish.jiang@ucloud.cn>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 13, 2021 at 05:38:21PM +0800, Zhiwei Jiang wrote:

In the subject, s/waring/warning/

> when i compile this file with some error message
> ../block.c: In function ‘bdrv_replace_node_common’:
> ../block.c:4903:9: error: ‘to_cow_parent’ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>          bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Signed-off-by: Zhiwei Jiang <elish.jiang@ucloud.cn>
> ---
>  block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This looks identical to
https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01229.html
which has a more complete commit message and is already on Kevin's
tree for an upcoming pull request.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


