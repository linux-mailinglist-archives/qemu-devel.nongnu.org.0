Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6AF3F8AF0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:23:53 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHEJ-0006Ww-BC
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJHCP-0003r2-NF
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJHCO-0005lf-6H
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629991307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKJtNOOJpZ5IR7MBevz7FJGgAL9UgE1nCuyjwiC5a/Q=;
 b=AuJQ/T7qEOZQNjXsOEeMGGj5zJ/bUihiZ5SrihtXAMgfMuklsH5dNmWcREgkB+GdKocJAi
 Hn7N4W9lW9HouoyJ7G7Vjao3r9irrlWBcfQzr58XptEWz4JPsOQssoRov46jfkPQCNrScs
 MUVAtpdP2O3gpjXgoTT+kI7Qhqp7Hxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-hmpzrJpHNx6FZk_Bxr_bXg-1; Thu, 26 Aug 2021 11:21:46 -0400
X-MC-Unique: hmpzrJpHNx6FZk_Bxr_bXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB25B1008067;
 Thu, 26 Aug 2021 15:21:44 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D61A25C1D5;
 Thu, 26 Aug 2021 15:21:39 +0000 (UTC)
Date: Thu, 26 Aug 2021 10:21:38 -0500
From: Eric Blake <eblake@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 33/44] qmp: add query-tdx-capabilities query-tdx
 command
Message-ID: <20210826152138.4ashihjr3ccakn5j@redhat.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <f9391aea17154c05a8d51da8a15b8aec4e2d5873.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9391aea17154c05a8d51da8a15b8aec4e2d5873.1625704981.git.isaku.yamahata@intel.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Chenyi Qiang <chenyi.qiang@intel.com>,
 cohuck@redhat.com, ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 seanjc@google.com, alistair@alistair23.me, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, mtosatti@redhat.com, erdemaktas@google.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 05:55:03PM -0700, isaku.yamahata@gmail.com wrote:
> From: Chenyi Qiang <chenyi.qiang@intel.com>
> 
> Add QMP commands that can be used by libvirt to query the TDX capabilities
> and TDX info.  The set of capabilities that needs to be reported is only
> enabled at the moment, which means TDX is enabled.
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> Co-developed-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  include/sysemu/tdx.h       |  6 ++++
>  qapi/misc-target.json      | 59 ++++++++++++++++++++++++++++++++++++++

In addition to Gerd's suggestion to use an enum,

> +++ b/qapi/misc-target.json
> @@ -323,3 +323,62 @@
>  { 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
>    'returns': 'SevAttestationReport',
>    'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @TDXInfo:
> +#
> +# Information about Trust Domain Extensions (TDX) support
> +#
> +# @enabled: true if TDX is active
> +#
> +##

Missing a 'Since: 6.2' line, here and elsewhere in the patch.

> +{ 'struct': 'TDXInfo',
> +    'data': { 'enabled': 'bool' },
> +  'if': 'defined(TARGET_I386)'
> +}
> +
> +##
> +# @query-tdx:
> +#
> +# Returns information about TDX
> +#
> +# Returns: @TdxInfo
> +#
> +#
> +# Example:
> +#
> +# -> { "execute": "query-tdx" }
> +# <- { "return": { "enabled": true } }
> +#
> +##
> +{ 'command': 'query-tdx', 'returns': 'TDXInfo',
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @TDXCapability:
> +#
> +# The struct describes capability for a TDX
> +# feature.
> +#
> +##
> +{ 'struct': 'TDXCapability',
> +  'data': { 'enabled': 'bool' },
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @query-tdx-capabilities:

Do we need two separate commands, or could 'query-tdx' be made
sufficiently powerful to tell you both whether tdx is available, and
what capabilities it has, all in one command?

> +#
> +# This command is used to get the TDX capabilities, and is supported on Intel
> +# X86 platforms only.
> +#
> +# Returns: @TDXCapability.
> +#
> +#
> +# Example:
> +#
> +# -> { "execute": "query-tdx-capabilities" }
> +# <- { "return": { 'enabled': 'bool' }}
> +#
> +##
> +{ 'command': 'query-tdx-capabilities', 'returns': 'TDXCapability',
> +  'if': 'defined(TARGET_I386)' }

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


