Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E702D980F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:37:23 +0100 (CET)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kon6Q-00075a-4o
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kon4r-0006CG-0c
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:35:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kon4o-0001My-Nh
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607949341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NW2RBYv2N1AY8BXcmhrd57hNyd+c2yGXliPbJ6rcPbM=;
 b=XMoAOeEw5flWe7W400tVjnyZ2d/0+crgdp0a1KH2ZxkgL/ab3TPlG+g5+HqJl2k70z24Qb
 MKI5LUzkotnYv5usr4vB4KAaAwYZNgn7ZDwFfX99nlny/8o2Y6aK35hOGkphTRZ/Obz6p1
 RyREi0zQfb/NccL9Fe+ZUaZEeJE3XWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347--0OULiIbOaWXqiVWKiDM1g-1; Mon, 14 Dec 2020 07:35:39 -0500
X-MC-Unique: -0OULiIbOaWXqiVWKiDM1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3385C1015C80;
 Mon, 14 Dec 2020 12:35:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A7191001B2C;
 Mon, 14 Dec 2020 12:35:30 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] gitlab-ci: Step in to maintain the
 fedora-i386-cross runner
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20201211171703.537546-1-philmd@redhat.com>
 <20201211171703.537546-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fe1213a5-a706-adaf-25a7-8323f42239da@redhat.com>
Date: Mon, 14 Dec 2020 13:35:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211171703.537546-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 18.17, Philippe Mathieu-Daudé wrote:
> As I am interested in using the runner based on the fedora-i386-cross
> docker image, add a smoke test job to be sure this image is usable,
> and set the JOB_MAINTAINER_NAME/JOB_MAINTAINER_EMAIL variables so
> other developers can contact me in case there is a problem with the
> public runner based on this image.
> 
> We will eventually send a patch to make script/checkpatch.pl parse
> the Gitlab YAML jobs to understand the JOB_MAINTAINER_NAME and
> JOB_MAINTAINER_EMAIL variables.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index bd6473a75a7..864cad7cec5 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -39,6 +39,13 @@
>        ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
>      - make -j$(expr $(nproc) + 1) all check-build
>  
> +.cross_sanity_check_job:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  timeout: 3m
> +  script:
> +    - /bin/true

I guess it makes more sense if I respin my patch here instead:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg762919.html

?

 Thomas


