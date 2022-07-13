Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E75736B4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 14:56:37 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBbuu-0006f2-1J
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 08:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oBbt3-0004TT-8o
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:54:41 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oBbt0-0006Ue-AG
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:54:40 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A384F33CEF;
 Wed, 13 Jul 2022 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657716875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=po/udvJtT0ZtQp+Godwhzy5xFPGjpHiNiWRvAvkBewM=;
 b=E24zV0zJgkkt/oVYbTerfmZcBS1EotAEPoAxwVguZuKq5Dq9Bz0bxhacOWYeps9DUjK6XD
 4d/kXKdPlbhLNR/3W+YidDdP22V3T+78p+g4OVGrTqKd15GMBSt9DpzG08PKMxb4pNqPXQ
 g4Wj04sp/KQAdUs8ol1VetnM+Ct7Icc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657716875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=po/udvJtT0ZtQp+Godwhzy5xFPGjpHiNiWRvAvkBewM=;
 b=o8fttkvU6cIVOsCe9NC2vxSsXsFYiQsqxLOdvaXrmTIUOsS8PY14PYrlHBlu8WGBISqrpE
 2WylKNq7XU3KJpAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F0A313AAD;
 Wed, 13 Jul 2022 12:54:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TGkvAYvAzmI5NQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 13 Jul 2022 12:54:35 +0000
