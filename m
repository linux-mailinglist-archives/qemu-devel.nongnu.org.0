Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49642436F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:54:49 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYABs-00015W-5g
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYA8e-0006kg-Cm
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYA8c-0000Ro-Uf
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633539086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5dLKFFWhkJkrgt/40flhoRbuf39WeCvRZc/YokmXB9c=;
 b=WlZ4oosVTOvTnk2dHft2W8MYK3ybqfYX3J//h0ikpNEIyX7nWtFY1DtxVFirILIoePKXNx
 TNzLtcbliORQrOICs3wo5DRDUQ43dVVpANdz60M3D7yVz0RYm/H1i8lh53HRRfJOV2GN6B
 xsJMdlO9HMh6qHDU4Hp7XkwJhe6/+Ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-7jblIf9MM8ylQbsa0IVu5A-1; Wed, 06 Oct 2021 12:51:25 -0400
X-MC-Unique: 7jblIf9MM8ylQbsa0IVu5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FE219251A8;
 Wed,  6 Oct 2021 16:51:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CD9960853;
 Wed,  6 Oct 2021 16:51:23 +0000 (UTC)
Date: Wed, 6 Oct 2021 18:51:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 2/2] qemu-iotests: fix image-fleecing pylint errors
Message-ID: <YV3UCaO5oJU2TeIR@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
 <20211006130100.389521-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006130100.389521-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Am 06.10.2021 um 15:01 hat Emanuele Giuseppe Esposito geschrieben:
> The problem here is that some variables are formatted with
> unnecessary spaces to make it prettier and easier to read.
> 
> However, pylint complains about those additional spaces.
> A solution is to transform them as string with arbitrary spaces,
> and then convert it back into a tuple.
> 
> Removing the spaces makes it a little bit ugly, and directly
> using the string forces us to change the test reference output
> accordingly, which will 1) contain ugly weird formatted strings,
> 2) is not portable if somebody changes the formatting in the test
> string.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Changing our logic because of a style checker feels wrong. I'd rather
stick in a line like this before the definitions:

# pylint: disable=bad-whitespace

(Not sure if the syntax of this is entirely correct, but from the
comment in your patch and existing uses in iotests, I think this would
be the line.)

Kevin


