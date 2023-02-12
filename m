Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F247B693786
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 14:25:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRCKt-0003pR-DI; Sun, 12 Feb 2023 08:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRCKg-0003oA-Lo
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 08:23:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRCKf-0003s6-4d
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 08:23:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso1040875wms.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N27fPuB3jlFdibuLChm0kDRCfgTLPmc4/wRlsVMHL6w=;
 b=tETpUDrK6v1J1FgB0IPw+vV5p3eXlGyo7BEntipAuU9QURgjMcnLLTZxNJCBVdwbUM
 S7B+VYifzqdwTxGNcvFQaxxToy+x9/NvxF7FYUabR3QgkwWjtQARM54511p2jAM1CkVA
 Vy91z0THXTu6/3438Nfbl26Q1LTPrbhqhlkeCIjxBLoh+baLSTx2XThFHsbuxgn+U/Dh
 UbqPjCyfDXdxoezBCFELrHE7pibxfwLGeFzgcMR6SjbUDhQ6P83z+c7nm/WjxPc4rvgJ
 y5YJJqM2kEry3YSjCfa8gbvWTqkIer+ivkQpYUBLpIMKbb6uCTSUnjQjnydADVRnPgQB
 ldjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N27fPuB3jlFdibuLChm0kDRCfgTLPmc4/wRlsVMHL6w=;
 b=nLzDna7VPlJTnheKhGH2Dn0fu0kaVVqCZY9+znQegfe6yXmvCiBtGQgMiJrMmeLhRl
 a8RVNfjab64tI9VJQGAqnO0ylcc5FJx2DXpbz2NCqjwbu27oLFCBS3xVJLt+P3N6633F
 nn73VQJAU4fjP54lYWtJP+Jw8aeqMSntSbzNkTstCq8z7Ze2C4COvPxbzs/B0eMoYztL
 tLYOwdDha4LvCxD3yPPd1AU/1tfN3mA9JacnIuHmieepu6x4j7MeQQ98UrxNSVeW2G66
 ssFt3EAj5gjVoYasgH+xWvaIlsA0aOwQ/OD4CxJIHxZ7hH5zJWF71WaBe4/SPcIUiup5
 V+HQ==
X-Gm-Message-State: AO0yUKUgFdmHaP2ngK/Rm+dmjKBtF7haZks9mIAE2MbQSdh59/XffFVI
 ZjigSpIyH4O2a5ACuvZ4TgWZfDYjgsIXQu9zEaI=
X-Google-Smtp-Source: AK7set9/LEXuS5CU8jUkdyXwZxLcPYYzU3K1WyOA4EfcRwgrugjDvkzxvlKBQfpki6oT9Zgu76tSBA==
X-Received: by 2002:a05:600c:3c90:b0:3dc:37b4:7983 with SMTP id
 bg16-20020a05600c3c9000b003dc37b47983mr331441wmb.0.1676208231041; 
 Sun, 12 Feb 2023 05:23:51 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfe381000000b002c54f39d34csm3608806wrm.111.2023.02.12.05.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 05:23:50 -0800 (PST)
Date: Sun, 12 Feb 2023 13:23:46 +0000
From: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+joYrG4aKC5cje5@google.com>
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -165
X-Spam_score: -16.6
X-Spam_bar: ----------------
X-Spam_report: (-16.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Sat, Feb 11, 2023 at 01:48:57PM -1000, Richard Henderson wrote:

> Just "return s->gbpa != SMMU_GBPA_RESET_VAL;".

I will update it.

> > @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
> >           VMSTATE_END_OF_LIST(),
> >       },
> > +    .subsections = (const VMStateDescription * []) {
> > +        &vmstate_gbpa,
> > +        NULL
> > +    }
> 
> Actually, I suspect that you need a pre_load hook that resets gbpa, which
> will then be overwritten if and only if the saved value != reset value.
> 

Please correct me if I am wrong. From what I see, the initial for value
GBPA will be set from smmu_reset_hold which is called from context of
qemu_system_reset from qemu_init context.
And migration will start after that in migration_incoming_process from
qemu_main_loop context.

I validated that also by printing the value of GBPA from vmstate_smmuv3
pre_load at migration without GPBA, and it is the same as
SMMU_GBPA_RESET_VAL.

Thanks,
Mostafa

