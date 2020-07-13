Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291721E005
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 20:45:46 +0200 (CEST)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv3ST-0008C7-9S
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 14:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jv3Rd-0007gL-HL
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 14:44:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43269
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jv3Rb-0007gi-El
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 14:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594665890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tNjn0b+JLl3k9eVHmAMiISet+AJmSqMjUqeTfwNzDng=;
 b=KZ6Ppq9a8x68RWW4QbwuG4smIWHgDZn/RbPkYyHfH98T8MUkNAF7tJwh7oDgyxBOrNLQrR
 y1/tECmBG5u19YUT9Y3oIQUWJlvtEIMkpiyw7YufH0nMs1algAoFYNRGtv5W3mis8Spwn2
 hxO4ZdKB81r9jVR7k/84i45310fYh3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-31vQC80XM9OTVi2SPVfHcA-1; Mon, 13 Jul 2020 14:44:46 -0400
X-MC-Unique: 31vQC80XM9OTVi2SPVfHcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124B310B0;
 Mon, 13 Jul 2020 18:44:45 +0000 (UTC)
Received: from localhost (ovpn-119-232.rdu2.redhat.com [10.10.119.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5AE3710A2;
 Mon, 13 Jul 2020 18:44:44 +0000 (UTC)
Date: Mon, 13 Jul 2020 14:44:44 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH 1/2] i368/cpu: Clear env->user_features after loading
 versioned CPU model
Message-ID: <20200713184444.GE780932@habkost.net>
References: <20200713174436.41070-1-xiaoyao.li@intel.com>
 <20200713174436.41070-2-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200713174436.41070-2-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 01:36:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 14, 2020 at 01:44:35AM +0800, Xiaoyao Li wrote:
> Features defined in versioned CPU model are recorded in env->user_features
> since they are updated as property. It's unwated because they are not
> user specified.
> 
> Simply clear env->user_features as a fix. It won't clear user specified
> features because user specified features are filled to
> env->user_features later in x86_cpu_expand_features().
> 
> Cc: Chenyi Qiang <chenyi.qiang@intel.com>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> ---
>  target/i386/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 1e5123251d74..9812d5747f35 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5159,6 +5159,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
>      object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
>  
>      x86_cpu_apply_version_props(cpu, model);
> +
> +    /* Properties in versioned CPU model are not user specified features.
> +     * We can simply clear env->user_features here since it will be filled later
> +     * in x86_cpu_expand_features() based on plus_features and minus_features.
> +     */
> +    memset(&env->user_features, 0, sizeof(env->user_features));
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> -- 
> 2.18.4
> 

-- 
Eduardo


