Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456E331977D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:33:35 +0100 (CET)
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAMOs-0000UB-BU
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMNR-00081m-FM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:32:05 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMNQ-0004Sn-50
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:32:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m1so7474166wml.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zL/YAUPwrvFvVcBdFMW4sjnEMsKOoh4QsNNlSviaViA=;
 b=pPb1Z3C5nbBwy3NibrUANTv3xuokyT0fNMmQxLlI6ByQu/YDZBAYCjtVcLTrdZadeJ
 F3x64d8S2anqU+Io3S4n3muCQHTYtAvKZ9e7NmWMidPvgy3JGjPFt1TW2YQDjL24R40M
 tjp+7JsGAY0LF/LhgJdrRG2ScmcdJiDnul/H5lPOck3BH3lrP7HP1tZwZUG2OUtWQcCe
 cRUyv67lLCsZXSCZGqAQuXtDsV4IjDbjVOJBbPy5sbtseLeVX8F2Do+kYunpAGCPm3GO
 LQlpxglAa8tVfjq8B20hhR7MX819kbB8MR4KTZ0+fBA0I/boaQQ1wboD9Hpr/i52K8bo
 iAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zL/YAUPwrvFvVcBdFMW4sjnEMsKOoh4QsNNlSviaViA=;
 b=gbAdYOnsl5AQNeDco1cXzv77S07bE/WTavr39lts/yKRbI+sNISW4ghNuo8QNncWaK
 yXhCCffOwRl24XSggTn49zNcEg+RZZTa5553N6YlFcwQZlFQpyoKPOr+/ayWCaRRbfmE
 AZl3ApKaoe3w2+lBEO38wK2fqK2gtxjXn0lq6OHkdb0Lzss5vqres5PeSpS6Nahh3hOV
 GXrQC39O66iEhUlaryFi8Rm5ST5osK7dRGRfcatyz/Je/XLm/ygrgaqiDRsk52Afbx4M
 Q32T1Jq7x5QSUnAd/31r4LU47MjI+siaZyZV+PIORik9G4Opb8UlzR26s6DgqsNhxrtJ
 Dk2A==
X-Gm-Message-State: AOAM530bOFJZwDWipYsu8q4pPET33Kxx87jNhclDBvUmo0Han8tP61OK
 nHbbQHtqsnTZcos9F8PW0DQ=
X-Google-Smtp-Source: ABdhPJwTJBWCCX2V93kWCQEW93y78xyXHzr09u+mjK1q/DOsn3UUQflrpQfn5mpwrHG0Gtvf0Mc48g==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr460255wma.22.1613089922939;
 Thu, 11 Feb 2021 16:32:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b15sm7160374wrr.47.2021.02.11.16.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:32:02 -0800 (PST)
Subject: Re: [PATCH v8 09/35] Hexagon (target/hexagon) architecture types
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-10-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0f9bd8c5-c149-fdbb-d954-580f7d65106f@amsat.org>
Date: Fri, 12 Feb 2021 01:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-10-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 6:45 AM, Taylor Simpson wrote:
> Define types used in files imported from the Hexagon architecture library
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/hex_arch_types.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 target/hexagon/hex_arch_types.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

