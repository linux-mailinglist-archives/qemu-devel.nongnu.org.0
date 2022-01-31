Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AD4A51DA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:49:55 +0100 (CET)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEeYc-0008Kc-LP
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nEeO5-00024D-Qm
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:39:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nEeO4-0001VY-9L
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643665139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QSfxMqoKXio4YVc21QPqesbFBMXnGYCJgqhqjX/plQ=;
 b=DtbXTMGzkrg4FBZHG8CGWfO9PWaiJCVa5ovOmzBpWMMgObDVGNt2jj7CNP1EdB/tS3l3X8
 riH1RaNu47pMiq04IgU7Un9al/CUsASn4JjGjPUPbppMYV1vqGa6RJYkIysYyuDdASLF8s
 d+aJRkJVWQvsXZN25gDp20/s3G/mnp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-nVeiYTRQOwaeQjAMNr6r9g-1; Mon, 31 Jan 2022 16:38:56 -0500
X-MC-Unique: nVeiYTRQOwaeQjAMNr6r9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F3F8824F83;
 Mon, 31 Jan 2022 21:38:55 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91A4D6AB88;
 Mon, 31 Jan 2022 21:38:54 +0000 (UTC)
Date: Mon, 31 Jan 2022 15:38:52 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2] qsd: Document fuse's allow-other option
Message-ID: <20220131213852.xx7ren7pgqy5yg6d@redhat.com>
References: <20220131103124.20325-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131103124.20325-1-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 11:31:24AM +0100, Hanna Reitz wrote:
> We did not add documentation to the storage daemon's man page for fuse's
> allow-other option when it was introduced, so do that now.
> 
> Fixes: 8fc54f9428b9763f800 ("export/fuse: Add allow-other option")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v2:
> - Replaced instances of "QSD" by more generic descriptions, as suggested
>   by Kevin.
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


