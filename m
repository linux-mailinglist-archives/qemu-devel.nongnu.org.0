Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45F5F52B7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 12:39:01 +0200 (CEST)
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og1no-0000Ma-Ka
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 06:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og1ha-0005HT-5I
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og1hX-0008Hr-S5
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664965950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z3V0Swsu9xuYX8doN0UPNK8OTp5wHhiQ+HRIgbAFFiQ=;
 b=CqhW5aUHDECjap7Mbj3Gy7RERQKJ0fnVBiAMihOuGaEah4XSzMLTui1+jILXuczU9OnsfI
 4NPlFSVd4LRg5TVcT2r2tHDzueaJgeyOpX8BdI9LUHzGXqS17opYaKSypKFdEphxrZVH+j
 M22VPYdmDEbG56JiL8P7qcv+LE3kQf0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-GJD17LGXPsWVT7CK0ehmBA-1; Wed, 05 Oct 2022 06:32:26 -0400
X-MC-Unique: GJD17LGXPsWVT7CK0ehmBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689DA1C06EC9;
 Wed,  5 Oct 2022 10:32:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90D3317585;
 Wed,  5 Oct 2022 10:32:25 +0000 (UTC)
Date: Wed, 5 Oct 2022 12:32:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 06/26] blkdebug: add missing coroutine_fn annotations
Message-ID: <Yz1dONxeQIVqysmL@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
 <20220922084924.201610-7-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922084924.201610-7-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.09.2022 um 10:49 hat Paolo Bonzini geschrieben:
> Callers of coroutine_fn must be coroutine_fn themselves, or the call
> must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
> functions where this holds.
> 
> Reviewed-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hm... blkdebug_debug_event() is called from bdrv_debug_event(), which is
not coroutine_fn. And I think that it's not coroutine_fn is correct:
For example, with 'qemu-img snapshot -c' you get img_snapshot() ->
bdrv_snapshot_create() -> qcow2_snapshot_create() ->
qcow2_alloc_clusters() -> BLKDBG_EVENT. I'm sure many other calls in
qcow2 can be reached from non-coroutine context as well.

It almost looks like your code analysis didn't consider calls through
function pointers?

Kevin


