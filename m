Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87573CF12D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:14:14 +0200 (CEST)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eKr-0005Fn-QC
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5eJm-0004S3-Ax
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:13:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5eJk-0008Ri-1T
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626743583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xVGX/8775B8QBoJPqxGcZZAMdoy13V22o+qnMlgTgf0=;
 b=E0zEXXUbLb/k60tnf94l+yAloO3cccprZc4evOn9h8jRmJgd6OnwkHDYp7Db0PyCVDCh4/
 V2B2oWKqdLdoY+onnQcRNaOXPAWYUWe9koCMrFoOMUJYtRRESZ/JgJ0grUrKcz3NRJ0J+n
 A2NXJEyQl7GA7fEkh1MFZ3AK0/ELu6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-8WBL2hRaP1irbF2DbT5ecw-1; Mon, 19 Jul 2021 21:13:01 -0400
X-MC-Unique: 8WBL2hRaP1irbF2DbT5ecw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 239101084F54;
 Tue, 20 Jul 2021 01:13:00 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A23CA60918;
 Tue, 20 Jul 2021 01:12:59 +0000 (UTC)
Date: Mon, 19 Jul 2021 20:12:58 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Failing iotest 206
Message-ID: <20210720011151.l66z3q5hfc7urcfv@redhat.com>
References: <87d526f8-53bc-c196-6d5c-72b78a49518b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87d526f8-53bc-c196-6d5c-72b78a49518b@redhat.com>
User-Agent: NeoMutt/20210205-614-b535a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: berrange@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 10:06:01AM +0200, Thomas Huth wrote:
>  Hi,
> 
> iotest 206 fails for me with:
> 

> --- 206.out
> +++ 206.out.bad
> @@ -99,55 +99,19 @@
> 
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options":
> {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode":
> "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg":
> "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file":
> {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
>  {"return": {}}
> +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}

> 
> Looks like it is missing a check for the availability of the corresponding
> crypto stuff? Does anybody got a clue how to fix this?

What system is this on? Which crypto library versions are installed?
I suspect this is related to Dan's effort to speed up crypto by
favoring gnutls over nettle, where the switch in favored libraries
failed to account for whether twofish-128 is supported?

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03886.html

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


