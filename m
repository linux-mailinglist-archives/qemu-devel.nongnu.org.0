Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D55F9C42
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:54:02 +0200 (CEST)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpU1-0001Jf-F9
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohoxk-0003wJ-83
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohoxa-0002Xx-Nh
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665393627;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cFZH0yo6TN2RC2tSWQ6gJ9ACfsZRs0jQouDgDGt1eZs=;
 b=BVd0IE/QOujKNOI2z4R8Bgn2LCyFIkRnBQoiOc3Yc4+fv6CVaa0oIlsknQHq0i6OImisku
 j3Ca/9QE/clX6t6Qw2zrTVBvmvBLDdyoIdmi1S4Aj8mBx6o5rp6r6BISHG8hQUD+hZ9W8Y
 mkfBUUNXhOAJFYCnJZsgDvt1KZofQxE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-aYprWucpNa-2qFg05WQHhA-1; Mon, 10 Oct 2022 05:20:24 -0400
X-MC-Unique: aYprWucpNa-2qFg05WQHhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21C1B380114B;
 Mon, 10 Oct 2022 09:20:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFCE840C206B;
 Mon, 10 Oct 2022 09:20:10 +0000 (UTC)
Date: Mon, 10 Oct 2022 10:20:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor M <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v3 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <Y0PjyANuojwEypoc@redhat.com>
References: <20221010075439.4146972-1-ani@anisinha.ca>
 <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Oct 10, 2022 at 01:43:21PM +0530, Ani Sinha wrote:
> On Mon, Oct 10, 2022 at 1:24 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > Please see the README file added in patch 10 for more details.
> > Sample runs are as follows:
> >
> > $ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
> > ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smbios.py, line 92)
> > ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smilatency.py, line 47)
> > ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (testacpi.py, line 158)
> 
> None of the above files are avocado tests or avocado related python
> scripts. They are run from within bits in a python 2.7 environment. I
> could not find a mechanism to exclude a directory from avocado tests.
> I also do not think making those scripts python 3 compliant is a good
> use of my time since upgrading bits to use python 3 would be a major
> task unrelated to QEMU testing.

In one of the later patches copy_test_scripts()  copies the files
into the guest image IIUC.

If you rename them in git, to be .py2  then presumably avocado
wont try to load them, and then in copy_test_scripts you can
give them the normal .py extension for the guest.  The .py2
extension will also make it more obvious to maintainers that
these are different from the rest of the python coded we have.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


