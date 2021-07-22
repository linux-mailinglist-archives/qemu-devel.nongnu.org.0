Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E913D2F5F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 23:52:34 +0200 (CEST)
Received: from localhost ([::1]:34052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6gcK-00005H-GQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 17:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6gax-0007l3-TX
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 17:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6gas-0001i5-9K
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 17:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626990660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wCbJf5t6koAdEbS56h1J/hzr76hjGcQ2PprMlsWBTcQ=;
 b=I9QyTf4SxfSRArzHl/mZxCHV3QXFRmnlh7xCndWbIGjoX/KxnlhWoZVaAkczqF3jiUoMqB
 yZxvNEaTObc11kFy/maNAffseeyU//99Yji4qWTE+ssuniCPawGCLr1V/iCK9m7H9kzRer
 olzTj02Aoh0SiXtzHlHja5PCXKB/iZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-K6JjVoUqNKunLNIy1s-iiQ-1; Thu, 22 Jul 2021 17:50:59 -0400
X-MC-Unique: K6JjVoUqNKunLNIy1s-iiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4308E190D344;
 Thu, 22 Jul 2021 21:50:58 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3CC604CF;
 Thu, 22 Jul 2021 21:50:50 +0000 (UTC)
References: <20210722192016.24915-1-peter.maydell@linaro.org>
 <20210722192016.24915-2-peter.maydell@linaro.org>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1 1/2] docs: Remove stale TODO comments about
 license and version
In-reply-to: <20210722192016.24915-2-peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 17:50:49 -0400
Message-ID: <87mtqe10hy.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Markus Armbruster <armbru@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell writes:

> Since commits 13f934e79fa and 3a50c8f3067aaf, our HTML docs include a
> footer to all pages stating the license and version.  We can
> therefore delete the TODO comments suggesting we should do that from
> our .rst files.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/interop/qemu-ga-ref.rst                 | 9 ---------
>  docs/interop/qemu-qmp-ref.rst                | 9 ---------
>  docs/interop/qemu-storage-daemon-qmp-ref.rst | 9 ---------
>  3 files changed, 27 deletions(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>


