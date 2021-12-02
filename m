Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370746629C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 12:43:07 +0100 (CET)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mskUT-0001u9-Mm
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 06:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mskTb-000174-Nb
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:42:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mskTY-0005qT-DE
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 06:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638445326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CAcv9hTvHxTNGsIQudOojHl8pDjaYoJP8wr4tabl4Ro=;
 b=DowAwC8HSkAXWN21y9+CsnO9vkhy0o5OmVUp0uUSKTl+1dMQ4uDTZPDzH3iKppC3Rvp60P
 XwAHiiwX/PnZiTP2anjQUnT1Gp6u5ajnf9cCfR1LxCBdnjGlViZnYkA+qE9rcspNg7EHEa
 bfB14nClBfFRVUXjHH/F5UwXUBobVfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-ArfyEKzOPx6ZHKRVIr4flA-1; Thu, 02 Dec 2021 06:42:05 -0500
X-MC-Unique: ArfyEKzOPx6ZHKRVIr4flA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 715DE101C7A0;
 Thu,  2 Dec 2021 11:42:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2541E77E21;
 Thu,  2 Dec 2021 11:42:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4C16D180079A; Thu,  2 Dec 2021 12:42:02 +0100 (CET)
Date: Thu, 2 Dec 2021 12:42:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] edid: set default resolution to 1280x800 (WXGA)
Message-ID: <20211202114202.f3wdrrqg6lxodj4b@sirius.home.kraxel.org>
References: <20211129140508.1745130-1-berrange@redhat.com>
 <CAFEAcA9VG8d3AnCSDEGjBaMwrk1yAbtCAUa9wTEURX22rNag9g@mail.gmail.com>
 <YaiorC0d/6FwYf0Y@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YaiorC0d/6FwYf0Y@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> The virtio-gpu change I'm not so sure about - it feeds into the
> EDID code, but not sure if it has other consequences that matter
> from a guest ABI pov.

virtio-gpu has two ways to query the display resolution (one predating
edid support), the change will affect both.  The effect will be simliar
in both cases: The next time the guest queries the resolution (typically
on reboot) it'll get the new default.

take care,
  Gerd


