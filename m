Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C133421392B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 13:13:01 +0200 (CEST)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrJcq-0006rd-CB
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 07:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jrJc5-00069f-QV
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 07:12:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30728
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jrJc3-0004my-1O
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 07:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593774729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IHRTv+TXZWVF8CMaZLoYPleqDasgOXycAbKw01Hdpdw=;
 b=e57uukU1kEgLxk6P/Mu+C5YUPlYh29pvO8LBtzBv9IZ8x2Uztap9Qgmw3NzbRr6CE6JQwR
 dCCFk1wETVDs3laUJptkYt8vYpXSAOtjw9as8VWjFXUY2J0z+SNCtytReDZ1sUZJ94afmo
 U2uyAR/dUZR6Al284mni+td7WjcoYSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-esOet6_0MIyhU3Fpyztw_g-1; Fri, 03 Jul 2020 07:12:05 -0400
X-MC-Unique: esOet6_0MIyhU3Fpyztw_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00125BFC1;
 Fri,  3 Jul 2020 11:12:03 +0000 (UTC)
Received: from work-vm (ovpn-114-207.ams2.redhat.com [10.36.114.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C732973FC7;
 Fri,  3 Jul 2020 11:12:01 +0000 (UTC)
Date: Fri, 3 Jul 2020 12:11:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] SEV: QMP support for Inject-Launch-Secret
Message-ID: <20200703110929.GB6641@work-vm>
References: <20200702194213.23272-1-tobin@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200702194213.23272-1-tobin@linux.vnet.ibm.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:17:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, jejb@linux.ibm.com,
 tobin@ibm.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tobin Feldman-Fitzthum (tobin@linux.vnet.ibm.com) wrote:
> From: Tobin Feldman-Fitzthum <tobin@ibm.com>
> 
> AMD SEV allows a guest owner to inject a secret blob
> into the memory of a virtual machine. The secret is
> encrypted with the SEV Transport Encryption Key and
> integrity is guaranteed with the Transport Integrity
> Key. Although QEMU faciliates the injection of the
> launch secret, it cannot access the secret.
> 
> Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.vnet.ibm.com>
> ---
>  include/monitor/monitor.h |  3 ++
>  include/sysemu/sev.h      |  2 ++
>  monitor/misc.c            |  8 ++---
>  qapi/misc-target.json     | 18 +++++++++++
>  target/i386/monitor.c     |  9 ++++++
>  target/i386/sev-stub.c    |  5 +++
>  target/i386/sev.c         | 66 +++++++++++++++++++++++++++++++++++++++
>  target/i386/sev_i386.h    |  3 ++
>  target/i386/trace-events  |  1 +
>  9 files changed, 111 insertions(+), 4 deletions(-)
> 
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 1018d754a6..bf049c5b00 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -4,6 +4,7 @@
>  #include "block/block.h"
>  #include "qapi/qapi-types-misc.h"
>  #include "qemu/readline.h"
> +#include "include/exec/hwaddr.h"
>  
>  extern __thread Monitor *cur_mon;
>  typedef struct MonitorHMP MonitorHMP;
> @@ -36,6 +37,8 @@ void monitor_flush(Monitor *mon);
>  int monitor_set_cpu(int cpu_index);
>  int monitor_get_cpu_index(void);
>  
> +void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, uint64_t size, Error **errp);
> +
>  void monitor_read_command(MonitorHMP *mon, int show_prompt);
>  int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
>                            void *opaque);
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index 98c1ec8d38..b279b293e8 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -18,4 +18,6 @@
>  
>  void *sev_guest_init(const char *id);
>  int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len);
> +int sev_inject_launch_secret(const char *hdr, const char *secret,
> +                             uint64_t gpa);
>  #endif
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 89bb970b00..b9ec8ba410 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -674,10 +674,10 @@ static void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
>      memory_dump(mon, count, format, size, addr, 1);
>  }
>  
> -static void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, Error **errp)
> +void *gpa2hva(MemoryRegion **p_mr, hwaddr addr, uint64_t size, Error **errp)
>  {
>      MemoryRegionSection mrs = memory_region_find(get_system_memory(),
> -                                                 addr, 1);
> +                                                 addr, size);
>  
>      if (!mrs.mr) {
>          error_setg(errp, "No memory is mapped at address 0x%" HWADDR_PRIx, addr);
> @@ -701,7 +701,7 @@ static void hmp_gpa2hva(Monitor *mon, const QDict *qdict)
>      MemoryRegion *mr = NULL;
>      void *ptr;
>  
> -    ptr = gpa2hva(&mr, addr, &local_err);
> +    ptr = gpa2hva(&mr, addr, 1, &local_err);
>      if (local_err) {
>          error_report_err(local_err);
>          return;
> @@ -777,7 +777,7 @@ static void hmp_gpa2hpa(Monitor *mon, const QDict *qdict)
>      void *ptr;
>      uint64_t physaddr;
>  
> -    ptr = gpa2hva(&mr, addr, &local_err);
> +    ptr = gpa2hva(&mr, addr, 1, &local_err);
>      if (local_err) {
>          error_report_err(local_err);
>          return;
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index dee3b45930..d145f916b3 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -200,6 +200,24 @@
>  { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
>    'if': 'defined(TARGET_I386)' }
>  
> +##
> +# @sev-inject-launch-secret:
> +#
> +# This command injects a secret blob into memory of SEV guest.
> +#
> +# @packet-header: the launch secret packet header encoded in base64
> +#
> +# @secret: the launch secret data to be injected encoded in base64
> +#
> +# @gpa: the guest physical address where secret will be injected.
> +#
> +# Since: 5.1
> +#
> +##
> +{ 'command': 'sev-inject-launch-secret',
> +  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
> +  'if': 'defined(TARGET_I386)' }
> +
>  ##
>  # @dump-skeys:
>  #
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 27ebfa3ad2..42bcfe6dc0 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -736,3 +736,12 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>  
>      return data;
>  }
> +
> +void qmp_sev_inject_launch_secret(const char *packet_hdr,
> +                                  const char *secret, uint64_t gpa,
> +                                  Error **errp)
> +{
> +    if (sev_inject_launch_secret(packet_hdr, secret, gpa) != 0) {
> +        error_setg(errp, "SEV inject secret failed");
> +    }
> +}
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index e5ee13309c..fed4588185 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -48,3 +48,8 @@ SevCapability *sev_get_capabilities(void)
>  {
>      return NULL;
>  }
> +int sev_inject_launch_secret(const char *hdr, const char *secret,
> +                             uint64_t gpa)
> +{
> +    return 1;
> +}
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index d273174ad3..3b2b3c8d8b 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -28,6 +28,8 @@
>  #include "sysemu/runstate.h"
>  #include "trace.h"
>  #include "migration/blocker.h"
> +#include "exec/address-spaces.h"
> +#include "monitor/monitor.h"
>  
>  #define TYPE_SEV_GUEST "sev-guest"
>  #define SEV_GUEST(obj)                                          \
> @@ -769,6 +771,70 @@ sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
>      return 0;
>  }
>  
> +int sev_inject_launch_secret(const char *packet_hdr,
> +                             const char *secret, uint64_t gpa)
> +{
> +    struct kvm_sev_launch_secret input;
> +    guchar *data = NULL, *hdr = NULL;
> +    int error, ret = 1;
> +    void *hva;
> +    gsize hdr_sz = 0, data_sz = 0;
> +    Error *local_err = NULL;
> +    MemoryRegion *mr = NULL;
> +
> +    /* secret can be inject only in this state */
> +    if (!sev_check_state(sev_guest, SEV_STATE_LAUNCH_SECRET)) {
> +        error_report("SEV: Not in correct state. (LSECRET) %x",
> +                     sev_guest->state);
> +        return 1;
> +    }
> +
> +    hdr = g_base64_decode(packet_hdr, &hdr_sz);
> +    if (!hdr || hdr_sz != SEV_SECRET_HEADER_LEN) {
> +        error_report("SEV: Failed to decode sequence header");
> +        return 1;
> +    }
> +
> +    data = g_base64_decode(secret, &data_sz);
> +    if (!data || data_sz <= 0 || data_sz > SEV_SECRET_MAX_LEN) {
> +        error_report("SEV: Failed to decode data");
> +        goto err;
> +    }
> +
> +    hva = gpa2hva(&mr, gpa, data_sz, &local_err);
> +    if (!hva) {
> +        error_report("SEV: Failed to calculate guest address.");
> +        goto err;
> +    }
> +
> +    input.hdr_uaddr = (uint64_t)hdr;
> +    input.hdr_len = hdr_sz;
> +
> +    input.trans_uaddr = (uint64_t)data;
> +    input.trans_len = data_sz;
> +
> +    input.guest_uaddr = (uint64_t)hva;

Thanks for changing these; although it fails a 32bit build (which is
probably mostly pointless for SEV, but it fails the build rather than
building it out). The easy fix here seems to be:
   (uint64_t)(uintptr_t)

> +    input.guest_len = data_sz;
> +
> +    trace_kvm_sev_launch_secret(gpa, input.guest_uaddr,
> +                                input.trans_uaddr, input.trans_len);
> +
> +    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_LAUNCH_SECRET,
> +                    &input, &error);
> +    if (ret) {
> +        error_report("SEV: failed to inject secret ret=%d fw_error=%d '%s'",
> +                     ret, error, fw_error_to_str(error));
> +        goto err;
> +    }
> +
> +    ret = 0;
> +
> +err:
> +    g_free(data);
> +    g_free(hdr);
> +    return ret;
> +}
> +
>  static void
>  sev_register_types(void)
>  {
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 8eb7de1bef..b9ed89d48c 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -28,6 +28,9 @@
>  #define SEV_POLICY_DOMAIN       0x10
>  #define SEV_POLICY_SEV          0x20
>  
> +#define SEV_SECRET_HEADER_LEN   0x34
> +#define SEV_SECRET_MAX_LEN      0x3E80
> +

Where does that maximum come from - I didn't find it in the spec.

Other than the 32bit ism above, and that minor question; I think this is
fine.

Dave

>  extern bool sev_enabled(void);
>  extern uint64_t sev_get_me_mask(void);
>  extern SevInfo *sev_get_info(void);
> diff --git a/target/i386/trace-events b/target/i386/trace-events
> index 789c700d4a..9f299e94a2 100644
> --- a/target/i386/trace-events
> +++ b/target/i386/trace-events
> @@ -15,3 +15,4 @@ kvm_sev_launch_start(int policy, void *session, void *pdh) "policy 0x%x session
>  kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIu64
>  kvm_sev_launch_measurement(const char *value) "data %s"
>  kvm_sev_launch_finish(void) ""
> +kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
> -- 
> 2.20.1 (Apple Git-117)
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


