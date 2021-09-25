Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7E418114
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:39:32 +0200 (CEST)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU55f-00013n-2J
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU53X-0007XH-TY
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:37:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU53W-0005sy-ET
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:37:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id d6so34980176wrc.11
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iP5NKIjmf7M/ldurP6pctLRcK+4naMwN1rn8Ep+i3E0=;
 b=d5+0qRRevSwZWkAPP5DTTwR0csZ+L2qvnOBGxN95F2B4cpt1Jz0OgbepnobcAnFZrU
 Bn+i69gkkCRLBKByrHn2BDR7wMuYuW4GnJohgI5qPpB7ObEgJiFbvL4gne3OhPJ71KZ+
 950LHSIYRmkShIzyHHcqaVPePsvGtoSgIEpzMJHwMjmk2Q9/F8F/ixlpbJwBOa+ly62a
 Y8xRU41b7nBdElE1ZecIlYtXqLedWxqHb1UFqGcN4rtZsK3qXZNqg+5rnp0/IDEoOc+R
 WGMnAZaWV0nwc4idG7L1BkqMBF0i9Ocq0+XIqOCxDgr6Ir8n2ez0SuweUlmo8bFGWPuI
 JT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iP5NKIjmf7M/ldurP6pctLRcK+4naMwN1rn8Ep+i3E0=;
 b=wTPIsmNJo7+pWezvZ4iZLrnX+SLy4Mt1He25y2QTbo6rb5XU9jZxihGoLb+JNtML+R
 ylwcn9X54Lq+ugAYpOMj+aJyifMEWFT9l3VYPzUXjTwh8IKU5aFDrormR6YeYveBsa7J
 LJ5Dc75mzb9w+9RMCNUINQnQo2pibLR4GKdOhmEIyFF00M+l9bHLs+KF6qXDxR20XVCF
 ViOiwste7wPjBbU0/HI9+VKluBu6BEm9Sr5C+6XlwB24ckgAdQNSARMGdI/xY75bPbUr
 XCIqSGD3e3jjcn6hIIJPhIOAms6MGy0+JIjgTjCL2lbFB4LLYlamySRvrtWXskNV/q20
 8l2w==
X-Gm-Message-State: AOAM532wbRFpIgYnBAZWu8PjKgauycl/aDbrfj9qocgfsxiGUdnRDscg
 PmNrYP+EwzUTwwpC3M+UI4k=
X-Google-Smtp-Source: ABdhPJwEprPmbhcQgZHe4aVE6fvbRMntaUuUCHnfok9jJOWdngl3dnTIfJodi4e8MKBoiwQZjosCBg==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr6192015wrm.236.1632566237286; 
 Sat, 25 Sep 2021 03:37:17 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r27sm9381019wrr.70.2021.09.25.03.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:37:16 -0700 (PDT)
Message-ID: <54cc1b6d-615a-1d94-5947-bb837c62f9ef@amsat.org>
Date: Sat, 25 Sep 2021 12:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 08/14] bsd-user/target_os_elf: If ELF_HWCAP2 is defined,
 publish it
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-9-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-9-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 08:14, Warner Losh wrote:
> Some architecutres publish AT_HWCAP2 as well as AT_HWCAP. Those

Typo "architectures"

> architectures will define this in their target_arch_elf.h files.  If it
> is defined, then publish it.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_elf.h | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

