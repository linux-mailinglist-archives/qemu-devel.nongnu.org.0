Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03CD4BDA7F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:16:02 +0100 (CET)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAPy-00015W-0B
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAKa-0006rL-QZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:10:28 -0500
Received: from [2a00:1450:4864:20::433] (port=36482
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAKX-0002Bq-93
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:10:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id o24so27647567wro.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 07:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dWrX5LOubYWecCf/Kqp0nPHpjdp5YUCPjM2P4SAgMnA=;
 b=XpIeNUvRnjxRFJKZUMXs6Dmg3SmFwuzPk7ie6Ms7wUnLzSFwkLdHUuFlVVItgZnluj
 zMtkHmA/d7BCSxKDS0uLfMWvaKwJTnWoM2cj3QWjwFUBFmLs+AN0cvzDmt4m+wzxFWZA
 4hLzMnDzyu1ctMhZsdDiH6xJk4IZgrhPZm/RPoH5dINIKlTb1OiYyxePZUDx0Iyb7Pvi
 c25vcyrcmj9MkjW+PQ7jgBsPif6dIWCFYsJ9mHN1tmKw20ZCceOcaZ6TzgU7ICfVK+Ea
 VxqVeVWQDSZXudPIRG3dDWnmAx/pq6uDxJTpRgGIUQ2/Wkd6xTIVBEV6/mmPn505ijRc
 7Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dWrX5LOubYWecCf/Kqp0nPHpjdp5YUCPjM2P4SAgMnA=;
 b=G8ksAgu4NJgREE6+irh1/G8xscnciFjxYLcJ9Ku+vcXtg83xF5a75ll/NrOdoj5UnX
 AuHPffMQUdFUxt9cPaVO69kaTN9JDidN9rhnyClgepU4nfLpDr/ryrHH9coOogWAiHh2
 Q7okWpyqCLU8yeDQ/mUxrv35kBEuvzXiez6tkaFGmsdDBrkGZh6bXpb/i7rC7XUmbZ1Z
 1jcanDBJ4ARzcNhlPrJUr/NMRweTZRZQrMUiVBMyxYCJcfnrs1ywAMwOUfM9nlaaWJ2W
 CjZIuMEvR4NNoT2ANUOMDO3cogxxI59cjxVSkBbCgC7I0PWSm5Ac8N8v7SiMWdArNpT3
 SU0Q==
X-Gm-Message-State: AOAM533lwqH1NZkrdBsFaRzpA9QhIRiIdVqnx0fDiZ0VDEBPhFaQL3Vd
 DgCraa8QpWtmHIbqpClsvjQ=
X-Google-Smtp-Source: ABdhPJzIZVwn0kY7BtEyU44tQ6XzSxHc/DV4FtmPtwrsSnQm4AUMiWW3ANO+btWJcZtxj/GTR59+Dw==
X-Received: by 2002:a5d:6b4c:0:b0:1e6:8ece:62e8 with SMTP id
 x12-20020a5d6b4c000000b001e68ece62e8mr16324119wrw.201.1645456223036; 
 Mon, 21 Feb 2022 07:10:23 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id a12sm36294454wru.99.2022.02.21.07.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 07:10:22 -0800 (PST)
Message-ID: <eb2e6eec-0783-b78b-92b4-0a71caa8d568@gmail.com>
Date: Mon, 21 Feb 2022 16:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] headers: Add pvpanic.h
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, pbonzini@redhat.com, mst@redhat.com
References: <20220221122717.1371010-1-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221122717.1371010-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 13:27, zhenwei pi wrote:
> Since 2020, linux kernel started to export pvpanic.h. Import the
> latest version from linux into QEMU.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   include/standard-headers/linux/pvpanic.h | 9 +++++++++
>   scripts/update-linux-headers.sh          | 3 ++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
>   create mode 100644 include/standard-headers/linux/pvpanic.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

