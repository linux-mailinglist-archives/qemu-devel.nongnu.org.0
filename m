Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E193BBB37
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:26:35 +0200 (CEST)
Received: from localhost ([::1]:32960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LoA-0006b6-If
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0LmU-0005mu-Hv
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0LmR-0008GL-TV
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625480686;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xm604vwA03HG2tKerR/s5Ndhzhdw4f3YOI0iTB0hOu4=;
 b=fPVwwboPnE05+sJzTDCK+iUMfZQjyyfCTGzGW7gizcKCyw9Ny+jDSPUjsu83UTXrlHg9Po
 GPUH9EgGG9pS5+Hj2D1AKaUik67bdSs5YKK6JKrlawAXBIsGfAynb+Cf/m1E1wfkuR2zhD
 haRSlLPQ2Zb9kw5r0/iNLXGmnQXundA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-SgZ4YLBEPSSOHDL8f10gtg-1; Mon, 05 Jul 2021 06:24:45 -0400
X-MC-Unique: SgZ4YLBEPSSOHDL8f10gtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DC5C1800D41;
 Mon,  5 Jul 2021 10:24:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71AAA5D6CF;
 Mon,  5 Jul 2021 10:24:43 +0000 (UTC)
Date: Mon, 5 Jul 2021 11:24:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 4/7] docs: Move deprecation, build and license info out
 of system/
Message-ID: <YOLd6JAztIMgNhoO@redhat.com>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
 <20210705095547.15790-5-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210705095547.15790-5-peter.maydell@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 10:55:44AM +0100, Peter Maydell wrote:
> Now that we have a single Sphinx manual rather than multiple manuals,
> we can provide a better place for "common to all of QEMU" information
> like the deprecation notices, build platforms, license information,
> which we currently have in the system/ manual even though it applies
> to all of QEMU.
> 
> Create a new directory about/ on the same level as system/, user/,
> etc, and move these documents there.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/{system => about}/build-platforms.rst  |  0
>  docs/{system => about}/deprecated.rst       |  0
>  docs/about/index.rst                        | 10 ++++++++++
>  docs/{system => about}/license.rst          |  0
>  docs/{system => about}/removed-features.rst |  0
>  docs/index.rst                              |  1 +
>  docs/system/index.rst                       |  4 ----
>  7 files changed, 11 insertions(+), 4 deletions(-)
>  rename docs/{system => about}/build-platforms.rst (100%)
>  rename docs/{system => about}/deprecated.rst (100%)
>  create mode 100644 docs/about/index.rst
>  rename docs/{system => about}/license.rst (100%)
>  rename docs/{system => about}/removed-features.rst (100%)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

This changes hyperlinks for the pages in question, so it is possible
we might have some links to update somewhere.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


