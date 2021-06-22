Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3853B072C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:14:36 +0200 (CEST)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhAh-0008TV-EI
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvh7m-0004zA-PV
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvh7i-0002F1-P8
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624371090;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmdBxL/g9c+2rIHFOgZMhk+kQF7eze+cn+yJ8etMT2s=;
 b=aEJiB2dq5JmzWNszpQN7OHHHpfjpIZRRn8/uAdgHBcqUELP/PsIXPRYw819TaPy7OGFnVU
 orSY+ij8WSpyhj0V3+082q8N9pwEUCWHx6JMKabzy7eUmRmU7/O6Bbcf5j5YJrop6oHQgb
 ktC4cj1WJY+vzZs9h8QvvjVO56t3UVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254--FGB1JnLPV-U9Civ80Mz0g-1; Tue, 22 Jun 2021 10:11:14 -0400
X-MC-Unique: -FGB1JnLPV-U9Civ80Mz0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB01100C618;
 Tue, 22 Jun 2021 14:11:12 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0175D9DE;
 Tue, 22 Jun 2021 14:11:00 +0000 (UTC)
Date: Tue, 22 Jun 2021 15:10:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <YNHvcQAMLSpVcxaE@redhat.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com>
 <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 10:04:52PM +0800, wangyanan (Y) wrote:
> Hi Daniel,
> 
> On 2021/6/22 20:41, Daniel P. Berrangé wrote:
> > On Tue, Jun 22, 2021 at 08:31:22PM +0800, wangyanan (Y) wrote:
> > > 
> > > On 2021/6/22 19:46, Andrew Jones wrote:
> > > > On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:
> > > > > On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > This is v4 of the series [1] that I posted to introduce support for
> > > > > > generating cpu topology descriptions to guest. Comments are welcome!
> > > > > > 
> > > > > > Description:
> > > > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > > > research and the related performance tests in [2] for reference. So here
> > > > > > we go, this patch series introduces cpu topology support for ARM platform.
> > > > > > 
> > > > > > In this series, instead of quietly enforcing the support for the latest
> > > > > > machine type, a new parameter "expose=on|off" in -smp command line is
> > > > > > introduced to leave QEMU users a choice to decide whether to enable the
> > > > > > feature or not. This will allow the feature to work on different machine
> > > > > > types and also ideally compat with already in-use -smp command lines.
> > > > > > Also we make much stricter requirement for the topology configuration
> > > > > > with "expose=on".
> > > > > Seeing this 'expose=on' parameter feels to me like we're adding a
> > > > > "make-it-work=yes" parameter. IMHO this is just something that should
> > > > > be done by default for the current machine type version and beyond.
> > > > > I don't see the need for a parameter to turnthis on, especially since
> > > > > it is being made architecture specific.
> > > > > 
> > > > I agree.
> > > > 
> > > > Yanan, we never discussed an "expose" parameter in the previous versions
> > > > of this series. We discussed a "strict" parameter though, which would
> > > > allow existing command lines to "work" using assumptions of what the user
> > > > meant and strict=on users to get what they mean or an error saying that
> > > > they asked for something that won't work or would require unreasonable
> > > > assumptions. Why was this changed to an "expose" parameter?
> > > Yes, we indeed discuss a new "strict" parameter but not a "expose" in v2 [1]
> > > of this series.
> > > [1] https://patchwork.kernel.org/project/qemu-devel/patch/20210413080745.33004-6-wangyanan55@huawei.com/
> > > 
> > > And in the discussion, we hoped things would work like below with "strict"
> > > parameter:
> > > Users who want to describe cpu topology should provide cmdline like
> > > 
> > > -smp strict=on,cpus=4,sockets=2,cores=2,threads=1
> > > 
> > > and in this case we require an more accurate -smp configuration and
> > > then generate the cpu topology description through ACPI/DT.
> > > 
> > > While without a strict description, no cpu topology description would
> > > be generated, so they get nothing through ACPI/DT.
> > > 
> > > It seems to me that the "strict" parameter actually serves as a knob to
> > > turn on/off the exposure of topology, and this is the reason I changed
> > > the name.
> > Yes, the use of 'strict=on' is no better than expose=on IMHO.
> > 
> > If I give QEMU a cli
> > 
> >    -smp cpus=4,sockets=2,cores=2,threads=1
> > 
> > then I expect that topology to be exposed to the guest. I shouldn't
> > have to add extra flags to make that happen.
> > 
> > Looking at the thread, it seems the concern was around the fact that
> > the settings were not honoured historically and thus the CLI values
> > could be garbage. ie  -smp cpus=4,sockets=8,cores=3,thread=9
> This "-smp cpus=4,sockets=8,cores=3,threads=9" behaviors as a wrong
> configuration, and the parsing function already report error for this case.
> 
> We hope more complete config like "-smp 4,sockets=2,cores=2,threads=1"
> for exposure of topology, and the incomplete ones like "-smp 4,sockets=1"
> or "-smp 4, cores=1" are not acceptable any more because we are starting
> to expose the topology.

Incomplete specified topologies *are* acceptable.

The smp_parse method will automatically fill in any missing values.

ie,

  -smp 4,cores=1
  -smp cores=1
  -smp threads=1
  -smp sockets=4

are all functionally identical to

  -smp 4,sockets=4,cores=1,dies=1,threads=1


The QEMU man page says this explicitly

                 For the PC target, the number of cores per die, the
    number of threads per cores, the number of dies per packages and the
    total number of sockets can be specified. Missing values will be
    computed. If any on the three values is given, the total number of
    CPUs n can be omitted.

note this qemu-options.hx doc will require updating since it will apply
to more than just the PC target.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


