Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591C42D124D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:40:41 +0100 (CET)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGkq-0004ZT-Ek
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmGii-0003iJ-92
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmGid-0000EC-P6
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607348301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+emTEKNZhaiY62rQ0tk28+oQfDj9k2VgCns/wB7AypI=;
 b=MmYvECl6k4MIXBM930896RXDrKW4r/0nVtDcCTG9tG+JUPQ/u512/glBYe6odoggiOrCUj
 LOCceMsvgsutPHmDALnebdhcAmTGo3YPKFCEbaOqtSdrWcfS0gxMZu3b5wHLMIEWXEm9ZM
 qLP38lVlcOf1y0RH3fk70v5dJXPiY7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-xmgaiuT5OzqkKla6GzK5hw-1; Mon, 07 Dec 2020 08:38:19 -0500
X-MC-Unique: xmgaiuT5OzqkKla6GzK5hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD539107ACE3;
 Mon,  7 Dec 2020 13:38:18 +0000 (UTC)
Received: from gondolin (ovpn-113-45.ams2.redhat.com [10.36.113.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BCF65D9DC;
 Mon,  7 Dec 2020 13:38:10 +0000 (UTC)
Date: Mon, 7 Dec 2020 14:38:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] tests/acceptance: enhance s390x devices test
Message-ID: <20201207143808.74dbc3c8.cohuck@redhat.com>
In-Reply-To: <20201130180216.15366-1-cohuck@redhat.com>
References: <20201130180216.15366-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Nov 2020 19:02:13 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> This series builds upon the new s390x acceptance test currently
> queued on my s390-next branch.
> 
> Sadly, the kernel/initrd I'm using does not have the virtio-net driver,
> so I cannot test things like mac address specification etc. Instead,
> I added some quick checks regarding legacy virtio and propagation of
> device type and fid properties.
> 
> Next up: maybe some device plug/unplug tests; but I still need to find
> some inspiration there.
> 
> [And yes, I know that checkpatch moans about long lines -- hard to avoid
> if you use a function with a very long name.]
> 
> Cornelia Huck (3):
>   tests/acceptance: test virtio-ccw revision handling
>   tests/acceptance: verify s390x device detection
>   tests/acceptance: test s390x zpci fid propagation
> 
>  tests/acceptance/machine_s390_ccw_virtio.py | 41 ++++++++++++++++++---
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> 
> base-commit: 875a99a0354211276b6daf635427b3c52a025790

Queued to s390-next (with some overlong lines fixed up.)


