Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E7234197
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 10:55:29 +0200 (CEST)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Qp6-00034O-8D
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 04:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k1QoA-0002cg-Oz
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 04:54:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30272
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k1Qo7-000822-3i
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 04:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596185665;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LftEs5P+9vPDiu+8rc3ywvBvIIc4MuZ9AhIAq/EURY4=;
 b=geNOxRtcvumYgfGqxZDe9rhBdmmbKpE31BVZNhBpSfhh4EyKf5Oc+zmlRaPBWdRaiKo4fz
 tOiVUcEgcaII4IYe61OkgKklGQgB9W6PozIRcyMeFwGCg1C25vQ3dRZBS3H3bu9/chZr3P
 FrmGgVjt18BgW6YarvuzKRbLQ+ZZOO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-Dad-qAF3NJSngcjIAjMHyA-1; Fri, 31 Jul 2020 04:54:20 -0400
X-MC-Unique: Dad-qAF3NJSngcjIAjMHyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BECB779EC0;
 Fri, 31 Jul 2020 08:54:19 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25ECA69318;
 Fri, 31 Jul 2020 08:53:51 +0000 (UTC)
Date: Fri, 31 Jul 2020 09:53:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V1 00/32] Live Update
Message-ID: <20200731085349.GB3518939@redhat.com>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <20200730165249.GR3477223@redhat.com>
 <aa6940d9-7c2a-bdc2-edaf-ea4fea56e61f@oracle.com>
MIME-Version: 1.0
In-Reply-To: <aa6940d9-7c2a-bdc2-edaf-ea4fea56e61f@oracle.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 03:06:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 30, 2020 at 02:48:44PM -0400, Steven Sistare wrote:
> On 7/30/2020 12:52 PM, Daniel P. Berrangé wrote:
> > On Thu, Jul 30, 2020 at 08:14:04AM -0700, Steve Sistare wrote:
> >> Improve and extend the qemu functions that save and restore VM state so a
> >> guest may be suspended and resumed with minimal pause time.  qemu may be
> >> updated to a new version in between.
> >>
> >> The first set of patches adds the cprsave and cprload commands to save and
> >> restore VM state, and allow the host kernel to be updated and rebooted in
> >> between.  The VM must create guest RAM in a persistent shared memory file,
> >> such as /dev/dax0.0 or persistant /dev/shm PKRAM as proposed in 
> >> https://lore.kernel.org/lkml/1588812129-8596-1-git-send-email-anthony.yznaga@oracle.com/
> >>
> >> cprsave stops the VCPUs and saves VM device state in a simple file, and
> >> thus supports any type of guest image and block device.  The caller must
> >> not modify the VM's block devices between cprsave and cprload.
> >>
> >> cprsave and cprload support guests with vfio devices if the caller first
> >> suspends the guest by issuing guest-suspend-ram to the qemu guest agent.
> >> The guest drivers suspend methods flush outstanding requests and re-
> >> initialize the devices, and thus there is no device state to save and
> >> restore.
> >>
> >>    1 savevm: add vmstate handler iterators
> >>    2 savevm: VM handlers mode mask
> >>    3 savevm: QMP command for cprsave
> >>    4 savevm: HMP Command for cprsave
> >>    5 savevm: QMP command for cprload
> >>    6 savevm: HMP Command for cprload
> >>    7 savevm: QMP command for cprinfo
> >>    8 savevm: HMP command for cprinfo
> >>    9 savevm: prevent cprsave if memory is volatile
> >>   10 kvmclock: restore paused KVM clock
> >>   11 cpu: disable ticks when suspended
> >>   12 vl: pause option
> >>   13 gdbstub: gdb support for suspended state
> >>
> >> The next patches add a restart method that eliminates the persistent memory
> >> constraint, and allows qemu to be updated across the restart, but does not
> >> allow host reboot.  Anonymous memory segments used by the guest are
> >> preserved across a re-exec of qemu, mapped at the same VA, via a proposed
> >> madvise(MADV_DOEXEC) option in the Linux kernel.  See
> >> https://lore.kernel.org/lkml/1595869887-23307-1-git-send-email-anthony.yznaga@oracle.com/
> >>
> >>   14 savevm: VMS_RESTART and cprsave restart
> >>   15 vl: QEMU_START_FREEZE env var
> >>   16 oslib: add qemu_clr_cloexec
> >>   17 util: env var helpers
> >>   18 osdep: import MADV_DOEXEC
> >>   19 memory: ram_block_add cosmetic changes
> >>   20 vl: add helper to request re-exec
> >>   21 exec, memory: exec(3) to restart
> >>   22 char: qio_channel_socket_accept reuse fd
> >>   23 char: save/restore chardev socket fds
> >>   24 ui: save/restore vnc socket fds
> >>   25 char: save/restore chardev pty fds
> > 
> > Keeping FDs open across re-exec is a nice trick, but how are you dealing
> > with the state associated with them, most especially the TLS encryption
> > state ? AFAIK, there's no way to serialize/deserialize the TLS state that
> > GNUTLS maintains, and the patches don't show any sign of dealing with
> > this. IOW it looks like while the FD will be preserved, any TLS session
> > running on it will fail.
> 
> I had not considered TLS.  If a non-qemu library maintains connection state, then
> we won't be able to support it for live update until the library provides interfaces
> to serialize the state.
> 
> For qemu objects, so far vmstate has been adequate to represent the devices with
> descriptors that we preserve.

My main concern about this series is that there is an implicit assumption
that QEMU is *not* configured with certain features that are not handled
If QEMU is using one of the unsupported features, I don't see anything in
the series which attempts to prevent the actions.

IOW, users can have an arbitrary QEMU config, attempt to use these new features,
the commands may well succeed, but the user is silently left with a broken QEMU.
Such silent failure modes are really undesirable as they'll lead to a never
ending stream of hard to diagnose bug reports for QEMU maintainers.

TLS is one example of this, the live upgrade  will "succeed", but the TLS
connections will be totally non-functional.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


