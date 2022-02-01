Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69434A5FE4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:20:17 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEux6-0006HT-D9
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:20:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsYk-0000L1-Aj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:46:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsYe-0002ap-Iw
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643719526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LNTVb7q+HaWpkfq33rfrxk373PF4oDyG6jZnW1mPjMI=;
 b=ALmjW7ruUptTbG70S4RMjoGnZwoo1DAP1kBti7gFF2gitDmRbskJblO73ubgTbn46HtPgR
 2+i+bwief0wv2rFIQvUMpNxdPcs1au8q88Ql0R9kZ1FElZ2uu/sujaXjCcVFkR4dz4vNHc
 y4mnNFx17D/NdBda6dedJEVrDp4K2F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-7-uOOYnKMLelB58SOv5IFA-1; Tue, 01 Feb 2022 07:45:23 -0500
X-MC-Unique: 7-uOOYnKMLelB58SOv5IFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3FAE101F002;
 Tue,  1 Feb 2022 12:45:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C489F752A0;
 Tue,  1 Feb 2022 12:45:01 +0000 (UTC)
Date: Tue, 1 Feb 2022 13:44:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] qemu-img: Unify [-b [-F]] documentation
Message-ID: <YfkrS78iHNVUdL0L@redhat.com>
References: <20220131135908.32393-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131135908.32393-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.01.2022 um 14:59 hat Hanna Reitz geschrieben:
> qemu-img convert documents the backing file and backing format options
> as follows:
>     [-B backing_file [-F backing_fmt]]
> whereas qemu-img create has this:
>     [-b backing_file] [-F backing_fmt]
> 
> That is, for convert, we document that -F cannot be given without -B,
> while for create, way say that they are independent.
> 
> Indeed, it is technically possible to give -F without -b, because it is
> left to the block driver to decide whether this is an error or not, so
> sometimes it is:
> 
> $ qemu-img create -f qed -F qed test.qed 64M
> Formatting 'test.qed', fmt=qed size=67108864 backing_fmt=qed [...]
> 
> And sometimes it is not:
> 
> $ qemu-img create -f qcow2 -F qcow2 test.qcow2 64M
> Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536 [...]
> qemu-img: test.qcow2: Backing format cannot be used without backing file
> 
> Generally, it does not make much sense, though, and users should only
> give -F with -b, so document it that way, as we have already done for
> qemu-img convert (commit 1899bf47375ad40555dcdff12ba49b4b8b82df38).
> 
> Reported-by: Tingting Mao <timao@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


