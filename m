Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CA4AD80E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:59:22 +0100 (CET)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHP9U-0005pn-RO
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHO6P-0004uD-9F; Tue, 08 Feb 2022 05:52:05 -0500
Received: from [2607:f8b0:4864:20::42f] (port=37596
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHO6N-0002Ne-Mo; Tue, 08 Feb 2022 05:52:04 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y5so17260113pfe.4;
 Tue, 08 Feb 2022 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BBebatjqc9J3K0170oLZvbwCqovawjrB+Q0DTYrN+AY=;
 b=pg/gap0FKrkljZXTpJYK6TwIA1ojhOlJ4CTFfl2jiYGsXz1fWS7w8ef0yaC9zEOGbo
 /X5JirVGZNMqFwWRwdX25OaqyFAbHGYr+edHOrJ+gzpijWXoAd1HiD9DgkgRq6wHe5zb
 CBjClvHj5RKuMmJtHMfTYLcQl5XHnKDoZ26BUqR6AIHbPO9cYhNq4uUOke/fYaswy4vC
 /YjsMyfhmh0PoltK6R0ZJtKzkPgdRjmUe29pArtHen3PF5GvAVYGJsaQtj2BMJb3SJUN
 0zRuJWTELCToqtf2cBdiZip2bORZFOU3eqeyXG9tAszNQSaRiGueynRK2Pd974zGLIkb
 jqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BBebatjqc9J3K0170oLZvbwCqovawjrB+Q0DTYrN+AY=;
 b=42v5qxTrZhF3v5z5yxucBwQrldj6zQlxHnJ5TqhYJdRGMBMFcYvpzujoo68aZOkYKM
 KzBhk+IlFPeNqRFVsl51Ag9dahmp4DegAux33Krcbjr3/+Zep/9sOpK54vTGiFAN6Ksx
 IIh/LXoesfwv+6qE1BaSSRz96V3UmDUdZMUL0wohsCmG/HlBtcVv40M68IuY9lwa67Td
 3kXxWsymkEif7yiL2chUH2yUw/9sTFLDQ0gnPWN2HE60Th97j3ytPzh87wln5eftAMWZ
 IxkrKulZmjW5Vwo/3iTVa+9Msr5thVfz5w/TX58/QwRrFZLYMPdVFvY7K02UL/hd6VK8
 vuJg==
X-Gm-Message-State: AOAM533gtpRvVge64bk0466obJih7U7FTKea4r/Zq+TqDIeywQKRMFNC
 vS5SAvlPXLKnEV17TCaLBb0=
X-Google-Smtp-Source: ABdhPJyRQTCvUHyG/IpdIHNV0FF1Z6mxq55y7hsn8kpaJ12Y8t4/5f+rSQqLIMbDKySdVzQZPTZfpA==
X-Received: by 2002:a63:85c1:: with SMTP id u184mr3041720pgd.115.1644317521914; 
 Tue, 08 Feb 2022 02:52:01 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j8sm16516259pfc.48.2022.02.08.02.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:52:01 -0800 (PST)
Message-ID: <79d13250-78fe-3037-9be9-73c15476ce81@amsat.org>
Date: Tue, 8 Feb 2022 11:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/6] tests/qemu-iotests/meson.build: Improve the
 indentation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-3-thuth@redhat.com>
In-Reply-To: <20220208101311.1511083-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 11:13, Thomas Huth wrote:
> By using subdir_done(), we can get rid of one level of indentation
> in this file. This will make it easier to add more conditions to
> skip the iotests in future patches.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/meson.build | 61 ++++++++++++++++++----------------
>   1 file changed, 32 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

