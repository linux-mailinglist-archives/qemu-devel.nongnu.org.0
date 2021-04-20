Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FEA365E3F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 19:11:18 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtu9-0006rj-Au
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 13:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYtsU-0006HS-N6
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYtsR-0000iU-Oi
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618938569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m/bM8AVyPCOzF6GKjD9Bu5bcH3jmV1AI/TsDxh2trNo=;
 b=Ms/5oB7W5ruPwGOhPaunmQK3hiHKnQ/m5IMV5E73OqVcueDp5Ac27bB81rRUeA6TuLcAXy
 NLyAvD02V8SGIssLaDp7R3eUjXqYL1w7QGn7JPS0xwZcv/Q9dzVWy6xtfDKjl3cIHUXtMV
 NnP9NTpKTabbFwYwebWM2wWejUDwSZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-0Ux9uZOrM3qxlRm-xbATFg-1; Tue, 20 Apr 2021 13:09:26 -0400
X-MC-Unique: 0Ux9uZOrM3qxlRm-xbATFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FD4D108F9C1;
 Tue, 20 Apr 2021 17:09:01 +0000 (UTC)
Received: from localhost (ovpn-118-208.rdu2.redhat.com [10.10.118.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ACA75D6AD;
 Tue, 20 Apr 2021 17:09:00 +0000 (UTC)
Date: Tue, 20 Apr 2021 13:09:00 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Subject: Re: [PATCH v6] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <20210420170900.utg4qzqkefdc642c@habkost.net>
References: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 07:19:40PM +0300, Valeriy Vdovin wrote:
[...]
> +##
> +# @query-cpu-model-cpuid:
> +#
> +# Returns description of a virtual CPU model, created by QEMU after cpu
> +# initialization routines. The resulting information is a reflection of a parsed
> +# '-cpu' command line option, filtered by available host cpu features.
> +#
> +# Returns:  @CpuModelCpuidDescription
> +#
> +# Example:
> +#
> +# -> { "execute": "query-cpu-model-cpuid" }
> +# <- { "return": 'CpuModelCpuidDescription' }
> +#
> +# Since: 6.1
> +##
> +{ 'command': 'query-cpu-model-cpuid',
> +  'returns': 'CpuModelCpuidDescription',
> +  'if': 'defined(TARGET_I386)' }

I was assuming the command was going to get a CPU model name as
argument.

If you are only going to return info on the current CPUs, the
interface could be simplified a lot.

What about a simple `query-cpuid` command that only takes:

 { 'qom-path': 'str', # qom-path is returned by query-cpus-fast
   'eax': 'uint32',
   '*ecx': 'uint32' }

as argument, and returns

 { 'present': 'bool',
   'max_eax': 'uint32',    # max value of EAX for this range
   '*max_ecx': 'uint32',   # max value of ECX if there are subleaves
   'eax': 'uint32',
   'ebx': 'uint32',
   'ecx': 'uint32',
   'edx': 'uint32' }

?

-- 
Eduardo


