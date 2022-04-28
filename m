Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DE512D8E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:59:44 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njz3u-0008NA-LZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylf-0004BY-Bv
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:40:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylZ-0003Op-SY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651131644;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2Vc1B7ycdjerUtqsdh74YcYfas9ITL6yK9Ldu4kCEI=;
 b=P0Js3GGi8+/03K3rkXk0992dJs5X56MEyJ1mwt+by15sLuVc34TBa7M4zBQC64lAEZalwk
 uOXdf2smvzf0ejSmCYf6xKWppOoKU5112m0KwK6pQG4KE7fevU0+6RSyaT5p83pcUKy2Se
 OABWJJZZNnHxNhqq0yUl1B8sMd1bbUE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-I-NYKA8QPFeVEY0J4RLL8w-1; Thu, 28 Apr 2022 03:40:43 -0400
X-MC-Unique: I-NYKA8QPFeVEY0J4RLL8w-1
Received: by mail-qv1-f69.google.com with SMTP id
 s19-20020ad44b33000000b00456107e1120so3153602qvw.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 00:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x2Vc1B7ycdjerUtqsdh74YcYfas9ITL6yK9Ldu4kCEI=;
 b=tGR4INNdqz8qsQW0KwG4cF/Ln5G3fPOHFFVPxHvOWepKjG1qtnt7mFFkIfr7TgHbZ2
 NDPqIvcDdNZfQpvl2h7+hxqr/jzkGQhCkyN/2TULF98AmnNoGbHJkcbMuR4RI5hAlVNX
 L1RbMOVZGv9dTD7E75HCJ7/6LvmoqGfEtsMIBumtNk7BI3Xa15ggVySqLwqKB+T00meG
 d1iICjDaAHhliA5Q3xJVRo3z5tck59vb+vqL9wpWcA7Ufe8X5TdN0SqoIpWoalkW5p08
 2fM4O+vGL+rfEifyZUl3mFRrEDHDRT8p4C2WbhRGr3uyJCp1H1kbRQ+qX9toQMV88fZo
 PYbg==
X-Gm-Message-State: AOAM531dR7SswBFUTm+o4hoietmwdoidHX7lG76w+xCTh5mElJ4LuT+O
 Agzlw2C/2M6XOWcdeJfZSmriWsahu7lxcE89gCRdj6EqmXpr/l3r520/gPyUL817X1dCdCVIAMb
 kRsoQF9/Wa2qk7mI=
X-Received: by 2002:a05:6214:caf:b0:456:4027:90ee with SMTP id
 s15-20020a0562140caf00b00456402790eemr11125573qvs.35.1651131642777; 
 Thu, 28 Apr 2022 00:40:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOGOZH8ovtFoHZVgxezUpnsbNWA4Aw8ij8/gaYt3xMZYzE6Wg6JEVf1T5lL+xY+JGBeDUBQw==
X-Received: by 2002:a05:6214:caf:b0:456:4027:90ee with SMTP id
 s15-20020a0562140caf00b00456402790eemr11125551qvs.35.1651131642374; 
 Thu, 28 Apr 2022 00:40:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a05622a15c100b002f373d233d3sm5228803qty.71.2022.04.28.00.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:40:41 -0700 (PDT)
Message-ID: <1f0cfaef-8b75-b13f-7713-d945cab6cbbb@redhat.com>
Date: Thu, 28 Apr 2022 09:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220427111543.124620-1-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Jean,

On 4/27/22 13:15, Jean-Philippe Brucker wrote:
> The Record bit in the Context Descriptor tells the SMMU to report fault
> events to the event queue. Since we don't cache the Record bit at the
> moment, access faults from a cached Context Descriptor are never
> reported. Store the Record bit in the cached SMMUTransCfg.
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
>
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/smmuv3-internal.h     |  1 -
>  include/hw/arm/smmu-common.h |  1 +
>  hw/arm/smmuv3.c              | 14 +++++++-------
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d1885ae3f2..6de52bbf4d 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -387,7 +387,6 @@ typedef struct SMMUEventInfo {
>      SMMUEventType type;
>      uint32_t sid;
>      bool recorded;
> -    bool record_trans_faults;
>      bool inval_ste_allowed;
>      union {
>          struct {
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 706be3c6d0..21e62342e9 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -71,6 +71,7 @@ typedef struct SMMUTransCfg {
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */
> +    bool record_faults;        /* record fault events */
>      uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 707eb430c2..8b1d8103dc 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -527,7 +527,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
>      }
>  
> -    event->record_trans_faults = CD_R(cd);
> +    cfg->record_faults = CD_R(cd);
>  
>      return 0;
>  
> @@ -680,7 +680,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>  
>      tt = select_tt(cfg, addr);
>      if (!tt) {
> -        if (event.record_trans_faults) {
> +        if (cfg->record_faults) {
>              event.type = SMMU_EVT_F_TRANSLATION;
>              event.u.f_translation.addr = addr;
>              event.u.f_translation.rnw = flag & 0x1;
> @@ -696,7 +696,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              status = SMMU_TRANS_ERROR;
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;
> @@ -720,28 +720,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ADDR_SIZE:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ACCESS:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_PERMISSION:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;


