Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9054CA277
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:51:33 +0100 (CET)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMZv-0008Ku-2z
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPMY6-0006mE-07
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:49:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPMY2-0003lp-B0
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646218172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BjskigSOM7UQRujknLUjGEvMVuMWTGsJtI+tPjOZRaA=;
 b=i2vBEfwM5LrE4cVRmEqFQIU/5mB3ZA0psjUjjkQxl/7HaUSs0Yp1pJijBUKmXXdeOa9r9u
 WsqFVoNiSvf1ua9sxnbZ5xGy4Ey3mJ3ln7dinXc23iyZlHO3GPzkSctML+w48zh2XFwES+
 vmZ1WlyAqYkyrjjxX6IVi1QL3EaZzZU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-W-Cu3KKVNsCLYKEAi4j1_Q-1; Wed, 02 Mar 2022 05:49:31 -0500
X-MC-Unique: W-Cu3KKVNsCLYKEAi4j1_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay7-20020a05600c1e0700b003813d7a7d03so685728wmb.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BjskigSOM7UQRujknLUjGEvMVuMWTGsJtI+tPjOZRaA=;
 b=G4dAIAvSl+8xFACTYLuogWMRLPlfHO3ge+9t5hZFvwwAg5KzxJT7TprdFmLNk2Azzz
 Kqw5XzxWnNhApQX8ii1BwghsClBuOc3QEpQiKulvizD0vP77VThFvhdxqdZxSazaYjXt
 ZKrx+9elY4TfgH10Wb9QkF1sbYvlFWq4ZYsL0MXKIT8/b+eE1gZchfUGOde9ekJXrWsn
 foV888bgwCkNZR6OvUT2xwSZPV0clqQe94kEHYefsoYw0R6ByVpk5OT5a6fGnZtdbrJQ
 mXOduJLcSbaazKxk3OZlXbHvbXhvZv9htKsVLVLJX+w61Ra6kCMiN2YVUlKVFsXyFDZv
 NJzw==
X-Gm-Message-State: AOAM530nc+CEhZtolkWaSoOLLL6PsPt0fGJpey27xMbYfXxNITkgkRoO
 rAKPi6ZAzy5wWGWPNxzVZ9ZJ/7nSqF3diOIrwPuJjzCrbSNESm4LLCo8q1non0NPbbTY8PFup51
 eFCLSE8absyhQhdO7h35mYL6fYzMqjNRPyT3WQcp86D37Jny7xTqrCl+1zSuN37dOiz0=
X-Received: by 2002:a5d:68cc:0:b0:1ef:8263:c3c1 with SMTP id
 p12-20020a5d68cc000000b001ef8263c3c1mr15582050wrw.103.1646218170394; 
 Wed, 02 Mar 2022 02:49:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNfnGWqkgTgIuRJzaZRUbNr2gqEd/LWbqAPlbgH5TBmewZgsYO5btXajhVvBSt67h3Cl/O+A==
X-Received: by 2002:a5d:68cc:0:b0:1ef:8263:c3c1 with SMTP id
 p12-20020a5d68cc000000b001ef8263c3c1mr15582034wrw.103.1646218170155; 
 Wed, 02 Mar 2022 02:49:30 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 9-20020a05600c268900b00381394d74a1sm5229718wmt.9.2022.03.02.02.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 02:49:29 -0800 (PST)
Date: Wed, 2 Mar 2022 10:49:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, luc@lmichel.fr, damien.hedde@greensocs.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH] clock-vmstate: Add missing END_OF_LIST
Message-ID: <Yh9Lt9VXh7iyz4Mq@work-vm>
References: <20220111101934.115028-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111101934.115028-1-dgilbert@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv

Queued

> 
> Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/core/clock-vmstate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 9d9174ffbd..7eccb6d4ea 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -44,6 +44,7 @@ const VMStateDescription vmstate_muldiv = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(multiplier, Clock),
>          VMSTATE_UINT32(divider, Clock),
> +        VMSTATE_END_OF_LIST()
>      },
>  };
>  
> -- 
> 2.34.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


