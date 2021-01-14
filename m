Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B9B2F69AD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:37:04 +0100 (CET)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07UV-0005W9-GK
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l07SY-0004Ox-A1
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:35:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l07SN-0000n2-Uv
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610649289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QY3IRl/nnM22IxYFUPumJu34lW3YhvOG72y6zzPx23s=;
 b=jH3swY8rQi0kFERDIpjWaEMmVuuO4GteOXHDZo2hOgrrHeYgfJh3a8GMhrSHuJETc0WKmi
 k3+WpxD4OFRfQ7/O476JCjvmCA2iNZrvf/pdydTiQcPwo3SaEgmMhLLWmLy/nayz6OMWRz
 RgDn7IRmlf2snLRnrA6MYbiQjcmEoao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-3gO_IOXnPYe7ohbAGeMSRQ-1; Thu, 14 Jan 2021 13:34:48 -0500
X-MC-Unique: 3gO_IOXnPYe7ohbAGeMSRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE129190A7A1;
 Thu, 14 Jan 2021 18:34:46 +0000 (UTC)
Received: from work-vm (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07C9160C6B;
 Thu, 14 Jan 2021 18:34:44 +0000 (UTC)
Date: Thu, 14 Jan 2021 18:34:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>, dgibson@redhat.com
Subject: Re: [PATCH] target/i386/sev: add the support to query the
 attestation report
Message-ID: <20210114183442.GB2906@work-vm>
References: <20201204213101.14552-1-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204213101.14552-1-brijesh.singh@amd.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Brijesh Singh (brijesh.singh@amd.com) wrote:
> The SEV FW >= 0.23 added a new command that can be used to query the
> attestation report containing the SHA-256 digest of the guest memory
> and VMSA encrypted with the LAUNCH_UPDATE and sign it with the PEK.
> 
> Note, we already have a command (LAUNCH_MEASURE) that can be used to
> query the SHA-256 digest of the guest memory encrypted through the
> LAUNCH_UPDATE. The main difference between previous and this command
> is that the report is signed with the PEK and unlike the LAUNCH_MEASURE
> command the ATTESATION_REPORT command can be called while the guest
> is running.
> 
> Add a QMP interface "query-sev-attestation-report" that can be used
> to get the report encoded in base64.
> 
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Tom Lendacky <Thomas.Lendacky@amd.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: kvm@vger.kernel.org
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  linux-headers/linux/kvm.h |  8 ++++++
>  qapi/misc-target.json     | 38 +++++++++++++++++++++++++++
>  target/i386/monitor.c     |  6 +++++
>  target/i386/sev-stub.c    |  7 +++++
>  target/i386/sev.c         | 54 +++++++++++++++++++++++++++++++++++++++
>  target/i386/sev_i386.h    |  2 ++
>  6 files changed, 115 insertions(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 56ce14ad20..6d0f8101ba 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1585,6 +1585,8 @@ enum sev_cmd_id {
>  	KVM_SEV_DBG_ENCRYPT,
>  	/* Guest certificates commands */
>  	KVM_SEV_CERT_EXPORT,
> +	/* Attestation report */
> +	KVM_SEV_GET_ATTESTATION_REPORT,
>  
>  	KVM_SEV_NR_MAX,
>  };
> @@ -1637,6 +1639,12 @@ struct kvm_sev_dbg {
>  	__u32 len;
>  };
>  
> +struct kvm_sev_attestation_report {
> +	__u8 mnonce[16];
> +	__u64 uaddr;
> +	__u32 len;
> +};
> +
>  #define KVM_DEV_ASSIGN_ENABLE_IOMMU	(1 << 0)
>  #define KVM_DEV_ASSIGN_PCI_2_3		(1 << 1)
>  #define KVM_DEV_ASSIGN_MASK_INTX	(1 << 2)
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 1e561fa97b..ec6565e6ef 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -267,3 +267,41 @@
>  ##
>  { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
>    'if': 'defined(TARGET_ARM)' }
> +
> +
> +##
> +# @SevAttestationReport:
> +#
> +# The struct describes attestation report for a Secure Encrypted Virtualization
> +# feature.
> +#
> +# @data:  guest attestation report (base64 encoded)
> +#
> +#
> +# Since: 5.2
> +##
> +{ 'struct': 'SevAttestationReport',
> +  'data': { 'data': 'str'},
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @query-sev-attestation-report:
> +#
> +# This command is used to get the SEV attestation report, and is supported on AMD
> +# X86 platforms only.
> +#
> +# @mnonce: a random 16 bytes of data (it will be included in report)
> +#
> +# Returns: SevAttestationReport objects.
> +#
> +# Since: 5.2
> +#
> +# Example:
> +#
> +# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
> +# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> +#
> +##

Can you please make this more generic, I'm thinking of something like:

  query-attestation-report
that returns an AttstationReport, which has a number of optional
components, of which you start off with one optional 'sev' component.

That way we can get other vendors to add to that same command rather
than inventing one extra command per vendor.

Dave

> +{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
> +  'returns': 'SevAttestationReport',
> +  'if': 'defined(TARGET_I386)' }
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 9f9e1c42f4..a4b65f330c 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -729,3 +729,9 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>  {
>      return sev_get_capabilities(errp);
>  }
> +
> +SevAttestationReport *
> +qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
> +{
> +    return sev_get_attestation_report(mnonce, errp);
> +}
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index 88e3f39a1e..66d16f53d8 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -49,3 +49,10 @@ SevCapability *sev_get_capabilities(Error **errp)
>      error_setg(errp, "SEV is not available in this QEMU");
>      return NULL;
>  }
> +
> +SevAttestationReport *
> +sev_get_attestation_report(const char *mnonce, Error **errp)
> +{
> +    error_setg(errp, "SEV is not available in this QEMU");
> +    return NULL;
> +}
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 93c4d60b82..28958fb71b 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -68,6 +68,7 @@ struct SevGuestState {
>  
>  #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
>  #define DEFAULT_SEV_DEVICE      "/dev/sev"
> +#define DEFAULT_ATTESATION_REPORT_BUF_SIZE      4096
>  
>  static SevGuestState *sev_guest;
>  static Error *sev_mig_blocker;
> @@ -490,6 +491,59 @@ out:
>      return cap;
>  }
>  
> +SevAttestationReport *
> +sev_get_attestation_report(const char *mnonce, Error **errp)
> +{
> +    struct kvm_sev_attestation_report input = {};
> +    SevGuestState *sev = sev_guest;
> +    SevAttestationReport *report;
> +    guchar *data;
> +    int err = 0, ret;
> +
> +    if (!sev_enabled()) {
> +        error_setg(errp, "SEV is not enabled");
> +        return NULL;
> +    }
> +
> +    /* Verify that user provided random data length */
> +    if (strlen(mnonce) != sizeof(input.mnonce)) {
> +        error_setg(errp, "Expected mnonce data len %ld got %ld",
> +                sizeof(input.mnonce), strlen(mnonce));
> +        return NULL;
> +    }
> +
> +    /* Query the report length */
> +    ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
> +            &input, &err);
> +    if (ret < 0) {
> +        if (err != SEV_RET_INVALID_LEN) {
> +            error_setg(errp, "failed to query the attestation report length "
> +                    "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> +            return NULL;
> +        }
> +    }
> +
> +    data = g_malloc(input.len);
> +    input.uaddr = (unsigned long)data;
> +    memcpy(input.mnonce, mnonce, sizeof(input.mnonce));
> +
> +    /* Query the report */
> +    ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
> +            &input, &err);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "Failed to get attestation report"
> +                " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> +        goto e_free_data;
> +    }
> +
> +    report = g_new0(SevAttestationReport, 1);
> +    report->data = g_base64_encode(data, input.len);
> +
> +e_free_data:
> +    g_free(data);
> +    return report;
> +}
> +
>  static int
>  sev_read_file_base64(const char *filename, guchar **data, gsize *len)
>  {
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 4db6960f60..e2d0774708 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -35,5 +35,7 @@ extern uint32_t sev_get_cbit_position(void);
>  extern uint32_t sev_get_reduced_phys_bits(void);
>  extern char *sev_get_launch_measurement(void);
>  extern SevCapability *sev_get_capabilities(Error **errp);
> +extern SevAttestationReport *
> +sev_get_attestation_report(const char *mnonce, Error **errp);
>  
>  #endif
> -- 
> 2.17.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


