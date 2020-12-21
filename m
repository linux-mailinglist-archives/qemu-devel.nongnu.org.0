Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50762E019E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:41:52 +0100 (CET)
Received: from localhost ([::1]:55818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krS07-0005dD-T1
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRwS-0002jD-Su; Mon, 21 Dec 2020 15:38:04 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:46522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRwQ-0004Wc-KR; Mon, 21 Dec 2020 15:38:04 -0500
Received: by mail-qv1-xf31.google.com with SMTP id p12so5025650qvj.13;
 Mon, 21 Dec 2020 12:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s0iuvGjufj6Wwojbrw2O2jw5ilmRFaFTbHyDsF5evKQ=;
 b=fql4nTfEzNNEqbA2dc39mperX6kihFTRioTD3yPzI+yBHYBMWyXzXbhTwBBfdEhusj
 XzQIbiw0MIkW6IOnLvKf2Qf0a3U5o8P5aMYUxoyg3+mhDRqFUoz+JHsnD8oarwvbRhfa
 AZL7JZFXBR0Sb1qHbnZXKUsqX1aVwXcPC0InZ724hqVIjsIdlY17PFAvClIaFpqQ5aPc
 QALtYm9Nd46a83A4KAG9iY4WMmYfuePyc0RQ/vNZsR+SRmJs/CxLmYP1SEeNyCtVfYB/
 ycpWqbccecgHtxmFJRWnFPS4Z6zWxk0sFyZqy0DUzU78RKxMhKX1N+3Jr1ETSDjrjxQQ
 cpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s0iuvGjufj6Wwojbrw2O2jw5ilmRFaFTbHyDsF5evKQ=;
 b=QKUzYKX/jl7eKPRnaMfpNimIo4hOML/V3Yp8lLE0UO+5cchDrm3n16mIe0UxSJMGLl
 AEXZuQmkMn6fDgxXtN2STlMmbnrTfAyGbloZ1vmvsmws0oHn0SAPUFy3TaduSGdvkLE8
 U4x+E5YIi/glrdPypG7XLW6pkFDMq/4+zJs/lCBb7L3qehrQQ2QgdrL4quLAXUQGgRxg
 vuu23VHrcdjq1TZV+kWtLqziYp+CobYMVnar95jDq6IZABYn4uidVajAEHQzuNkL93DN
 pG70bZ9FtND0ubi9DYMa7MLvVQbl3ZLOOE9G4ozdWF2bNsRR9E1OHmuDvTuexAktS1mS
 8PFQ==
X-Gm-Message-State: AOAM533AcWWMMym2E344fYAPfDLFSg6EASdetxL5ydoJhxnSaXjR9n7Y
 fYErnPFtp9RkS9D4PzM/CRc=
X-Google-Smtp-Source: ABdhPJzsdRSuw7486xzM3sTH3PTBRrWPWvEyji5ia9Lwfm5sxc1OoMu/OgP03m8p9WbIhJjNvZqw5Q==
X-Received: by 2002:a05:6214:768:: with SMTP id
 f8mr19020793qvz.1.1608583081495; 
 Mon, 21 Dec 2020 12:38:01 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:556d:fa44:43b8:486b:f066?
 ([2804:431:c7c6:556d:fa44:43b8:486b:f066])
 by smtp.gmail.com with ESMTPSA id z30sm11067558qtc.15.2020.12.21.12.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:38:00 -0800 (PST)
Subject: Re: [PATCH 5/6] spapr: Add drc_ prefix to the DRC realize and
 unrealize functions
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-6-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <fd01fa77-9662-738f-78d8-862053f49fc6@gmail.com>
Date: Mon, 21 Dec 2020 17:37:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218103400.689660-6-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 7:33 AM, Greg Kurz wrote:
> Use a less generic name for an easier experience with tools such as
> cscope or grep.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr_drc.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a4d2608017c5..8571d5bafe4e 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -503,7 +503,7 @@ static const VMStateDescription vmstate_spapr_drc = {
>       }
>   };
>   
> -static void realize(DeviceState *d, Error **errp)
> +static void drc_realize(DeviceState *d, Error **errp)
>   {
>       SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
>       Object *root_container;
> @@ -530,7 +530,7 @@ static void realize(DeviceState *d, Error **errp)
>       trace_spapr_drc_realize_complete(spapr_drc_index(drc));
>   }
>   
> -static void unrealize(DeviceState *d)
> +static void drc_unrealize(DeviceState *d)
>   {
>       SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
>       Object *root_container;
> @@ -579,8 +579,8 @@ static void spapr_dr_connector_class_init(ObjectClass *k, void *data)
>   {
>       DeviceClass *dk = DEVICE_CLASS(k);
>   
> -    dk->realize = realize;
> -    dk->unrealize = unrealize;
> +    dk->realize = drc_realize;
> +    dk->unrealize = drc_unrealize;
>       /*
>        * Reason: DR connector needs to be wired to either the machine or to a
>        * PHB in spapr_dr_connector_new().
> @@ -628,7 +628,7 @@ static void realize_physical(DeviceState *d, Error **errp)
>       SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
>       Error *local_err = NULL;
>   
> -    realize(d, &local_err);
> +    drc_realize(d, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
>           return;
> @@ -644,7 +644,7 @@ static void unrealize_physical(DeviceState *d)
>   {
>       SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
>   
> -    unrealize(d);
> +    drc_unrealize(d);
>       vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp);
>       qemu_unregister_reset(drc_physical_reset, drcp);
>   }
> 

