Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C79415F0F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:58:57 +0200 (CEST)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOJU-0000PO-VH
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTOIS-0007Iq-Bw
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTOIO-00059d-Su
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632401867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sD3v1d4rcxbdwFt3fusuHqJ19+V0QPn1KUhfuuuJRXw=;
 b=i9YZPAotvcFA2odl9wOfShB0pOuUUF8nkawX5kGVjkvxypngIawyuiUVxiQwsxuPtPTAqj
 livcjbD3b+vMDGBvxW9F88KZH+fzYBeOKS3k66igVeGTUMiDk6VGtebf8oypzIvh3uwH33
 Agj0TRnnNaC/OYjY+jAXPJ8iuB4kxCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-WcMlyMubMK-U_YPOUQXZZg-1; Thu, 23 Sep 2021 08:57:46 -0400
X-MC-Unique: WcMlyMubMK-U_YPOUQXZZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2701802937;
 Thu, 23 Sep 2021 12:57:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D4F60BF1;
 Thu, 23 Sep 2021 12:57:43 +0000 (UTC)
Date: Thu, 23 Sep 2021 14:57:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 0/6] iotests: update environment and linting configuration
Message-ID: <YUx5xgxkYljq9Vuv@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923001625.3996451-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.09.2021 um 02:16 hat John Snow geschrieben:
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt1
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/375630185
> 
> This series partially supersedes:
>   [PATCH v3 00/16] python/iotests: Run iotest linters during Python CI'
> 
> Howdy, this is good stuff we want even if we aren't yet in agreement
> about the best way to run iotest 297 from CI.
> 
> - Update linting config to tolerate pylint 2.11.1
> - Eliminate sys.path hacking in individual test files
> - make mypy execution in test 297 faster
> 
> The rest of the actual "run at CI time" stuff can get handled separately
> and later pending some discussion on the other series.

Patch 2 seems to need some more work.

The rest is: Reviewed-by: Kevin Wolf <kwolf@redhat.com>


