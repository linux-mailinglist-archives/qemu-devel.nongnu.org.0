Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C780E30D75A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:21:45 +0100 (CET)
Received: from localhost ([::1]:57134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FI8-0005J2-T3
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7FES-0001FQ-46
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7FEQ-0003Rg-Ew
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612347473;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8a2P8LooqMk4dH0PQENPKcBki7Xd9n/LgcyC/M/dOyc=;
 b=HFEKOpGMlN+m3c2JqCxxLBwy8xkEEDrw9qPelR0jfqFaYVuHalCwjii2OoEzzk87lBXcVC
 HqbE+b3pU98sAEH4Q90VznP3INHwATIcbDwfNogLAbDZS+Kb4wOcCSFNI83fXI7TVJ/YMb
 G9FJ0UC50HpCWbs2skU3r4swhtsr2ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-bl64Y7ytM7GuagmdpSKJjQ-1; Wed, 03 Feb 2021 05:17:52 -0500
X-MC-Unique: bl64Y7ytM7GuagmdpSKJjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D3CC8030B3;
 Wed,  3 Feb 2021 10:17:50 +0000 (UTC)
Received: from redhat.com (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30AC25D9E8;
 Wed,  3 Feb 2021 10:17:17 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:17:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/12] qga: Rename config key 'blacklist' as 'denylist'
Message-ID: <20210203101715.GJ300990@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202205824.1085853-3-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 09:58:14PM +0100, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  docs/interop/qemu-ga.rst   |  2 +-
>  qga/main.c                 | 15 +++++++++++----
>  tests/test-qga.c           |  8 ++++----
>  tests/data/test-qga-config |  2 +-
>  4 files changed, 17 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
> index 3063357bb5d..9a590bf95cb 100644
> --- a/docs/interop/qemu-ga.rst
> +++ b/docs/interop/qemu-ga.rst
> @@ -125,7 +125,7 @@ pidfile        string
>  fsfreeze-hook  string
>  statedir       string
>  verbose        boolean
> -blacklist      string list
> +denylist       string list
>  =============  ===========
>  
>  See also
> diff --git a/qga/main.c b/qga/main.c
> index e7f8f3b1616..249fe06e8e5 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -962,6 +962,7 @@ static void config_load(GAConfig *config)
>      GError *gerr = NULL;
>      GKeyFile *keyfile;
>      g_autofree char *conf = g_strdup(g_getenv("QGA_CONF")) ?: get_relocated_path(QGA_CONF_DEFAULT);
> +    const gchar *denylist_key = "denylist";
>  
>      /* read system config */
>      keyfile = g_key_file_new();
> @@ -1008,10 +1009,16 @@ static void config_load(GAConfig *config)
>          config->retry_path =
>              g_key_file_get_boolean(keyfile, "general", "retry-path", &gerr);
>      }
> +
>      if (g_key_file_has_key(keyfile, "general", "blacklist", NULL)) {
> +        g_warning("config using deprecated 'blacklist' key, now replaced"
> +                  " by the 'denylist' key.");

We should document the config file option deprecation in the norma
place for deprecations.

> +        denylist_key = "blacklist";
> +    }

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


