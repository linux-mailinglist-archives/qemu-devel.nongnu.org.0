Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5047446660
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:47:55 +0100 (CET)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1Ra-0003Ev-Ub
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mj1Oh-0000um-JY
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mj1Of-0000iG-QA
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636127093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6DLkGSxNicOim/LBBgAt4eojAI3YnddCRl0+DAWn5eI=;
 b=IHbiGiwmZu98ao9kDnWv6S1K3unjSPh/kmmJNrV8DzfV9BV4V/ldgaVxPa8R+yRgrH3bb6
 PSnyDfmt6lW+nZsv1qkDGvYwci35cJUs8jKkOSLBtlxWZEcFRdQffCTs37Ppj5dWLv9YA0
 RxSaZPgaxBLmdmU88i171l17vAg0H5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-Z51IVV95M2m12sgDWdBfOw-1; Fri, 05 Nov 2021 11:44:51 -0400
X-MC-Unique: Z51IVV95M2m12sgDWdBfOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4582DDF8A0;
 Fri,  5 Nov 2021 15:44:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C6E5D6D7;
 Fri,  5 Nov 2021 15:44:49 +0000 (UTC)
Date: Fri, 5 Nov 2021 16:44:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 0/7] block: Attempt on fixing 030-reported errors
Message-ID: <YYVRb+fq+hyZBeke@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104103849.46855-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 11:38 hat Hanna Reitz geschrieben:
> Hanna Reitz (7):
>   stream: Traverse graph after modification
>   block: Manipulate children list in .attach/.detach
>   block: Unite remove_empty_child and child_free
>   block: Drop detached child from ignore list
>   block: Pass BdrvChild ** to replace_child_noperm
>   block: Let replace_child_noperm free children
>   iotests/030: Unthrottle parallel jobs in reverse

Now I know that I don't aspire to a new career as a full time borrow
checker. :-)

Patches 1-4:
Reviewed-by: Kevin Wolf <kwolf@redhat.com>


