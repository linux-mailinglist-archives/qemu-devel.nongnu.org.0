Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33433BBB1A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:17:52 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Lfj-0001zR-VT
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0Ldl-0008Fx-3k
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0Ldg-0001P7-Gy
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625480143;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vCC9r8Jgi/c6hRhg+4qY4ZxPJUbPA9/w2SLiwGXfnU=;
 b=U8vqvq0qmnPJvRpuKJCSelui4Mbh+POUcmH7Y+UR5l7IeHqod7XCD+jQhPTnJvdrsVRXB1
 raMShsh/I7+SbjuQBl/8xZTjQYePgw0kfFQ2YsnYn/NkvQDJB/N+6y5kZgD94gWlVK3oXI
 L588NB4Ep6VJssIjw2KQPFJq4IVEJsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Z1XPTRcGNl22w2mkvV42jA-1; Mon, 05 Jul 2021 06:15:42 -0400
X-MC-Unique: Z1XPTRcGNl22w2mkvV42jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F6296A7;
 Mon,  5 Jul 2021 10:15:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C52960864;
 Mon,  5 Jul 2021 10:15:40 +0000 (UTC)
Date: Mon, 5 Jul 2021 11:15:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/7] docs: Stop calling the top level subsections of our
 manual 'manuals'
Message-ID: <YOLbySzbyAhmZWHw@redhat.com>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
 <20210705095547.15790-3-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210705095547.15790-3-peter.maydell@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Mon, Jul 05, 2021 at 10:55:42AM +0100, Peter Maydell wrote:
> We merged our previous multiple-manual setup into a single Sphinx
> manual, but we left some text in the various index.rst lines that
> still calls the top level subsections separate 'manuals'.  Update
> them to talk about "this section of the manual" instead, and remove
> now-obsolete comments about how the index.rst files are the "top
> level page for the 'foo' manual".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/index.rst   | 5 +----
>  docs/interop/index.rst | 7 ++-----
>  docs/specs/index.rst   | 5 ++---
>  docs/system/index.rst  | 5 +----
>  docs/tools/index.rst   | 5 ++---
>  docs/user/index.rst    | 5 +----
>  6 files changed, 9 insertions(+), 23 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


