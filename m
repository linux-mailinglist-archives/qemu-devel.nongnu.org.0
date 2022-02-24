Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983C84C276F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:08:18 +0100 (CET)
Received: from localhost ([::1]:49472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNA6i-0006w9-PD
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nN9yd-0003S4-T0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:00:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nN9yZ-0001t0-8e
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 03:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645693185;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=scRBZv2Bmgx+0cas1agsUzEWOgIvau3ObR0QgyrB0DU=;
 b=BxPrzG4xbnt6cpxwTWYN6/JPG9rqm91caPwEPwrrDeHSJn8DmQ7Wbzudn7JdZ1tymAUknX
 mYgdEHf3+9P3Y32741yOCYX/3alrxiIPXkh1Y/YNOFxVauOEIXUOwCRZbIQTLHIEAnOMk6
 RlaxFb95UIXP+1ZXGdHs2e9TPArNeLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-tlbEhAdkMgCEyCSGJF21hg-1; Thu, 24 Feb 2022 03:59:29 -0500
X-MC-Unique: tlbEhAdkMgCEyCSGJF21hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B4F81854E21;
 Thu, 24 Feb 2022 08:59:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89CEF7FA22;
 Thu, 24 Feb 2022 08:59:25 +0000 (UTC)
Date: Thu, 24 Feb 2022 08:59:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Message-ID: <YhdI6iRAFSvaL7wr@redhat.com>
References: <20220224061405.1959756-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220224061405.1959756-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 06:14:05AM +0000, Dov Murik wrote:
> Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
> command.  The value of the field is the base64-encoded 64-byte unique ID
> of the CPU0 (socket 0), which can be used to retrieve the signed CEK of
> the CPU from AMD's Key Distribution Service (KDS).
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 
> ---
> 
> v2:
> - change encoding to Base64 (thanks Daniel)
> - rename constant to SEV_CPU_UNIQUE_ID_LEN
> ---
>  qapi/misc-target.json |  4 ++++
>  target/i386/sev.c     | 27 +++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 4bc45d2474..c6d9ad69e1 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -177,6 +177,8 @@
>  #
>  # @cert-chain:  PDH certificate chain (base64 encoded)
>  #
> +# @cpu0-id: 64-byte unique ID of CPU0 (base64 encoded) (since 7.0)
> +#
>  # @cbitpos: C-bit location in page table entry
>  #
>  # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
> @@ -187,6 +189,7 @@
>  { 'struct': 'SevCapability',
>    'data': { 'pdh': 'str',
>              'cert-chain': 'str',
> +            'cpu0-id': 'str',
>              'cbitpos': 'int',
>              'reduced-phys-bits': 'int'},
>    'if': 'TARGET_I386' }
> @@ -205,6 +208,7 @@
>  #
>  # -> { "execute": "query-sev-capabilities" }
>  # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
> +#                  "cpu0-id": "2lvmGwo+...61iEinw==",
>  #                  "cbitpos": 47, "reduced-phys-bits": 5}}
>  #
>  ##
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 025ff7a6f8..d3d2680e16 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -82,6 +82,8 @@ struct SevGuestState {
>  #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
>  #define DEFAULT_SEV_DEVICE      "/dev/sev"
>  
> +#define SEV_CPU_UNIQUE_ID_LEN   64

Is this fixed size actually guaranteed by AMD ?  In reading the spec
for "GET_ID" it feels like they're intentionally not specifying a
fixed length, pushing towards querying once and then re-trying with
the reported buffer size:

   "If the value of the ID_LEN field is too small, an 
    INVALID_LENGTH error is returned and the minimum 
    required length is written to the field"

I didn't find where it says 64 bytes exactly.

> +
>  #define SEV_INFO_BLOCK_GUID     "00f771de-1a7e-4fcb-890e-68c77e2fb44e"
>  typedef struct __attribute__((__packed__)) SevInfoBlock {
>      /* SEV-ES Reset Vector Address */
> @@ -531,11 +533,31 @@ e_free:
>      return 1;
>  }
>  
> +static int
> +sev_get_id(int fd, guchar *id_buf, size_t id_buf_len, Error **errp)
> +{
> +    struct sev_user_data_get_id2 id = {
> +        .address = (unsigned long)id_buf,
> +        .length = id_buf_len
> +    };
> +    int err, r;
> +
> +    r = sev_platform_ioctl(fd, SEV_GET_ID2, &id, &err);
> +    if (r < 0) {
> +        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
> +                   r, err, fw_error_to_str(err));
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
>  static SevCapability *sev_get_capabilities(Error **errp)
>  {
>      SevCapability *cap = NULL;
>      guchar *pdh_data = NULL;
>      guchar *cert_chain_data = NULL;
> +    guchar cpu0_id[SEV_CPU_UNIQUE_ID_LEN];
>      size_t pdh_len = 0, cert_chain_len = 0;
>      uint32_t ebx;
>      int fd;
> @@ -561,9 +583,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
>          goto out;
>      }
>  
> +    if (sev_get_id(fd, cpu0_id, sizeof(cpu0_id), errp)) {
> +        goto out;
> +    }
> +
>      cap = g_new0(SevCapability, 1);
>      cap->pdh = g_base64_encode(pdh_data, pdh_len);
>      cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
> +    cap->cpu0_id = g_base64_encode(cpu0_id, sizeof(cpu0_id));
>  
>      host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
>      cap->cbitpos = ebx & 0x3f;
> -- 
> 2.25.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


