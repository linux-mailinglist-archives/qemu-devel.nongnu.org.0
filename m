Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1A4A025E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:56:56 +0100 (CET)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYIh-0000x0-J4
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:56:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYD2-0004ZH-Iu
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDYCz-0004Wj-Mg
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643403058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86zMuwhaS+ygTO9PAOZWLYYT+tiMQbdvm++Woz5tFic=;
 b=IfSK1llDnc9vv4zrUQp6pHKwcTR54Tg5xbTL/3cmXZSWJYrOIOn2c88REKyaKzbaJgHsEh
 XC3h81ptaFfHAE9t1YqMq7wS/6DJoCx3SaC9ZDJ1owrcE/twC0g/Utmk7bqamq1cBJSRdg
 zlfAuc42Slm5CV5iUBQZxsA1/yvedKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-RQe4IXcCO2OS6hR4WQ_O2g-1; Fri, 28 Jan 2022 15:50:55 -0500
X-MC-Unique: RQe4IXcCO2OS6hR4WQ_O2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67B3A1853022;
 Fri, 28 Jan 2022 20:50:54 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F036AB86;
 Fri, 28 Jan 2022 20:50:53 +0000 (UTC)
Date: Fri, 28 Jan 2022 14:50:51 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 2/2] iotests/block-status-cache: New test
Message-ID: <20220128205051.aqbqkfkavlb6ycci@redhat.com>
References: <20220118170000.49423-1-hreitz@redhat.com>
 <20220118170000.49423-3-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220118170000.49423-3-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 06:00:00PM +0100, Hanna Reitz wrote:
> Add a new test to verify that want_zero=false block-status calls do not
> pollute the block-status cache for want_zero=true calls.
> 
> We check want_zero=true calls and their results using `qemu-img map`
> (over NBD), and want_zero=false calls also using `qemu-img map` over
> NBD, but using the qemu:allocation-depth context.
> 
> (This test case cannot be integrated into nbd-qemu-allocation, because
> that is a qcow2 test, and this is a raw test.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/tests/block-status-cache   | 139 ++++++++++++++++++
>  .../qemu-iotests/tests/block-status-cache.out |   5 +
>  2 files changed, 144 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/block-status-cache
>  create mode 100644 tests/qemu-iotests/tests/block-status-cache.out

Reviewed-by: Eric Blake <eblake@redhat.com>

As this was detected as a regression using NBD, I'm happy to add this
to my NBD queue, and will send a pull request soon.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


