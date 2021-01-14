Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE772F63B6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:08:26 +0100 (CET)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Eb-0003I1-I2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l049g-0001nu-HJ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l049a-0001CN-7j
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610636593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhfBV5+9TAriZ1ROovaPluf8T7WjGnI4Ivmpp1Bu1/U=;
 b=J+jYAuxBWn1txY9dsH7B3DustsnThG49sDY3GVxY6ktTC/WScPsTszw68EaZAKYeeUBAU5
 fz0epgEH0ssciRv47NSuBS5ChYtBP7J3D4Ia3kyAFxNUG8eqeAk4wgQf7e/f7E6h3GFo5N
 bcX8Zpa2UMwqdl63UZ2C27JnGs0i3wE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-FweXK2aDM8GYE28F2UDRcQ-1; Thu, 14 Jan 2021 10:03:11 -0500
X-MC-Unique: FweXK2aDM8GYE28F2UDRcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1479B1034B21;
 Thu, 14 Jan 2021 15:03:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 192475D9E2;
 Thu, 14 Jan 2021 15:02:57 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:02:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: qmp-shell TUI (was: Re: Call for Google Summer of Code 2021
 project ideas)
Message-ID: <20210114150256.GE6058@merkur.fritz.box>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <CAJSP0QVRohWcfYY7AjispK8+VYat6APc3nNbmAxk+34nZmtFPw@mail.gmail.com>
 <e8938b53-a933-426c-0719-981ab0df123f@redhat.com>
 <20210114135234.GC292902@stefanha-x1.localdomain>
 <20210114135942.GI1643043@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210114135942.GI1643043@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 Stefan Hajnoczi <stefanha@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.2021 um 14:59 hat Daniel P. Berrangé geschrieben:
> On Thu, Jan 14, 2021 at 01:52:34PM +0000, Stefan Hajnoczi wrote:
> > On Wed, Jan 13, 2021 at 01:59:43PM -0500, John Snow wrote:
> > > On 1/13/21 3:53 AM, Stefan Hajnoczi wrote:
> > > > On Tue, Jan 12, 2021 at 9:10 PM John Snow <jsnow@redhat.com> wrote:
> > > > 2. Ability to watch QMP activity on a running QEMU process, e.g. even
> > > > when libvirt is directly connected to the monitor.
> > > > 
> > > 
> > > That *WOULD* be extremely cool, and moves a lot closer to how mitmproxy
> > > works.
> > > 
> > > (Actually, mitmproxy could theoretically be taught how to read and
> > > understand QMP traffic, but that's not something I know how to do or would
> > > be prepared to mentor.)
> > > 
> > > Is this possible to do in a post-hoc fashion? Let's say you are using
> > > production environment QEMU, how do we attach the QMP listener to it? Or
> > > does this idea require that we start QEMU in a specific fashion with a
> > > second debug socket that qmp-shell can connect to in order to listen?
> > > 
> > > ... Or do we engineer qmp-shell to open its own socket that libvirt connects
> > > to ...?
> > 
> > Here is the QEMU command-line that libvirt uses on my F33 system:
> > 
> >   -chardev socket,id=charmonitor,fd=36,server,nowait
> >   -mon chardev=charmonitor,id=monitor,mode=control
> > 
> > Goals for this feature:
> > 
> > 1. No manual steps required for setup.
> > 2. Ability to start/stop monitoring traffic at runtime without
> >    restarting QEMU.
> > 3. Available to unprivileged users.
> > 
> > I think the easiest way to achieve this is through a new QEMU monitor
> > command. Approaches that come to mind:
> > 
> > 1. Add a -mon debug-chardev property and a QMP command to set it at
> >    runtime. The debug-chardev receives both monitor input (commands) and
> >    output (responses and events). This does not allow MITM, rather it
> >    mirrors traffic.
> > 
> > 2. Add a chardev-get-fd command that fetches the fd from a chardev and
> >    then use the existing chardev-change command to replace the monitor
> >    chardev with a chardev connected to qmp-shell. This inserts qmp-shell
> >    as a proxy between the QMP client and server. qmp-shell can remove
> >    itself again with another chardev-change command. This approach
> >    allows MITM. The downside is it assumes the QMP chardev is a file
> >    descriptor, so it won't work with all types of chardev.
> > 
> > 3. Add a new chardev-proxy type that aggregates 3 chardevs: 1. an origin
> >    source chardev, 2. a monitoring sink chardev, and 3. a monitoring
> >    source chardev. The data flow is origin <-> monitoring sink <->
> >    monitoring source <-> QMP monitor. qmp-shell creates the monitoring
> >    sink (for receiving incoming QMP commands) and monitoring source
> >    chardev (for forwarding QMP commands or MITM commands), and then it
> >    uses change-chardev to instantiate a chardev-proxy that directs the
> >    original libvirt chardev through the monitoring sink and source.
> > 
> >    This is the most complex but also completely contained within the
> >    QEMU chardev layer.

I have an idea for the QMP command name: chardev-snapshot-sync!

Finally we get backing file chains for chardevs! :-)

> > In all these approaches qmp-shell uses virsh qemu-monitor-command or an
> > equivalent API to start/stop monitoring a running VM without manual
> > setup steps.
> 
> Why go to the trouble of adding more chardevs to a running QEMU that
> libvirt has.  qmp-shell can just directly use the libvirt Python API
> to invoke  virDomainQemuMonitorCommand to invoke QMP commands, and
> the othe API for receiving QMP events.
> 
> Essentially it just needs to be split into two layers. The upper
> layer works in terms of individual QMP command/replies, and QMP
> events. The lower layer provides a transport that is either a
> UNIX socket, or is the libvirt QMP passthrough API.
> 
> Or alternatively, provide a virt-qmp-shim  command that listens on
> a UNIX socket, accepts QMP commands and turns them into calls to
> virDomainQemuMonitorCommand, and funnells back the response.

I think the idea was to show the QMP traffic that libvirt produces for
other management applications, not for the QMP shell. These APIs
probably don't allow this?

Kevin


