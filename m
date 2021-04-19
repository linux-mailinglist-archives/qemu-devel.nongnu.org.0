Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA18936403D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:09:27 +0200 (CEST)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRmQ-0002Df-QC
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYRVT-0003LD-Do
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYRVL-0001GE-SW
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618829506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvhU2ssCArPP/2DUZ+vFmXTpjS8OnNuPPclIXiTtdY4=;
 b=SSOXLsPUNqzvuTNCdWnuZK+ujj4fVjMCo+VcSXP3OyzntDHUNeK8CT7xJR3AxlP9bi+T1+
 Ujp4qwzdblHIG7modYRkgYh38XeBntyMgv466h7Z/+V551KrbsrQLXQehyocQ/204ydEda
 QliAKqPhOg2S4XIiRVgk3Hbg6tv0r6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-Fcv2oYE_OXWrUajqRgSOQA-1; Mon, 19 Apr 2021 06:51:45 -0400
X-MC-Unique: Fcv2oYE_OXWrUajqRgSOQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4935C801814;
 Mon, 19 Apr 2021 10:51:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 505255D9CA;
 Mon, 19 Apr 2021 10:51:35 +0000 (UTC)
Date: Mon, 19 Apr 2021 11:51:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
Message-ID: <YH1gtK/JFtVE4lF1@redhat.com>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org>
 <YH1QJZGYQXc6x9Et@redhat.com> <YH1XLd34h7OXXqYR@nautilus.local>
 <1140e403-fbb0-8021-f2b6-9528247dfbc7@redhat.com>
 <YH1dQfy3H80/p0Ch@redhat.com>
 <f9bc5520-3cda-0904-241d-e3ee7b918b73@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f9bc5520-3cda-0904-241d-e3ee7b918b73@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 12:48:25PM +0200, Thomas Huth wrote:
> On 19/04/2021 12.36, Daniel P. Berrangé wrote:
> > On Mon, Apr 19, 2021 at 12:20:55PM +0200, Thomas Huth wrote:
> > > On 19/04/2021 12.10, Erik Skultety wrote:
> > > > On Mon, Apr 19, 2021 at 10:40:53AM +0100, Daniel P. Berrangé wrote:
> > > > > On Mon, Apr 19, 2021 at 01:34:47AM +0200, Philippe Mathieu-Daudé wrote:
> > > > > > Forks run the same jobs than mainstream, which might be overkill.
> > > > > > Allow them to easily rebase their custom set, while keeping using
> > > > > > the mainstream templates, and ability to pick specific jobs from
> > > > > > the mainstream set.
> > > > > > 
> > > > > > To switch to your set, simply add your .gitlab-ci.yml as
> > > > > > .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
> > > > > > is your gitlab 'namespace', usually username). This file will be
> > > > > > used instead of the default mainstream set.
> > > > > 
> > > > > I find this approach undesirable, because AFAICT, it means you have
> > > > > to commit this extra file to any of your downstream branches that
> > > > > you want this to be used for.  Then you have to be either delete it
> > > > > again before sending patches upstream, or tell git-publish to
> > > > > exclude the commit that adds this.
> > > > > 
> > > > > IMHO any per-contributor overhead needs to not involve committing
> > > > > stuff to their git branches, that isn't intended to go upstream.
> > > > 
> > > > Not just that, ideally, they should also run all the upstream workloads before
> > > > submitting a PR or posting patches because they'd have to respin because of a
> > > > potential failure in upstream pipelines anyway.
> > > 
> > > It's pretty clear that you want to run the full QEMU CI before submitting
> > > patches to the QEMU project, but I think we are rather talking about forks
> > > here that are meant not meant for immediately contributing to upstream
> > > again, like RHEL where we only build the KVM-related targets and certainly
> > > do not want to test other things like CPUs that are not capable of KVM, or a
> > > branch where Philippe only wants to check his MIPS-related work during
> > > development.
> > > For contributing patches to upstream, you certainly have to run the full CI,
> > > but for other things, it's sometimes really useful to cut down the CI
> > > machinery (I'm also doing this in my development branches manually some
> > > times to speed up the CI), so I think this series make sense, indeed.
> > 
> > For a downstream like RHEL, I'd just expect them to replace the main
> > .gitlab-ci.yml entirely to suit their downstream needs.
> 
> But that still means that we should clean up the main .gitlab-ci.yml file
> anyway, like it is done in this series, to avoid that you always get
> conflicts in this big file with your downstream-only modifications. So at
> least up to patch 11 or 12, I think this is a very valuable work that
> Philippe is doing here.

I don't see a real issue with downstream conflicts. They'll just
periodically pick a release to base themselves off and change once
every 6 months or more.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


