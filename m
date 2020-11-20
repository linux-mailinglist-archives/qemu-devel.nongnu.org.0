Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC12BAFA9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:10:50 +0100 (CET)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8zp-00077L-NP
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg8xi-000683-Vn
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg8xh-0003Lf-A1
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605888516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQ3AQKcwsC8GH2ZJEEXxAhlTvg0kpls/NlC+jLMXCYI=;
 b=i4yH7jT+I+8Nh4Fy6y8GthF1pr2BZQ2zvTPBxk2j8skhOW+LoF7AyhkI+++mHePNa89imF
 1lau4smhMmu/MhhnzSaiGZBvcwCWnVCrRyh9bXUiSUruc2FQrFgigtTt0YrTW7pktmeYSk
 Ep2Ev7Xqn/R2qy6potUSO7wXDrDC2NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-eZXDcPXyPIisnIs-DDi2JA-1; Fri, 20 Nov 2020 11:08:33 -0500
X-MC-Unique: eZXDcPXyPIisnIs-DDi2JA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2D3F107ACFC
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 16:08:32 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E69AC6085A;
 Fri, 20 Nov 2020 16:08:31 +0000 (UTC)
Date: Fri, 20 Nov 2020 17:08:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 25/29] vl: start VM via qmp_cont
Message-ID: <20201120170829.319fabd2@redhat.com>
In-Reply-To: <20201027182144.3315885-26-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-26-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:40 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Complement the previous patch by starting the VM with a QMP command.
> Later, the user will be able to do the same, invoking two
> commands "finish-machine-init" and "cont" instead of
> "x-exit-preconfig".
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 583366510b..edabd17dac 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -110,6 +110,7 @@
>  #include "qapi/qapi-visit-ui.h"
>  #include "qapi/qapi-commands-block-core.h"
>  #include "qapi/qapi-commands-migration.h"
> +#include "qapi/qapi-commands-misc.h"
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/qmp/qerror.h"
> @@ -4566,7 +4567,7 @@ void qemu_init(int argc, char **argv, char **envp)
>              }
>          }
>      } else if (autostart) {
> -        vm_start();
> +        qmp_cont(NULL);
>      }
>  
>      accel_setup_post(current_machine);


