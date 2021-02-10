Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB99316D4A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:51:05 +0100 (CET)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tdo-0000jz-EL
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9t7P-0004mK-0d
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:17:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9t7N-0001yf-Ly
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612977453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJNcfB02mvLglK6Lx0Gb6RZ/UGeIJftbZib+Ug+/l7U=;
 b=G797Ij3W7/ICxdfltnSpYlWLTmk39o/w2OkQX6h6eZb8c4mwAjES7evZ1teXlTV5JwxAzU
 q9Lt+2TBazkBoyDuytu9xlS2RbJxb8TJaaqnDCS4AFTmUUyk4HiPH7jsnL8PuhiH3gVqiT
 ankNqfmmkbX9ojIK5acxsDcUJKlZitk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-3aMHHkRaMxm64K_Ar0ZW-w-1; Wed, 10 Feb 2021 12:17:29 -0500
X-MC-Unique: 3aMHHkRaMxm64K_Ar0ZW-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A662584E241;
 Wed, 10 Feb 2021 17:17:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85FD15C8A8;
 Wed, 10 Feb 2021 17:17:26 +0000 (UTC)
Date: Wed, 10 Feb 2021 18:17:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [RFC PATCH v2 2/4] iotests: Update 245 to support replacing
 files with x-blockdev-reopen
Message-ID: <20210210171724.GI5144@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <74cbe313dce107f6100751f1c42296769f05a7ef.1612809837.git.berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <74cbe313dce107f6100751f1c42296769f05a7ef.1612809837.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.2021 um 19:44 hat Alberto Garcia geschrieben:
> Signed-off-by: Alberto Garcia <berto@igalia.com>

> +    def test_insert_throttle_filter(self):
> +        hd0_opts = hd_opts(0)
> +        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
> +        self.assert_qmp(result, 'return', {})
> +
> +        opts = { 'qom-type': 'throttle-group', 'id': 'group0',
> +                 'props': { 'limits': { 'iops-total': 1000 } } }

Please don't add new users of 'props', it's deprecated. Instead, specify
'limits' on the top level.

Kevin


