Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEB45AEB56
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:08:35 +0200 (CEST)
Received: from localhost ([::1]:36886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZFi-0005Hf-F1
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVYH6-0000OR-21
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVYH2-0004Xd-CX
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662469550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eeWRfrWqLiKW4cDDpqtgHtLxP/N92/Sbn04SrKsEYhg=;
 b=NTYoDnZokRATfVDWWAc7ALSoFoLduCszmERLJvB59UKPjmb1m5C1Dm8nIr2K7Mypj/oKRn
 5UhNB0jMSkf+NFfm+uXmmv3JpqcrBGEi7PvPIQp+/nIkvwRKEj+x8PxKqLFNq8wj2/I0RE
 QYUlmJDRnUYUCperDlWmMp/3pCYeak8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-BfObpKJiOpavU5V_4QVpzw-1; Tue, 06 Sep 2022 09:05:49 -0400
X-MC-Unique: BfObpKJiOpavU5V_4QVpzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC3AB101E9B2;
 Tue,  6 Sep 2022 13:05:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 208AD2026D4C;
 Tue,  6 Sep 2022 13:05:46 +0000 (UTC)
Date: Tue, 6 Sep 2022 14:05:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <YxdFqBaqoV+twdMe@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CAFn=p-Yy9WsAf3=3ZvkUEDbE_SKj-ARent_vzJw-PWcPnVQOXA@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121222280.1824593@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2207121222280.1824593@anisinha-lenovo>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 12:45:59PM +0530, Ani Sinha wrote:
> 
> 
> On Mon, 11 Jul 2022, John Snow wrote:
> 
> > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > This change adds python based test environment that can be used to run pytest
> > > from within a virtual environment. A bash script sets up a virtual environment
> > > and then runs the python based tests from within that environment.
> > > All dependent python packages are installed in the virtual environment using
> > > pip python module. QEMU python test modules are also available in the environment
> > > for spawning the QEMU based VMs.
> > >
> > > It also introduces QEMU acpi/smbios biosbits python test script which is run
> > > from within the python virtual environment. When the bios bits tests are run,
> > > bios bits binaries are downloaded from an external repo/location.
> > > Currently, the test points to an external private github repo where the bits
> > > archives are checked in.
> > >
> >
> > Oh, I see -- requirements are handled here in this patch.
> >
> > Is this test designed to run the host/build system? I'm a little
> > confused about the environment here.
> 
> yes it is supposed to run on the build system where "make check" is
> executed.
> 
> >
> > Is this test going to be run "by default" or will users have to opt
> > into running it using a special invocation?
> 
> run by default through "make check" or "make check-pytest" or "make
> check-pytest-x86_64".

I don't think that a default 'make check' should be downloading
disk images, especially when they're stored in the local build
dir by default and so lost when the build dir is cleaned.

The downloading of disk images is one of the reasons why avocado
is not set to run by default with 'make check', and I think this
should be the same. This again takes me to back to believing that
we should simply be using Avocado here instead of creating something
that has to solve the same problems.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


