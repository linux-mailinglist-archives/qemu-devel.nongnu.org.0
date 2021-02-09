Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BA31519C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:32:44 +0100 (CET)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9U4J-0005oQ-PN
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9Tvp-0000PR-74
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9Tvm-0001h6-Qv
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612880633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xml2n7/xQxxSBiCugsHxF8zQT17FUCBY9alhA9eE1IE=;
 b=GgKlFHvzHbToNHRWMefrpth6Ah/Ki9Y8oiSaXPzNiJTk/w79eI/34OUHcOkXu2rKXFxnSt
 TffVdWR5D36EN22n3hIfB8wZMEMTvtnQvZerWt5aA5A524Q/3W+bSE7wd5sfEtIYiKRV7g
 ntvtTquqLjHwxhgJnFhmYbTmFZT/UgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-xFagKJOQMICNciEjm6Us5g-1; Tue, 09 Feb 2021 09:23:49 -0500
X-MC-Unique: xFagKJOQMICNciEjm6Us5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00CAE107ACE3;
 Tue,  9 Feb 2021 14:23:48 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE495177F1;
 Tue,  9 Feb 2021 14:23:40 +0000 (UTC)
Date: Tue, 9 Feb 2021 14:23:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
Message-ID: <20210209142337.GM1166421@redhat.com>
References: <20210207121239.2288530-1-f4bug@amsat.org>
 <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
 <CAAdtpL5YO=A-V06+7Wyhn5XnavGCUAqqcD8XpU2cVpE4AV-W3w@mail.gmail.com>
 <CAFEAcA-m0MKhMr05mX7HyJZ8DuK7D2YzCFnTyG4B32=-r-5mpA@mail.gmail.com>
 <622e8281-eeda-2620-d388-69d9d6853788@amsat.org>
 <21da6a3f-d2ce-91ff-6e9a-588af13c3369@redhat.com>
MIME-Version: 1.0
In-Reply-To: <21da6a3f-d2ce-91ff-6e9a-588af13c3369@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 03:16:46PM +0100, Thomas Huth wrote:
> On 09/02/2021 15.12, Philippe Mathieu-Daudé wrote:
> > On 2/9/21 2:41 PM, Peter Maydell wrote:
> > > On Tue, 9 Feb 2021 at 13:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > > > Migration of this job is pending of Cleber's possibility to add an AArch64
> > > > runner to Gitlab-CI, right? Then we need someone to support and maintain
> > > > the hardware... I don't think anybody volunteered.
> > > 
> > > We have the hardware already. Effectively Alex is maintaining it...
> > 
> > I missed to read if Alex volunteered for this task but am certainly
> > happy if he is :) Although this should be documented somewhere (who
> > to contact if the AArch64 runner starts to fail?).
> > 
> > Assuming Cleber's runner script is merged and working on the AArch64
> > runner, then we need to figure how contributors can use it.
> > Assuming this runner will be registered under the QEMU organization
> > namespace in Gitlab, then contributors would have to open a Merge
> > Request to trigger the CI jobs (similarly to when you push to the
> > /staging branch). Then we would cancel the MR. We can ask contributors
> > to cancel their MR once testing done.
> 
> I'm not sure, but if I got that right, opening a MR will only trigger a CI
> run on side of the requester, not of the target project? For example, when I
> look at:
> 
>  https://gitlab.com/libvirt/libvirt/-/merge_requests/65
> 
> the pipeline that is shown there ran on side of the requester, not on side
> of the libvirt project?

I'll have to search out the details, but there was an enhancement to
gitlab late last year that makes it possible for merge requests to
run CI in the context of the upstram project not the fork. It is
mentioned somewhere in the gitlab release notes.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


