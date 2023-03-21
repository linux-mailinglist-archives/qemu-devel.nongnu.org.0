Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A26C324A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:07:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebh2-0003h2-Fu; Tue, 21 Mar 2023 09:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pebgo-0003fv-Rw
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:06:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pebgn-00065N-7n
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:06:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3ed3080d17bso18535e9.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679403967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qkXrBRaTmEpyrQrjI+sGA6vdPgiu8xxEwZJ3Y82fQ34=;
 b=efTE+oXKuNEnOYkrjCHXCLS8eY3dIFMLXHtlfC6Qoo52SATmYBL6ks5i89wMqxnQke
 oMSa5U4T7b+2LAEMv55bZLZS1r/h1UlQ2KF2loVnPsZUZSWHX05J5CD/sxKIBY3JQoh4
 s4+bTDK9wgibjUhPDnta6nZK+XGvTyChE/x1tRTRK1A8UI1v+PhVuaHOY94ZkB7ZTo2O
 L453Wbw2CO1cnJ10sACEp4vN6lWGT2OKikepndTlauIM2pqmxvpinAkekUA/tVIcpQLx
 oXhQ2uqoQ8SE1LP6yTAUzkXg40gT9eXqJJrFXYLtm/3/LKorVwwdnpOQMo6XhC3o/MP2
 tA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679403967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkXrBRaTmEpyrQrjI+sGA6vdPgiu8xxEwZJ3Y82fQ34=;
 b=lhZXiguFCVoZZZ9JSwoIym291rjODoMD9PQ21ZvVLQg/IOdGJXb3HgfDoyWazmw3ae
 yooxnQFQT+AUSBxg7JZNGMtyhFjABfp5hTGBl+GXwAHGXuijgs9HfDKTUhBWX3/jg37o
 xIhrZ742xmVF3mJ+84jyf6+cPhTk7iaCVSAGt+f4JdlvvvIocwIZCKkw7EOVVTaNDzY8
 Cw9w/udSSbQshj3O10nNDWJ/LTXcFbmLdC3dHuehOOHSagvgvLWeUqRg3+d/Hz1t8sIx
 Bo52crUw6lutfmRMgST6pesXDnbRt/MZCzIOoWc66S+6YmeTRvi0zSs67464ywrqyNnQ
 xELg==
X-Gm-Message-State: AO0yUKU7JJWCgVslaaOMkVaEkQ1D+YgmhJqulrMv00sKUUT6Tw3ATCOI
 9emMoWSEE49dQ2VQ5B98I0kWew==
X-Google-Smtp-Source: AK7set9ufH3kLkmP5KLiWScGNX3qcO4it879jn1hSbauPVHTW6vAiFyx/CY75jdAtUqk0QOe1QHC2g==
X-Received: by 2002:a05:600c:4685:b0:3ee:eb4:b45f with SMTP id
 p5-20020a05600c468500b003ee0eb4b45fmr182422wmo.6.1679403967199; 
 Tue, 21 Mar 2023 06:06:07 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 g18-20020adffc92000000b002cdbb26bb48sm11321612wrr.33.2023.03.21.06.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:06:06 -0700 (PDT)
Date: Tue, 21 Mar 2023 13:06:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Message-ID: <ZBmruj7OME3Pfbh1@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=smostafa@google.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

> > +     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
> > +     * size.
> > +     */
> > +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> > +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> is this working in accelerated mode?
I didn't try with accel, I will give it a try, but from what I see, that
ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
accel/kvm-all.c, so it seems this would work for accelerated mode.

> > +
> >      /**
> >       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
> >       *       multi-level stream table
> > @@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
> > -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> > +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
> I am not sure you can change that easily. In case of migration this is
> going to change the behavior of the device, no?

I see IDR registers are not migrated. I guess we can add them in a
subsection and if they were not passed (old instances) we set OAS to
44.
Maybe this should be another change outside of this series.

Thanks,
Mostafa

