Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9464F800F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:07:10 +0200 (CEST)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRqv-0002Cc-By
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRp7-0000zn-BT
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:05:17 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:36389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRp5-0004Dd-MA
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:05:17 -0400
Received: by mail-lf1-x132.google.com with SMTP id i38so1210536lfv.3
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ybikp2ZD+yoog3VX2RcZSheCoHRwYo89MLZX0qR4hrA=;
 b=EnE2jA1U1BV1ck+jikFfNZp5+0tUR2YgYiwda/xzzLOJqocY3S71LTAEJ17GbcCZh5
 lcf8XhcGTs8g9KxNA4QCxZNSjTTqt3wmD31BlvR8iUi4jmvgp8AXMTegIPM0r6qnjoQf
 sxTcIH7VZ6Te1E6B9Rew5ohHHN7WyyXv0dguugb7/0ULa/5KN4fKkgt3Q293cB6p8Ejq
 WvJCMo+02CPd8+r5sw0HEJwlA8/6BegQki1SEzWI+WsxT9qReL7W47om0AU2I7eWpDrZ
 rqa6vgx+Df2XaFXavDueNAZVpsuJmRi7baX4xfwvfjrv24vpYK5bHYHxV23VOgK/w//S
 3ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ybikp2ZD+yoog3VX2RcZSheCoHRwYo89MLZX0qR4hrA=;
 b=bfOV2CUNhpWBKVDj+KEgEoqy0h/XHRY8VxqTVVOe9h/csShwmZUbMO1EVfFgBjUf46
 jnPpAr6l365fBIZGppdCMWe44a/vnGGugiM7nd4E/j4rNkbFH1tvMCLu4hRIrzJuF95x
 RN1zCOA7QObuFSNDoGuJ+BVAy5+C44WfIy59UYPzXuCcHxizn4+4xIzOwKZJJiA835ed
 yCKC9gPiFMCNGeR2loUD2UqiGQlfg24EII2sxiaafHXs2SOYWffVVXRT+zSSfgNf8hQ+
 CUauJmriyC4O/fUSi8L2l713k5MgVC6mV8XAhdYI4/mCsOIfUFQF3Mag2W8zA10kquvB
 FdgQ==
X-Gm-Message-State: AOAM533S1oxICgSFZcOhcA3qclOEm6TvJI75CVis8jDoBYLjURAEDqU+
 H5rNs9gDEQFP8FSNEfeVwfY=
X-Google-Smtp-Source: ABdhPJzScgalODvSr2DGLOrlMP7brDd80ref3mi9k+bjZw0iEscyXh/qnI2BHadFopiA1wcuUoYaeg==
X-Received: by 2002:ac2:5119:0:b0:450:d4e7:99ca with SMTP id
 q25-20020ac25119000000b00450d4e799camr9287474lfb.95.1649336713110; 
 Thu, 07 Apr 2022 06:05:13 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a19384e000000b00464f6d13785sm166858lfj.176.2022.04.07.06.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:05:12 -0700 (PDT)
Date: Thu, 7 Apr 2022 15:05:11 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v2 1/5] qdev: add
 user_creatable_requires_machine_allowance class flag
Message-ID: <20220407130511.GB3143488@toto>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
 <20220331115312.30018-2-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331115312.30018-2-damien.hedde@greensocs.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 01:53:08PM +0200, Damien Hedde wrote:
> This flag will be used in device_add to check if
> the device needs special allowance from the machine
> model.
> 
> It will replace the current check based only on the
> device being a TYPE_SYB_BUS_DEVICE.
> 

Looks good to me!
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> v2:
>  + change the flag name and put it just below user_creatable
> ---
>  include/hw/qdev-core.h | 9 +++++++++
>  hw/core/qdev.c         | 1 +
>  hw/core/sysbus.c       | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..6a040fcd3b 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -122,6 +122,15 @@ struct DeviceClass {
>       * TODO remove once we're there
>       */
>      bool user_creatable;
> +    /*
> +     * Some devices can be user created under certain conditions (eg:
> +     * specific machine support for sysbus devices), but it is
> +     * preferable to prevent global allowance for the reasons
> +     * described above.
> +     * This flag is an additional constraint over user_creatable:
> +     * user_creatable still needs to be set to true.
> +     */
> +    bool user_creatable_requires_machine_allowance;
>      bool hotpluggable;
>  
>      /* callbacks */
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 84f3019440..0844c85a21 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -833,6 +833,7 @@ static void device_class_init(ObjectClass *class, void *data)
>       */
>      dc->hotpluggable = true;
>      dc->user_creatable = true;
> +    dc->user_creatable_requires_machine_allowance = false;
>      vc->get_id = device_vmstate_if_get_id;
>      rc->get_state = device_get_reset_state;
>      rc->child_foreach = device_reset_child_foreach;
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 05c1da3d31..5f771ed1e9 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -325,6 +325,7 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
>       * subclass needs to override it and set user_creatable=true.
>       */
>      k->user_creatable = false;
> +    k->user_creatable_requires_machine_allowance = true;
>  }
>  
>  static const TypeInfo sysbus_device_type_info = {
> -- 
> 2.35.1
> 
> 

