Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A144EF07E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:34:32 +0200 (CEST)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIMB-0006da-Qd
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:34:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIBQ-0004xI-EX
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:23:24 -0400
Received: from [2607:f8b0:4864:20::b34] (port=44811
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIBO-00089I-Go
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:23:23 -0400
Received: by mail-yb1-xb34.google.com with SMTP id y142so5246092ybe.11
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qguey1I3vdc9qt43mAFj/MaOYQ5iiTkcKtt+q14pVbo=;
 b=wpYIHMmN4EHS0y+mFr2zxKTW/YBqx28PlHx4um+Yxz1uZcgTH+uVNDq8hPcKrci1dw
 cmr2C0zn3e6b9gzKZ/kK2MR2mT+RZ7d5ndfHH63Wt0Rlkf1kcjcVCR1xhYYfHEKB+qLn
 7HHpR2xBR328FnOH2NxyLuATLpgiIufP9gOEg81j4GQ/zhL1eM3dEITyH0NHlrJYr1bd
 sG+dtuWDqCEojAo71p6jNa7X/RByygUSGmLv/F6QT3nfRBW2SWNeTnX45+QzGzQCoRCg
 OLF/THZEfBUdOxq3yIc458cTLs0qeC9cK5/9H0BIq9dG1Zhuc2/ULjsWNo+yry86HCXc
 XBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qguey1I3vdc9qt43mAFj/MaOYQ5iiTkcKtt+q14pVbo=;
 b=vygGQTHvpHMRf321HTlHhNaLQHH8FC0aC4iJIv6AJ66UQ7Ew1fh4ggKd0lTQZQOvMb
 8vd7xGfZWTEupZLPlbGa9mQhlzmtsGugSv5eeK8ow2dcOSRevFK/i0Nja91Lw7x7A8JR
 dexKRqurCGDSDoqoymH23pGFFwp4sEik313ei4M4IQTbg9zdrI7AbfkRSRf89idWPYMQ
 RTd9GioHP9stYm8iEfIr2SSmuRnBfiyQjAJpnCiSDsoZMru2eRZ+2zA/k3+vQeAc58D2
 sI7+tsQ8c3f8/zYyRDcvwU9vUg1PmSBvWhPChty+URosA5AdtwVRK2su0SX4mPwBSNOH
 q5MA==
X-Gm-Message-State: AOAM530lEU+hu5YaIBQBgKySeH4IeKyHZnknmlbN6gaOlOnYXO1YbeTc
 ke4cH7WMiF8mbRz5fg51U5WgiJq+2+UoBJVn/0pSIOcry0rVC8kl
X-Google-Smtp-Source: ABdhPJz64bD29HGmOGm2a5rWn4/mdUW3I6/mX+IfKYqknzxe1+gaekmecJRriHGnSHGnikj5sRuRzCOfFe6ex5D83rE=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr8942857ybt.479.1648823000426; Fri, 01
 Apr 2022 07:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210930151201.9407-1-peter.maydell@linaro.org>
 <20210930151201.9407-7-peter.maydell@linaro.org>
In-Reply-To: <20210930151201.9407-7-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 15:23:09 +0100
Message-ID: <CAFEAcA_XHxc9XedMzXxzuNcOiJLkwOzDQgMXCFNsViV8dS-d8w@mail.gmail.com>
Subject: Re: [PULL 06/22] hw/nvram: Introduce Xilinx battery-backed ram
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, Tong Ho <tongh@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Tong Ho <tong.ho@xilinx.com>
>
> This device is present in Versal and ZynqMP product
> families to store a 256-bit encryption key.

Hi; Coverity points out a bug in this change (CID 1487233):

> +static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
> +{
> +    Error *errp;
> +
> +    error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
> +                     blk_name(s->blk), detail);

The Error** argument to error_setg() and error_setg_errno()
needs to (assuming it's not one of the special cases
&error_abort or &error_fatal) point to an Error* that has
been initialized to NULL. (The comment on error_setg() in
include/qapi/error.h explains this.)

So this function needs to start "Error *errp = NULL;"
to avoid a probable assert() inside error_setg().

> +    error_report("%s", error_get_pretty(errp));
> +    error_free(errp);
> +
> +    g_free(detail);
> +}

thanks
-- PMM

