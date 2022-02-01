Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058294A5FA2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:09:34 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEumi-0005zC-Ey
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:09:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsT1-0008AS-0t
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:41:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsSy-0001yx-8K
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643719257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Awlc8qK2tj1ypvdEgRjME5oRSyTOMzXGzhkMJQ4PmPA=;
 b=FSs9v1BYbYJJx/dM7VtgUvvgx4K6nC1fSOUbZ/+OGPxx54WL1TJNGDj4JIp8dyIAEODFsQ
 003xC2pWMUaHfqk9Yebjsg68X06KQAfVfJSDC3g6vNtAeVS61GO3Q/n1ARmkRjeWBgQUsT
 jvEXvg3gbXZBNMpreWv1MxaJbfjFhj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-rXKMgGvkNXy5d7-1LvCAlg-1; Tue, 01 Feb 2022 07:40:56 -0500
X-MC-Unique: rXKMgGvkNXy5d7-1LvCAlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F384874982;
 Tue,  1 Feb 2022 12:40:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 668D87BB67;
 Tue,  1 Feb 2022 12:40:54 +0000 (UTC)
Date: Tue, 1 Feb 2022 13:40:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2] qsd: Document fuse's allow-other option
Message-ID: <YfkqVC3/pqS7aYN4@redhat.com>
References: <20220131103124.20325-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131103124.20325-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.01.2022 um 11:31 hat Hanna Reitz geschrieben:
> We did not add documentation to the storage daemon's man page for fuse's
> allow-other option when it was introduced, so do that now.
> 
> Fixes: 8fc54f9428b9763f800 ("export/fuse: Add allow-other option")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


