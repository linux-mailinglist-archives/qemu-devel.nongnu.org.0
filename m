Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8993B0150
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:26:00 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdbT-00080d-JC
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvdUS-00049J-CE
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvdUP-0006gs-AS
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624357120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gzrImPinhRNlxdci63CYV4SVhoeg6XtsX8beB1ydNkk=;
 b=MY+vSs6y6XesJO5S830wptl9xvsA/DRZ+wQ4n4h7QHu+aKlpht48ILrnR6P/PB/bnLA/GM
 P5QHVAQWc4yCTaYQ+bRIdItzDYTBNjbULGXefH/CJYHjuCOlSdgB5ohFqZ7YPGSJwEtchF
 aqyw1aIppnof3R+3+LUXTlDsJJ7E2PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-97JpW901OT-AojPhjsJ9OA-1; Tue, 22 Jun 2021 06:18:24 -0400
X-MC-Unique: 97JpW901OT-AojPhjsJ9OA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A55101C8A8;
 Tue, 22 Jun 2021 10:18:22 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0B0E5C1CF;
 Tue, 22 Jun 2021 10:18:12 +0000 (UTC)
Date: Tue, 22 Jun 2021 11:18:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <YNG44c9KtaiNXT7b@redhat.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:
> Hi,
> 
> This is v4 of the series [1] that I posted to introduce support for
> generating cpu topology descriptions to guest. Comments are welcome!
> 
> Description:
> Once the view of an accurate virtual cpu topology is provided to guest,
> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> e.g., the scheduling performance improvement. See Dario Faggioli's
> research and the related performance tests in [2] for reference. So here
> we go, this patch series introduces cpu topology support for ARM platform.
> 
> In this series, instead of quietly enforcing the support for the latest
> machine type, a new parameter "expose=on|off" in -smp command line is
> introduced to leave QEMU users a choice to decide whether to enable the
> feature or not. This will allow the feature to work on different machine
> types and also ideally compat with already in-use -smp command lines.
> Also we make much stricter requirement for the topology configuration
> with "expose=on".

Seeing this 'expose=on' parameter feels to me like we're adding a
"make-it-work=yes" parameter. IMHO this is just something that should
be done by default for the current machine type version and beyond.
I don't see the need for a parameter to turnthis on, especially since
it is being made architecture specific.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


