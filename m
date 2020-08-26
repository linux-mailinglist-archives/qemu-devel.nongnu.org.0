Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6DF253798
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 20:53:03 +0200 (CEST)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB0Xe-0001MN-AP
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 14:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kB0PQ-0008Tf-Tl; Wed, 26 Aug 2020 14:44:35 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kB0PP-0001If-DC; Wed, 26 Aug 2020 14:44:32 -0400
Received: by mail-lf1-x141.google.com with SMTP id i14so1537774lfl.12;
 Wed, 26 Aug 2020 11:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qLDwvIZxJUP65DAQVvbFClNeiPCkILFLUvIB5eFRofE=;
 b=g5wGkqfEaDwjlULlIbR87kq7Sc8nztSjQRKoohjcPDcyaGH83ifQu9OR3rBHfOfQoy
 4EnhyeugkXrvUfx/BLb/Dr80JT8Ur4w+tHN2xO8KpDeYHhM0R48/PA7njopiL/A592bn
 5iBC/wyOMW8U2G9oLzsdIBL7EOwZl6C8E92a1/23xkh23fJn5aOXamj3HLWfRI18Pymz
 2VbshXypSdT0tS0mSDzIUvzxAM9s0Pvw06Nvnf8tMlJIY3fXN45NEFuRQ2KKn5dgERK+
 8nSLTGMWfsD15E0AYe/IsbQrkD5wxwRU1gSBl7rzyiL528q/o1SsXrjf79RHJqsA+hy5
 8DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qLDwvIZxJUP65DAQVvbFClNeiPCkILFLUvIB5eFRofE=;
 b=aarx7Wmb5BRPzQFnHAHWR3dul+KBZiIXtLpqEvlef1A3SfUWwsOjQ+y7V0IRI8lBlF
 yBU6WKURSiybQGV/m1QBU6SiAa3dM9n+NSfSGssJ36twNz27YUcTDCgMs5o3vYDoyHfN
 puy99w6vtD1e6f50ZrT9jrjlDGro60ofOiP1QDKelF36Bcz1G7zHXghfKcfqWsCRRPls
 JTO+R7fkvhMfIl/VIolZOes9FsdMWreJ08wiPNUB7JIQzsdXlqCyuwQ72webGHNiMgr6
 BnKOHp8OknfDO6oSXGg2OaYZBe5E7GmbpCW9np03xJ3pI7N2qofFw6X9NuF97VT2M1ZI
 TmJg==
X-Gm-Message-State: AOAM532/8n2PFOKzkblwuhmaNrmh7UDj79FPDsyRKpRqQ14G+J6FbCa/
 qtNHGg0zsutyXmpVxueL3II=
X-Google-Smtp-Source: ABdhPJxuDLrdNpYe9/5Nw1tbNf9mCJNcsrg/j0TJIbk+6lnLi3vhdF2xrBRHn0r4bHRE88BDtqxjyg==
X-Received: by 2002:ac2:5f49:: with SMTP id 9mr2306527lfz.96.1598467468954;
 Wed, 26 Aug 2020 11:44:28 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h11sm671516ljb.58.2020.08.26.11.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 11:44:28 -0700 (PDT)
Date: Wed, 26 Aug 2020 20:44:27 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/8] xlnx-zcu102: Use TYPE_ZCU102_MACHINE constant
Message-ID: <20200826184427.GJ2954729@toto>
References: <20200826184334.4120620-1-ehabkost@redhat.com>
 <20200826184334.4120620-6-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826184334.4120620-6-ehabkost@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.066, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 26, 2020 at 02:43:31PM -0400, Eduardo Habkost wrote:
> This will make future conversion to use OBJECT_DECLARE* easier.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/xlnx-zcu102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 5997262459..672d9d4bd1 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -238,7 +238,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>  }
>  
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
> -    .name       = MACHINE_TYPE_NAME("xlnx-zcu102"),
> +    .name       = TYPE_ZCU102_MACHINE,
>      .parent     = TYPE_MACHINE,
>      .class_init = xlnx_zcu102_machine_class_init,
>      .instance_init = xlnx_zcu102_machine_instance_init,
> -- 
> 2.26.2
> 

