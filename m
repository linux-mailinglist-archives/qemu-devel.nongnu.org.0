Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FEF6994F3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdld-0002u0-6I; Thu, 16 Feb 2023 07:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdlb-0002lp-1r
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:53:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdlY-0005Qn-D0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:53:38 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso4150478wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a+qjDWSL4rGvjXMBfZfBL55ChqVeDMTznuCacNpFBnE=;
 b=Uq4uHA6km3V715+uSiTjOhr9/fEQraKGa78nqSheJmV2JxwcBXYKPI6cZke9BAP7ps
 3JLDXU+C/kzq4L3os4jP5s2SGsUC27uIYrJPL25QgkKk+YyQWMnwuX4f30dQ6WPHZIjW
 GSR1vkia4+Kuhcf93tB0azoKhkTQuE6n3btvFqxSbW1RNl40uiSE3SDEumQMJ/+ZhYqe
 ANJG7v2TwTVzDImYhHtfa1vo6GMXG/uFY1SjrghRhF8ht0wMzfNjWbLko3HSk8Ix9i+p
 xzZ3J+ma5IgsAs4mC7SiX1E0OTa64iGzZ+8EbkJgRPG+2v+UMpwTqOgMrvyfyl6cjYiR
 W5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+qjDWSL4rGvjXMBfZfBL55ChqVeDMTznuCacNpFBnE=;
 b=T64kRVN6Io0l3UV751oaGGxUcTJPfbiUadHsPsbSimRFx24MPkEEahM3FKlKla2C7z
 0iJ7ArsDpuHHCFDbFmr3M8LI9iKCKoRbCR66VKbu8XNSBm7YTCeyV/SH2NJCLx64KkZf
 mi9ngGPV0YuXjWdxJ14w0udchpN3nHob5WABTjgD8pBH8Qeib14KGQ106M6ej/GRgFGD
 +u5IV6JUHmT+1ZStLFbHdk8sQiX8Nq24YL3zbVEK3CdFbgmvGoM8GrnmbgTJ2WccbVFZ
 ecJSk8gBHoX7P2R0u8O7+Kd4+1nFf5Wi0bVCPciLUNOkcZqBT3IfaifOiOntT6wVs62O
 8SeQ==
X-Gm-Message-State: AO0yUKV21Eqj1e5NQ8eecG+BMt7HFsHqEHPrnSNYJaOMYtm248vOCjwg
 jPz5D/G02Wpyl1+w3yw7useDKA==
X-Google-Smtp-Source: AK7set/Yw+1A4dlYDG9yrSviDEEc7NwvBdX9JCQndZfZBo/2uGrmXFV15vznqGS8xx3hyBeKdWU7xA==
X-Received: by 2002:a05:600c:5114:b0:3df:f3cb:e8cc with SMTP id
 o20-20020a05600c511400b003dff3cbe8ccmr167324wms.5.1676552014241; 
 Thu, 16 Feb 2023 04:53:34 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600001d000b002c56287bd2csm1413883wrx.114.2023.02.16.04.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:53:33 -0800 (PST)
Date: Thu, 16 Feb 2023 12:53:29 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 02/16] hw/arm/smmuv3: Update translation config to
 hold stage-2
Message-ID: <Y+4nSeT6Eq+ssD8W@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-3-smostafa@google.com>
 <d7f4e2cd-e60e-7187-105c-0e29b7745bbd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f4e2cd-e60e-7187-105c-0e29b7745bbd@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=smostafa@google.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Eric,

Thanks for taking the time to review the patches!

On Wed, Feb 15, 2023 at 07:57:59PM +0100, Eric Auger wrote:
> > In preparation for adding stage-2 support. Add it's configuration.
> replace "support. Add it's " by "support, add a S2 config struct,
> composed of the following fields and embedded in the main TransCfg ../.."

I will update it in V2.


> >
> > They are added as SMMUS2Cfg in SMMUTransCfg, SMMUS2Cfg hold configs
> > parsed from STE:
> >  -tsz: Input range
> >  -sl0: start level of translation
> >  -affd: AF fault disable
> >  -granule_sz: Granule page shift
> >  -vmid: VMID
> >  -vttb: PA of translation table
> >
> > They will be used in the next patches in stage-2 address translation.
> >
> > No functional change intended.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  include/hw/arm/smmu-common.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index c5683af07d..45f74d0e93 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -60,6 +60,16 @@ typedef struct SMMUTLBEntry {
> >      uint8_t granule;
> >  } SMMUTLBEntry;
> >  
> > +typedef struct SMMUS2Cfg {
> > +    uint8_t tsz;            /* Input range */
> > +    uint8_t sl0;            /* Start level of translation */
> > +    bool affd;              /* AF Fault Disable */
> > +    uint8_t granule_sz;     /* Granule page shift */
> > +    uint16_t vmid;          /* Virtual machine ID */
> > +    uint64_t vttb;          /* PA of translation table */
> > +} SMMUS2Cfg;
> > +
> > +
> >  /*
> >   * Generic structure populated by derived SMMU devices
> >   * after decoding the configuration information and used as
> > @@ -79,6 +89,7 @@ typedef struct SMMUTransCfg {
> >      SMMUTransTableInfo tt[2];
> >      uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
> >      uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
> > +    struct SMMUS2Cfg s2cfg;
> >  } SMMUTransCfg;
> >  
> >  typedef struct SMMUDevice {
> Eric

Thanks,
Mostafa

