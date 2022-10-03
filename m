Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B255F37F7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:40:41 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTB2-00066Y-3Q
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSUo-0004CB-95; Mon, 03 Oct 2022 16:57:04 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSUj-0007a6-Cu; Mon, 03 Oct 2022 16:56:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id g130so10632470pfb.8;
 Mon, 03 Oct 2022 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=P5pvTI6BjTghFqonJBTDGkNAN6Pf/vaEQH9CIWIPLVI=;
 b=HdtSNd3Brva7xFOPaSxU/g8h2gG0Tv7As3RhPvckxnzs8bsbxElHO6OPY8SV5MfpkK
 xYcO0WJvPRbAxKxsRW0lT9IsjO7f9u7HyftrTHlb+0FfTOHgPtBFDHhI/yehfu8i7/YR
 CGtJ3OzgvgutAdYWI5AxWN0BuDL+ZgahA8xvUYrgs9YOLSKJTREEhhcpgaGr8amUxNU4
 s0W19YxFGG4vNrFDY/Q6HGy2RAY5YkH3pfyVF6Yaw48diEi5tLy1qn9gVNuYSgIAPC+q
 0t1nlYe/+sW5GBlsHIGjuUrL8xjsJdg/iHGo/i69EUONl85RlDk8n1hUCihgCAElqI6n
 sJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=P5pvTI6BjTghFqonJBTDGkNAN6Pf/vaEQH9CIWIPLVI=;
 b=dEaV3fVh5q1y+jtsPCUCYCtSfOkAJruXkoHVXjkypM3aBMeVrkO1pHoq1mgr4kjWZg
 4t5tQlqe/8zqvkvtVrV0D4vKHLrrWjd6xsm4/T65qUBcOUNx1Br4pjsTrHCiMikQ/+eJ
 74xfMhMtPjdlqgtnYownlpZxjsfyb86J4YyMtZdXwDmkuHqMkecb9lEmK754erigGQ2H
 cpEybkoShIclUk2MiYH0k0+u1SWnDvrFoctFyDuPmtW6dRBmpYdx03PmR2vaFFLyDD/E
 m6V6YvrIGGbPIqXX3jrKpwmTCjF7wTS/yIlg+KxFfVZNOhivy2qHYs6/dJjvVP+5h9pY
 foVw==
X-Gm-Message-State: ACrzQf25dUDB7m1OcQv6fngiH+nkg2rDlFqAbvi6MVuERvs9PjtKliqD
 p6YmAaslkLBbw1efswrt8YQ=
X-Google-Smtp-Source: AMsMyM6QgXfKJtzsZl4cagXElu6+1rv0OqOg8blKLchHTVIfSlmPthX0DDk/ifN/JvcUVmg+qG1Bxw==
X-Received: by 2002:a65:4508:0:b0:43c:e3c6:d1c2 with SMTP id
 n8-20020a654508000000b0043ce3c6d1c2mr20021060pgq.582.1664830615198; 
 Mon, 03 Oct 2022 13:56:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o41-20020a17090a0a2c00b00202df748e91sm6821643pjo.16.2022.10.03.13.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 13:56:54 -0700 (PDT)
Message-ID: <f42e94bf-d269-5714-4280-c48590ba3f18@amsat.org>
Date: Mon, 3 Oct 2022 22:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 05/13] hw/ppc/mpc8544ds: Rename wrongly named method
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-6-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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

On 3/10/22 22:31, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/mpc8544ds.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


