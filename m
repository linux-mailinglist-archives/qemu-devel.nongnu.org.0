Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61488512D85
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:57:45 +0200 (CEST)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njz1z-0003nZ-9Y
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylw-0004ec-41
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylt-0003Tn-CB
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651131664;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CnUPrd9pk15XVP0gJJP5BS7DxyRw92zxEwCfGq67nY=;
 b=TCAO2S+GnODjrTW3csq2AscyuSncVuYE5E1wALu7eyg9zWHTIglRpDiCtl2SSolgwVbtYy
 PKHQZ2N1tLnlNOTLtyqtBcxS3GwlVPRDotpB9AQZ47oGw+ZUhujmpVcHjlx//YT+qBsUSf
 IEy5Aw6lLA3ikYOLGXh0YTUEvSNT4fU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-JEx58EqVNHOz7yoeirxZnw-1; Thu, 28 Apr 2022 03:41:03 -0400
X-MC-Unique: JEx58EqVNHOz7yoeirxZnw-1
Received: by mail-qt1-f199.google.com with SMTP id
 l11-20020a05622a174b00b002f37e3fe6easo2767801qtk.18
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4CnUPrd9pk15XVP0gJJP5BS7DxyRw92zxEwCfGq67nY=;
 b=oSBPtkhst61jTSqCLdqP+lgFkAUT9BvVFx+5z2xyFvGOAAu86C/vOlP9oltXGzkSo5
 AhKiW0nb+y87vmXoz0bVsRWa2GbYaOkpFqBNOTbIgDFNjGu4TSZ61nqB7eI9tC2F6rCo
 FOTZzKROa4jZvZhJ6le6NgSYbiY7RlJkvrJgHGvVrmelQoC0tLAlzxXAeZU93zdvzFJX
 mJ8fNjeUax18KIVoWgH+5xSreZWYgy5eENTKjqih9SNNHvCvK6O0QXnH8jlkAn+qEmI8
 4RhxmqMw4E99DzFDZ098s0PXxSbgqF+WHFLF7Qn5I819PwnY+g499NPISoE8kXOA4cje
 +KIA==
X-Gm-Message-State: AOAM531OwrEauXemygdEvBH0cvcbWeRh97/5sz2wGPVXvebQbp5dPx4H
 Sqy/i5t7c0sV/C95Vy18OEvlfcmarsdmY7bOJ30ifQAqzhKc01VL0gSVzyn/15ENkCIr4xGHMX7
 WbsrKEPaTim/p1d4=
X-Received: by 2002:a05:620a:46a3:b0:69e:d29d:73d with SMTP id
 bq35-20020a05620a46a300b0069ed29d073dmr18440967qkb.463.1651131662992; 
 Thu, 28 Apr 2022 00:41:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOy0Ilj9mjczKsL/7hV4oNigQIRlN8GAUMIzD1VkS4mWsWF0n2hoKjYuzdcY8CtoCxHOrWzg==
X-Received: by 2002:a05:620a:46a3:b0:69e:d29d:73d with SMTP id
 bq35-20020a05620a46a300b0069ed29d073dmr18440961qkb.463.1651131662802; 
 Thu, 28 Apr 2022 00:41:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h19-20020ac87773000000b002f388ea2959sm494922qtu.36.2022.04.28.00.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:41:02 -0700 (PDT)
Message-ID: <8278541d-26c2-e606-5d46-c665358c89b5@redhat.com>
Date: Thu, 28 Apr 2022 09:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] hw/arm/smmuv3: Add space in guest error message
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220427111543.124620-1-jean-philippe@linaro.org>
 <20220427111543.124620-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220427111543.124620-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/27/22 13:15, Jean-Philippe Brucker wrote:
> Make the translation error message prettier by adding a missing space
> before the parenthesis.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8b1d8103dc..3a989b09cb 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -786,7 +786,7 @@ epilogue:
>          break;
>      case SMMU_TRANS_ERROR:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s translation failed for iova=0x%"PRIx64"(%s)\n",
> +                      "%s translation failed for iova=0x%"PRIx64" (%s)\n",
>                        mr->parent_obj.name, addr, smmu_event_string(event.type));
>          smmuv3_record_event(s, &event);
>          break;


