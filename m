Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BEB17AB39
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 18:10:10 +0100 (CET)
Received: from localhost ([::1]:53572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9u0f-0001m9-6M
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 12:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1j9tye-0007f4-81
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 12:08:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1j9tyb-0002y3-Of
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 12:08:03 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40412)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1j9tyb-0002xg-EH
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 12:08:01 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 025GrvdH140302;
 Thu, 5 Mar 2020 17:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=SnQ/FGqWKPanjSDWy3VDPnOCUP35ITBXNLc8SPZioVI=;
 b=HRY+UScigxyxzcixX62StY+Oix4jCkGY2UEzlbXWns6G0ydTuoB4GXqrBaYBjmosPhEG
 stWLQpETR6eEbtsdZq6hhdMGiQaVI1Oge+FEaA8Thyo2chjVHijQe35g5Jy88rZ0lpu1
 j56dC3/5Hau2Wwv7xfEdesQozNB6GJadETnxM7ODJtlimD0EluhLZJX1iwZS7pf6sJKa
 ClSnTiBUCtfEAt246/JB8/ujnRlo4smgvdSdG+zlHhBzMunALwBPNQlsYLhF7h8+Q6tn
 MEy/xCi+qrzc7Juytv3bSF79Fi4rsG7lyVibSZY8Ed+VqgGyppBXDnpdrWloYMGQi0m5 MQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yffcuxjd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Mar 2020 17:07:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 025GrAtS145668;
 Thu, 5 Mar 2020 17:07:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2yg1h3wxks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Mar 2020 17:07:52 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 025H7o61007348;
 Thu, 5 Mar 2020 17:07:50 GMT
Received: from flaka (/174.207.16.221) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 05 Mar 2020 09:07:50 -0800
Date: Thu, 5 Mar 2020 09:07:46 -0800
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 40/50] multi-process/mig: build migration module in
 the remote process
