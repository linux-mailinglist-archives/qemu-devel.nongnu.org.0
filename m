Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69222109BF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 12:54:09 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqaNU-0001td-PR
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 06:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jqaMb-0001Rz-LG
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 06:53:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21192
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jqaMa-0002HB-AY
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 06:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593600791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eOvxuq2Hid8nd4tt0uJvvgI2eQLHlx5begQKR4i3fk=;
 b=UDM07VJ2Tp6Tk1jRxPAh1GAfUGz+fXx/IeJTjajuHOnnDnq2uAKVFuMdEw3yxGjK3Qff1S
 F9cbzE5zKF+DiXr8+bVu59ShC+wlBfKJJLaorDG4qlZ9YRufvtOyUlYnF5u0siObeL8gSD
 rvEnISZk52rqYB92dD2KRLlKYgYdNAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-bjpmsoYhO32BI_7_B-Vs0g-1; Wed, 01 Jul 2020 06:53:07 -0400
X-MC-Unique: bjpmsoYhO32BI_7_B-Vs0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB867804004;
 Wed,  1 Jul 2020 10:53:06 +0000 (UTC)
Received: from gondolin (ovpn-113-61.ams2.redhat.com [10.36.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73FBB5FC1B;
 Wed,  1 Jul 2020 10:53:03 +0000 (UTC)
Date: Wed, 1 Jul 2020 12:53:01 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Generate and include dependency files
 in the Makefile
Message-ID: <20200701125301.1498351f.cohuck@redhat.com>
In-Reply-To: <20200630142955.7662-1-thuth@redhat.com>
References: <20200630142955.7662-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 22:25:53
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jun 2020 16:29:55 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The Makefile of the s390-ccw bios does not handle dependencies of the
> *.c files from the headers yet, so that you often have to run a "make
> clean" to get the build right when one of the headers has been changed.
> Let's make sure that we generate and include dependency files for all
> *.c files now to avoid this problem in the future.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/Makefile    |  3 +++
>  pc-bios/s390-ccw/netboot.mak | 13 +++++++------
>  2 files changed, 10 insertions(+), 6 deletions(-)

My Makefile-fu is not that strong, but this looks sane to me.

Acked-by: Cornelia Huck <cohuck@redhat.com>

[I can also pick this directly, if you do not plan to send me a bios
pull req.]


