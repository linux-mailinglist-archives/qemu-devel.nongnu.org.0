Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4947430D790
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:31:39 +0100 (CET)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FRi-00029p-9y
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7FOz-00006v-Pk
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:28:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7FOy-0008Te-65
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612348126;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zg3CMFz8kPgmp6u9HGBkVNKI/3kqWjMIRaFOoHro+Q0=;
 b=flGApf1n5GafiNXAQ2lecV6SDKOD6EXvXM8wcxIyiVIa+EsSi0hKC4jrvcdEnqFWx7YBw9
 kOWDyPFS2rqXZsLTlGf4seN+5/Af0LfNmkGaZY3Krjo6TBQ5vtnCF9qocdhrFX1yPE6g38
 ytz9wcrHvG7QEvmy2pAb/U2S/xhkqmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-TWESD4UaNuWrZ8KyCLkdCA-1; Wed, 03 Feb 2021 05:28:40 -0500
X-MC-Unique: TWESD4UaNuWrZ8KyCLkdCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92FBE100C661;
 Wed,  3 Feb 2021 10:28:39 +0000 (UTC)
Received: from redhat.com (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE0677771D;
 Wed,  3 Feb 2021 10:28:11 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:28:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 10/12] tests/qemu-iotests: Replace the words
 'blacklist/whitelist'
Message-ID: <20210203102757.GL300990@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-11-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202205824.1085853-11-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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

On Tue, Feb 02, 2021 at 09:58:22PM +0100, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "blacklist"
> and "whitelist" appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qemu-iotests/149     | 14 +++++++-------
>  tests/qemu-iotests/149.out |  8 ++++----
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
> index 328fd05a4c9..b1d3f5fad67 100755
> --- a/tests/qemu-iotests/149
> +++ b/tests/qemu-iotests/149
> @@ -500,7 +500,7 @@ configs = [
>  
>  ]
>  
> -blacklist = [
> +denylist = [
>      # We don't have a cast-6 cipher impl for QEMU yet
>      "cast6-256-xts-plain64-sha1",
>      "cast6-128-xts-plain64-sha1",
> @@ -510,17 +510,17 @@ blacklist = [
>      "twofish-192-xts-plain64-sha1",
>  ]

"skiplist" better describes the purpose of this.

>  
> -whitelist = []
> +allowlist = []
>  if "LUKS_CONFIG" in os.environ:
> -    whitelist = os.environ["LUKS_CONFIG"].split(",")
> +    allowlist = os.environ["LUKS_CONFIG"].split(",")

And "filterlist"

>  
>  for config in configs:
> -    if config.name in blacklist:
> -        iotests.log("Skipping %s in blacklist" % config.name)
> +    if config.name in denylist:
> +        iotests.log("Skipping %s in denylist" % config.name)
>          continue
>  
> -    if len(whitelist) > 0 and config.name not in whitelist:
> -        iotests.log("Skipping %s not in whitelist" % config.name)
> +    if len(allowlist) > 0 and config.name not in allowlist:
> +        iotests.log("Skipping %s not in allowlist" % config.name)
>          continue
>  
>      test_once(config, qemu_img=False)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


