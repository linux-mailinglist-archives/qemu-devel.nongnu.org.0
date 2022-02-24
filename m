Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094714C2DC6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:03:15 +0100 (CET)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEi9-0004WG-S2
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:03:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEfj-0002pl-3n
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:00:43 -0500
Received: from [2607:f8b0:4864:20::635] (port=35674
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEfh-0005hB-50
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:00:42 -0500
Received: by mail-pl1-x635.google.com with SMTP id i1so1794578plr.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kh8dkYAns6hoqrGk9nFwiRb+lYVjK/hNiiEYMuw8wEE=;
 b=Hau1WgGgU1TNNdqtcFtqNcL8i32EM+frGCmjX3xIjDp7EyGugE6nIFrPREPbnEHLVX
 l/tmHl0REiaSqpptuBRcpCi5H61w6CNR5S5vzwiQXcCP3SfQ234rkve2QGKTRmzJCdrF
 tGg0N8z/bILjMGSO8sFj+cAE7hFBmUPFJnVBQUGfzy54UaveTx0kgcbccE3Xy9pxby/T
 G9gj5bH85n1zMiTOlKRJAK/sAU1kBBl6fSS4kTqk1tgZARHx7V5EpNBhFbV1P8o9AoIF
 eYDXK3EJvC8kcrAWf5cDyEumAr5pj2dNDSIkSDJ5a8tKcSPs+90/e4xGjrBBKeKFaN6s
 us1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kh8dkYAns6hoqrGk9nFwiRb+lYVjK/hNiiEYMuw8wEE=;
 b=oEmyzqA3H0r4TSY0VuXfLTkywVUCdmmSU+3HO+b/SyCYXe2AXdBiEiRjnMp5LT3eua
 D7oFwiwklrF7fUClDdpJhwf/BmOGJYcPBzFLu6MPccr/RLydOJevJYfTC+Pu2/hks3zj
 9DRPN4rKWRzfZmKNzMYj4R8jjsWCuojrSfaMBM7X6aW4KJIT7MLSfXJSJIEMaHEQ6ZpQ
 Z6BUwt51CxGWsvx7Tse4XuSWYM46NTA7pUL20RRpcjtExo7509sXcF5JfXLE/MwqWs0u
 iz7OJkBJbK7DB8xYBGYuxMUtbn4X5yu4dYD6L6NHkwHJDzNAgYWkTUSyOpKT+0S1XH3d
 bMaQ==
X-Gm-Message-State: AOAM530Cli2fsGF9JMNXNZdhFaudl4EcrQ1Waeo095P5MLLolQrBZfE+
 J5jpF4N5+EwU7FuGtojB1uo=
X-Google-Smtp-Source: ABdhPJwzfa5zX9S5pHcXboAk8oLTmUjG/dyDLOgYRFTBgwFYgmOPi1Uw3o0N2KXeoNuxqxoxB4xSIA==
X-Received: by 2002:a17:902:e945:b0:14e:b8d9:aa07 with SMTP id
 b5-20020a170902e94500b0014eb8d9aa07mr2750603pll.163.1645711239905; 
 Thu, 24 Feb 2022 06:00:39 -0800 (PST)
Received: from [192.168.223.175] (140.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.140])
 by smtp.gmail.com with ESMTPSA id u1sm4011154pfg.151.2022.02.24.06.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:00:39 -0800 (PST)
Message-ID: <2370d7c0-f42b-1da1-9de5-4f51396bdd5f@gmail.com>
Date: Thu, 24 Feb 2022 15:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 10/12] mac_via: make SCSI_DATA (DRQ) bit live rather
 than latched
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-11-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220224115956.29997-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/2/22 12:59, Mark Cave-Ayland wrote:
> The VIA2 on the Q800 machine is not a separate chip as in older Macs but instead
> is integrated into the on-board logic. From analysing the SCSI routines in the
> MacOS toolbox ROM (and to a lesser extent NetBSD and Linux) the expectation seems
> to be that the SCSI_DATA (DRQ) bit is live on the Q800 and not latched.
> 
> Fortunately we can use the recently introduced mos6522 last_irq_levels variable
> which tracks the edge-triggered state to return the SCSI_DATA (DRQ) bit live to
> the guest OS.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/misc/mac_via.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