Message-ID: <20200305170746.GB26883@flaka>
References: <cover.1582576372.git.jag.raman@oracle.com>
 <96a495711764282ff90504cec6734eff563ceb4d.1582576372.git.jag.raman@oracle.com>
 <20200304155859.GG4104@work-vm>
 <240f3182-80bb-f808-f93a-a41634eaff54@oracle.com>
 <20200304195201.GM4104@work-vm>
 <ce7ed38a-f17b-3a94-3a26-91abed632d17@oracle.com>
 <20200305101059.GC3130@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305101059.GC3130@work-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9551
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9551
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003050106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 Jag Raman <jag.raman@oracle.com>, quintela@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, liran.alon@oracle.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, rth@twiddle.net,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 05, 2020 at 10:10:59AM +0000, Dr. David Alan Gilbert wrote:
> * Jag Raman (jag.raman@oracle.com) wrote:
> > 
> > 
> > On 3/4/2020 2:52 PM, Dr. David Alan Gilbert wrote:
> > > * Jag Raman (jag.raman@oracle.com) wrote:
> > > > 
> > > > 
> > > > On 3/4/2020 10:58 AM, Dr. David Alan Gilbert wrote:
> > > > > * Jagannathan Raman (jag.raman@oracle.com) wrote:
> > > > > > Add Makefile support to enable migration in remote process
> > > > > > 
> > > > > > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > > > > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > > > > > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > > > > > ---
> > > > > >    Makefile.objs           |  4 +++-
> > > > > >    Makefile.target         |  1 +
> > > > > >    migration/Makefile.objs | 13 ++++++++++++-
> > > > > >    net/Makefile.objs       |  2 ++
> > > > > >    softmmu/vl.c            |  2 --
> > > > > >    stubs/migration.c       | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > >    stubs/net-stub.c        | 21 +++++++++++++++++++++
> > > > > >    stubs/qapi-misc.c       |  2 ++
> > > > > >    stubs/replay.c          |  8 ++++++++
> > > > > >    stubs/vl-stub.c         | 24 ++++++++++++++++++++++++
> > > > > >    vl-parse.c              |  3 +++
> > > > > >    11 files changed, 125 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/Makefile.objs b/Makefile.objs
> > > > > > index 4b5db09..65009da 100644
> > > > > > --- a/Makefile.objs
> > > > > > +++ b/Makefile.objs
> > > > > > @@ -74,6 +74,8 @@ common-obj-y += qdev-monitor.o device-hotplug.o
> > > > > >    common-obj-$(CONFIG_WIN32) += os-win32.o
> > > > > >    common-obj-$(CONFIG_POSIX) += os-posix.o
> > > > > > +remote-pci-obj-$(CONFIG_POSIX) += os-posix.o
> > > > > > +
> > > > > >    common-obj-$(CONFIG_LINUX) += fsdev/
> > > > > >    common-obj-y += accel/
> > > > > > @@ -104,11 +106,11 @@ common-obj-y += vl-parse.o
> > > > > >    #######################################################################
> > > > > >    # qapi
> > > > > > -
> > > > > >    common-obj-y += qapi/
> > > > > >    endif # CONFIG_SOFTMMU
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += net/
> > > > > >    remote-pci-obj-$(CONFIG_MPQEMU) += qapi/
> > > > > >    remote-pci-obj-$(CONFIG_MPQEMU) += blockdev-nbd.o
> > > > > >    remote-pci-obj-$(CONFIG_MPQEMU) += job-qmp.o
> > > > > > diff --git a/Makefile.target b/Makefile.target
> > > > > > index 4ead5c3..4012ae5 100644
> > > > > > --- a/Makefile.target
> > > > > > +++ b/Makefile.target
> > > > > > @@ -240,6 +240,7 @@ all-remote-pci-obj-y += exec.o
> > > > > >    all-remote-pci-obj-y += exec-vary.o
> > > > > >    all-remote-pci-obj-y += ioport.o
> > > > > >    all-remote-pci-obj-y += cpus.o
> > > > > > +all-remote-pci-obj-y += migration/ram.o
> > > > > >    endif
> > > > > >    remote-pci-obj-y :=
> > > > > > diff --git a/migration/Makefile.objs b/migration/Makefile.objs
> > > > > > index e7cdc76..21f9d8d 100644
> > > > > > --- a/migration/Makefile.objs
> > > > > > +++ b/migration/Makefile.objs
> > > > > > @@ -15,4 +15,15 @@ common-obj-$(CONFIG_LIVE_BLOCK_MIGRATION) += block.o
> > > > > >    rdma.o-libs := $(RDMA_LIBS)
> > > > > > -remote-pci-obj-$(CONFIG_MPQEMU) += qemu-file.o vmstate.o qjson.o vmstate-types.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += migration.o socket.o fd.o exec.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += tls.o channel.o savevm.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += colo.o colo-failover.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += vmstate.o vmstate-types.o page_cache.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += qemu-file.o global_state.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += qemu-file-channel.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += xbzrle.o postcopy-ram.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += qjson.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += block-dirty-bitmap.o
> > > > > > +remote-pci-obj-$(CONFIG_RDMA) += rdma.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += block.o
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += multifd.o
> > > > > 
> > > > > Hmm, are you really going to want all this lot in your remote process?
> > > > > Assuming it's just devices, I can understand the first line or two, but
> > > > > it seems odd to have all of this.
> > > > 
> > > > Yeah, we ended up needing to compile these in to enable migration. We
> > > > are only using "fd" to enable migration. Although we don't use tls,
> > > > xbzrle, rdma, multifd, etc... for example, the migration code does
> > > > support these protocols and, therefore, we had to compile them in.
> > > 
> > > But are you even running a migration stream from the remote process?
> > > Aren't you just doing vmstate migration of devices; i.e. do you need
> > > anything relating to incremental RAM migration (e.g. xbzrle, rdma,
> > > postcopy).
> > 
> > We are running a migration stream from the remote process. We are only
> > doing the vmstate migration of devices, and not anything incremental
> > related to RAM.
> > 
> > We are using QEMU's existing migration infrastructure (vmstate_save /
> > qemu_loadvm_section_start_full) to move the vmstate. Based on my limited
> > experience with the migration code, I get that it comes as a suite.
> > Without some refactoring, we would need to build all of the files within
> > the migration folder.
> > 
> > The vmstate functions communicate over QEMUFile, which would be using
> > fd, tcp, rdma, etc... at the backend. These functions also need other
> > functions defined in migration.c, which require the building of xbzrle,
> > postcopy, etc...
> 
> OK, I bet we can refactor some of that to be modular fairly easily; some
> is harder than others.  For example there are different QEMUFile
> subclasses for RDMA, so you should be able to have just the top level
> QEMUFile and the implementations you need.
> Similarly the vmstate code shouldn't depend on the ram code;  we can
> look at splitting it up some how.
>

Hi Dave

We did initially tried to split some of the vmstate code, and it was a lot of code to add to
already big patchset. So we could do this split later on as a separate series.
Would that be an option or you would rather see it in this set?

Thank you!

