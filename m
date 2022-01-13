Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BE948DF1F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:42:13 +0100 (CET)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86vE-00078F-4c
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:42:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n86nh-0000IZ-P2; Thu, 13 Jan 2022 15:34:25 -0500
Received: from [2607:f8b0:4864:20::235] (port=41807
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n86ng-0006AN-5Z; Thu, 13 Jan 2022 15:34:25 -0500
Received: by mail-oi1-x235.google.com with SMTP id q186so9425502oih.8;
 Thu, 13 Jan 2022 12:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=077emCO/Nk7M+0XKxgNIcC7gKVONqoGQRTvDJnUdiNE=;
 b=oA2tiysAYX1InN22rVCv9vdnuT/rCCyP1oJkQYdy8oIAFFKmTaVL/o4JnZQZ6jF4X6
 aVBCkEzsqtXp4+HVCnTyHJGcwCFk4qrJqdVAA6B8O5EssK9cl61HIkUIZs+qO4QuVsKP
 9aLYj5qvN14lnfpUIbjKpUCR5NQLNXOW8Vi56pGK7cR6TOWKfodJZTEXvDQg598QkdNH
 Q1OM/D8zJ1iMbFaAnNQnglOKVcxLqt14IboSL0pd1lLPMc45m+xXwvnTA1HEMln5jDF2
 mMbbxa+oM92bp/bJ9k8SuHdUXsjKz/zJFhP85W0olP7JBs4tLv56uqyeLRGqWQOrJqlI
 /AYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=077emCO/Nk7M+0XKxgNIcC7gKVONqoGQRTvDJnUdiNE=;
 b=Lzkd8Qv/8RYPNdbXsNt8gwSKP1gayfKOG0fyKkQb2DL1XATPPOu+UaE6I51Pjo2wge
 awBEXQI+7NCR2QFzUBBf0Xe+N8bUGmjbFIt/cQkiP+bflniRaBlw98NJJQm3oKUaY90Q
 XxUTAsqPMTdANrSjUm7NJwTl5PnK4/V2Rw5e55sRLiYzy1T4sDVxaBThjh1QakGf+F6T
 9Jw3h5/hDWaH/GBjPILuaSVWlbIWWg81WIfnPLbOmT/tvHJ2wIu32YI2c5Kw9JE+VLv+
 njaf/4S15poYlfb1tziDMgKKBDtNH/TxHKLOYHWHA4Vk9nlIEY9nZv0nTDesfnFCSZ5l
 nGbA==
X-Gm-Message-State: AOAM533W2nAjbRr92L66fi62PHNf8HmtrMRS1ppdLoy/06aiXtS41MBN
 qK2+GC4bibuSbzsLypcOKk8=
X-Google-Smtp-Source: ABdhPJxd7AVY+od34+PjPMFieaiqbSUh73GTTpFiNZHXp2G5bTInp9VscbqE1cbPwE5r+tBOkfq0hg==
X-Received: by 2002:a05:6808:1820:: with SMTP id
 bh32mr5138107oib.31.1642106062787; 
 Thu, 13 Jan 2022 12:34:22 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id c6sm785925oto.19.2022.01.13.12.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 12:34:22 -0800 (PST)
Message-ID: <c1cca733-fa92-1219-4a6a-fdeccc48fda4@gmail.com>
Date: Thu, 13 Jan 2022 17:34:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] Link new ppc-spapr-hotplug.rst file to pseries.rst.
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1641995057.git.lagarcia@br.ibm.com>
 <e54aad58e3cfbd96647430d33cdb59fd87d199b0.1641995058.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e54aad58e3cfbd96647430d33cdb59fd87d199b0.1641995058.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/12/22 10:52, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/system/ppc/pseries.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index ead33e6764..1120b21d95 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -110,13 +110,13 @@ can  also be found in QEMU documentation:
>   .. toctree::
>      :maxdepth: 1
>   
> +   ../../specs/ppc-spapr-hotplug.rst
>      ../../specs/ppc-spapr-hcalls.rst
>      ../../specs/ppc-spapr-numa.rst
>      ../../specs/ppc-spapr-xive.rst
>   
>   Other documentation available in QEMU docs directory:
>   
> -* Hot plug (``/docs/specs/ppc-spapr-hotplug.txt``).
>   * Hypervisor calls needed by the Ultravisor
>     (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
>   

