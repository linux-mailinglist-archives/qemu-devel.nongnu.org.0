Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADEA2C6371
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:52:24 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibMV-0000Iw-B0
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kibKt-0007RB-IF
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kibKq-0001sG-Lr
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606474239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Af0j5+gHj0tbQTm4LXh+q7OIwk/N513Zrkaur+Era7E=;
 b=W4DR2CZ8aJnIqlf/8YCeg+bDFgTdGNJkms28mDYmy64uE3g8CmFYnBjw2zL+LJzXVeo0eY
 zbUV4MpgK+NHCOuaRuQV44J36yNHfYHwCxWe+dqCrOUjKF96wpPznDCJKgL7anoPNe8eb2
 6ncEUDZjg4AKH/vHVLA7J+aOVnSQLIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-suR2dF7BMX2GOqbxCLxvaQ-1; Fri, 27 Nov 2020 05:50:37 -0500
X-MC-Unique: suR2dF7BMX2GOqbxCLxvaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB6B9107AD34
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:50:36 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA4EA5D9D0;
 Fri, 27 Nov 2020 10:50:35 +0000 (UTC)
Date: Fri, 27 Nov 2020 11:50:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 26/36] remove preconfig state
Message-ID: <20201127115033.187f20ee@redhat.com>
In-Reply-To: <f356049d-36e1-9b63-b50d-0a9ca2d1cb96@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-27-pbonzini@redhat.com>
 <20201126195551.7b761db9@redhat.com>
 <f356049d-36e1-9b63-b50d-0a9ca2d1cb96@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 06:19:51 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 26/11/20 19:55, Igor Mammedov wrote:
> > On Mon, 23 Nov 2020 09:14:25 -0500
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >   
> >> The preconfig state is only used if -incoming is not specified, which
> >> makes the RunState state machine more tricky than it need be.  However
> >> there is already an equivalent condition which works even with -incoming,
> >> namely qdev_hotplug.  Use it instead of a separate runstate.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>   hw/core/machine-qmp-cmds.c    |  5 ++---
> >>   include/qapi/qmp/dispatch.h   |  1 +
> >>   monitor/hmp.c                 |  7 ++++---
> >>   monitor/qmp-cmds.c            |  5 ++---
> >>   qapi/qmp-dispatch.c           |  5 +----
> >>   qapi/run-state.json           |  5 +----
> >>   softmmu/qdev-monitor.c        | 12 ++++++++++++
> >>   softmmu/vl.c                  | 13 ++-----------
> >>   stubs/meson.build             |  1 +
> >>   stubs/qmp-command-available.c |  7 +++++++
> >>   tests/qtest/qmp-test.c        |  2 +-
> >>   11 files changed, 34 insertions(+), 29 deletions(-)
> >>   create mode 100644 stubs/qmp-command-available.c
> >>
> >> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> >> index 5362c80a18..cb9387c5f5 100644
> >> --- a/hw/core/machine-qmp-cmds.c
> >> +++ b/hw/core/machine-qmp-cmds.c
> >> @@ -286,9 +286,8 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
> >>   
> >>   void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
> >>   {
> >> -    if (!runstate_check(RUN_STATE_PRECONFIG)) {
> >> -        error_setg(errp, "The command is permitted only in '%s' state",
> >> -                   RunState_str(RUN_STATE_PRECONFIG));
> >> +    if (qdev_hotplug) {  
> > 
> > that would work only as long as qemu_init_board() hasn't been called,
> > and fall apart as soon as we permit creating cold-pluged devices
> > (qemu_create_cli_devices()) at preconfig stage.
> > 
> > for qmp_set_numa_node() the better fit would something like
> >    if(is_board_created)
> >       error_out
> > so it won't break silently when we start extending list of
> > commands allowed at preconfig time.
> >   
> >> +         error_setg(errp, "The command is permitted only before the machine has been created");
> >>            return;
> >>       }  
> 
> I don't understand...  qdev_hotplug is a bad name for is_board_created, 
> it is set by qdev_machine_creation_done which is called after preconfig 
> is left.  As of this patch that happens after the early 
> qemu_main_loop(); the next patch moves it to qmp_x_exit_preconfig.
it works in context of this series since

  +    qemu_init_board();
  +    qemu_create_cli_devices();
  +    qemu_machine_creation_done();

are called within the same command qmp_x_exit_preconfig, 
if preconfig is enabled we happen to call qmp_set_numa_node()
and if (qdev_hotplug) {error} work as expected, since qemu_init_board()
hasn't been called yet.

but I'm thinking about what happens beyond this series, when we start
splitting qmp_x_exit_preconfig() after this series on separate stages.

By using qdev_hotplug here, we practically loose dependency tracking
on qemu_init_board() not being yet called. And if later we forget that,
then it would allow to call qmp_set_numa_node() after qemu_init_board()
but before qemu_machine_creation_done()

So for this intermediate stage, instead of abusing qdev_hotplug adding
a temporary is_board_created might be used. And when we introduce
new phases you've described below, is_board_created could be replaced
with appropriate phase check.


> Cold-plugged devices would (by definition) be created while qdev_hotplug 
> is false.  But before we get there, I will have replaced the two states 
> permitted by qdev_hotplug with five separate phases (PHASE_NO_MACHINE, 
> PHASE_MACHINE_CREATED, PHASE_ACCEL_CREATED, PHASE_MACHINE_INITIALIZED, 
> PHASE_MACHINE_READY) to clarify the QMP command implementation and to 
> assert that various functions are called in the right phase.
> 
> Thanks,
> 
> Paolo
> 


