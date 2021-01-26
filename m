Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11269303B6C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:21:35 +0100 (CET)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MPe-0006LS-3h
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4MMx-0004Mr-5y
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:18:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4MMv-0000VI-KZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3OItHbfUA3QT8UFa6QgvNKjVX0ZaHjGE2HhCd8Ttpc=;
 b=YvHUWztA+qGNsbjowNpy8gRth/o8dli61BCa90t/NpBoymlFodMp5U4RduU6BgkUzSmGCt
 tLqT3TN4Yq3w1k4IFTjLEeEIdy3Dd6oBipFRYjYRFDTCr8wf2FGRoZeILhVURcoJ3e7qP2
 s21oIk/B4TpE53bXp4U7nsIgmxFv8VM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-QbhYxQUSNNW6Lj_I4-yTyw-1; Tue, 26 Jan 2021 06:18:43 -0500
X-MC-Unique: QbhYxQUSNNW6Lj_I4-yTyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44F28BBEE2;
 Tue, 26 Jan 2021 11:18:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD2F60C5F;
 Tue, 26 Jan 2021 11:18:41 +0000 (UTC)
Date: Tue, 26 Jan 2021 12:18:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests/118: Drop 'change' test
Message-ID: <20210126111839.GC4385@merkur.fritz.box>
References: <20210126104833.57026-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210126104833.57026-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.2021 um 11:48 hat Max Reitz geschrieben:
> Commit 0afec75734331 removed the 'change' QMP command, so we can no
> longer test it in 118.
> 
> Fixes: 0afec75734331a0b52fa3aa4235220eda8c7846f
>        ('qmp: remove deprecated "change" command')
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks, applied to the block branch.

(I was just about to make the same change myself...)

If you don't mind, I'd squash in something like the following.

Kevin

diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index 88e8354e21..cae52ffa5e 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -1,8 +1,7 @@
 #!/usr/bin/env python3
 # group: rw
 #
-# Test case for the QMP 'change' command and all other associated
-# commands
+# Test case for media change monitor commands
 #
 # Copyright (C) 2015 Red Hat, Inc.
 #


