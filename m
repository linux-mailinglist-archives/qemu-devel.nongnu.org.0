Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73876343F75
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:17:42 +0100 (CET)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIZ3-0001zG-2n
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIWD-00019s-AO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:14:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIWB-0008DZ-Jg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:14:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id 61so16210484wrm.12
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2U9zFDuerLURPOrjD5ODW7P7D7zQZHeiAJ+VbW99/LQ=;
 b=lAA+XG9h5TKc1LmBaoJkkH/coEwU68Csde7FWDRywHD62FHddCrb1gg9AqHeCwhgMO
 YbppEk6DlXA4TpBPdRZPdyJjRAjm+KjadCMfCqKYUSXCSExYrYHLJArbxX4WnTMDzTZ2
 4CkgsTntigbVudGb1yqq/s8xpSdZhIz52fp2cFMCzXGpZhkFXl67/HYAOf5DZ7SbctVl
 oJJyL33UzM2A8BgplrXMrXeeNkdWeUaEH0yzga8hj2xeUiIIJH19Uye1op7NiINCfARx
 RcisUEEPECLDmH+2710MaU0FIYUL3LD4L28EZqykFXz0PR81YF8e0CuSIM1HDBoDQWuZ
 p65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2U9zFDuerLURPOrjD5ODW7P7D7zQZHeiAJ+VbW99/LQ=;
 b=uMw7/E6jbC/Mg5G04z7WJyj7w/5LGDfiH9IDBynjJF0vnYIoQtx8Sg73eIYQiozN8P
 hoSx6x7IUF+SjuL44eaQAWOtZw/0nGCbZQTYrnmtf/ETEVhRivOWXyItp2SGBxcmYD1m
 /R7dwy0S2KBqHpVldZXQHStoiVrqDRwFqfOUAlBdw3xnAinUdHvITBQkQ6ATax8+ffMN
 tJIFCPPSJdWSI6PvmEU0/S8UxcG0+cVH6DJ5S7FnYzJ0XRc3Kp61Xyyj+DAxsUNbrxN5
 I0/xCvGEkD8j/jTMQ5479dbS1+lqaFSf0DSjCcL/eNc0bK3aTqRPeLGrd2oZAvMkmwK1
 Xp2w==
X-Gm-Message-State: AOAM533dBaS4n6QeiBoALh3Gr+bIG9sRX2TUq0qPhmO5qL3UgYnJgtCd
 yZeFfAwOXSBpj9wddf2ubzg=
X-Google-Smtp-Source: ABdhPJx4B8aySDUMYLlewrFauWuGW1S1jBX1SHBkP0DmxCNa2tmC8O7rji2hBC3oeL6UKHL81xo36w==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr17025089wrg.180.1616411682122; 
 Mon, 22 Mar 2021 04:14:42 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u8sm19182774wrr.42.2021.03.22.04.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 04:14:40 -0700 (PDT)
Subject: Re: [PATCH] exec: Build page-varry-common.c with -fno-lto
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210321211534.2101231-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <646b88fe-99b8-cc93-2f9f-497f241ce118@amsat.org>
Date: Mon, 22 Mar 2021 12:14:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210321211534.2101231-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/21 10:15 PM, Richard Henderson wrote:
> In bbc17caf81f, we used an alias attribute to allow target_page
> to be declared const, and yet be initialized late.
> 
> This fails when using LTO with several versions of gcc.
> The compiler looks through the alias and decides that the const
> variable is statically initialized to zero, then propagates that
> zero to many uses of the variable.
> 
> This can be avoided by compiling one object file with -fno-lto.
> In this way, any initializer cannot be seen, and the constant
> propagation does not occur.
> 
> Since are certain to have this separate compilation unit, we can
> drop the alias attribute as well.  We simply have differing
> declarations for target_page in different compilation units.
> Drop the use of init_target_page, and drop the configure detection
> for CONFIG_ATTRIBUTE_ALIAS.
> 
> In order to change the compilation flags for a file with meson,
> we must use a static_library.  This runs into specific_ss, where
> we would need to create many static_library instances.
> 
> Fix this by splitting exec-page.c: the page-vary-common.c part is
> compiled once as a static_library, while the page-vary.c part is
> left in specific_ss in order to handle the target-specific value
> of TARGET_PAGE_BITS_MIN.
> 
> Reported-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure                |  19 -------
>  meson.build              |  18 ++++++-
>  include/exec/cpu-all.h   |  15 ++----
>  include/exec/page-vary.h |  34 ++++++++++++
>  exec-vary.c              | 108 ---------------------------------------
>  page-vary-common.c       |  54 ++++++++++++++++++++
>  page-vary.c              |  41 +++++++++++++++
>  7 files changed, 150 insertions(+), 139 deletions(-)
>  create mode 100644 include/exec/page-vary.h
>  delete mode 100644 exec-vary.c
>  create mode 100644 page-vary-common.c
>  create mode 100644 page-vary.c

In which MAINTAINERS section this files belong to?

