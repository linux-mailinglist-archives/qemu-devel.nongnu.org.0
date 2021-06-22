Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993233B0851
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:10:43 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvi30-0002uK-Fv
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvi0w-00016W-7z
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lvi0t-0005ZH-Pf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624374510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCz7L9zZff6Sl1XF79z1JQ5kVC/Kj55rmzKh50NGmTI=;
 b=hKPBIF65ibDH2SNB5Vp3rxyYsrW+5Q9sBzsiHvbqYhkdqzklU+cwrkXkGwslbucPPstZrJ
 OolLVIs2xSfVkdNgHgbxXkKk8zftsgCzL51FHHxU1BtDQFssZcK0RL9fRq4y+re8vAxrGs
 GR0CAusgPiR8848NeiK5dCy12DRltN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-Q-lEF2B3P1aJfaWF47mPAg-1; Tue, 22 Jun 2021 11:08:29 -0400
X-MC-Unique: Q-lEF2B3P1aJfaWF47mPAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9896E362FA;
 Tue, 22 Jun 2021 15:08:28 +0000 (UTC)
Received: from redhat.com (ovpn-114-58.ams2.redhat.com [10.36.114.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C457C10023B5;
 Tue, 22 Jun 2021 15:08:27 +0000 (UTC)
Date: Tue, 22 Jun 2021 17:08:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 4/4] iotests/308: Test allow-other
Message-ID: <YNH86rBVVG2mJo/E@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
 <20210614144407.134243-5-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210614144407.134243-5-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
> We cannot reasonably test the main point of allow-other, which is to
> allow users other than the current one to access the FUSE export,
> because that would require access to sudo, which this test most likely
> will not have.  (Also, we would need to figure out some user/group that
> is on the machine and that is not the current user/group, which may
> become a bit hairy.)
> 
> But we can test some byproducts: First, whether changing permissions
> works (our FUSE code only allows so for allow-other=true), and second,
> whether the kernel applies permission checks with allow-other=true
> (because that implies default_permissions).
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

This seems to have the problem that you mentioned:

--- /home/kwolf/source/qemu/tests/qemu-iotests/308.out
+++ 308.out.bad
@@ -205,7 +205,9 @@
          'writable': true,
          'allow-other': true
           } }
-{"return": {}}
+fusermount3: option allow_other only allowed if 'user_allow_other' is set in /etc/fuse.conf
+{"error": {"class": "GenericError", "desc": "Failed to mount FUSE session to export"}}
+Timeout waiting for return on handle 2
 (Invoking chmod)
 Permissions post-chmod: 666
 (Removing all permissions)

Maybe it should be a separate test case that is skipped with
user_allow_other is disabled.

>  tests/qemu-iotests/308     | 91 ++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/308.out | 47 ++++++++++++++++++++
>  2 files changed, 138 insertions(+)
> 
> diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
> index f122065d0f..1b2f908947 100755
> --- a/tests/qemu-iotests/308
> +++ b/tests/qemu-iotests/308
> @@ -334,6 +334,97 @@ echo '=== Compare copy with original ==='
>  
>  $QEMU_IMG compare -f raw -F $IMGFMT "$COPIED_IMG" "$TEST_IMG"
>  
> +echo
> +echo '=== Test permissions ==='
> +
> +# Test that you can only change permissions on the export with allow-other=true.
> +# We cannot really test the primary reason behind allow-other (i.e. to allow
> +# users other than the current one access to the export), because for that we
> +# would need sudo, which realistically nobody will allow this test to use.
> +# What we can do is test that allow-other=true also enables default_permissions,
> +# i.e. whether we can still read from the file if we remove the read permission.

We already have other test cases that use sudo if available. Though I
guess it means that these tests aren't run very often.

Kevin


