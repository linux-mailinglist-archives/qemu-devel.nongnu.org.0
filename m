Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB7232D0F9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:40:32 +0100 (CET)
Received: from localhost ([::1]:46726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlPD-0008Ms-1f
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlN6-0007IV-NC
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlN4-0002yy-UA
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614854297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJ+JYkBurO4w27eFbB4ViLUL++vUaflpwMbs3B/0imQ=;
 b=TTRDNVznQAshQjpzaClMxv+8WtRYZ4BlCpDZxx1c6GIk02MxWGJfVYSSWkMnr2QMyTh7fN
 m9eCCuvGMs66oIUTHzytELx1Mmch7S21NrvZGO5nTvtZ/RVD2tLoD1V9iDyyaD2xFPedXV
 0wVen6bFJNsDlQGNePnQgX/0gf7eOq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-wXuXWvodNX2gsasR7PulEQ-1; Thu, 04 Mar 2021 05:38:14 -0500
X-MC-Unique: wXuXWvodNX2gsasR7PulEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A1180006E;
 Thu,  4 Mar 2021 10:38:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 331A15D720;
 Thu,  4 Mar 2021 10:38:08 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:38:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/2] gitlab-ci.yml: Allow custom # of parallel linkers
Message-ID: <YEC4jaROHvxeL8bS@redhat.com>
References: <20210304030948.9367-1-dbuono@linux.vnet.ibm.com>
 <20210304030948.9367-2-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210304030948.9367-2-dbuono@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 10:09:47PM -0500, Daniele Buono wrote:
> Define a new variable LD_JOBS, that can be used to select
> the maximum number of linking jobs to be executed in parallel.
> If the variable is not defined, maintain the default given by
> make -j
> 
> Currently, make parallelism at build time is based on the number
> of cpus available.
> 
> This doesn't work well with LTO at linking, because with LTO the
> linker has to load in memory all the intermediate object files
> for optimization.
> The end result is that, if the gitlab runner happens to run two
> linking processes at the same time, the job will fail with an
> out-of-memory error,
> 
> This patch leverages the ability to maintain high parallelism at
> compile time, but limit the number of linkers executed in parallel.
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>  .gitlab-ci.yml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


