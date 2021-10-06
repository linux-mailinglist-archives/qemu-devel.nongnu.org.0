Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43D42435E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:50:30 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYA7g-0003de-My
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYA4b-0001vJ-DG
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYA4Y-0003o5-MF
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AU7DER7sW6KscKnUuUWM+Hrx1tSr8sADakJHfy3MNf8=;
 b=JQkZk4ihJvyipPJYCGNnehZFo8tmX51DMdslwbdnZFuXcD1mAYqSO5QFhUf1P07HNDw7ci
 7VkStLmuox9MYcBznZkZhg0tsJjnJmhQr/eZBam95UfHnfkZxHuikHUKOY78rX/kvt1B/B
 YbE6k8g3G1tScsEZPLUpFt4WUaVnRJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-aKHfSb7jNceeFgRSSOPT3A-1; Wed, 06 Oct 2021 12:47:11 -0400
X-MC-Unique: aKHfSb7jNceeFgRSSOPT3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5EA8AF87D;
 Wed,  6 Oct 2021 16:46:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FC1160C05;
 Wed,  6 Oct 2021 16:46:46 +0000 (UTC)
Date: Wed, 6 Oct 2021 18:46:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 1/2] pylint: fix errors and warnings from qemu-tests test
 297
Message-ID: <YV3S9N8SnU4W+aYL@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006130100.389521-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.10.2021 um 15:00 hat Emanuele Giuseppe Esposito geschrieben:
> Test 297 in qemu-iotests folder currently fails: pylint has
> learned new things to check, or we simply missed them.
> 
> All fixes in this patch are related to additional spaces used
> or wrong indentation.
> 
> No functional change intended.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

> @@ -87,13 +87,14 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>          iotests.qemu_img('create', '-f', iotests.imgfmt, self.overlay_img,
>                           '1G')
>  
> -        result = self.vm.qmp('blockdev-add', **{
> +        result = self.vm.qmp('blockdev-add',
> +                             **{
>                                   'node-name': 'overlay',
>                                   'driver': iotests.imgfmt,
>                                   'file': {
>                                       'driver': 'file',
>                                       'filename': self.overlay_img
> -                                 }
> +                                     }
>                               })
>          self.assert_qmp(result, 'return', {})

Am I the only one to think that the new indentation for the closing
brace there is horrible? PEP-8 explictly allows things like:

    my_list = [
        1, 2, 3,
        4, 5, 6,
    ]

Some of the other changes in this patch should be made, but at least if
these are behind different switches, I would consider just disabling the
one that complains about nicely formatted dicts.

Kevin


