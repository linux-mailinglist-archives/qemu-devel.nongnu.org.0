Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B766835BE85
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 11:01:50 +0200 (CEST)
Received: from localhost ([::1]:36868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsS5-0000ZU-QU
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 05:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lVsQ4-00005t-P6
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lVsPz-0004QO-Ui
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618217977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBG61mCbBkyCMaaihLTVvrhh1pgW3liLE7o9yTXBt7Q=;
 b=ejfM4JgNU0g9uZeixXPUJy1W19BKaxVMWRTtpiUYah7ZRpUyBOu5R+uNo53KV49HoXtMxW
 Fbmr2uIGpSNwiusiCsfRjwLMWdYVpTYylcGY/0QeviBcWcBZ+XOwDnc/AJ02gvezU9GKEF
 vY18MUKzRO4q07Yg8UCw+BvJaoKNVZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-htJPp1teOESFU2UpJjkBWA-1; Mon, 12 Apr 2021 04:59:35 -0400
X-MC-Unique: htJPp1teOESFU2UpJjkBWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27DC88CBA39;
 Mon, 12 Apr 2021 08:59:21 +0000 (UTC)
Received: from redhat.com (ovpn-115-78.ams2.redhat.com [10.36.115.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3FB719C59;
 Mon, 12 Apr 2021 08:59:18 +0000 (UTC)
Date: Mon, 12 Apr 2021 09:59:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: gitlab-ci check-dco test
Message-ID: <YHQL4myfgY72EZ9/@redhat.com>
References: <524450fb-2baa-12de-710a-3e05ea1f3f25@linaro.org>
 <a5fbeeb4-2985-d3c7-148c-b942cf4fcd16@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a5fbeeb4-2985-d3c7-148c-b942cf4fcd16@amsat.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 10, 2021 at 11:03:19AM +0200, Philippe Mathieu-Daudé wrote:
> On 4/10/21 4:58 AM, Richard Henderson wrote:
> > On development branches, it's not uncommon to push
> > temporary --fixup patches, and normally one doesn't
> > sign those.  But then of course one get hate-mail
> > from the gitlab-ci job about the failing test.
> > 
> > Is there a way to make it fatal on staging, but
> > merely a warning on other branches (a-la checkpatch)?
> 
> To only run check-dco on branch /staging on any namespace:
> 
> -- >8 --
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3480d79db3a..f0d21da57f0 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -781,9 +781,9 @@ check-dco:
>    needs:
>      job: amd64-centos8-container
>    script: .gitlab-ci.d/check-dco.py
> -  except:
> +  only:
>      variables:
> -      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH ==
> 'master'
> +      - $CI_COMMIT_BRANCH == 'staging'
>    variables:
>      GIT_DEPTH: 1000

Definitely don't want that - it skips the DCO check entirely on all
branches except 'staging'. We want contributors to see the missing
SoB on any of their branches *before* they send them to qemu-devel
at all.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


