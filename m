Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B033ED328
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:37:06 +0200 (CEST)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFavR-0006rd-A1
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFau7-0005np-I1
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFau3-0004gR-NY
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629113737;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvrMto4GFi4h84tApn1rmv0QQK8XwFfXO3zPyEyugOY=;
 b=frUcrlrlKczlZnFKmrQGRW8PJlkgF7D02GiKPn/715r1weQVdSioSJdT8oNZxFvol3yLzT
 l8vV4lj+UHW8QCQ2px4NGxuQTe+gGX2aQiKjuh59GwDFiRN/wk8dnmK5743dvew/InbdXb
 HVR1YTm96bsJQMZrkJ+eSBVO07PMabw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-8ZT8vUMpN1KToUT1lvoR-A-1; Mon, 16 Aug 2021 07:35:31 -0400
X-MC-Unique: 8ZT8vUMpN1KToUT1lvoR-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2835E80292A;
 Mon, 16 Aug 2021 11:35:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 594AB61093;
 Mon, 16 Aug 2021 11:35:18 +0000 (UTC)
Date: Mon, 16 Aug 2021 12:35:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
Message-ID: <YRpNUE7722YPIYjq@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com>
 <87y291u0st.fsf@redhat.com> <YRpGFnvZznlU9RKQ@redhat.com>
 <3062c8e9-b7f1-30ef-ddfa-006f4ea4f7e7@amsat.org>
MIME-Version: 1.0
In-Reply-To: <3062c8e9-b7f1-30ef-ddfa-006f4ea4f7e7@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 01:20:14PM +0200, Philippe Mathieu-Daudé wrote:
> On 8/16/21 1:03 PM, Daniel P. Berrangé wrote:
> >> (c) a subsystem maintainer is preparing a pull request
> >>
> >> Ideally, that should run the 'gating' set, to eliminate needless bounces
> >> of the pull request; plus some subsystem-specific manual testing on
> >> top. In practice, the 'full' set might be good enough.
> > 
> > Yeah, the full/gating set is what I would thing subsys maintainers
> > would want to use, to minimize risk that Peter's tests throw back
> > the merge due to failure. The only difference of gating vs full
> > is whether the acceptance tests run.
> 
> "run" or "pass"?

In 'full' set the acceptance test jobs are marked to allow to be
triggered manually and won't affect pipeline status if they fail

In 'gating' set the acceptance test jobs always run and are
required to pass.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


