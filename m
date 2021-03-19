Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176434202B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:52:39 +0100 (CET)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGUQ-0002dm-B6
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGRv-00014L-7w
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNGRt-0002Jk-5d
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616165400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L56Uxf+Aq7Gol9gc/JP7JcoRvL+14YL89FeEtOzIU0s=;
 b=fHe4l8AMh7P5IqtWPmOkoWzdZhHAtW82hEXSrRc30CX2FSCyxuELljD72T4/+JxLxw8SMO
 R0ca3ivgyDBA7NFx8Nl9dUko2ff3EQt9r1EwUHyu7YCPDifMOAi1sBkTQ3XoSNmFUdYcBi
 m07Sox/WT8CWUnJDY9+lgIGUFy6vzYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-tAF4OcLxMiqldjwBBt2kmQ-1; Fri, 19 Mar 2021 10:49:58 -0400
X-MC-Unique: tAF4OcLxMiqldjwBBt2kmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98162874998;
 Fri, 19 Mar 2021 14:49:57 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D48560C04;
 Fri, 19 Mar 2021 14:49:54 +0000 (UTC)
Date: Fri, 19 Mar 2021 15:49:52 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 4/6] iotests: Revert "iotests: use -ccw on s390x for
 040, 139, and 182"
Message-ID: <20210319154952.35368af5.cohuck@redhat.com>
In-Reply-To: <20210319132537.2046339-5-laurent@vivier.eu>
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-5-laurent@vivier.eu>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 14:25:35 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Commit f1d5516ab583 introduces a test in some iotests to check if
> the machine is a s390-ccw-virtio and to select virtio-*-ccw rather
> than virtio-*-pci.
> 
> We don't need that because QEMU already provides aliases to use the correct
> virtio interface according to the machine type.
> 
> This patch removes all virtio-*-pci and virtio-*-ccw to use virtio-*
> instead. This also enables virtio-mmio devices (virtio-*-device)
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> cc: Cornelia Huck <cohuck@redhat.com>
> ---
>  tests/qemu-iotests/040        |  2 +-
>  tests/qemu-iotests/051        | 12 +-----------
>  tests/qemu-iotests/051.out    |  2 +-
>  tests/qemu-iotests/051.pc.out |  2 +-
>  tests/qemu-iotests/068        |  4 +---
>  tests/qemu-iotests/093        |  3 +--
>  tests/qemu-iotests/139        |  9 ++-------
>  tests/qemu-iotests/182        | 13 ++-----------
>  tests/qemu-iotests/238        |  4 +---
>  tests/qemu-iotests/240        | 10 +++++-----
>  tests/qemu-iotests/257        |  4 ++--
>  tests/qemu-iotests/307        |  4 +---
>  tests/qemu-iotests/iotests.py |  5 -----
>  13 files changed, 19 insertions(+), 55 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


