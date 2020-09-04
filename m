Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78925D576
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 11:54:18 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE8QD-0006UT-G5
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 05:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kE8PY-00063a-WC
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:53:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48769
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kE8PW-0008TZ-Sg
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:53:36 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-WuS95AUtOM6YP-Z_PIoqKg-1; Fri, 04 Sep 2020 05:53:31 -0400
X-MC-Unique: WuS95AUtOM6YP-Z_PIoqKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A729D1DDE7;
 Fri,  4 Sep 2020 09:53:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58B037E41B;
 Fri,  4 Sep 2020 09:53:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7B80D31E63; Fri,  4 Sep 2020 11:53:26 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:53:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 2/2] GitLab Gating CI: initial set of jobs,
 documentation and scripts
Message-ID: <20200904095326.egqvj6unx7uymngl@sirius.home.kraxel.org>
References: <20200709024657.2500558-1-crosa@redhat.com>
 <20200709024657.2500558-3-crosa@redhat.com>
 <20200709103029.GK3753300@redhat.com>
 <20200904001139.GE55646@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200904001139.GE55646@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > IOW, a RHEL-8 aarch64 host, running docker for ubuntu18.04, fedora30
> > etc.
> 
> I've come across so many caveats and corner cases that having the
> lowest common denominator proved to be the smart and sane thing to do.
> For instance, building on the example you gave, running a RHEL 8
> aarch64 host is a NO GO Today because RHEL 8 doesn't ship with docker
> and the gitlab runner needs to be taught to talk to, say, Podman.

podman got support for the docker daemon api (v2.0 I think), so 
this should be possible soon, without changing gitlab runner.

Also there is a kubernetes runner so you can run the thing in pretty
much any cluster.  k3s.io seems to be the easiest way to boot up a small
kubernetes cluster on pretty much any linux system.  Works on aarch64
too.  Didn't try (yet) to run the gitlab runner there.

> Finally, it's going to be very important for some organizations to
> run tests outside of container environments.  For instance, Red Hat
> needs to run QEMU+KVM tests on bare metal and on VMs, in addition
> to containers.

Also for *BSD testing.
For setting up VM images we should use tests/vm.

> Like I explained before, containers-only won't cut it.  So, we need
> tooling that is environment agnostic.  So far, ansible playbooks seem
> to be a reasonable solution.  But duplicating information bothers me
> as much as it seems to bother you, so we need to engage in common
> tooling that is capable of generating those container environments,
> but not be limited to it.  One example of a tool that seems to be
> a good candidate is "Libvirt's" lcitool.

What is wrong with the docker files we have?

It is a good idea anyway to use the same images for local test builds
and CI.  Makes it easier to reproduce CI failures locally.

take care,
  Gerd


