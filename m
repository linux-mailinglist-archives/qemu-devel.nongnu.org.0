Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A561853D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:49:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdOz-0004lz-6R; Thu, 03 Nov 2022 12:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqdOx-0004ex-4W
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqdOv-000502-ER
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667494148;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtGh/HTlKjwZlq1HCI1WTUypeVcGV6eXJDgMM3AWfEI=;
 b=hw3hClor2r2vienzbNPCCZI9PMmlw+K5F96hON9YYBz0R0sh8hcQXxLQXcrG1Hl6SgE7CM
 7Zq+b9JyeconLYycj2gOaKf4m3bnEtcbV45FhXiO5nmRvyKqasjx5hSfDHXWX0vqP6daWQ
 myCHH/PoTH8UJE5nUaSI7JDf46wGI+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-7edaPTGPORyUQ8jO23R6Dw-1; Thu, 03 Nov 2022 12:49:07 -0400
X-MC-Unique: 7edaPTGPORyUQ8jO23R6Dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAF2E803D48;
 Thu,  3 Nov 2022 16:49:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 935E01415123;
 Thu,  3 Nov 2022 16:49:05 +0000 (UTC)
Date: Thu, 3 Nov 2022 16:49:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 philmd@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <Y2Pw/1xXSdpXLVfz@redhat.com>
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
 <Y2Plai60TK1kErl5@redhat.com>
 <CAJSP0QUk4iWY6B7-oxjLtW22OMyAfR-KH7M6QMmQVjvOhwQ+nQ@mail.gmail.com>
 <Y2Pui+kYDyJ1Rgja@redhat.com>
 <CAFEAcA_BEUTWEeTOgeHR9Sy_XOCJ=ckM=ki3c9sSuAMT_emL1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_BEUTWEeTOgeHR9Sy_XOCJ=ckM=ki3c9sSuAMT_emL1w@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 04:47:03PM +0000, Peter Maydell wrote:
> On Thu, 3 Nov 2022 at 16:38, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Thu, Nov 03, 2022 at 12:25:49PM -0400, Stefan Hajnoczi wrote:
> > > 2. The GitLab output does not contain the full command lines because
> > > environment variables are hidden (e.g. $QEMU_CONFIGURE_OPTS).
> >
> > Note, $QEMU_CONFIGURE_OPTS is set by the container image itself, so
> > there's no need to know that one.
> >
> > $CONFIGURE_ARGS meanwhile is set in the build-XXXXX template and
> > easy to find.
> 
> Not all that easy if you're looking at some specific gitlab
> job output... it would be helpful if the scripts
> echoed the exact configure command line before running it,
> then you wouldn't need to go ferreting around in the gitlab
> config files and hoping you've found the right bit.

That's easy enough to do, I'll send a patch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


