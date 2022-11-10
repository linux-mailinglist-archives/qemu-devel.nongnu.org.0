Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC006243A5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7zn-0005gh-9B; Thu, 10 Nov 2022 08:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot7zl-0005gR-Gj
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:53:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot7zk-0001z5-5E
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668088407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fidpPDKSgam6rvXkyHzkWNR8zugUKr1P6nqsl+n21GI=;
 b=cOskDIGWOI3lo1+B+e8jmzATnIJNbuYCuOP/3t6AceV45bNI1DDXAXntrL0TP5LP7MrelM
 mRIZvnfL021WI1RxUic1di58eL3sIHjMT1ukmbcdiJLjZVYJZBvd0fduv4d8kwMgYY4mme
 tm5e5svy984YTgvFRGb/aTuOHebbIMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-BPhAcmAnM3WNDDcSbdT-ag-1; Thu, 10 Nov 2022 08:53:25 -0500
X-MC-Unique: BPhAcmAnM3WNDDcSbdT-ag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DABB85A583;
 Thu, 10 Nov 2022 13:53:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79FB64EA4C;
 Thu, 10 Nov 2022 13:53:24 +0000 (UTC)
Date: Thu, 10 Nov 2022 14:53:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH for-7.2] block/blkio: Set
 BlockDriver::has_variable_length to false
Message-ID: <Y20CUzTFO+6rQmpn@redhat.com>
References: <20221108144433.1334074-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108144433.1334074-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 08.11.2022 um 15:44 hat Alberto Faria geschrieben:
> Setting it to true can cause the device size to be queried from libblkio
> in otherwise fast paths, degrading performance. Set it to false and
> require users to refresh the device size explicitly instead.
> 
> Fixes: 4c8f4fda0504 ("block/blkio: Tolerate device size changes")
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Thanks, applied to the block branch.

Kevin


