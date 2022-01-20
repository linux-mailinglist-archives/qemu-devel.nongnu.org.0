Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A432494B6C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 11:10:47 +0100 (CET)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAUOx-0000sC-9z
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 05:10:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nATSz-00057s-JB
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:10:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nATSw-0007Bu-6z
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642669845;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zm7ekI9ziVvC6tutjs0CnBPejRcYHLfTzQp85LFuj/k=;
 b=B6IGAjYJouB99+OFHrb4IWyMCE71sktVF1s71nE59S5PNsfC5RT31qPoqXmI67o9Z3CwMP
 MrVB1zpsz0m2vwJRjSLIcI6y8NTvknciuCSe7olEKHo0hNMpBpMJNPd9O/niG6LmN63uBx
 Xj4ZqTi9axhv29dWa3tFiW1yOft6jOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-iACNiju4OGKTCGHQviPXWw-1; Thu, 20 Jan 2022 04:10:39 -0500
X-MC-Unique: iACNiju4OGKTCGHQviPXWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 692981091DA0;
 Thu, 20 Jan 2022 09:10:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6844EC9E;
 Thu, 20 Jan 2022 09:10:36 +0000 (UTC)
Date: Thu, 20 Jan 2022 09:10:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Message-ID: <YeknCiBuMEaD3XP2@redhat.com>
References: <20220119235720.371961-1-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220119235720.371961-1-yang.zhong@intel.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 06:57:20PM -0500, Yang Zhong wrote:
> The SGX NUMA patches were merged into Qemu 7.0 release, we need
> clarify detailed version history information and also change
> some related comments, which make SGX related comments clearer.
> 
> The QMP command schema promises backwards compatibility as standard.
> We temporarily restore "@section-size", which can avoid incompatible
> API breakage. The "@section-size" will be deprecated in 7.2 version.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  qapi/machine.json     |  4 ++--
>  qapi/misc-target.json | 17 ++++++++++++-----
>  hw/i386/sgx.c         | 11 +++++++++--
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index b6a37e17c4..cf47cb63a9 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1207,7 +1207,7 @@
>  #
>  # @memdev: memory backend linked with device
>  #
> -# @node: the numa node
> +# @node: the numa node (Since: 7.0)
>  #
>  # Since: 6.2
>  ##
> @@ -1288,7 +1288,7 @@
>  #
>  # @memdev: memory backend linked with device
>  #
> -# @node: the numa node
> +# @node: the numa node (Since: 7.0)
>  #
>  # Since: 6.2
>  ##
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 1022aa0184..a87358ea44 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -344,9 +344,9 @@
>  #
>  # @node: the numa node
>  #
> -# @size: the size of epc section
> +# @size: the size of EPC section
>  #
> -# Since: 6.2
> +# Since: 7.0
>  ##
>  { 'struct': 'SGXEPCSection',
>    'data': { 'node': 'int',
> @@ -365,7 +365,9 @@
>  #
>  # @flc: true if FLC is supported
>  #
> -# @sections: The EPC sections info for guest
> +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)

I expected deprecation would start now (7.0, and it would be removed
in 7.2.

Also needs to be documented in docs/about/deprecated.rst



> +#
> +# @sections: The EPC sections info for guest (Since: 7.0)
>  #
>  # Since: 6.2
>  ##
> @@ -374,6 +376,7 @@
>              'sgx1': 'bool',
>              'sgx2': 'bool',
>              'flc': 'bool',
> +            'section-size': 'uint64',
>              'sections': ['SGXEPCSection']},
>     'if': 'TARGET_I386' }
>  
> @@ -390,7 +393,9 @@
>  #
>  # -> { "execute": "query-sgx" }
>  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> -#                  "flc": true, "section-size" : 0 } }
> +#                  "flc": true,  "section-size" : 96468992,
> +#                  "sections": [{"node": 0, "size": 67108864},
> +#                  {"node": 1, "size": 29360128}]} }
>  #
>  ##
>  { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> @@ -408,7 +413,9 @@
>  #
>  # -> { "execute": "query-sgx-capabilities" }
>  # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> -#                  "flc": true, "section-size" : 0 } }
> +#                  "flc": true, "section-size" : 96468992,
> +#                  "section" : [{"node": 0, "size": 67108864},
> +#                  {"node": 1, "size": 29360128}]} }
>  #
>  ##
>  { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index 5de5dd0893..a2b318dd93 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -83,7 +83,7 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
>             ((high & MAKE_64BIT_MASK(0, 20)) << 32);
>  }
>  
> -static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
> +static SGXEPCSectionList *sgx_calc_host_epc_sections(uint64_t *size)
>  {
>      SGXEPCSectionList *head = NULL, **tail = &head;
>      SGXEPCSection *section;
> @@ -106,6 +106,7 @@ static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
>          section = g_new0(SGXEPCSection, 1);
>          section->node = j++;
>          section->size = sgx_calc_section_metric(ecx, edx);
> +        *size += section->size;
>          QAPI_LIST_APPEND(tail, section);
>      }
>  
> @@ -156,6 +157,7 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
>  {
>      SGXInfo *info = NULL;
>      uint32_t eax, ebx, ecx, edx;
> +    uint64_t size = 0;
>  
>      int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
>      if (fd < 0) {
> @@ -173,7 +175,8 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
>      info->sgx1 = eax & (1U << 0) ? true : false;
>      info->sgx2 = eax & (1U << 1) ? true : false;
>  
> -    info->sections = sgx_calc_host_epc_sections();
> +    info->sections = sgx_calc_host_epc_sections(&size);
> +    info->section_size = size;
>  
>      close(fd);
>  
> @@ -220,12 +223,14 @@ SGXInfo *qmp_query_sgx(Error **errp)
>          return NULL;
>      }
>  
> +    SGXEPCState *sgx_epc = &pcms->sgx_epc;
>      info = g_new0(SGXInfo, 1);
>  
>      info->sgx = true;
>      info->sgx1 = true;
>      info->sgx2 = true;
>      info->flc = true;
> +    info->section_size = sgx_epc->size;
>      info->sections = sgx_get_epc_sections_list();
>  
>      return info;
> @@ -249,6 +254,8 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
>                     info->sgx2 ? "enabled" : "disabled");
>      monitor_printf(mon, "FLC support: %s\n",
>                     info->flc ? "enabled" : "disabled");
> +    monitor_printf(mon, "size: %" PRIu64 "\n",
> +                   info->section_size);
>  
>      section_list = info->sections;
>      for (section = section_list; section; section = section->next) {
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


