Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63162D574
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:49:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovaZR-0006IV-K3; Thu, 17 Nov 2022 03:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovaZP-0006Hx-P5
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovaZN-0005Tu-Ki
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668674904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=t4V2Mr09jLsGywIzEiqocsFUNSvVmwsB6lK91k70Mu8=;
 b=TAG03oZ0WRpwTiWTDW6ZZyuxFX0MPf6H8pJskIPptY0fbukARaRLM0vtI8QdyHzd4IdPdJ
 ugT045zIgS/HNKFbm2Mtsvi9zcTgQP/a2g47TtMyxJ7ky/NKpHSXj91EOlKWSxJOGxFYjz
 Q7/PBTbYxa4/fcAwf7v41v9et1FTdZ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-Mkl2eDP8NDuTbRPZKf9CGQ-1; Thu, 17 Nov 2022 03:48:23 -0500
X-MC-Unique: Mkl2eDP8NDuTbRPZKf9CGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0C24101A528;
 Thu, 17 Nov 2022 08:48:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5122D42222;
 Thu, 17 Nov 2022 08:48:21 +0000 (UTC)
Date: Thu, 17 Nov 2022 08:48:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] acpi/tests/avocado/bits: don't remove the work directory
 when V is in env
Message-ID: <Y3X1UKtTm1G5dBBu@redhat.com>
References: <20221117074629.526448-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221117074629.526448-1-ani@anisinha.ca>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 17, 2022 at 01:16:29PM +0530, Ani Sinha wrote:
> Debugging bits issue often involves running the QEMU command line manually
> outside of the avocado environment with the generated ISO. Hence, its
> inconvenient if the iso gets cleaned up after the test has finished. This change
> makes sure that the work directory is kept after the test finishes if the test
> is run with V=1 in the environment so that the iso is available for use with the
> QEMU command line.
> 
> CC: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a76..7657343f2a 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -354,7 +354,11 @@ def tearDown(self):
>          if self._vm:
>              self.assertFalse(not self._vm.is_running)
>          self.logger.info('removing the work directory %s', self._workDir)
> -        shutil.rmtree(self._workDir)
> +        if not os.getenv('V'):
> +            shutil.rmtree(self._workDir)
> +        else:
> +            self.logger.info('not removing the work directory %s as V is ' \
> +                             'passed in the environment', self._workDir)
>          super().tearDown()

I don't think it is a good idea to hook into 'V=1'.

That is something commonly used simply to get a record of the verbose
build process. It shouldn't affect the functional operation at all.
So leaving around undeleted state is an undesirable side effect.

If you want a means for debugging invent a new env variable such
as BIOSBITS_DEBUG=1 or whatever name..

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


