Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A41FB55F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 17:03:54 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlD7x-0000gf-9M
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 11:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlD5q-0007NC-JK
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 11:01:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35760
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlD5p-0006J4-2D
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 11:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592319699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HqczRbAwPx+vKqu+Y3gRIXJ8X0tDsQL0G2N8oNctokM=;
 b=fMelr5LbB5PdO4U3Z2Mrp8PwSxs93UtNQklYhgQn12PFaQZUyFGFYsmtQhK8sAWhkOoZPv
 vQCEuq1a5m+N1hGL5QAYefJvqj872/wBfTi1QH4kgRlk7sCauKXzOUo00BCf2iIk2/nM8y
 jZoDamCeaB87u0MAIhH4tJAKUWvh/fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-2sdhp2BqPYSrEIhtCiUjdA-1; Tue, 16 Jun 2020 11:01:32 -0400
X-MC-Unique: 2sdhp2BqPYSrEIhtCiUjdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46057100A8C1;
 Tue, 16 Jun 2020 15:01:31 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 596CE60C05;
 Tue, 16 Jun 2020 15:01:30 +0000 (UTC)
Date: Tue, 16 Jun 2020 17:01:28 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH] .gitignore: Ignore storage-daemon files
Message-ID: <20200616150128.GE4305@linux.fritz.box>
References: <20200612105830.17082-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20200612105830.17082-1-r.bolshakov@yadro.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.06.2020 um 12:58 hat Roman Bolshakov geschrieben:
> The files are generated.
> 
> Fixes: 2af282ec51a ("qemu-storage-daemon: Add --monitor option")
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks, applied to the block branch.

Kevin


