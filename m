Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D64F802F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:09:37 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRtI-0005HE-QS
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRqw-0003QU-DC
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:07:10 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRqt-0004Ye-W0
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:07:10 -0400
Received: by mail-lj1-x235.google.com with SMTP id by7so7459096ljb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4KGuzkMG/YMrysIlHukPlf/75CRIFxySTlYI6qdMnjY=;
 b=UvAI1FBFpmhbQIHhkGpXyBe+w8pdnMp4hWOrEMO0OqzAPyAQNRk8Lcw4xC3BnVffX8
 QP2ht2UiS/UuunJ/XqR29ms0teAHFW/IglgmEEgR6gze8ukGFrgvptUCACAxOOlKLkV9
 GaeDSuqKMjnvHm6rrkyRQaloNT7Y9ZcGLbJIU6cVQ7VeYkwPFSfMkxb5bsBXQAM4e7sZ
 WB8cRXRpUl5Xs+gyxP7EFogO6O1fZa9JJblbBmRcxz8ynj+OSLpBFbrt7eOexi7FRq6z
 SUSxmCX1jjBYWIFrqcDhb2aVJBZnlYTpttRcPSBHbiNBTOyGNH5qp3V2DnBAd2fR5rNT
 QAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4KGuzkMG/YMrysIlHukPlf/75CRIFxySTlYI6qdMnjY=;
 b=mAIvP373OZvpAVpFGouBqB9sgb26tqTQKkjEGK+icXEf4PDDVb4DuB9hsTHM9jXkcx
 OQK7t8eutHQ+Y6Lz6INCCMj+aQhlejQ6k6PuYvNNa0XSqrvdvgdbul16AXoknzhv2i+x
 YYO/H8MomeRiM5mEiFjph3pvenhu44U77R2HfbxAWk10ccDaZ3pankQx3UIB9ScQ8T2U
 xRPwCS+Jfi+XSAmbWsOqpvXyzfwL1gptnUWadHRx5dLXuV9+d8vYJvEMtW6afx8JfrIP
 YdcPyBBMxH0urwT8emzo785Rwzn5KqK7QAL8FGLWfhEHldjaF2RzJ/refaiXIEbw+7TH
 LDWw==
X-Gm-Message-State: AOAM533+gFGYfSYkO1V/nIFkqJ4jUcXoUxXJt/9Ql/7/gE3zQbz0QnKq
 6PR9cF3mbIMO180TI4ZPaUc=
X-Google-Smtp-Source: ABdhPJwt7fa6FYsgd04yGWku9baj7i8HrWg667wV8MVbSCN6MJMEHdaJMg0unRmotg8GzC9fenf/Rg==
X-Received: by 2002:a2e:b802:0:b0:24b:5ec:ee53 with SMTP id
 u2-20020a2eb802000000b0024b05ecee53mr8646364ljo.332.1649336826191; 
 Thu, 07 Apr 2022 06:07:06 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a19f10f000000b0044a36e3cc33sm2153990lfh.298.2022.04.07.06.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:07:05 -0700 (PDT)
Date: Thu, 7 Apr 2022 15:07:04 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v2 3/5] qdev-monitor: use the new
 user_creatable_requires_machine_allowance
Message-ID: <20220407130704.GD3143488@toto>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
 <20220331115312.30018-4-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331115312.30018-4-damien.hedde@greensocs.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
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

On Thu, Mar 31, 2022 at 01:53:10PM +0200, Damien Hedde wrote:
> Instead of checking if the device is a sysbus device, just check
> the newly added flag in device class.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> ---
> 
> v2: update the flag name
> ---
>  softmmu/qdev-monitor.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 12fe60c467..77f468358d 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -258,12 +258,12 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>  
> -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> -        /* sysbus devices need to be allowed by the machine */
> +    if (dc->user_creatable_requires_machine_allowance) {
> +        /* some devices need to be allowed by the machine */
>          MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
> -        if (!device_type_is_dynamic_sysbus(mc, *driver)) {
> +        if (!device_type_is_dynamic_allowed(mc, *driver)) {
>              error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
> -                       "a dynamic sysbus device type for the machine");
> +                       "the device type is not allowed for this machine");
>              return NULL;
>          }
>      }
> -- 
> 2.35.1
> 
> 

