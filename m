Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C2653EDFB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 20:42:21 +0200 (CEST)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyHgC-0000eP-DC
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 14:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyHbi-0005dj-O5
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyHbf-0005vX-EE
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654540657;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=liz7xteDRHmqMU1J2eoIAr+aQA74Fq/gw05FT3qzEpQ=;
 b=R+LcUxpRAox0QOd8ff1Uju+2Gf5hJWjjUAwSvyTBOZo8NfWfFQABH162fQW8syuIDQ98RD
 nnsp22ad2OH1j+3tTCITFCBnCsAzcaKpU/WayqbWzNGm/WGabu4At4Wj3S36KrorErGiLl
 wgo7vAe94nIYe79A6dNv1d8mSqyLu2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-AQ0nD263OaeZQbo9yxVrAQ-1; Mon, 06 Jun 2022 14:37:36 -0400
X-MC-Unique: AQ0nD263OaeZQbo9yxVrAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AEE9801228;
 Mon,  6 Jun 2022 18:37:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 640BE1415100;
 Mon,  6 Jun 2022 18:37:35 +0000 (UTC)
Date: Mon, 6 Jun 2022 19:37:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com
Subject: Re: [PATCH] gitlab-ci: Extend timeout for ubuntu-20.04-s390x-all to
 75m
Message-ID: <Yp5Jbd9UhSEF7ljj@redhat.com>
References: <20220606182436.410053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220606182436.410053-1-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 06, 2022 at 11:24:36AM -0700, Richard Henderson wrote:
> Recent runs have been taking just over the 60m default.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> index 4f292a8a5b..9f1fe9e7dc 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> @@ -31,6 +31,7 @@ ubuntu-20.04-s390x-all:
>   - s390x
>   variables:
>      DFLTCC: 0
> + timeout: 75m
>   rules:
>   - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>   - if: "$S390X_RUNNER_AVAILABLE"

I'm not entirely convinced the problem is a slow build, as opposed to
a stuck test suite job. ie a genuine (non-deterministic) bug.

The last few successfull builds I can see took 46 minutes which is
well inside the 60 min timeout, especially considering we have a
dedicated build host which should be reliable in having capacity
available.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