Elena 
> Dave
> 
> > Thank you!
> > --
> > Jag
> > 
> > > 
> > > Dave
> > > 
> > > > Thank you!
> > > > --
> > > > Jag
> > > > 
> > > > > 
> > > > > Dave
> > > > > 
> > > > > > diff --git a/net/Makefile.objs b/net/Makefile.objs
> > > > > > index c5d076d..a8ad986 100644
> > > > > > --- a/net/Makefile.objs
> > > > > > +++ b/net/Makefile.objs
> > > > > > @@ -30,3 +30,5 @@ common-obj-$(CONFIG_WIN32) += tap-win32.o
> > > > > >    vde.o-libs = $(VDE_LIBS)
> > > > > >    common-obj-$(CONFIG_CAN_BUS) += can/
> > > > > > +
> > > > > > +remote-pci-obj-$(CONFIG_MPQEMU) += announce.o
> > > > > > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > > > > > index 4a4f52c..42d5682 100644
> > > > > > --- a/softmmu/vl.c
> > > > > > +++ b/softmmu/vl.c
> > > > > > @@ -128,7 +128,6 @@ const char* keyboard_layout = NULL;
> > > > > >    ram_addr_t ram_size;
> > > > > >    const char *mem_path = NULL;
> > > > > >    int mem_prealloc = 0; /* force preallocation of physical target memory */
> > > > > > -bool enable_mlock = false;
> > > > > >    bool enable_cpu_pm = false;
> > > > > >    int nb_nics;
> > > > > >    NICInfo nd_table[MAX_NICS];
> > > > > > @@ -168,7 +167,6 @@ const char *prom_envs[MAX_PROM_ENVS];
> > > > > >    int boot_menu;
> > > > > >    bool boot_strict;
> > > > > >    uint8_t *boot_splash_filedata;
> > > > > > -int only_migratable; /* turn it off unless user states otherwise */
> > > > > >    bool wakeup_suspend_enabled;
> > > > > >    int icount_align_option;
> > > > > > diff --git a/stubs/migration.c b/stubs/migration.c
> > > > > > index 28ccf80..dbd12db 100644
> > > > > > --- a/stubs/migration.c
> > > > > > +++ b/stubs/migration.c
> > > > > > @@ -6,6 +6,35 @@
> > > > > >    #include "qapi/qapi-types-migration.h"
> > > > > >    #include "qapi/qapi-commands-migration.h"
> > > > > >    #include "qapi/qapi-types-net.h"
> > > > > > +#include "net/filter.h"
> > > > > > +#include "net/colo-compare.h"
> > > > > > +
> > > > > > +#pragma weak qmp_query_migrate_capabilities
> > > > > > +#pragma weak qmp_query_migrate_parameters
> > > > > > +#pragma weak migrate_announce_params
> > > > > > +#pragma weak qmp_query_migrate
> > > > > > +#pragma weak qmp_migrate_set_capabilities
> > > > > > +#pragma weak qmp_migrate_set_parameters
> > > > > > +#pragma weak qmp_migrate_incoming
> > > > > > +#pragma weak qmp_migrate_recover
> > > > > > +#pragma weak qmp_migrate_pause
> > > > > > +#pragma weak qmp_migrate
> > > > > > +#pragma weak qmp_migrate_cancel
> > > > > > +#pragma weak qmp_migrate_continue
> > > > > > +#pragma weak qmp_migrate_set_cache_size
> > > > > > +#pragma weak qmp_query_migrate_cache_size
> > > > > > +#pragma weak qmp_migrate_set_speed
> > > > > > +#pragma weak qmp_migrate_set_downtime
> > > > > > +#pragma weak qmp_migrate_start_postcopy
> > > > > > +#pragma weak migration_global_dump
> > > > > > +#pragma weak save_snapshot
> > > > > > +#pragma weak qmp_xen_save_devices_state
> > > > > > +#pragma weak load_snapshot
> > > > > > +#pragma weak qmp_xen_set_replication
> > > > > > +#pragma weak qmp_query_xen_replication_status
> > > > > > +#pragma weak qmp_xen_colo_do_checkpoint
> > > > > > +#pragma weak qmp_query_colo_status
> > > > > > +#pragma weak qmp_x_colo_lost_heartbeat
> > > > > >    MigrationInfo *qmp_query_migrate(Error **errp)
> > > > > >    {
> > > > > > @@ -160,3 +189,23 @@ AnnounceParameters *migrate_announce_params(void)
> > > > > >        return NULL;
> > > > > >    }
> > > > > > +
> > > > > > +void colo_notify_filters_event(int event, Error **errp)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > +
> > > > > > +void colo_notify_compares_event(void *opaque, int event, Error **errp)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > +
> > > > > > +void colo_compare_register_notifier(Notifier *notify)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > +
> > > > > > +void colo_compare_unregister_notifier(Notifier *notify)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > diff --git a/stubs/net-stub.c b/stubs/net-stub.c
> > > > > > index 962827e..ddfd1e4 100644
> > > > > > --- a/stubs/net-stub.c
> > > > > > +++ b/stubs/net-stub.c
> > > > > > @@ -5,6 +5,8 @@
> > > > > >    #include "qapi/qapi-commands-net.h"
> > > > > >    #include "qapi/qapi-commands-rocker.h"
> > > > > > +#pragma weak qmp_announce_self
> > > > > > +
> > > > > >    int qemu_find_net_clients_except(const char *id, NetClientState **ncs,
> > > > > >                                     NetClientDriver type, int max)
> > > > > >    {
> > > > > > @@ -98,3 +100,22 @@ void netdev_add(QemuOpts *opts, Error **errp)
> > > > > >    {
> > > > > >        qemu_debug_assert(0);
> > > > > >    }
> > > > > > +
> > > > > > +NetClientState *qemu_get_queue(NICState *nic)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +
> > > > > > +    return NULL;
> > > > > > +}
> > > > > > +
> > > > > > +ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int size)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +
> > > > > > +    return 0;
> > > > > > +}
> > > > > > +
> > > > > > +void qemu_foreach_nic(qemu_nic_foreach func, void *opaque)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > diff --git a/stubs/qapi-misc.c b/stubs/qapi-misc.c
> > > > > > index 3eeedd9..824eac1 100644
> > > > > > --- a/stubs/qapi-misc.c
> > > > > > +++ b/stubs/qapi-misc.c
> > > > > > @@ -5,6 +5,8 @@
> > > > > >    #include "./qapi/qapi-types-dump.h"
> > > > > >    #include "qapi/qapi-commands-dump.h"
> > > > > > +#pragma weak qmp_xen_load_devices_state
> > > > > > +
> > > > > >    void qmp_dump_guest_memory(bool paging, const char *file,
> > > > > >                               bool has_detach, bool detach,
> > > > > >                               bool has_begin, int64_t begin, bool has_length,
> > > > > > diff --git a/stubs/replay.c b/stubs/replay.c
> > > > > > index 9b53c0c..6fc7850 100644
> > > > > > --- a/stubs/replay.c
> > > > > > +++ b/stubs/replay.c
> > > > > > @@ -1,4 +1,5 @@
> > > > > >    #include "qemu/osdep.h"
> > > > > > +#include "qemu-common.h"
> > > > > >    #include "sysemu/replay.h"
> > > > > >    ReplayMode replay_mode;
> > > > > > @@ -106,3 +107,10 @@ void replay_account_executed_instructions(void)
> > > > > >    void replay_add_blocker(Error *reason)
> > > > > >    {
> > > > > >    }
> > > > > > +
> > > > > > +bool replay_can_snapshot(void)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +
> > > > > > +    return false;
> > > > > > +}
> > > > > > diff --git a/stubs/vl-stub.c b/stubs/vl-stub.c
> > > > > > index 606f078..5f308c1 100644
> > > > > > --- a/stubs/vl-stub.c
> > > > > > +++ b/stubs/vl-stub.c
> > > > > > @@ -14,6 +14,8 @@
> > > > > >    #include "disas/disas.h"
> > > > > >    #include "audio/audio.h"
> > > > > > +#pragma weak qemu_add_exit_notifier
> > > > > > +
> > > > > >    bool tcg_allowed;
> > > > > >    bool xen_allowed;
> > > > > >    bool boot_strict;
> > > > > > @@ -169,3 +171,25 @@ int wav_start_capture(AudioState *state, CaptureState *s, const char *path,
> > > > > >        return -1;
> > > > > >    }
> > > > > > +
> > > > > > +void qemu_system_killed(int signal, pid_t pid)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > +
> > > > > > +void qemu_system_reset(ShutdownCause reason)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > +
> > > > > > +bool runstate_store(char *str, size_t size)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +
> > > > > > +    return false;
> > > > > > +}
> > > > > > +
> > > > > > +void qemu_add_exit_notifier(Notifier *notify)
> > > > > > +{
> > > > > > +    qemu_debug_assert(0);
> > > > > > +}
> > > > > > diff --git a/vl-parse.c b/vl-parse.c
> > > > > > index 1f6a3f0..423f4a0 100644
> > > > > > --- a/vl-parse.c
> > > > > > +++ b/vl-parse.c
> > > > > > @@ -27,6 +27,9 @@
> > > > > >    #include "vl.h"
> > > > > > +int only_migratable; /* turn it off unless user states otherwise */
> > > > > > +bool enable_mlock;
> > > > > > +
> > > > > >    /***********************************************************/
> > > > > >    /* QEMU Block devices */
> > > > > > -- 
> > > > > > 1.8.3.1
> > > > > > 
> > > > > --
> > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > > 
> > > > 
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > 
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

