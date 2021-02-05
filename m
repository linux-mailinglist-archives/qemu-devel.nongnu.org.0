Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559C3310EE7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:41:44 +0100 (CET)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8571-0004ck-9y
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l84RM-0004iU-9Y
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:58:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l84RI-00038h-E5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612544315;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KGswybY2Uws+/RNHIR+quxtECvTrU30wocTGN92ByfQ=;
 b=PzrkhNQgtkbotSTyalI3df4zPhAQsL76m8xxsrkFOU2JN7v9Jdxj8OcZ/+wxuv/nTlXzE5
 jtn1YakVHcD8Rhh4GUq0GBy2nW7Vq7RWXa8S22tcWkFLne4ka1V7WzNOYyZWVDEjZrT71J
 GFFsowElLFHQ0MBn8QpitYcWn3fzXHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-JUl3EyHVMIW2Z4j9x9ZNWw-1; Fri, 05 Feb 2021 11:58:20 -0500
X-MC-Unique: JUl3EyHVMIW2Z4j9x9ZNWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01197107ACF3;
 Fri,  5 Feb 2021 16:58:19 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 298FE19C47;
 Fri,  5 Feb 2021 16:58:05 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:58:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL v2 00/27] Block patches
Message-ID: <20210205165803.GS908621@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
 <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
 <20210205162105.GB416527@stefanha-x1.localdomain>
 <CAFEAcA-VFfcWzH47nxgthtcdkCzm8c74uo3rj8Zd=M3mWAXX7g@mail.gmail.com>
 <4b05dea5-be2e-1da1-30bb-ade792ec75cd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4b05dea5-be2e-1da1-30bb-ade792ec75cd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 John G Johnson <john.g.johnson@oracle.com>, "Denis V. Lunev" <den@openvz.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 05:52:59PM +0100, Thomas Huth wrote:
> On 05/02/2021 17.23, Peter Maydell wrote:
> > On Fri, 5 Feb 2021 at 16:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > Thanks, I update the patch in question.
> > > 
> > > It looks like the GitLab CI doesn't include a clang version that
> > > produces this error because the pipeline passed for me:
> > > https://gitlab.com/stefanha/qemu/-/pipelines/251524779
> > > 
> > > Is there something clang-specific you want to check in the CI? Maybe
> > > clang 3.4, the oldest version supported according to ./configure?
> > 
> > Would probably be nice I guess. My ad-hoc builds use clang 6,
> > which is what tripped up here.
> 
> We should maybe discuss first whether we can bump the minimum version of
> Clang that we would like to support. I once picked Clang 3.4 since that was
> available in EPEL for RHEL7, but I think there were newer versions of Clang
> available in RHEL7 via other repos later, so 3.4 is likely really just way
> too old now...
> 
> According to https://developers.redhat.com/HW/ClangLLVM-RHEL-7 there was at
> least Clang 7.0 available on RHEL7. Debian stable seems to have at least
> 7.0, too, according to repology.org. Ubuntu 18.04 seems to have version 6,
> but later ones are available via updates? Anyway, I think we could at least
> bump the minimum version to 6.0 nowadays...

Per our support matrix, this is the last dev cycle where we need to
care about RHEL-7, as RHEL-7 will be past the 2 year cutoff in
the QEMU 6.1 cycle.

Furthermore given that CLang was only ever an EPEL package, not a
core part of the distro, I think we are justified in just ignoring
RHEL-7 already for purpose of choosing CLang min version.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


