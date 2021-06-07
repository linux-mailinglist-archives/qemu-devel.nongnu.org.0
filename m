Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2C39DF43
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:52:09 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGbo-0002hx-0f
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqGao-0001mq-QG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqGal-0003C4-MZ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623077462;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KQaQPp5Gq0tNLM1nY32bXdRFBHq9Nnac4WikS2um94=;
 b=JPLDzzXgs5cVz9byU/YGZL8RaX8lHFJQi+UUxSYu52g7pshcUFYiQmlF5E82g8Sfu75onw
 bZgG0VPsFBQc7PqbHkqkivu7xJtZm9iP/4mbpl8vwKbBAh9EqC0DBkqoReIoT8fJrwAEvL
 xXTXauAp5PkPBfvY7Gh+OSEBPUHVhtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-voy6h4ZtP1GXa5rr86lCAQ-1; Mon, 07 Jun 2021 10:50:59 -0400
X-MC-Unique: voy6h4ZtP1GXa5rr86lCAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F37CE9F92B;
 Mon,  7 Jun 2021 14:50:57 +0000 (UTC)
Received: from redhat.com (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D663B19D9D;
 Mon,  7 Jun 2021 14:50:49 +0000 (UTC)
Date: Mon, 7 Jun 2021 15:50:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL 5/8] gitlab: work harder to avoid false positives in
 checkpatch
Message-ID: <YL4yRyLgD1avZdRE@redhat.com>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
 <20210607143303.28572-6-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210607143303.28572-6-alex.bennee@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 03:33:00PM +0100, Alex Bennée wrote:
> This copies the behaviour of patchew's configuration to make the diff
> algorithm generate a minimal diff.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Message-Id: <20210602153247.27651-1-alex.bennee@linaro.org>
> 
> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
> index 8e30872164..7e685c6a65 100644
> --- a/.gitlab-ci.d/static_checks.yml
> +++ b/.gitlab-ci.d/static_checks.yml
> @@ -3,7 +3,11 @@ check-patch:
>    image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>    needs:
>      job: amd64-centos8-container
> -  script: .gitlab-ci.d/check-patch.py
> +  script:
> +    - git config --local diff.renamelimit 0
> +    - git config --local diff.renames True
> +    - git config --local diff.algorithm histogram
> +    - .gitlab-ci.d/check-patch.py

No objection to merging this patch as is, but I wonder if we ought to
make scripts/checkpatch.pl set these options explicitly when it runs
git, eg

   git -c diff.renamelimit=0 -c diff.renames=True ...etc show

so that everyone who runs checkpatch.pl benefits from the improvement.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


