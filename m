Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018F2D5D68
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:22:29 +0100 (CET)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMpv-0003t4-C7
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmatouse@redhat.com>)
 id 1knMmm-0000PI-8p
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:19:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pmatouse@redhat.com>)
 id 1knMmk-0004YQ-Cp
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607609949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1qbbYzjH0vTJQLKSaKckMMA47tfyxw3+wSz6sTQmNyA=;
 b=GHQfOTgBcNnsY37bL2qQ7WoG+e7ecVrnrUJX6nqbp2EGk9ooger7Vy1X6NqPjBNLbDGq4p
 sbeUQqd3rjRu7mI4n6vjl+vV0tKJFhSYHZSWXIeIEwuxykNp1QHXW9pv4Mo2Z53UJpRWCL
 +EZrGUR571Axyr4iw+fsZQffagu9cGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-TjqEfCVJNFaX1TlOVa2gxQ-1; Thu, 10 Dec 2020 09:17:58 -0500
X-MC-Unique: TjqEfCVJNFaX1TlOVa2gxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FA13A0C32;
 Thu, 10 Dec 2020 14:17:56 +0000 (UTC)
Received: from dhcp-25-225.brq.redhat.com (dhcp-10-40-4-249.brq.redhat.com
 [10.40.4.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7DB360C04;
 Thu, 10 Dec 2020 14:17:47 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:17:45 +0100
From: Petr Matousek <pmatouse@redhat.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH v2 1/1] security-process: update process information
Message-ID: <20201210141743.GZ2094@dhcp-25-225.brq.redhat.com>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203142902.474883-2-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pmatouse@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pmatouse@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 07:59:02PM +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
> 
> Update the security process web page with new mailing list address
> and triage details.
> 
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  contribute/security-process.md | 154 ++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 59 deletions(-)

Reviewed-by: Petr Matousek <pmatouse@redhat.com>

Thanks!

-- 
Petr Matousek / Red Hat Product Security
PGP: 0xC44977CA 8107 AF16 A416 F9AF 18F3  D874 3E78 6F42 C449 77CA


