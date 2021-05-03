Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82B37134E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:02:41 +0200 (CEST)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVPU-0006Dx-9F
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldVNh-0005d9-A9
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldVNf-0000Am-4z
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620036046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMcbou3JhU36inC0R7tb9fN7q7wGTardZUGpXssGKUM=;
 b=IhJMGGAxEKuWbqIo9m/R91kOtcrlk+aiIELRkP5+FlsqzrQXmN6FokiJh/E1/q6kluVt7M
 8YTvubtuk0mYFrQvJETfObEvcoX4rYF9PgB1IOvZcjLjTiEfSLZnsAS+qoQis1ffELxXB1
 R3E+6bSgzwjv/R+JLDdF0Gy5gr5OTk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-V35ierFpOC6pz_rmfEB-Gg-1; Mon, 03 May 2021 06:00:42 -0400
X-MC-Unique: V35ierFpOC6pz_rmfEB-Gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB5B7801106;
 Mon,  3 May 2021 10:00:41 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-109.ams2.redhat.com
 [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B215E5C1D0;
 Mon,  3 May 2021 10:00:40 +0000 (UTC)
Date: Mon, 3 May 2021 12:00:35 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
Message-ID: <20210503120035.29952643.cohuck@redhat.com>
In-Reply-To: <20210502174836.838816-5-thuth@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun,  2 May 2021 19:48:36 +0200
Thomas Huth <thuth@redhat.com> wrote:

> Clang unfortunately does not support generating code for the z900
> architecture level and starts with the z10 instead. Thus to be able
> to support compiling with Clang, we have to check for the supported
> compiler flags. The disadvantage is of course that the bios image
> will only run with z10 guest CPUs upwards (which is what most people
> use anyway), so just in case let's also emit a warning in that case.

Maybe add a note here that the pre-built image will continue to be
built with gcc for the z900, so for most people nothing will change?

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                 | 9 ++++++++-
>  pc-bios/s390-ccw/Makefile | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


