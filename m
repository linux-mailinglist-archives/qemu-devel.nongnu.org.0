Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA66C023E
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 15:08:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdtgZ-00065H-Lp; Sun, 19 Mar 2023 10:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pdtgQ-00064s-VX
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 10:06:51 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pdtgO-00056C-Tw
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 10:06:50 -0400
Received: by mail-qt1-x833.google.com with SMTP id n2so10484780qtp.0
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112; t=1679234806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zerjc4o/6krhz8Vy+JMWVoFR5qxPdhsILurfPhrIxl0=;
 b=Sytx95GPQJZYrPNfNJTRBNJAcdMIv4+73X2bfSQ8ZBq1rogebBNecDSYRfysvU1lMs
 E39vGBqz70+tIrozWX4xwiDTAjfVcjCC7rnkGEPQihTh2A2ZWd758Lee/wMuZ47gNAGg
 OhceWCSZ7arKO/Nv1CUTCPn/szZcXRviQ3r3GDcu653uR4dqJkGH3Lk7baUWnNfhFqWf
 SY+36UxGra+KmWa78GFoArf4z8XrmINC8nZmG8gH4NxBaa5Pk2tPslnPPNY+F8y+xQzZ
 /skAJOWUEvWLgVEPrAvoPN1fEjSgpBf1ggx+pKpIl0zu8Fhi7NbQnoQ/y7KrCmc1YYtS
 +Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679234806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zerjc4o/6krhz8Vy+JMWVoFR5qxPdhsILurfPhrIxl0=;
 b=sgmgtWnOGIqJqKynFoN7QyxwkliSeo6A3W7lczmg68vudgcpXvo3Kbld8NnOEYlJJ/
 Nz10GApwSms+3eLAY7NG/m2AlEQYWcyqSFrKjhCgIhkw6dGRVhOKRXxqFlPI1dVGLw3N
 FaTms3F3ylNE8ju5sAKKNGRW0xbF8nHx5pE7MAYsQXRedejHqMQ/MGRlftfi1YJDB1DN
 Lpwg352FRDKNI4w0lnPHR514k0GshcFXOuLK302S/PXI0Bv/SklSgLp8IyT7O2fWzj6q
 Xnw+NEiHS2ZvJWjv2oA4MXHDsBr0zwQ97PVXMOQ+EFr5Wbowo9uzw//t5j2KTOCtDnVT
 ZTrg==
X-Gm-Message-State: AO0yUKW2+/clDe+TeRhmki3wePJH3Kir+yzACtWqmFsQ4SAYMiERxTfb
 UuDfB2xjPIcYPlVS+4PKzVb6vuPHQ66Gy3YZCmYt9A==
X-Google-Smtp-Source: AK7set8+5LUoq/SN2XJ2ymDvWWPzuVlN94+dfbLPNFKIsR+DiUm54lD1SqR79ZaEhTvOX1ph7BA56Q==
X-Received: by 2002:ac8:7d96:0:b0:3bf:cc89:9c8f with SMTP id
 c22-20020ac87d96000000b003bfcc899c8fmr21431933qtd.68.1679234806589; 
 Sun, 19 Mar 2023 07:06:46 -0700 (PDT)
Received: from localhost ([143.244.47.76]) by smtp.gmail.com with ESMTPSA id
 h23-20020ac85157000000b003b848759ed8sm4681938qtn.47.2023.03.19.07.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 07:06:46 -0700 (PDT)
Date: Sun, 19 Mar 2023 10:06:44 -0400
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 0/7] plugin: fix clearing of plugin_mem_cbs on TB exit
Message-ID: <ZBcW9PeFAlQQlPeR@cota-l14>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::833;
 envelope-from=cota@braap.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Fri, Mar 10, 2023 at 11:52:45 -0800, Richard Henderson wrote:
> Changes for v2:
(snip)
> Richard Henderson (7):
>   tcg: Clear plugin_mem_cbs on TB exit
>   tcg: Drop plugin_gen_disable_mem_helpers from tcg_gen_exit_tb
>   include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
>   *: Add missing includes of qemu/error-report.h
>   *: Add missing includes of qemu/plugin.h
>   include/qemu: Split out plugin-event.h
>   include/qemu/plugin: Inline qemu_plugin_disable_mem_helpers

Reviewed-by: Emilio Cota <cota@braap.org>

Thanks, Richard!

Alex: is it too late to add my R-b tags to the series?

		Emilio

