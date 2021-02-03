Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D530D71D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:12:31 +0100 (CET)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7F9B-0002Sz-Pz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7F78-0001oa-6B
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:10:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7F73-0008TT-24
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612347014;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRDtz4vW5rgy/kI5mj/sLtzBFoxpGHktZKrA1O1UdIA=;
 b=ioYOVkQLotxvR6rHa5l4xsJC4vkQYvggDohzApG9DJ2kwm691h3D24ofmdrqNTh7YQIGXE
 9EAt5uwmLryCKk8kGjh4daE9pLv66LTNQG+v+lFyENpMNqvqAeGFN+CqhLFxYl0jaG/eIG
 8QfuykI3f4ME+K4afSgnzZ2eJn7XVq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-PvkLdqi5PyG-UP6YhENqzQ-1; Wed, 03 Feb 2021 05:10:13 -0500
X-MC-Unique: PvkLdqi5PyG-UP6YhENqzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A94918A0834;
 Wed,  3 Feb 2021 10:10:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 669DE722D1;
 Wed,  3 Feb 2021 10:09:55 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:09:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/12] qga: Replace '--blacklist' command line option by
 '--denylist'
Message-ID: <20210203100952.GD300990@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202205824.1085853-4-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Tue, Feb 02, 2021 at 09:58:15PM +0100, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> Keep the --blacklist available for backward compatibility.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  docs/interop/qemu-ga.rst | 2 +-
>  qga/main.c               | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
> index 9a590bf95cb..89596e646de 100644
> --- a/docs/interop/qemu-ga.rst
> +++ b/docs/interop/qemu-ga.rst
> @@ -79,7 +79,7 @@ Options
>  
>    Daemonize after startup (detach from terminal).
>  
> -.. option:: -b, --blacklist=LIST
> +.. option:: -b, --denylist=LIST
>  
>    Comma-separated list of RPCs to disable (no spaces, ``?`` to list
>    available RPCs).
> diff --git a/qga/main.c b/qga/main.c
> index 249fe06e8e5..66177b9e93d 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -257,7 +257,8 @@ QEMU_COPYRIGHT "\n"
>  #ifdef _WIN32
>  "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
>  #endif
> -"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
> +"  --blacklist       backward compatible alias for --denylist (deprecated)\n"
> +"  -b, --denylist    comma-separated list of RPCs to disable (no spaces, \"?\"\n"


"-b" is a bit odd as a short name now, but i guess that's not the end
of the world.

The deprecation should be documented though. Ideally we would report
a warning if the deprecated long arg was used too.

>  "                    to list available RPCs)\n"
>  "  -D, --dump-conf   dump a qemu-ga config file based on current config\n"
>  "                    options / command-line parameters to stdout\n"
> @@ -1111,7 +1112,8 @@ static void config_parse(GAConfig *config, int argc, char **argv)
>          { "method", 1, NULL, 'm' },
>          { "path", 1, NULL, 'p' },
>          { "daemonize", 0, NULL, 'd' },
> -        { "blacklist", 1, NULL, 'b' },
> +        { "denylist", 1, NULL, 'b' },
> +        { "blacklist", 1, NULL, 'b' }, /* deprecated alias for 'denylist' */
>  #ifdef _WIN32
>          { "service", 1, NULL, 's' },
>  #endif
> -- 
> 2.26.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


