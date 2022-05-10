Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D4521D88
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:06:42 +0200 (CEST)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRRh-0003W7-5U
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRPz-0001ca-O7
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1noRPy-0001QX-8D
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652195093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hUQ3fReIQVUNUgOBI/7wklPh3HxA/XEEiYUZln5ApUs=;
 b=imwKPL8KYjUpX9BWFGLF+qiqJnZibcf7xndl7UNZ5EOiBoApWoi1shm+GutZMM6EHyEQnS
 hSOctcmwXNfPb4C7Yk6nL7Jqp2dczH5WCyOhwwiiGbSbZUEpMEqwvOj8+PwzitkMy4nh8V
 1is4cblZwPcrdcsJQ5wHT4jHMIEHRFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-4WVOlxlMPoS-VWrZFe-Tnw-1; Tue, 10 May 2022 11:04:52 -0400
X-MC-Unique: 4WVOlxlMPoS-VWrZFe-Tnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7905100BAA1
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 15:04:51 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A40B7400E436;
 Tue, 10 May 2022 15:04:51 +0000 (UTC)
Date: Tue, 10 May 2022 10:04:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 02/26] qcow2: remove incorrect coroutine_fn annotations
Message-ID: <20220510150450.5bwqngt6wcdrjxna@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509103019.215041-3-pbonzini@redhat.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 09, 2022 at 12:29:55PM +0200, Paolo Bonzini wrote:
> This is incorrect because qcow2_mark_clean() calls qcow2_flush_caches().
> qcow2_mark_clean() is called from non-coroutine context in
> qcow2_inactivate() and qcow2_close().
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/qcow2-refcount.c | 4 ++--
>  block/qcow2.h          | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


