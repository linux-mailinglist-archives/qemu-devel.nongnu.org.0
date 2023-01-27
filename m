Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C767E0D5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 10:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLLQY-0000Q2-9H; Fri, 27 Jan 2023 04:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pLLQV-0000Pf-PK
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 04:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pLLQU-0005cZ-19
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 04:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674813220;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+OX/8wawHa+f8gWpnETFYISSxQzYa/TCM4F9c6dvEfY=;
 b=H/Cz9+KLqOVP9AB5fJVmKfha8YEubKqnuAEGcFftKm/8TCGUgU2H+E3DpMFoCBZPnjDcxE
 C9nJVoqjIPe9LvbRDQpWV4B3fFkVtXbBeCphyUlPlzB9OBIsk/7yNhNnESP59a2bxrfo/i
 6ZbbYsZKFS032VsGFWgLUMJ7kehIch8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-iI4TnvLuOky3IE70HOowfw-1; Fri, 27 Jan 2023 04:53:37 -0500
X-MC-Unique: iI4TnvLuOky3IE70HOowfw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92214858F0E;
 Fri, 27 Jan 2023 09:53:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89258492B01;
 Fri, 27 Jan 2023 09:53:35 +0000 (UTC)
Date: Fri, 27 Jan 2023 09:53:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9OfHNRi+Wb3EEoO@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid> <87h6wdpeig.fsf@linaro.org>
 <Y9KQX2pa6I7n/uvT@redhat.com> <Y9LJbvFf0N3BJBKq@invalid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9LJbvFf0N3BJBKq@invalid>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 06:41:50PM +0000, Eldon Stegall wrote:

> As far as baremetal goes, I find authenticated IPXE scripts work well
> for a number of these scenarios, and permit very dynamic allocation of
> resources. I have been a fan of the ignition/coreos/fcos strategy for
> baremetal deployment due to the capability to run the full system in
> memory, as writing packaging to disk can waste time and flash in my
> opinion. I strongly agree with the benefits of managing these components
> in the repo. Dockerfile, ignition config, or cloud-config would probably
> work.  Dockerfile makes sense to me if existing work in that direction
> has interest and docker is sufficiently flexible for the tests. That
> said, it may be easier to generate an appropriate cloud-config if no
> work is yet done on running tests inside docker.

One of the critical factors for QEMU CI is reproducability by
contributors. This is a critical reason why we want do CI
inside containers to the greatest extent possible. It lets
the maintainer eithuer pull down the same container build, or
rebuild the container image locally. This has given us a much
better ability to reproduce CI failures than we have before
we used containers so widely.

> I have looked through the .gitlab-cl.d directory in the repo, and it
> seems that there is existing work done with containers in the
> container-template.yml. Do we also incur minutes for our cirrus builds
> equivalent to the duration of the build on cirrus? Maybe relocation
> those builds would be the most effective? It seems that a number of
> builds unrelated to cirrus use containers already, or I am missing
> something?

We have a two phase CI pipeline. In the first phase we build all
the container images that we need. This uses cache, reusing layers
from containers in the previous build to reduce time spent. In
the second phase we run the actual QEMU build jobs inside the
containers we built in the first phase.

The cirrus jobs are special. We want gitlab to act as the single
frontend for all CI jobs. So we use a tool called cirrus-run in
the gitlab job to spawn a job on Cirrus CI and pull back the
results. This is only used for FreeBSD/macOS/Windows, which is
a pretty small part of our set of jobs.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


