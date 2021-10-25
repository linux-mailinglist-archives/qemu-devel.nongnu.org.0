Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D134397CA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:44:11 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0Go-0000Dj-Cw
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mf0F4-0007Qy-N6
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mf0Ez-0006Mn-Au
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635169335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=15/SypJFqyFUftJZFnizEwZ8onNaRkdSq2skESjGf3c=;
 b=hvldw5DT+qYO98sbTSdbDqpZlVhz4Pj9vM3GeB4WyhccwJjqKveNfdIH42Ip2dXFz+wVJc
 U2fVrBUAoBF4klUVnPC1Dgz5mJ+Mvv1jLI9xhLdGtmoeS5L6xtQ/J8MPRbTQu6+rF22/89
 XGnj4OH7CXu1Za3zaALb8qyHgZu1faA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-jfIMkm-sN12kAgO01sxghQ-1; Mon, 25 Oct 2021 09:42:12 -0400
X-MC-Unique: jfIMkm-sN12kAgO01sxghQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C9B8018AC;
 Mon, 25 Oct 2021 13:42:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DDEE100164A;
 Mon, 25 Oct 2021 13:42:10 +0000 (UTC)
Date: Mon, 25 Oct 2021 15:42:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH] block/export/fuse.c: fix musl build
Message-ID: <YXa0MLaGp5YTPN07@redhat.com>
References: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.10.2021 um 11:52 hat Fabrice Fontaine geschrieben:
> Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
> https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
> and avoid the following build failure on musl:
> 
> ../block/export/fuse.c: In function 'fuse_fallocate':
> ../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>   643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
>       |                     ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, applied to the block branch.

Kevin


