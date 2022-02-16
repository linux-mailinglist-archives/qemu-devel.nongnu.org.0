Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2B4B9458
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 00:10:33 +0100 (CET)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTRQ-00061s-HV
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 18:10:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTQ9-0005Jf-Vt
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:09:14 -0500
Received: from [2607:f8b0:4864:20::62e] (port=36543
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTQ6-000720-UK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:09:12 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u5so3196547ple.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=41Kn11qV2afHo7TvwlgqEK2mMsf1VnLGUrccdbuCZ38=;
 b=ah81A2Wgm6jEh9LlE0asJ3uk79G0XNBc0ZkIRud7RlICjyzeV9ae/3R95IzkYXs5FZ
 SWn53AtpcrIsefwS3Mg+zhR5fx1BgwiBEzAxs+9wcTUc+xVa9OWeIZuLzUhC3qvfVtDF
 IIAERmDDpq5rcaAULdUWL5HNzO+zIvQyX8KuZqTWqmrT6Q8ErghLAnO4Ye5F5fWd3B5O
 AIb0/qxl9Kqly7Nu1hkVwS7eqU893NMgXbpu+8fnA8vm+zv8VFgtKQypIHgFbJQR9s2L
 i1h0Zaldpnw7PYB7iWoN6EDktfC4S1pANcy9zkshQn3kc6MWfF8dHpDzJteWUfIcXF4d
 +MrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=41Kn11qV2afHo7TvwlgqEK2mMsf1VnLGUrccdbuCZ38=;
 b=c+pO9i+F1sN6KT8xW6wcJf0s+V/e1+4o7aG5OcD5tUT8Bm6yjf57+qpdHJaVR/LzHt
 AuIBMnObw7qTl4qko7i5T4UcWv8XntnOPh8cx6FcCMzQCJmx8MLjL6VDfV26nhoion08
 D0BV1lF2CqJ45E41VA8QgccAnMDPj9+NEEVr4gygW6E7JK/fDUMOUumjwG6JQfZfFYpj
 TI4r2ncjhUzW40Z5IDA3ExvGaRLfsPdhiKdTX0sqHYus7q3gTycDrK9bS9uCrdTYmFQb
 eiS3oqHaxDgUAep/Dwzh3rOcahqnvLJJQiH9PkZZ7ueWoQuhUU9cmLkxIfd2SPelLSGl
 Qa3Q==
X-Gm-Message-State: AOAM532qfMRy/7rjWxkBmHalh+xhENJoKtgGb45C2EyWFkMhzFDhhNVh
 WFy9wnFaG2HQ5kDbKyEFtgM=
X-Google-Smtp-Source: ABdhPJwXlCeXIPGdZjy47OuSa7c4PSeZUAfb4GlWS0oE7FNpAO3uW3Aw9UWdBsSH5CfIVF0MFTcJOA==
X-Received: by 2002:a17:90b:4d86:b0:1b9:c571:53a0 with SMTP id
 oj6-20020a17090b4d8600b001b9c57153a0mr4377101pjb.242.1645052945051; 
 Wed, 16 Feb 2022 15:09:05 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id w23sm6449524pgm.14.2022.02.16.15.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 15:09:04 -0800 (PST)
Message-ID: <f326463e-1077-eceb-0f8e-e11ac69f3b21@amsat.org>
Date: Thu, 17 Feb 2022 00:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 6/7] hw/isa/piix4: Replace some magic IRQ constants
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-7-shentey@gmail.com>
In-Reply-To: <20220216224519.157233-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 16/2/22 23:45, Bernhard Beschow wrote:
> This is a follow-up on patch "malta: Move PCI interrupt handling from
> gt64xxx_pci to piix4". gt64xxx_pci used magic constants, and probably
> didn't want to use piix4-specific constants. Now that the interrupt
> handing resides in piix4, its constants can be used.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

