Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45CD3B082D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:04:10 +0200 (CEST)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhwf-0005av-St
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvhuf-000428-9g
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:02:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvhud-0001oM-73
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624374122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3th47WHdn1eg81t2BPEFItSKkKecejEDZ/49AZQPSg=;
 b=e/lUDQiG9Qp/csbOn3j1REErhhywTmeUrUUS9uki9BC2ElLXrMx5uzgUcTmNRznlPPbt2a
 7ildIXRgmC6PZUWpmfPSYNEwGhvpD7ulL5bunwfnFRnDcaacbIB8xvFvl5yHd9IH33vjPq
 0fri5pttzK171qSd01Lu1YIoyq1drfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-HQ-X8UBDOdapNC5TGXdKuQ-1; Tue, 22 Jun 2021 11:00:51 -0400
X-MC-Unique: HQ-X8UBDOdapNC5TGXdKuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E92C1084F66;
 Tue, 22 Jun 2021 15:00:50 +0000 (UTC)
Received: from redhat.com (ovpn-114-58.ams2.redhat.com [10.36.114.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71FD95D6BA;
 Tue, 22 Jun 2021 15:00:49 +0000 (UTC)
Date: Tue, 22 Jun 2021 17:00:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 1/4] export/fuse: Add allow-other option
Message-ID: <YNH7IGIA5/dDxHmz@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
 <20210614144407.134243-2-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210614144407.134243-2-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.06.2021 um 16:44 hat Max Reitz geschrieben:
> Without the allow_other mount option, no user (not even root) but the
> one who started qemu/the storage daemon can access the export.  Allow
> users to configure the export such that such accesses are possible.
> 
> When we do pass allow_other, we should also pass default_permissions,
> because our export code performs no permission checks.  With
> default_permissions, we can just let the kernel do it.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


