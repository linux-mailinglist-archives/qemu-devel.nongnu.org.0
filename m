Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480942C8240
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:33:20 +0100 (CET)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgUh-0000Pz-24
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjgTA-0008Lt-Sx
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:31:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjgT5-0005W1-3u
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606732298;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/91FSOlY3yUqQbmObw1NIAprA9AHoksqpCc1Off/rpQ=;
 b=ICSSFxOuzUPJJvd1706laXq8b7b7GKd7jVms9ruGYKxROb5CtvCeZM/NRz/5s5UnoAO+IV
 EKOBGReNzZGmpOvSi1QcqQZN23K9V2iQMo0Qe83du2ZyvpLajEyyulk/4Qp+tGycVYIf/5
 C2YWswTYfvHj5QWSf9GMF3xiZokyKr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-kVcASHBlOsGtYB_kJyKDrg-1; Mon, 30 Nov 2020 05:31:35 -0500
X-MC-Unique: kVcASHBlOsGtYB_kJyKDrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11EE8144E1;
 Mon, 30 Nov 2020 10:31:34 +0000 (UTC)
Received: from redhat.com (ovpn-114-242.ams2.redhat.com [10.36.114.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0BB35D9D2;
 Mon, 30 Nov 2020 10:31:12 +0000 (UTC)
Date: Mon, 30 Nov 2020 10:31:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
Message-ID: <20201130103109.GD2039965@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
 <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virt-ci-maint-team@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 07:29:31PM +0100, Thomas Huth wrote:
> On 27/11/2020 18.57, Philippe Mathieu-Daudé wrote:
> > On 11/27/20 6:47 PM, Thomas Huth wrote:
> >> On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:
> >>> We lately realized that the Avocado framework was not designed
> >>> to be regularly run on CI environments. Therefore, as of 5.2
> >>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> >>> current users, it is possible to keep the current behavior by
> >>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> >>> (see [*]).
> >>> From now on, using these jobs (or adding new tests to them)
> >>> is strongly discouraged.
> >>>
> >>> Tests based on Avocado will be ported to new job schemes during
> >>> the next releases, with better documentation and templates.
> >>
> >> Why should we disable the jobs by default as long as there is no replacement
> >> available yet?
> > 
> > Why keep it enabled if it is failing randomly
> 
> We can still disable single jobs if they are not stable, but that's no
> reason to disable all of them by default, is it?

Agreed, the jobs which are known to be broken or unreliable should
be unconditonally disabled in QEMU as a whole. This isn't specific
to gitlab config - the qemu build makefiles/mesonfiles should disable
the problem tests entirely, as we don't want developers wasting time
running them locally either if they're known to be broken/unreliable.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


