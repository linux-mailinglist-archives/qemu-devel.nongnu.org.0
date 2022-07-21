Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCBE57D3FE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:18:33 +0200 (CEST)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEbgt-0004ZQ-WB
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEbfZ-0003CV-O3
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEbfW-0000U2-QK
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658431026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1hLnU9Vmkid83qloC6D0jfIKy1RwhSzY0USNiGf2A8=;
 b=FAo3Wg8FK5prCJEYXAbyImVl54V+1+QPyst/l+KJU9KuJD92H0weaXa9IFfJDXddYnCTBY
 4/4N7tVmkYveYbw1lWKzYPYDHhh7k+aeUXl6YkppAcBgik7P5inLx+1hLEPwzyi8nTiCx1
 jZBlzzoBxWEkjg78EsVwPL+JrdN1WPI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-EvXtauwvPGy1FFX8IFa6Aw-1; Thu, 21 Jul 2022 15:16:54 -0400
X-MC-Unique: EvXtauwvPGy1FFX8IFa6Aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B13685A58A;
 Thu, 21 Jul 2022 19:16:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C0C2166B26;
 Thu, 21 Jul 2022 19:16:52 +0000 (UTC)
Date: Thu, 21 Jul 2022 14:16:51 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 9/9] tests/style: check qemu/osdep.h is NOT included
 in all .h/.c.inc files
Message-ID: <20220721191651.6ng54wvvotcmr7ap@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-10-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707163720.1421716-10-berrange@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 07, 2022 at 05:37:20PM +0100, Daniel P. Berrangé wrote:
> Since the qemu/osdep.h file must be included as the very first header
> in all C source files, there is no reason to include it in .h or .c.in

.c.inc

> files.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/style.yml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/style.yml b/tests/style.yml
> index 6d91ac6115..d2a0299a33 100644
> --- a/tests/style.yml
> +++ b/tests/style.yml
> @@ -143,3 +143,8 @@ osdep_h_in_source:
>      - tests/uefi-test-tools/.*
>      - tests/unit/test-rcu-(simpleq|slist|tailq)\.c
>      - tools/ebpf/rss.bpf.c
> +
> +osdep_h_in_header:
> +  files: \.(h|c\.inc)$
> +  prohibit: '#include "qemu/osdep\.h"'
> +  message: only C source files may include qemu/osdep.h

Should we also have a rule that rejects <qemu/osdep.h> in all files
(our only spelling should be with "", not <>)?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


