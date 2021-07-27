Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D422D3D7B0B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:34:36 +0200 (CEST)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Q2N-000308-FV
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m8Q0S-00028X-5J
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m8Q0J-0001FJ-BS
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627403545;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKlvvT/agt56jXTLGbzwu66nWAe3QSQ7fxBwJRMBFAA=;
 b=I85xJd0/QcMkQueAnTjiDfbLgdEaHI3Fp5sim2WDhg7dgItWBfGqfEIAfGLJ0HOAVJC+jD
 r0A4a3K3SIaJwpF8RPfyTZkcJsbqb1otxytkKcN5vCIGbjXOLGQ08ch6s8ly27EtFv4X4w
 tIPgk9UeZTF1ccegnkmlrG4lUys5gsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-6AGZZzs0MAaODy4lW5GuoA-1; Tue, 27 Jul 2021 12:32:18 -0400
X-MC-Unique: 6AGZZzs0MAaODy4lW5GuoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E696190A7A1;
 Tue, 27 Jul 2021 16:32:17 +0000 (UTC)
Received: from redhat.com (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B1AE60C0F;
 Tue, 27 Jul 2021 16:32:07 +0000 (UTC)
Date: Tue, 27 Jul 2021 17:32:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Disable iotests 197 and 215
Message-ID: <YQA1BTjjOwbsDaQx@redhat.com>
References: <20210727162542.318882-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210727162542.318882-1-thuth@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 06:25:42PM +0200, Thomas Huth wrote:
> The iotests 197 and 215 are occasionally failing in the gitlab-CI now.
> According to the log, the failure is "./common.rc: Killed" which might
> be an indication that the process has been killed due to out-of-memory
> reasons. Both tests are doing a big read with 2G that likely causes
> this issue. It used to work fine in the gitlab-CI in the past, but
> either the program is now requiring more free memory, or the the CI
> containers have changed, so that the OOM condition now sometimes occurs.
> 
> Anyway, these two tests are not really suitable for CI containers if
> they are doing things like huge reads (which is likely also the reason
> why they haven't been added to the "auto" group in the past), so let's
> simply disable them in the gitlab-CI now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


