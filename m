Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B53408A65
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:38:08 +0200 (CEST)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkHm-00072c-NV
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mPkFK-0005Di-EV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:35:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mPkFF-0006ME-BG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631532928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7nmcAiRVfjWpYGy/ryNDIeMC8T4lRvUkBaBk+NG79nc=;
 b=EUyFbzZBpUIqi8tZ6SPfN1ANWrpbx+TVQvOPiXQtRal331W2YQNcoe/nmSS9q4+rO3pevb
 LEBjmoZyLL4u38dd1RqSy1KKb/HVO3bIaLO+a36/2AVaeQHOKbc4HV2nM1B8GXe97qfhv0
 lsho78D8fZKBZwd95JyrC+jyFTEhiIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-tDhLwrb6OvC_IZObswJ2OA-1; Mon, 13 Sep 2021 07:35:27 -0400
X-MC-Unique: tDhLwrb6OvC_IZObswJ2OA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A7021084681;
 Mon, 13 Sep 2021 11:35:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C4519724;
 Mon, 13 Sep 2021 11:35:21 +0000 (UTC)
Date: Mon, 13 Sep 2021 13:35:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2] include/block.h: remove outdated comment
Message-ID: <YT83d0BsFlf3hZOT@redhat.com>
References: <20210903113800.59970-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903113800.59970-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.09.2021 um 13:38 hat Emanuele Giuseppe Esposito geschrieben:
> There are a couple of errors in bdrv_drained_begin header comment:
> - block_job_pause does not exist anymore, it has been replaced
>   with job_pause in b15de82867
> - job_pause is automatically invoked as a .drained_begin callback
>   (child_job_drained_begin) by the child_job BdrvChildClass struct
>   in blockjob.c. So no additional pause should be required.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks, applied to the block branch.

Kevin


