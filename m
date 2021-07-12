Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D144C3C5B27
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:11:16 +0200 (CEST)
Received: from localhost ([::1]:55968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tqF-0005VY-U5
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2tol-0004fs-23
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 07:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2tnv-0006nC-4p
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 07:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626088129;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwm8FhW1AGGohpr3SgReYwaP/SfONzINswapFtKfkko=;
 b=OQPwYxjHVnkvf+HNNMzkF8/ALCv/wvgzg+Npx32+l+DakRpbf0qU3Xn8T6ADn4lfPhS6fw
 s8L9TKhXQgPNg8oT2ehP4K9ALp/7KD7xQ5rvuoiEOtgvrJXeRvi8uWjjCLDJuOVrhr/Doq
 +/B5GPL4+vueYZpaSzJpEPYWW0YdB04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-z2NOXxpWOWyZae0WBCoWNw-1; Mon, 12 Jul 2021 07:08:42 -0400
X-MC-Unique: z2NOXxpWOWyZae0WBCoWNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA4A71835AC5;
 Mon, 12 Jul 2021 11:08:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F10141346F;
 Mon, 12 Jul 2021 11:08:37 +0000 (UTC)
Date: Mon, 12 Jul 2021 12:08:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: retrying failed gitlab CI external jobs (travis)
Message-ID: <YOwisuzpWCsPe/CT@redhat.com>
References: <CAFEAcA9ykYzTbuUskdCFkYYdYqZcUM5K2ciuFLKKh9_Y2GW7Dg@mail.gmail.com>
 <CAFEAcA8LvPSUw+x9GhPvKFvZqx6zLtUDYOT7Uh2zYef3RZx-7A@mail.gmail.com>
 <YOwJyhZGXUhbF+nH@redhat.com>
 <CAFEAcA9ragK95AtCz0zCfxpDs0kF6SxXtq10smW44b4abCkTmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ragK95AtCz0zCfxpDs0kF6SxXtq10smW44b4abCkTmQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 12:03:02PM +0100, Peter Maydell wrote:
> On Mon, 12 Jul 2021 at 10:22, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > WRT missing job for commit fc32b91a, I see there is a Travis stage
> > reported here:
> >
> >   https://gitlab.com/qemu-project/qemu/-/pipelines/334907106/builds
> >
> > So I presume there was some delay in running the Travis jobs and
> > thus they only got reported after you sent the mail.
> >
> > The extra stage in the pipeline is not triggered/tracked by GitLab
> > itself. Rather it relies on Travis to see the changes, runs its job
> > and pushes information back to GitLab. This is completely asynchronous
> > to the rest of the normal GitLab pipeline, so unfortunately if Travis
> > hasn't even started the job yet, we see nothing :=(
> 
> Hmm. If nothing shows up in the gitlab pipeline, it doesn't really
> work as a gating CI step, because I won't see if it fails...

Agreed, the Travis integration isn't ideal in this respect. We probably
have to consider to be merely a nice sanity check, rather than fully
gating CI.

The way I've integrated Cirrus CI into GitLab is more useful, because
that uses the GitLab job to directly trigger the Cirrus job, and so
we don't suffer from the asynchronous feedback loop going missing
entirely as with Travis.

It would be nice to integrate Traviss in the same way as Cirrus, but
I'm still not sure it is possible with Travis' REST API.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


