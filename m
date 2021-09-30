Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB941DFB8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 19:06:30 +0200 (CEST)
Received: from localhost ([::1]:42138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVzVt-0006SV-Jz
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 13:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVzQk-0002qJ-8F
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVzQi-0001ir-Fz
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633021267;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojvuZRd8W5aVx8y87Xwid8nHN/RJuwHiruq3obGcodk=;
 b=N8g2R/3WrXNvvKBKMQujURvg4J3dMtH91NHECoQz1kwOZ2e+7gs4T6tAFe8NePoVlmDDwG
 lm/60RrxqtkYo8VQOCQLUswGFWtaIB25Kn2L4BuNePSF5Uq7JplTwB7M/ssTwdB2Jrhw11
 Rn6lXBhE9w0thFOC1GegL5xSth7JDeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-NkMWHAyKOsC3yQSQUBtzfg-1; Thu, 30 Sep 2021 13:01:05 -0400
X-MC-Unique: NkMWHAyKOsC3yQSQUBtzfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEF15100CCCB;
 Thu, 30 Sep 2021 17:01:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9E8F60BF1;
 Thu, 30 Sep 2021 17:01:02 +0000 (UTC)
Date: Thu, 30 Sep 2021 18:01:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/2] tests/docker: Fix fedora-i386-cross
Message-ID: <YVXtTJWFNgHIovZ0@redhat.com>
References: <20210930163636.721311-1-richard.henderson@linaro.org>
 <20210930163636.721311-3-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210930163636.721311-3-richard.henderson@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 12:36:36PM -0400, Richard Henderson wrote:
> By using PKG_CONFIG_PATH instead of PKG_CONFIG_LIBDIR,
> we were still including the 64-bit packages.  Install
> pcre-devel.i686 to fill a missing glib2 dependency.
> 
> By using --extra-cflags instead of --cpu, we incorrectly
> use the wrong probing during meson.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/docker/dockerfiles/fedora-i386-cross.docker | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


