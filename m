Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF545FE188
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:42:22 +0200 (CEST)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj39x-0001F0-Jg
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oj385-0006b8-0z; Thu, 13 Oct 2022 14:40:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oj383-0001dh-3X; Thu, 13 Oct 2022 14:40:24 -0400
Received: by mail-pj1-x102c.google.com with SMTP id cl1so2683443pjb.1;
 Thu, 13 Oct 2022 11:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=s9heAK0+f3TTB/yifb8y+1GwxSs7xj8xyiac31cGOBo=;
 b=QeAI6tB1NfspYNkNA9hR7GqN/6Ox8Xv3kuhKthCMmnuPlhdi4FoZhnzDt5/p/TpAtQ
 PFf7H0s6ITAYsxAUfMFTyemABU5zsn0goo6WC2r5wZh0aV99+Ni8zrjVv7IZBqArTxla
 HP+fUkG37YVaXX9Ctg/FCoILjG6YgyqOXjjSmgwIEOtX/45gjHWMEAjyxNWmGSsWZ+FX
 Xy2c4VP8lqP39xyv6NQpF6xz5ppcfVEG4yUIdYG3aH+UU1RplS/qOJxNV6Mu7zS7XtIu
 qUipsMNzFE0EcK4Wk3VeY/ljw/El7/7ZuM/aM3Bf75xTwsjUTPm31/K4SsqrXY2XSzOO
 5dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9heAK0+f3TTB/yifb8y+1GwxSs7xj8xyiac31cGOBo=;
 b=6lodeqWulHgnwrpIQx7ntk4sSoj2GKnjkrLwYWcqndA1h7wUMUB/xZqthyDH/6jmzs
 rDnRD37Yh+uhhuQUB/89JRYPmtIVIhD09KB89gAci+ZRKq0fybMt7bTgwm6DaIQmVbkp
 YfVmbD7n4Q9oJJ53/vsElfO8LJ8xAn/KKaSokXTVemuzEjoyGZgMSY0CV6f62P7q4zLT
 XWFgKhc+YWApJIBkGtdTHUVRNLyGne0G1Ul3n3RqVc1HO8kTZ/RVtlR90TLaizXT7mry
 LoSHqVt7lucuLeVE2W8FvNSpv9AgS2cOI5xEBQntz+o668X4lwOrqlnODbOLHJvBtfu2
 Gu4g==
X-Gm-Message-State: ACrzQf1wnDECjCfPOVNScD7jHjFEziJ336fW7t6lv0wxtAx3pF0SzigY
 wJ+CB9Go+jT5Jg+rAF0UGJY=
X-Google-Smtp-Source: AMsMyM4lk/VfqOQRMGXCdClaNzXQ7Us7aIlgQ+kT8Z/iQnLIs773+rmUBghOtwQ4suiSX43s00BmAA==
X-Received: by 2002:a17:90a:b103:b0:20d:69aa:a350 with SMTP id
 z3-20020a17090ab10300b0020d69aaa350mr12488578pjq.178.1665686420880; 
 Thu, 13 Oct 2022 11:40:20 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a170903248300b00176d218889esm164190plw.228.2022.10.13.11.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:40:20 -0700 (PDT)
Message-ID: <838812c9-f03e-7d78-51c0-923ba4174a1d@amsat.org>
Date: Thu, 13 Oct 2022 20:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] include/hw/scsi/scsi.h: Remove unused
 scsi_legacy_handle_cmdline() prototype
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20221013130500.967432-1-peter.maydell@linaro.org>
In-Reply-To: <20221013130500.967432-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/10/22 15:05, Peter Maydell wrote:
> In commit 1454509726719e0933c80 we removed the function
> scsi_legacy_handle_cmdline() and all of its callers, but forgot to
> delete the prototype from the header function.  Delete the prototype
> too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/scsi/scsi.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


