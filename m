Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC3345BED
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 11:32:39 +0100 (CET)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOeL0-0007Vw-5B
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 06:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOeJT-00070g-Sg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOeJN-0005nO-Ua
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616495456;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzowdJT+aYUHFdlNa2zvTqkV0uTn4z8NkXN/FOY0SF0=;
 b=SeHI9X+iyZlIRAnGXpJcLVSrouEkaNtUVg3FRmpQxqH/mfRVc9Bb6NFPhe5uB3XVgQ5xES
 qLPPqiEOweZ1WttVFHVJdOKWmmGI/DuegGEyNM9Un5tla12EXzuj0RTlOui/IRKR0qUd4y
 bMCU1bPfcOlg+DR2Fl2UxUaALY2Od5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-aMY-iKq2MxCEm9K6-lVQnQ-1; Tue, 23 Mar 2021 06:30:54 -0400
X-MC-Unique: aMY-iKq2MxCEm9K6-lVQnQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E8BC80006E;
 Tue, 23 Mar 2021 10:30:53 +0000 (UTC)
Received: from redhat.com (ovpn-113-223.ams2.redhat.com [10.36.113.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FF5910023B2;
 Tue, 23 Mar 2021 10:30:51 +0000 (UTC)
Date: Tue, 23 Mar 2021 10:30:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] block: Remove monitor command block_passwd
Message-ID: <YFnDWNLTBEZWEIdk@redhat.com>
References: <20210323101951.3686029-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210323101951.3686029-1-armbru@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 11:19:51AM +0100, Markus Armbruster wrote:
> Command block_passwd always fails since
> 
> Commit c01c214b69 "block: remove all encryption handling APIs"
> (v2.10.0) turned block_passwd into a stub that always fails, and
> hardcoded encryption_key_missing to false in query-named-block-nodes
> and query-block.
> 
> Commit ad1324e044 "block: remove 'encryption_key_missing' flag from
> QAPI" just landed.  Complete the cleanup job: remove block_passwd.

Oh, we never marked block_passwd as deprecated, so I missed this
cleanup.

None the less we're fine removing it, since anyone who has tried
to use it since 2.10 will have found it useless, and have been
unable to start their VMs with encrypted disks. 

> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> This is based on my "[PATCH 00/28] qapi: Enforce naming rules".  To
> apply directly, simply drop the qapi/pragma.json hunk.
> 
> Based-on: <20210323094025.3569441-1-armbru@redhat.com>
> 
> 
>  qapi/block-core.json           | 14 --------------
>  qapi/pragma.json               |  1 -
>  block/monitor/block-hmp-cmds.c | 10 ----------
>  blockdev.c                     |  8 --------
>  hmp-commands.hx                | 15 ---------------
>  5 files changed, 48 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


