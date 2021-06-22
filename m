Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289933AFF41
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:28:35 +0200 (CEST)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvblq-0006bR-7a
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvbks-0005ZY-27
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvbkq-0000Vj-93
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624350451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gUSDzQn2JDNyce6kfkRiMCWobRGZ7nLKbW0Kv1C1Nco=;
 b=NpZFAQ/lr/UnT/BwbfIUDi1cfDM1o1tMaiE95Ejtw3cKGuIfneGp7jYSRW5A8IPadEBAKz
 f+pJgrgWt8Ng4EREJgRbUM+5SfXp5j8jSTd+C0Z6CzLZ3xOVTuxSMkjnd79AXWLzUw4f40
 ze1+0sIwWY3/3Lk8i6i0U7mEIrTR8cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-KTq7XycLNDqWaBpi9xihnw-1; Tue, 22 Jun 2021 04:27:25 -0400
X-MC-Unique: KTq7XycLNDqWaBpi9xihnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D8A80431F;
 Tue, 22 Jun 2021 08:27:24 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75E6E5C1D1;
 Tue, 22 Jun 2021 08:27:13 +0000 (UTC)
Date: Tue, 22 Jun 2021 09:27:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
Message-ID: <YNGe3iiZ103ps36n@redhat.com>
References: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
 <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com>
 <87o8byqpao.fsf@toke.dk>
MIME-Version: 1.0
In-Reply-To: <87o8byqpao.fsf@toke.dk>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke Høiland-Jørgensen wrote:
> Jason Wang <jasowang@redhat.com> writes:
> 
> > 在 2021/6/22 上午11:29, Yuri Benditovich 写道:
> >> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com> wrote:
> >>>
> >>> 在 2021/6/19 上午4:03, Andrew Melnichenko 写道:
> >>>> Hi Jason,
> >>>> I've checked "kernel.unprivileged_bpf_disabled=0" on Fedora,  Ubuntu,
> >>>> and Debian - no need permissions to update BPF maps.
> >>>
> >>> How about RHEL :) ?
> >> If I'm not mistaken, the RHEL releases do not use modern kernels yet
> >> (for BPF we need 5.8+).
> >> So this will be (probably) relevant for RHEL 9. Please correct me if I'm wrong.
> >
> > Adding Toke for more ideas on this.
> 
> Ignore the kernel version number; we backport all of BPF to RHEL,
> basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.
> 
> However, we completely disable unprivileged BPF on RHEL kernels. Also,
> there's upstream commit:
> 08389d888287 ("bpf: Add kconfig knob for disabling unpriv bpf by default")
> 
> which adds a new value of '2' to the unprivileged_bpf_disable sysctl. I
> believe this may end up being the default on Fedora as well.
> 
> So any design relying on unprivileged BPF is likely to break; I'd
> suggest you look into how you can get this to work with CAP_BPF :)

QEMU will never have any capabilities. Any resources that required
privileges have to be opened by a separate privileged helper, and the
open FD then passed across to the QEMU process. This relies on the
capabilities checks only being performed at time of initial opening,
and *not* on operations performed on the already open FD.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


