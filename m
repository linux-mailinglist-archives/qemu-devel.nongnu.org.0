Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F243D349E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:26:28 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6odg-0006h0-23
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6ocl-0005vQ-PA
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6oci-0006V4-Pb
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627021527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NLVx3cXkupzvgjCwIyvlpK5Hz+w6Rx9OxqFtUGXQOOI=;
 b=YhxzfbZcEd8d+Rz5Lt377bvnG9MFZBdRBUMnWCc0G1IFvFy7evSukeU3oQvzpuce/7TsbD
 D8pDuXr40BTy9Wof+z+FJmFn8SYTEjuUEqlR8SCP8EoGco10Iyp6ZYREjW/IaR7dx1/k2G
 H9OUoAgzYRqzK9LVXjztBWV+bAF7/9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-0kx5z3ACMFChZ9gmPKrvOA-1; Fri, 23 Jul 2021 02:25:24 -0400
X-MC-Unique: 0kx5z3ACMFChZ9gmPKrvOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCC5710086C4;
 Fri, 23 Jul 2021 06:25:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D48E5C1D1;
 Fri, 23 Jul 2021 06:25:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8CE71800926; Fri, 23 Jul 2021 08:25:20 +0200 (CEST)
Date: Fri, 23 Jul 2021 08:25:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
Message-ID: <20210723062520.hp6qux5enrwyw56u@sirius.home.kraxel.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210722220952.17444-2-jziviani@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> --- a/accel/accel-softmmu.c
> +++ b/accel/accel-softmmu.c
> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>       * all accelerators need to define ops, providing at least a mandatory
>       * non-NULL create_vcpu_thread operation.
>       */
> -    g_assert(ops != NULL);
> +    if (ops == NULL) {

Error message here?
Also split accel bits into a separate patch?

>          g_hash_table_remove(loaded_modules, module_name);
> +        fprintf(stderr, "%s module is missing, install the "
> +                        "package or config the library path "
> +                        "correctly.\n", module_name);

This should be error_report(), or maybe warn_report() as this
isn't a fatal error in all cases.  Otherwise looks good to me.

take care,
  Gerd


