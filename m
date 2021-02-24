Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6B43240F6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:56:24 +0100 (CET)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwWV-0005x6-5Z
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEwQU-0000Ul-LI
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:50:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEwQP-00082l-IX
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614181799;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SrmjOryht3bO77ws3esX9ib9SfnwkJhY/d+oqIECTM=;
 b=OhN3D2wsW38PVAklyMRPN5mx1hV+oYM0KLaeyKkHZK5io+EPZQVeQzq73I2kayPjHXGsKn
 IxCL7lDBzjGolN+MkGjgnH+xSZbiA03JQVrsXzbvQXtyXRwmt33cLyoxMui65GHxgyYTsM
 bXfZjxeDlwCDCIA8FAMMURBnrZFxoZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-YWt5UuetND-irWFeaK2_HA-1; Wed, 24 Feb 2021 10:49:45 -0500
X-MC-Unique: YWt5UuetND-irWFeaK2_HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00FBB8A0265;
 Wed, 24 Feb 2021 15:33:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4A35D6A8;
 Wed, 24 Feb 2021 15:33:44 +0000 (UTC)
Date: Wed, 24 Feb 2021 15:33:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
Message-ID: <YDZx1WEpMPGZB+b9@redhat.com>
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
 <2ee6c3b3-7b90-e10c-8950-bfd07c963558@redhat.com>
 <5a1c4191-b0e6-8dcf-d5db-7335b5f41628@redhat.com>
 <87lfbe51oy.fsf@linaro.org>
 <YDZDSY3G9+KpgJsE@stefanha-x1.localdomain>
 <YDZETVhPKm7H2My2@redhat.com>
 <YDZv9ROdREeN5o5u@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YDZv9ROdREeN5o5u@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 03:25:41PM +0000, Stefan Hajnoczi wrote:
> On Wed, Feb 24, 2021 at 12:19:25PM +0000, Daniel P. Berrangé wrote:
> > On Wed, Feb 24, 2021 at 12:15:05PM +0000, Stefan Hajnoczi wrote:
> > > On Tue, Feb 23, 2021 at 01:37:45PM +0000, Alex Bennée wrote:
> > > > 
> > > > Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> > > > > Or even better since we have a job pushing to Gitlab pages
> > > > > accessible on https://qemu-project.gitlab.io/qemu/:
> > > > >
> > > > > https://qemu-project.gitlab.io/qemu/devel/style.html
> > > > >
> > > > > Maybe the https://www.qemu.org/docs/ redirect should
> > > > > go to gitlab page now?
> > > > 
> > > > It could do either, I think the result is exactly the same.
> > > 
> > > Standarizing project infrastructure on GitLab CI seems good to me. That
> > > way developers will be able to reuse their CI knowledge and won't have
> > > to learn other systems (like readthedocs).
> > > 
> > > However, I don't see .gitlab-ci.yml directives that build the docs and
> > > publish a static page yet. Is anyone volunteering to do this? (It can be
> > > done as a separate step from this patch.)
> > 
> > The very last job (called 'pages') in .gitlab-ci.yml does this.
> 
> Awesome! I have updated the qemu.org HTTP redirect to GitLab:
> 
>   https://qemu.org/docs/master/
> 
> If anyone wants to discuss RTD vs GitLab docs hosting more, please go
> ahead. We can change the redirect again in the future, if necessary.

The downside with using a HTTP redirect is that user's still see the
particular hosting choice. So they are liable to bookmark these
links which will  break if we move again.

Paolo had proposed a patch to rsync the CI content directly onto
qemu.org:

  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04629.html

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


