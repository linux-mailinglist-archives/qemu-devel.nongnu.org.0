Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C1340241
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:42:02 +0100 (CET)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpAH-0004Ie-Au
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMp2n-00039G-6D
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMp2l-0004xn-CB
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616060054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2xz9a+4qFZYG+V+JSyN4TyVQvYav407sbGXSNeSqnY=;
 b=G1gjtF6KQuUi+idHjgHqrbzP6ZpCbKjj4bR3P2dKwB0NsLGbknFLeRo/V5PcXlfHEECmQt
 f7wnDteMM2joe9KfIwYkYMawwobiLJe88OFaji5qeurGTkSwtxliir+PrqUxygHJaILqF3
 GcZlkoq3w1o+Jitje/lB3t3azEIeEQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-GhpXDpxFO6Oud80hWjzuKA-1; Thu, 18 Mar 2021 05:34:04 -0400
X-MC-Unique: GhpXDpxFO6Oud80hWjzuKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD7C5B365;
 Thu, 18 Mar 2021 09:34:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D5F650AD5;
 Thu, 18 Mar 2021 09:33:58 +0000 (UTC)
Date: Thu, 18 Mar 2021 09:33:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YFMegwL6SXX2/+kZ@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
MIME-Version: 1.0
In-Reply-To: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 09:29:32PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> For some (unclear) reason I got my free tier Gitlab account renewed and
> lost the privilege for users opening account before the quota limit.
> 
> I pushed a single branch to my namespace repo to trigger a pipeline.
> 1h later I was surprised to see the pipeline was stuck, having completed
> 99 jobs of 119. Looking closer there is a red comment on top of the
> pipeline:
> 
>  philmd has exceeded its pipeline minutes quota. Unless you buy
>  additional pipeline minutes, no new jobs or pipelines in its projects
>  will run. [Buy more Pipelines minutes]
> 
> So I exhausted my 400 monthly minutes credit.
> 
> From this FAQ:
> https://about.gitlab.com/pricing/faq-consumption-cicd/#managing-your-cicd-minutes-usage
> 
> Q. What happens if I hit the CI/CD Minutes allotted limit and forget to
> purchase additional CI/CD Minutes?
> 
> A. You will not be able to run new jobs until you purchase additional
> CI/CD Minutes, or until the next month when you receive your monthly
> allotted CI/CD Minutes.
> 
> Q. Will I be notified before I hit my limit on CI/CD Minutes?
> 
> A. You will receive notification banners in-app when your group has less
> than 30%, 5% or exceeded your total allotted CI/CD minutes.
> 
> I indeed received 3 warnings in 7 minutes.
> 
> Now I'm having serious doubts about Gitlab usefulness for the QEMU
> community...

Per the discussions in the related Forum postings about CI limites, the
400 minute limit is still only intended to apply to projects that are
marked as private.  Public projects are not even being tracked for
accounting, let alone have a limit enforced. They also said they want
to make sure they don't impact ability of users to contribute to OSS
projects hosted on GitLab that require use of CI.

It feels like what you hit here is fallout from your account accidentally
getting blocked, rather than something which is hitting every contributor
to QEMU. Did they restore projects as private perhaps ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


