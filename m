Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2A4CFE7B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:29:50 +0100 (CET)
Received: from localhost ([::1]:59786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCUn-0003n2-FO
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:29:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRCTA-0001hz-QD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:28:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRCT8-0001kS-CN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646656084;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppJ34Y3xalgS1idw6VhEHEodY0M6DTgM58ZHF/vPpOM=;
 b=jLpavokb/gDkfTRkZQcNC+FztKqbTDIAnlHPjV9p+gZJq3QMX/nmW0ksbQBo/ZKSYev+Ut
 8vsrG9v/YsB19ZFM906ZL0SEkE8iLmzsioAwFebw7eoaKjEoeeOyPK5FaN7DWfP6GLMCKK
 gc9kc/xS+ivtenU3q0aYwmCSHy6HBbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-WGxgFLo5P9WYc-Xak9biJQ-1; Mon, 07 Mar 2022 07:27:59 -0500
X-MC-Unique: WGxgFLo5P9WYc-Xak9biJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4239E801AFE;
 Mon,  7 Mar 2022 12:27:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0413B2377C;
 Mon,  7 Mar 2022 12:27:51 +0000 (UTC)
Date: Mon, 7 Mar 2022 12:27:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/33] Abstract ArchCPU
Message-ID: <YiX6RV5bUiqhbF9m@redhat.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
 <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
 <CAFEAcA_rLaphLoyZNUGOPoj5n2z7X+RJNSpnJGqhu9ujAMduEQ@mail.gmail.com>
 <ec456ba2-71ed-7cbd-ae3a-595131962918@gmail.com>
 <CAFEAcA9tzq6atDCFDSmFZ2FhNgn7dXt21=GazcXZ9+3WYVtWuA@mail.gmail.com>
 <YiX2uVVtuj6+l3R4@redhat.com>
 <CAFEAcA9YYZj2Zwda2UdS+_r5j0uvO-VQ-Yu_8unTGE4iJ=8+ZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9YYZj2Zwda2UdS+_r5j0uvO-VQ-Yu_8unTGE4iJ=8+ZA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 12:17:24PM +0000, Peter Maydell wrote:
> On Mon, 7 Mar 2022 at 12:12, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > A big issue IMHO is that the pain/impact hits the wrong people.
> > It is most seriously impacts & disrupts Peter when merging, and
> > less impacts the subsystem maintainers, and even less the
> > original authors.
> >
> > If we consider a alternative world where we used merge requests
> > for subsystem maintainers just to send pull requests. The subsystem
> > maintainer would open a MR and it would be their responsibility
> > to get a green pipeline. Peter (or the person approving pulls for
> > merge at the time) shouldn't even have to consider a MR until it
> > has got a green pipeline. That would put the primary impact of
> > unreliable CI onto the subsystem maintainers, blocking their work
> > from being considered for merge. This creates a direct incentive
> > on the subsystem maintainers to contribute to ensuring reliable
> > CI, instead of considering it somebody else's problem.
> 
> CI fails merge isn't really a big deal IME -- I just bounce
> the merge request. The real problem and timesink (especially of
> CI hours) is the intermittents.

I'm saying the intermittents shouldn't be your problem to babysit
either though. The subsystem maintainer should own the whole problem
of getting the CI into a green state, either by fixing the genuine
bugs in the pull, but also by re-trying the jobs on intermittent
failure and/or by fixing the non-deterministic pre-existing problems.

The person approving the merge to git master shouldn't have to do
more than look at the CI results to check they are green and hit
the button to apply. GitLab can even enforce this by disabling the
ability to apply the merge request until CI is green, to avoid
accidentally merging something with bad CI results.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


