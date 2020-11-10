Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630DE2ADCF3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:30:52 +0100 (CET)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXTn-00073I-Er
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1kcXQo-0005vR-4A
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:27:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1kcXQl-0006kf-Ey
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605029261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGl6CQz7oWv27pGF74E4X5uchN4wqJZlmgML1SHRuAA=;
 b=fZNfBCcc0/yzT0SFK8cZLzfhfqTeLmkZMdIEqUMBfXuQPr4V5D1BJJ/v7ra+ZXHmFfwCcj
 fAs1bT323COgt/3+LG6Ox8qBZNn0aK/NJbtP7TYq0me3aPQfFqd+mmGjBO+lHCczFX65BB
 G/ziJSSfUO0Ik3dx+s/K5NYg2aAW70U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-o3PkyTLOMs69CSUALBqJ_A-1; Tue, 10 Nov 2020 12:27:37 -0500
X-MC-Unique: o3PkyTLOMs69CSUALBqJ_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CA061074658;
 Tue, 10 Nov 2020 17:27:36 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.195.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69A2D5C1D0;
 Tue, 10 Nov 2020 17:27:20 +0000 (UTC)
Message-ID: <4c325f314f0a691feb51462b6aa0648a6d46c663.camel@redhat.com>
Subject: Re: [PATCH v4 2/4] Jobs based on custom runners: build environment
 docs and playbook
From: Andrea Bolognani <abologna@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Date: Tue, 10 Nov 2020 18:27:17 +0100
In-Reply-To: <20201109163726.GC3874327@localhost.localdomain>
References: <20201019015003.1527746-1-crosa@redhat.com>
 <20201019015003.1527746-3-crosa@redhat.com>
 <c0e7bd88bf64c0b22023810192fdb6e38d96fd97.camel@redhat.com>
 <20201109163726.GC3874327@localhost.localdomain>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-11-09 at 11:37 -0500, Cleber Rosa wrote:
> On Tue, Oct 20, 2020 at 07:52:43PM +0200, Andrea Bolognani wrote:
> > On Sun, 2020-10-18 at 21:50 -0400, Cleber Rosa wrote:
> > > +    - name: Install basic packages to build QEMU on FreeBSD 12.x
> > > +      pkgng:
> > > +        # Originally from packages on .cirrus.yml under the freebsd_12_task
> > > +        name: bash,curl,cyrus-sasl,git,glib,gmake,gnutls,gsed,nettle,ninja,perl5,pixman,pkgconf,png,usbredir
> > 
> > See above for 'pkgng' vs 'package', but at the very least this should
> > be
> > 
> >   pkgng:
> >     name:
> >       - bash
> >       - curl
> >         ...
> > 
> > or each time the list is touched the resulting diff is going to be
> > unmanageable.
> 
> The documentation suggests a comma separated list of package names:
> 
>    https://docs.ansible.com/ansible/2.8/modules/pkgng_module.html#pkgng-module
> 
> And the reason is that this module is not as smart as others, and will
> run one separate command for each individual package name value:
> 
>    https://github.com/ansible/ansible/blob/v2.10.3/test/support/integration/plugins/modules/pkgng.py#L214
> 
> It's a tradeoff indeed, but I think we're aligned with the docs.

I would probably take the performance hit over having to deal with an
unmaintainable blob. As a rule of thumb, reviewer time is more
valuable than machine time.

If the performance hit turns out to be unacceptably big, you could at
least do something along the lines of

  - set_fact:
      freebsd_packages:
        - bash
        - curl
          ...
  
  - pkgng:
      name: "{ freebsd_packages | join(',') }"

to keep things reviewable.

-- 
Andrea Bolognani / Red Hat / Virtualization


