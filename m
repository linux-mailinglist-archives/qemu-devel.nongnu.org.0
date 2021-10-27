Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9005A43C7A8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:29:06 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfgB7-0000aA-Fv
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfg7x-0008BP-Qv
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfg7U-0008Ss-7u
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635330311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LyET6wEKauLYafpwUWePoWK3EQMgxUW2+ix+cFlkhQ=;
 b=L5yOjX62SL7l0TIB8SdqU5H/GSid1uykURjAMXHkT98LAX7SzTw0Y2v1vpT4wFbsofn7c4
 ASqFzy7YvM//2d/NP+oYDt/ZFMKFZPjH1/ml6ampBwz9GTMmFc4p3yPfC3kTNneHfp3gYr
 ryFXlmRgx/UrtJ72tw30pMh1qGSo3T0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-HreWdrNqOIifBsRglv093g-1; Wed, 27 Oct 2021 06:25:03 -0400
X-MC-Unique: HreWdrNqOIifBsRglv093g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3D0D10B3940;
 Wed, 27 Oct 2021 10:25:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DFF462A41;
 Wed, 27 Oct 2021 10:24:59 +0000 (UTC)
Date: Wed, 27 Oct 2021 11:24:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.0.1 0/2] gitlab-ci: Only push docker images to
 mainstream registry from /master
Message-ID: <YXko+T1rsVqtSZ5g@redhat.com>
References: <20211027052656.1275436-1-philmd@redhat.com>
 <YXkSm13RTFCWyWxR@redhat.com>
 <6a9cfd05-e2fd-0091-44c8-25f7229d5877@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6a9cfd05-e2fd-0091-44c8-25f7229d5877@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 12:09:39PM +0200, Philippe Mathieu-Daudé wrote:
> +Richard/Peter
> 
> On 10/27/21 10:49, Daniel P. Berrangé wrote:
> > On Wed, Oct 27, 2021 at 07:26:54AM +0200, Philippe Mathieu-Daudé wrote:
> >> Hi Michael,
> >>
> >> 2 more patches to avoid gitlab-ci mayhem when you push the
> >> stable tags. See this cover for more info:
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg846861.html
> > 
> > Please don't push this to stable - Thomas points out that it is broken
> > when any changes to dockerfiles are made.
> 
> But we still don't want to update the registry with these old
> images...
> 
> What is the plan then, hold the stable tag until we figure out
> the best fix?
> 
> Otherwise Michael can use 'git-push --push-option=ci.skip' to
> not trigger a CI pipeline when pushing stable tags (running
> CI pipelines previously in his own gitlab namespace).

Yes, I'd suggest that approach currently, until we figure out a
real long term solution.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


