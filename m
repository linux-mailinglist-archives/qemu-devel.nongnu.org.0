Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A91EA3E9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 14:30:40 +0200 (CEST)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfjaR-00013W-Es
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 08:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jfjZJ-000079-W7
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 08:29:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24683
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jfjZI-0001x8-PT
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 08:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591014567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2AYaxn/6IwGDHHB/RW0wmGgaHhVlO6z2tV/aerIGeQ=;
 b=Nm6s4OMdNE6ASn+uO0sGx8O9ujWxE86KnqFyfAwHo9tcHsTAHQ1uGehSPEPLy4T6AS0I3l
 EzrqcxGY+NRe6xJHiEjIlUAp0NkHkjsDxoPsJClyGeexqf0rkj52Z/+D4z0uPpRtV9LJiQ
 /SySjdSXgu6WhUtnzxmefSe3oN/S+qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-P6yltwKhOSK0U390joYZDg-1; Mon, 01 Jun 2020 08:29:25 -0400
X-MC-Unique: P6yltwKhOSK0U390joYZDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 835F5A0BD7;
 Mon,  1 Jun 2020 12:29:24 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C005C1D4;
 Mon,  1 Jun 2020 12:29:22 +0000 (UTC)
Date: Mon, 1 Jun 2020 14:29:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: About the kvm-no-adjvtime CPU property
Message-ID: <20200601122917.fyp2kwqzsodahnzu@kamzik.brq.redhat.com>
References: <b4389848-10fd-a906-9901-d1d354ce4842@huawei.com>
 <20200601080718.jul5r4qebpeieyfl@kamzik.brq.redhat.com>
 <3d8729db-067c-31f9-dd69-02a218f1b53e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <3d8729db-067c-31f9-dd69-02a218f1b53e@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:19:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 01, 2020 at 08:07:31PM +0800, Ying Fang wrote:
> 
> 
> On 2020/6/1 16:07, Andrew Jones wrote:
> > On Sat, May 30, 2020 at 04:56:26PM +0800, Ying Fang wrote:
> > > About the kvm-no-adjvtime CPU property
> > > 
> > > Hi Andrew,
> > > To adjust virutal time, a new kvm cpu property kvm-no-adjvtime
> > > was introduced to 5.0 virt machine types. However the cpu
> > > property was enabled only for host-passthrough and max cpu model.
> > > As for other cpu model like cortex-a57, cortex-a53, cortex-a72,
> > > this kvm-adjvtime is not enabled by default, which means the
> > > virutal time can not be adjust for them.
> > > 
> > > Here, for example, if VM is configured with kvm enabled:
> > > 
> > >    <cpu mode='custom' match='exact' check='partial'>
> > >      <model fallback='allow'>cortex-a72</model>
> > >      <topology sockets='2' dies='1' cores='2' threads='1'/>
> > >      <numa>
> > >        <cell id='0' cpus='0-1' memory='16777216' unit='KiB'/>
> > >        <cell id='1' cpus='2-3' memory='16777216' unit='KiB'/>
> > >      </numa>
> > >    </cpu>
> > > 
> > > We cannot adjust virtual time even if 5.0 virt machine is used.
> > > So i'd like to add it to other cpu model, do you have any
> > > suggestions here ?
> > > 
> > > 
> > 
> > Hi Fang,
> > 
> > The cpu feature only requires kvm.  If a cpu model may be used with kvm,
> > then the feature can be allowed to be used with the model.  What I find
> > interesting is that the cpu model is being used with kvm instead of 'host'
> > or 'max'.  Can you explain the reasons for that?  Currently, when using
> yes，the cpu model is indeed used with kvm.
> 
> There is a situation where the host cpu model is Cortex-A72 and
> a 'custom' cpu mode is used to keep insrtuction set compatible between
> the source and destination host machine when doing live migration.
> So the host physical machine cpu model is Cortex-A72 but
> host-passthrough model is mode used here.

Are the source and destinations hosts used in the migration identical?
If so, then the guest can use cpu 'host' and disable cpu features that
should not be exposed (e.g. -cpu host,pmu=off).  If the source and
destination hosts are not identical, then I'm curious what those exact
differences are.  With the way AArch64 KVM works today, even using the
Cortex-A72 cpu model should require identical hosts when migrating.  Or,
at least both hosts must be compatible with Cortex-A72 and any difference
in ID registers must be somehow getting hidden from the guest.

Thanks,
drew


