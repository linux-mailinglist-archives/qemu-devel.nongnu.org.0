Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E62C635B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:46:11 +0100 (CET)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibGU-0003p4-31
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kibAr-0000oz-S0
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kibAq-0006gf-2z
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606473619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sTJZMlFqr59jCraKgRgdzhEuWCwII1Z9nYoO1oyEKl4=;
 b=EVoh9c01nvYa7mneamCE+IbVUxga1GUWjgsUw3kDdAMNbpEgE+P3M7pL2HuNsUytIs7Pfn
 WxmHzdD9VVWJfU99zVLXAVHNP3eI2TSdtDTNv97wPDXrihIrfwZhb4gvLN2eIRMjlzZMTv
 Q8oCWqR4mUq4DhXkyoE/oCLmHaYfoe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-kxCxPs0tOoi-KhmiGShXpw-1; Fri, 27 Nov 2020 05:40:17 -0500
X-MC-Unique: kxCxPs0tOoi-KhmiGShXpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43F0A101AFA9;
 Fri, 27 Nov 2020 10:40:16 +0000 (UTC)
Received: from work-vm (ovpn-114-206.ams2.redhat.com [10.36.114.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2F51A8A6;
 Fri, 27 Nov 2020 10:40:14 +0000 (UTC)
Date: Fri, 27 Nov 2020 10:40:12 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0 2/6] qapi: Rename KvmInfo to AccelInfo
Message-ID: <20201127104012.GD2969@work-vm>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-3-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20201116131011.26607-3-r.bolshakov@yadro.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Roman Bolshakov (r.bolshakov@yadro.com) wrote:
> There's nothing specific to KVM in the structure. A more generic name
> would be more appropriate.
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>

For HMP:

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Markus/Eric: Is it OK from QMP to change the type like that?

Dave

> ---
>  monitor/hmp-cmds.c |  4 ++--
>  monitor/qmp-cmds.c |  8 ++++----
>  qapi/machine.json  | 18 +++++++++---------
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a6a6684df1..ea86289fe8 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -120,7 +120,7 @@ void hmp_info_version(Monitor *mon, const QDict *qdict)
>  
>  void hmp_info_kvm(Monitor *mon, const QDict *qdict)
>  {
> -    KvmInfo *info;
> +    AccelInfo *info;
>  
>      info = qmp_query_kvm(NULL);
>      monitor_printf(mon, "kvm support: ");
> @@ -130,7 +130,7 @@ void hmp_info_kvm(Monitor *mon, const QDict *qdict)
>          monitor_printf(mon, "not compiled\n");
>      }
>  
> -    qapi_free_KvmInfo(info);
> +    qapi_free_AccelInfo(info);
>  }
>  
>  void hmp_info_status(Monitor *mon, const QDict *qdict)
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 0454394e76..f5d50afa9c 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -52,9 +52,9 @@ NameInfo *qmp_query_name(Error **errp)
>      return info;
>  }
>  
> -KvmInfo *qmp_query_kvm(Error **errp)
> +AccelInfo *qmp_query_kvm(Error **errp)
>  {
> -    KvmInfo *info = g_malloc0(sizeof(*info));
> +    AccelInfo *info = g_malloc0(sizeof(*info));
>  
>      info->enabled = kvm_enabled();
>      info->present = kvm_available();
> @@ -62,9 +62,9 @@ KvmInfo *qmp_query_kvm(Error **errp)
>      return info;
>  }
>  
> -KvmInfo *qmp_query_accel(const char *name, Error **errp)
> +AccelInfo *qmp_query_accel(const char *name, Error **errp)
>  {
> -    KvmInfo *info = g_malloc0(sizeof(*info));
> +    AccelInfo *info = g_malloc0(sizeof(*info));
>  
>      AccelClass *ac = accel_find(name);
>  
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 11f364fab4..5648d8d24d 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -562,24 +562,24 @@
>  { 'command': 'inject-nmi' }
>  
>  ##
> -# @KvmInfo:
> +# @AccelInfo:
>  #
> -# Information about support for KVM acceleration
> +# Information about support for an acceleration
>  #
> -# @enabled: true if KVM acceleration is active
> +# @enabled: true if an acceleration is active
>  #
> -# @present: true if KVM acceleration is built into this executable
> +# @present: true if an acceleration is built into this executable
>  #
>  # Since: 0.14.0
>  ##
> -{ 'struct': 'KvmInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
> +{ 'struct': 'AccelInfo', 'data': {'enabled': 'bool', 'present': 'bool'} }
>  
>  ##
>  # @query-kvm:
>  #
>  # Returns information about KVM acceleration
>  #
> -# Returns: @KvmInfo
> +# Returns: @AccelInfo
>  #
>  # Since: 0.14.0
>  #
> @@ -589,14 +589,14 @@
>  # <- { "return": { "enabled": true, "present": true } }
>  #
>  ##
> -{ 'command': 'query-kvm', 'returns': 'KvmInfo' }
> +{ 'command': 'query-kvm', 'returns': 'AccelInfo' }
>  
>  ##
>  # @query-accel:
>  #
>  # Returns information about an accelerator
>  #
> -# Returns: @KvmInfo
> +# Returns: @AccelInfo
>  #
>  # Since: 6.0.0
>  #
> @@ -608,7 +608,7 @@
>  ##
>  { 'command': 'query-accel',
>    'data': { 'name': 'str' },
> -  'returns': 'KvmInfo' }
> +  'returns': 'AccelInfo' }
>  
>  ##
>  # @NumaOptionsType:
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


