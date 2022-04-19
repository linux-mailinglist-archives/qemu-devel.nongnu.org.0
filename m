Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229D7506B66
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:49:26 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmMG-0004bR-T0
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngmJp-000384-TK
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:46:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngmJm-0007rs-6L
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650368808;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FmtIly70gWxAdH7ilCfhOQj8ffk6K0wSqVZFvYofmEQ=;
 b=DA5mvcqZu+pWqDsEB3ma8cGm4AcLUsi4aQfT1flxZNQNuksGMfHFn0y6v3B98z28fD4evj
 KCMkqvR+kv1TsYLUkW+Zne76cysyI3/mA4BBDd8W48yjAvzrYxZ195HVZ5Fapung5/Mwwr
 SRTjLsRldWXKifBvn987z9uSrae2EPw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-hAGCH4gzPhaq3Sbs8TflBQ-1; Tue, 19 Apr 2022 07:46:47 -0400
X-MC-Unique: hAGCH4gzPhaq3Sbs8TflBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56E123C13A0A
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:46:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73B694104968;
 Tue, 19 Apr 2022 11:46:46 +0000 (UTC)
Date: Tue, 19 Apr 2022 12:46:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] remove -writeconfig
Message-ID: <Yl6hI1MHG0p2yF/o@redhat.com>
References: <20220414145721.326866-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220414145721.326866-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 10:57:21AM -0400, Paolo Bonzini wrote:
> Like -set and -readconfig, it would not really be too hard to
> extend -writeconfig to parsing mechanisms other than QemuOpts.
> However, the uses of -writeconfig are substantially more
> limited, as it is generally easier to write the configuration
> by hand in the first place.  In addition, -writeconfig does
> not even try to detect cases where it prints incorrect
> syntax (for example if values have a quote in them, since
> qemu_config_parse does not support any kind of escaping.
> Just remove it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/about/deprecated.rst       |  7 ------
>  docs/about/removed-features.rst |  6 +++++
>  include/qemu/config-file.h      |  1 -
>  qemu-options.hx                 |  8 ++-----
>  softmmu/climain.c               | 20 ----------------
>  util/qemu-config.c              | 42 ---------------------------------
>  6 files changed, 8 insertions(+), 76 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


