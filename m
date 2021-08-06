Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25013E226E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 06:17:25 +0200 (CEST)
Received: from localhost ([::1]:45806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBrIS-0004h4-N8
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 00:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBrGn-00032H-F6
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBrGl-0006Mg-SJ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628223339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjbzMrUNCRefHITRjeWegMmOKEhu/UpzfoIUepThUsk=;
 b=MFoaaivC1K1gnPsJ7T64441Tr8V3/tTVxU0ChbdCMqSOqfPk1jI9RMvhKJDW6ptKByDRU0
 /sP/bjMDDl1MNxaCZi/dY5bdSdrfLM60fcXYR0Et/HPBW+5pKJAGcL9LWYaXG9ubfmAvwl
 bUvlhVXEO65fuu+psrrGlR/wu1Qvzgg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-vXK3yUFxOGqJGb95zmy_dQ-1; Fri, 06 Aug 2021 00:15:34 -0400
X-MC-Unique: vXK3yUFxOGqJGb95zmy_dQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r14-20020a5d4e4e0000b029015409d80a01so2697238wrt.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 21:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AjbzMrUNCRefHITRjeWegMmOKEhu/UpzfoIUepThUsk=;
 b=Bx56EROIh30ZagAUNM0bf0lOemBezyOn3f56xgSwVi6RgtgXG/+3QkYo1vzZ16gUXc
 XR0TGnv/G3dLfdOpzbNhFLdHUPyTuxklhcJLxbPhsTB5Vfo5cATUmBK7YfkaDShPHI2a
 /u1eARqoKkOMQi0nDivWQXE46Pl9hCezhRRQFoJAW7kNYCp0vE/cC1nMcXJ7jKzOusmB
 IHZ6n6aXTY/pyOP0vTeKF9ZJa+TMSI1JaXmg5D07GEVI3v8juCBZw0/tJpBFEM6B2Oww
 MOGaY2dBcL5wPONL8hXUP/zDaT+H+9aj2SAxymMnGW/yjY89S2OWZNIRCHu4u2Z9bUcK
 q0BA==
X-Gm-Message-State: AOAM5304s1erDAjYL1YSBCJesJquXeMwsAA1r6Z6A7jeane4tLOfqwde
 kLrm8SV+YUBapMtQCKAsPEPzdHAGVTwwF8vjXaDxHKdLGq0c+6Pcb6uNjmJ27EOo6KKdmDmEVt6
 gl+GR9rstWf9m53k=
X-Received: by 2002:adf:e3d2:: with SMTP id k18mr8425500wrm.212.1628223333651; 
 Thu, 05 Aug 2021 21:15:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHNEREazUZE8lSUM2szD/xV1oyEEmw+mpH5HblqsYvzpSOxePhWLmqos732rFADn4d4Rb90A==
X-Received: by 2002:adf:e3d2:: with SMTP id k18mr8425491wrm.212.1628223333487; 
 Thu, 05 Aug 2021 21:15:33 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id q124sm2852159wma.42.2021.08.05.21.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 21:15:33 -0700 (PDT)
Subject: Re: [PATCH for-6.2 5/6] s390x: event-facility: Use SCLP_EVENT_BUS
 macro
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-6-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a6f20bc5-9639-0cfb-aa70-88e4a5e1d4af@redhat.com>
Date: Fri, 6 Aug 2021 06:15:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805193431.307761-6-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 21.34, Eduardo Habkost wrote:
> Use the SCLP_EVENT_BUS macro instead of manually calling
> OBJECT_CHECK.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>   hw/s390x/event-facility.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
> index 9f7883d6e20..bc706bd19b4 100644
> --- a/hw/s390x/event-facility.c
> +++ b/hw/s390x/event-facility.c
> @@ -532,7 +532,7 @@ BusState *sclp_get_event_facility_bus(void)
>       SCLPEventsBus *sbus;
>   
>       busobj = object_resolve_path_type("", TYPE_SCLP_EVENTS_BUS, NULL);
> -    sbus = OBJECT_CHECK(SCLPEventsBus, busobj, TYPE_SCLP_EVENTS_BUS);
> +    sbus = SCLP_EVENT_BUS(busobj);
>       if (!sbus) {
>           return NULL;
>       }
> 

I think this could be merged with the previous patch. Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


