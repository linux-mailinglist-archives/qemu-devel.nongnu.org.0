Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AB531A450
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:13:23 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcwU-0001Qs-EE
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAcun-00008k-Ep; Fri, 12 Feb 2021 13:11:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAcul-0000My-Ol; Fri, 12 Feb 2021 13:11:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id u16so454101wmq.1;
 Fri, 12 Feb 2021 10:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lZ9Hh7Z92B/pLvoC2lyRIqAJR+dMlMcZoV5i6TTAjKg=;
 b=LK4qK4gKzALi9ChGoeeNngxigsZakWYQ8QV7uKb1kMrCCujEeWDP9JrrjfrYf2Wwuj
 9ir9DmmTZlQvK5bC3iNWq26gtRIFV+PvdgHEUUsrTRiQLUZjBj0aD5svXEn6wBgV91Hr
 bJBQfoeCtKScRf0C6V6YIf0BQKIqcH+ClFwaedaO4Qrox+du+6PR3wA2/AR81fToz8HV
 pkT31WRxW+cNTEIKpUh2/CnBO0ANj0X5U7TmagDBwLW/YdaJBN4k5nk4wlF7mesvQzAj
 boE+1acs5XsH/zTETeMmrVUct3C4JASOn9gv1qkBhgEuoESA21cUd0QXKVSfLsr59tPv
 5Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZ9Hh7Z92B/pLvoC2lyRIqAJR+dMlMcZoV5i6TTAjKg=;
 b=HU13v3Z7f8WuOFnHyI9Yw/RecMdy/1R26Xm8N5+3eDEeMjvIhqOrdYbnkfAnY/O2ju
 YxclfoSaKievRWoSnpkaFf3U95TmfcCEissDz5SsD/Pd7ZM90spUuAqBNIzdfltip+4Q
 WWURuu88Ohe8CKAkfnpmNFUUkydrkz4xEA7hq6wnWYu0nA+wVayb8C+N2vrzlR4Exb9i
 D7q54FUr7BXjWjsmtBkl+nWrEMOzA/NfBnChbAaQzQouHiXkKJ/puv6juB+bcQ06zPsC
 ltZGQm6v80T6AIjCSzo6BIRp6i5mPul/ug1gx5hdIcxaaxuFIGHeTGdlii5LS7nxQmok
 X+MA==
X-Gm-Message-State: AOAM531S6VL1ZGYRc7uXDaPkDQqYVmCgXE3le8VlXt+xhbL40DRtjZ/r
 QJB/WUmW5ffleBQNpWYO9YAS0fQZ+d0=
X-Google-Smtp-Source: ABdhPJwAnV/UcEw1Go2UNpwSujoK06N3XROzNSb2SoWrixn9YpClWXLajxkvkbzQGa1oovVl4nroQg==
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr3685771wmo.183.1613153493668; 
 Fri, 12 Feb 2021 10:11:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l1sm13851580wmi.48.2021.02.12.10.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:11:33 -0800 (PST)
Subject: Re: [PATCH 02/24] hw/misc/mps2-scc: Support configurable number of
 OSCCLK values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21c387e9-a6e7-2c99-28e5-d4ad3e717e1c@amsat.org>
Date: Fri, 12 Feb 2021 19:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:59 PM, Peter Maydell wrote:
> Currently the MPS2 SCC device implements a fixed number of OSCCLK
> values (3).  The variant of this device in the MPS3 AN524 board has 6
> OSCCLK values.  Switch to using a PROP_ARRAY, which allows board code
> to specify how large the OSCCLK array should be as well as its
> values.
> 
> With a variable-length property array, the SCC no longer specifies
> default values for the OSCCLKs, so we must set them explicitly in the
> board code.  This defaults are actually incorrect for the an521 and
> an505; we will correct this bug in a following patch.
> 
> This is a migration compatibility break for all the mps boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> It would be possible to avoid the compat break, but we've already
> broken compat for the mps boards this release cycle (eg in commit
> eeae0b2bf4e69de2) when we added Clock support to the armsse code, so
> there's no point in trying to keep compat for this change.
> ---
>  include/hw/misc/mps2-scc.h |  7 +++----
>  hw/arm/mps2-tz.c           |  5 +++++
>  hw/arm/mps2.c              |  5 +++++
>  hw/misc/mps2-scc.c         | 24 +++++++++++++-----------
>  4 files changed, 26 insertions(+), 15 deletions(-)

TIL DEFINE_PROP_ARRAY(), thanks.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

