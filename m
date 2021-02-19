Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B1E31F96A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:30:17 +0100 (CET)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4vH-0002hr-Vu
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lD4nH-0001o2-HM
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:21:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lD4nF-0000cL-O5
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613737317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r7CXdrejAtkHy27sK0oAIRGSNED677Xx660c2FLVOeI=;
 b=VU9brPIcA26c2+0NENUKmiRVuUbg681boAbwHNxk01I8FRfvrbDynebgvIhaK4DVKnWVRA
 h///tDDIhu4Xr/xkLlv05hlUu0o+Ez8pJ3rhVMMawE1EWtnY+FN81wV+0GVZqCoxw2n3gC
 h8qDKVkYavN6lehplOcd8OY856ub9j0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-iwl985c-P4i3Ui4xMBh-DQ-1; Fri, 19 Feb 2021 07:21:53 -0500
X-MC-Unique: iwl985c-P4i3Ui4xMBh-DQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B0E0107ACE3;
 Fri, 19 Feb 2021 12:21:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-88.ams2.redhat.com [10.36.114.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B6A5D743;
 Fri, 19 Feb 2021 12:21:50 +0000 (UTC)
Date: Fri, 19 Feb 2021 13:21:49 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] iotests: Drop deprecated 'props' from object-add
Message-ID: <20210219122149.GC5750@merkur.fritz.box>
References: <20210216171653.6543-1-berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20210216171653.6543-1-berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.02.2021 um 18:16 hat Alberto Garcia geschrieben:
> Signed-off-by: Alberto Garcia <berto@igalia.com>

> diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
> index 20d16dbf38..f5c73b9c17 100755
> --- a/tests/qemu-iotests/235
> +++ b/tests/qemu-iotests/235
> @@ -57,7 +57,7 @@ vm.add_args('-drive', 'id=src,file=' + disk)
>  vm.launch()
>  
>  log(vm.qmp('object-add', qom_type='throttle-group', id='tg0',
> -           props={ 'x-bps-total': size }))
> +           x_bps_total=size))

x-bps-total isn't a stable interface, I'd prefer to use limits.

My patch from November [1] had this:

diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index d1b10ac36b..2765561ada 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -56,7 +56,7 @@ vm.add_args('-drive', 'id=src,file=' + disk)
 vm.launch()

 log(vm.qmp('object-add', qom_type='throttle-group', id='tg0',
-           props={ 'x-bps-total': size }))
+           limits={ 'bps-total': size }))

 log(vm.qmp('blockdev-add',
            **{ 'node-name': 'target',

The same happens in other hunks in the patch.

Actually, I believe I can even merge my patch to drop 'props' while
the rest of the object-add QAPIfication series isn't ready yet. Maybe I
should just do that.

Kevin

[1] https://lists.gnu.org/archive/html/qemu-block/2020-11/msg00802.html


