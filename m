Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98A30D77C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:29:15 +0100 (CET)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FPO-0000H7-R9
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7FOL-00083i-JB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:28:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7FOK-0008CG-0v
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612348087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2+qz0DjWkEkbZPan4bMlbGQBE07zRWTPTtmhEpp3FE=;
 b=FfbdOH93doT9duM3RopfLNVo2dkXkd8nN6tF/0QB1HWkJFadKRGZ1/0VSFf60BXNf9xGFA
 CaYN4pK82sPc2MQbndJkU1ZSkijvf93muggwjO5myeTZSiA8C9oQGwZ/r6XG10iNZFKC/2
 siStd7is3AZtzUAyT6eU9/xcze+IQ9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-ddn9cbMbOAaMmGS_7tbM5w-1; Wed, 03 Feb 2021 05:28:03 -0500
X-MC-Unique: ddn9cbMbOAaMmGS_7tbM5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589DC107ACE4;
 Wed,  3 Feb 2021 10:28:02 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA0D62461;
 Wed,  3 Feb 2021 10:28:00 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:27:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <20210203102758.GC2950@work-vm>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Cc'ing migration team and qemu-arm@ list.

I'll have to leave the detail of that to the ARM peole; but from a
migration point of view I think we do want the 64 bit ARM migrations to
be stable now.  Please tie incompatible changes to machine types.

Dave

> On 2/3/21 5:01 AM, Aaron Lindsay wrote:
> > Hello,
> > 
> > I'm attempting to restore an AArch64 snapshot taken on QEMU 4.1.0 on
> > QEMU 5.2.0, using system mode. My previous impression, possibly from
> > https://wiki.qemu.org/Features/Migration/Troubleshooting#Basics was that
> > this ought to work:
> > 
> >> Note that QEMU supports migrating forward between QEMU versions
> > 
> > Note that I'm using qemu-system-aarch64 with -loadvm.
> > 
> > However, I've run into several issues I thought I should report. The
> > first of them was that this commit changed the address of CBAR, which
> > resulted in a mismatch of the register IDs in `cpu_post_load` in
> > target/arm/machine.c:
> > https://patchwork.kernel.org/project/qemu-devel/patch/20190927144249.29999-2-peter.maydell@linaro.org/
> > 
> > The second was that several system registers have changed which bits are
> > allowed to be written in different circumstances, seemingly as a result
> > of a combination of bugfixes and implementation of additional behavior.
> > These hit errors detected in `write_list_to_cpustate` in
> > target/arm/helper.c.
> > 
> > The third is that meanings of the bits in env->features (as defined by
> > `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> > ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> > ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> > added since 4.1.0. Heck, even I have added a field there in the past.
> > Unfortunately, these additions/removals mean that when env->features is
> > saved on one version and restored on another the bits can mean different
> > things. Notably, the removal of the *VFP features means that a snapshot
> > of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> > ARM_FEATURE_M on 5.2.0!
> > 
> > My guess, given the numerous issues and the additional complexity
> > required to properly implement backwards-compatible snapshotting, is
> > that this is not a primary goal. However, if it is a goal, what steps
> > can/should we take to support it more thoroughly?
> > 
> > Thanks!
> > 
> > -Aaron
> > 
> > p.s. Now for an admission: the snapshots I'm testing with were
> > originally taken with `-cpu max`. This was unintentional, and I
> > understand if the response is that I can't expect `-cpu max` checkpoints
> > to work across QEMU versions... but I also don't think that all of these
> > issues can be blamed on that (notably CBAR and env->features).
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