Message-ID: <cd4e721a-481b-eeab-c59f-8bbff50fb4c5@suse.de>
Date: Wed, 13 Jul 2022 14:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzRdIE1vZGlmeWluZyDigJhtaWdyYXRl4oCZIHFt?=
 =?UTF-8?Q?p_command_to_add_multi-FD_socket_on_particular_source_and_destina?=
 =?UTF-8?Q?tion_pair?=
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jim Fehlig <jfehlig@suse.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com> <Yqtn1Q5Dkd2fe0G2@work-vm>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Yqtn1Q5Dkd2fe0G2@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/22 19:26, Dr. David Alan Gilbert wrote:
> * Het Gala (het.gala@nutanix.com) wrote:
>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>    each element in the list consists of multi-FD connection parameters: source
>>    and destination uris and of the number of multi-fd channels between each pair.
>>
>> ii) Information of all multi-FD connection parameters’ list, length of the list
>>     and total number of multi-fd channels for all the connections together is
>>     stored in ‘OutgoingArgs’ struct.
>>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>  include/qapi/util.h   |  9 ++++++++
>>  migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
>>  migration/socket.c    | 53 ++++++++++++++++++++++++++++++++++++++++---
>>  migration/socket.h    | 17 +++++++++++++-
>>  monitor/hmp-cmds.c    | 22 ++++++++++++++++--
>>  qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
>>  6 files changed, 170 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 81a2b13a33..3041feb3d9 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool complete);
>>      (tail) = &(*(tail))->next; \
>>  } while (0)
>>  
>> +#define QAPI_LIST_LENGTH(list) ({ \
>> +    int _len = 0; \
>> +    typeof(list) _elem; \
>> +    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
>> +        _len++; \
>> +    } \
>> +    _len; \
>> +})
>> +
>>  #endif
> 
> This looks like it should be a separate patch to me (and perhaps size_t
> for len?)
> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 31739b2af9..c408175aeb 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>>      return true;
>>  }
>>  
>> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>> +void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
>> +                 MigrateUriParameterList *cap, bool has_blk, bool blk,
>>                   bool has_inc, bool inc, bool has_detach, bool detach,
>>                   bool has_resume, bool resume, Error **errp)
>>  {
>>      Error *local_err = NULL;
>>      MigrationState *s = migrate_get_current();
>> -    const char *p = NULL;
>> +    const char *dst_ptr = NULL;
>>  
>>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>                           has_resume && resume, errp)) {
>> @@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>          }
>>      }
>>  
>> +    /*
>> +     * In case of Multi-FD migration parameters, if uri is provided,
> 
> I think you mean 'if uri list is provided'
> 
>> +     * supports only tcp network protocol.
>> +     */
>> +    if (has_multi_fd_uri_list) {
>> +        int length = QAPI_LIST_LENGTH(cap);
>> +        init_multifd_array(length);
>> +        for (int i = 0; i < length; i++) {
>> +            const char *p1 = NULL, *p2 = NULL;
> 
> Keep these as ps/pd  to make it clear which is source and dest.
> 
>> +            const char *multifd_dst_uri = cap->value->destination_uri;
>> +            const char *multifd_src_uri = cap->value->source_uri;
>> +            uint8_t multifd_channels = cap->value->multifd_channels;
>> +            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
>> +                !strstart(multifd_src_uri, "tcp:", &p2)) {
> 
> I've copied in Claudio Fontana; Claudio is fighting to make snapshots
> faster and has been playing with various multithread schemes for multifd
> with files and fd's;  perhaps the syntax you're proposing doesn't need
> to be limited to tcp.


Hi,

I will try to express our current problem, and see where there might be some overlap, maybe you can see more.

The current problem we are facing is, saving or restoring of VM state to disk, which in libvirt terms is "virsh save" or "virsh managedsave" and "virsh restore" or "virsh start",
is currently needlessly slow with large VMs, using upstream libvirt and qemu.

We need to get the transfer speeds of VM state (mainly RAM) to disk in the multiple GiB/s range with modern processors and NVMe disks; we have shown it is feasible.

Mainline libvirt uses QEMU migration to "fd://" to implement saving of VMs to disk, but adds copying though pipes via a libvirt "iohelper" process to work around a set of problems that are still not 100% clear to me;
(I cannot find the right email where this was discussed).

One clearly factual issue is that the QEMU migration stream is not currently O_DIRECT friendly, as it assumes it goes to network, and unfortunately for large transfers of this kind, O_DIRECT is needed due to the kernel file cache trashing problem.

So already, if your series were to address "fd://", it would potentially automatically provide an additional feature for libvirt's current save VM implementation; but I am not sure if what you are trying to achieve applies here.

Our temporary solution for libvirt to the throughput problem takes advantage of multifd migration to a "unix://" socket target to save in parallel,
with a new helper process (multifd-helper) taking the place of iohelper and performing the parallel multithreaded copy from the UNIX socket to a single file (in the latest iteration of the series),
or to multiple files in previous iterations, one for each multifd channel.

It works very well in practice, achieving dramatic throughput improvements by parallelizing the transfer reaching the GiB/s range.
This temporary solution is available here:

https://listman.redhat.com/archives/libvir-list/2022-June/232252.html

Libvirt is not accepting this approach, because the maintainer (Daniel, in Cc:) argues that the problem needs to be solved in QEMU instead,
while solving it in libvirt is an unwanted hack. My understanding is that this new feature is no more of a hack than the existing libvirt iohelper solution for basic VM save currently in mainline.

I don't really know how really this QEMU solution could look like yet.

If we code up a new QEMU "disk://" migration transport to save to a local file, and parameters to specify whether the transfer should happen in parallel, and how many parallel channels to use,
then we could solve the problem entirely in QEMU (possibly reusing some multifd code, or even not reusing that at all), but we end up with libvirt unable to efficiently put its own header as part of the savefile format libvirt expects.

An alternative could be instead to adjust the QEMU "fd://" migration protocol to add "parallel" parameters, and so keep the existing mechanism for libvirt/qemu communication for save vm,
change libvirt header read/write to be O_DIRECT friendly, and have qemu migrate in parallel directly to the open fd.

In both cases I presume that the QEMU migration stream code, including the code for all device state save, would need to be adjusted to be O_DIRECT friendly.

This modulo some additional details is my current understanding of the situation, I hope it helps.

Ciao,

Claudio

> 
>> +                error_setg(errp, "multi-fd destination and multi-fd source "
>> +                "uri, both should be present and follows tcp protocol only");
>> +                break;
>> +            } else {
>> +                store_multifd_migration_params(p1 ? p1 : multifd_dst_uri,
>> +                                            p2 ? p2 : multifd_src_uri,
>> +                                            multifd_channels, i, &local_err);
>> +            }
>> +            cap = cap->next;
>> +        }
>> +    }
>> +
>>      migrate_protocol_allow_multi_channels(false);
>> -    if (strstart(uri, "tcp:", &p) ||
>> +    if (strstart(uri, "tcp:", &dst_ptr) ||
>>          strstart(uri, "unix:", NULL) ||
>>          strstart(uri, "vsock:", NULL)) {
>>          migrate_protocol_allow_multi_channels(true);
>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>> +        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &local_err);
>>  #ifdef CONFIG_RDMA
>> -    } else if (strstart(uri, "rdma:", &p)) {
>> -        rdma_start_outgoing_migration(s, p, &local_err);
>> +    } else if (strstart(uri, "rdma:", &dst_ptr)) {
>> +        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
>>  #endif
>> -    } else if (strstart(uri, "exec:", &p)) {
>> -        exec_start_outgoing_migration(s, p, &local_err);
>> -    } else if (strstart(uri, "fd:", &p)) {
>> -        fd_start_outgoing_migration(s, p, &local_err);
>> +    } else if (strstart(uri, "exec:", &dst_ptr)) {
>> +        exec_start_outgoing_migration(s, dst_ptr, &local_err);
>> +    } else if (strstart(uri, "fd:", &dst_ptr)) {
>> +        fd_start_outgoing_migration(s, dst_ptr, &local_err);
>>      } else {
>>          if (!(has_resume && resume)) {
>>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> diff --git a/migration/socket.c b/migration/socket.c
>> index 4fd5e85f50..7ca6af8cca 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>      SocketAddress *saddr;
>>  } outgoing_args;
>>  
>> +struct SocketArgs {
>> +    struct SrcDestAddr data;
> 
> 'data' is an odd name; 'addresses' perhaps?
> 
>> +    uint8_t multifd_channels;
>> +};
>> +
>> +struct OutgoingMigrateParams {
>> +    struct SocketArgs *socket_args;
>> +    size_t length;
>> +    uint64_t total_multifd_channel;
>> +} outgoing_migrate_params;
>> +
>>  void socket_send_channel_create(QIOTaskFunc f, void *data)
>>  {
>>      QIOChannelSocket *sioc = qio_channel_socket_new();
>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>          qapi_free_SocketAddress(outgoing_args.saddr);
>>          outgoing_args.saddr = NULL;
>>      }
>> +
>> +    if (outgoing_migrate_params.socket_args != NULL) {
>> +        g_free(outgoing_migrate_params.socket_args);
>> +        outgoing_migrate_params.socket_args = NULL;
> 
> I think g_free is safe on NULL; so I think you can just do this without
> the if.
> 
>> +    }
>> +    if (outgoing_migrate_params.length) {
> 
> Does that ever differ from the != NULL test ?
> I think you can always just set this to 0 without the test.
> 
>> +        outgoing_migrate_params.length = 0;
>> +    }
>>      return 0;
>>  }
>>  
>> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>  }
>>  
>>  void socket_start_outgoing_migration(MigrationState *s,
>> -                                     const char *str,
>> +                                     const char *dst_str,
>>                                       Error **errp)
>>  {
>>      Error *err = NULL;
>> -    SocketAddress *saddr = socket_parse(str, &err);
>> +    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
>> +    if (!err) {
>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>> +    }
>> +    error_propagate(errp, err);
>> +}
>> +
>> +void init_multifd_array(int length)
>> +{
>> +    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
>> +    outgoing_migrate_params.length = length;
>> +    outgoing_migrate_params.total_multifd_channel = 0;
>> +}
>> +
>> +void store_multifd_migration_params(const char *dst_uri,
>> +                                    const char *src_uri,
>> +                                    uint8_t multifd_channels,
>> +                                    int idx, Error **errp)
>> +{
>> +    Error *err = NULL;
>> +    SocketAddress *src_addr = NULL;
>> +    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
>> +    if (src_uri) {
>> +        src_addr = socket_parse(src_uri, &err);
>> +    }
>>      if (!err) {
>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>> +        outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
>> +        outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
>> +        outgoing_migrate_params.socket_args[idx].multifd_channels
>> +                                                         = multifd_channels;
>> +        outgoing_migrate_params.total_multifd_channel += multifd_channels;
>>      }
>>      error_propagate(errp, err);
>>  }
>> diff --git a/migration/socket.h b/migration/socket.h
>> index 891dbccceb..bba7f177fe 100644
>> --- a/migration/socket.h
>> +++ b/migration/socket.h
>> @@ -19,12 +19,27 @@
>>  
>>  #include "io/channel.h"
>>  #include "io/task.h"
>> +#include "migration.h"
>> +
>> +/* info regarding destination and source uri */
>> +struct SrcDestAddr {
>> +    SocketAddress *dst_addr;
>> +    SocketAddress *src_addr;
>> +};
>>  
>>  void socket_send_channel_create(QIOTaskFunc f, void *data);
>>  int socket_send_channel_destroy(QIOChannel *send);
>>  
>>  void socket_start_incoming_migration(const char *str, Error **errp);
>>  
>> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
>> +void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
>>                                       Error **errp);
>> +
>> +int multifd_list_length(MigrateUriParameterList *list);
>> +
>> +void init_multifd_array(int length);
>> +
>> +void store_multifd_migration_params(const char *dst_uri, const char *src_uri,
>> +                                    uint8_t multifd_channels, int idx,
>> +                                    Error **erp);
>>  #endif
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 622c783c32..2db539016a 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -56,6 +56,9 @@
>>  #include "migration/snapshot.h"
>>  #include "migration/misc.h"
>>  
>> +/* Default number of multi-fd channels */
>> +#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
>> +
>>  #ifdef CONFIG_SPICE
>>  #include <spice/enums.h>
>>  #endif
>> @@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>>      bool inc = qdict_get_try_bool(qdict, "inc", false);
>>      bool resume = qdict_get_try_bool(qdict, "resume", false);
>>      const char *uri = qdict_get_str(qdict, "uri");
>> +
>> +    const char *src_uri = qdict_get_str(qdict, "source-uri");
>> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
>> +    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
>> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
>>      Error *err = NULL;
>> +    MigrateUriParameterList *caps = NULL;
>> +    MigrateUriParameter *value;
>> +
>> +    value = g_malloc0(sizeof(*value));
>> +    value->source_uri = (char *)src_uri;
>> +    value->destination_uri = (char *)dst_uri;
>> +    value->multifd_channels = multifd_channels;
>> +    QAPI_LIST_PREPEND(caps, value);
>> +
>> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
>> +                inc, false, false, true, resume, &err);
>> +    qapi_free_MigrateUriParameterList(caps);
>>  
>> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
>> -                false, false, true, resume, &err);
>>      if (hmp_handle_error(mon, err)) {
>>          return;
>>      }
> 
> Please split the HMP changes into a separate patch.
> 
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 6130cd9fae..fb259d626b 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1454,12 +1454,38 @@
>>  ##
>>  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>  
>> +##
>> +# @MigrateUriParameter:
>> +#
>> +# Information regarding which source interface is connected to which
>> +# destination interface and number of multifd channels over each interface.
>> +#
>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>> +#              Default port number is 0.
>> +#
>> +# @destination-uri: the Uniform Resource Identifier of the destination VM
> 
> I would just say 'uri' rather than spelling it out.
> 
>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>> +#                    for specific source-uri and destination-uri. Default value
>> +#                    in this case is 2 (Since 4.0)
> 
> 7.1 at the moment.
> 
>> +#
>> +##
>> +{ 'struct' : 'MigrateUriParameter',
>> +  'data' : { 'source-uri' : 'str',
>> +             'destination-uri' : 'str',
>> +             '*multifd-channels' : 'uint8'} }
> 
> OK, so much higher level question - why do we specify both URIs on
> each end?  Is it just the source that is used on the source side to say
> which NIC to route down?  On the destination side I guess there's no
> need?
> 
> Do we have some rule about needing to specify enough channels for all
> the multifd channels we specify (i.e. if we specify 4 multifd channels
> in the migration parameter do we have to supply 4 channels here?)
> What happens with say Peter's preemption channel?
> 
> Is there some logical ordering rule; i.e. if we were to start ordering
> particular multifd threads, then can we say that we allocate these
> channels in the same order as this list?
> 
>>  ##
>>  # @migrate:
>>  #
>>  # Migrates the current running guest to another Virtual Machine.
>>  #
>>  # @uri: the Uniform Resource Identifier of the destination VM
>> +#       for migration thread
>> +#
>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>> +#                     Resource Identifiers with number of multifd-channels
>> +#                     for each pair
>>  #
>>  # @blk: do block migration (full disk copy)
>>  #
>> @@ -1479,20 +1505,27 @@
>>  # 1. The 'query-migrate' command should be used to check migration's progress
>>  #    and final result (this information is provided by the 'status' member)
>>  #
>> -# 2. All boolean arguments default to false
>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>> +#    destination VM. This connection will be bound to default network
>> +#
>> +# 3. All boolean arguments default to false
>>  #
>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>  #    be used
>>  #
>>  # Example:
>>  #
>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>> +# -> { "execute": "migrate",
>> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>> +#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>> +#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>> +#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>>  # <- { "return": {} }
>>  #
>>  ##
>>  { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>  
>>  ##
>>  # @migrate-incoming:
>> -- 
>> 2.22.3
>>


