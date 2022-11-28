Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85DA63A2F3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:27:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZUI-0004K2-SA; Mon, 28 Nov 2022 03:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZUE-0004Hz-Fw
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:27:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZUC-0003qw-Vl
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:27:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bs21so15505760wrb.4
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bMoxpevd4f0CgRo2LWH2ZHePqKUeeHvuckwwUNSFIVo=;
 b=LkS1xbCenegawhSG+BfSkcbksc8SlGA9xFEnXYlbrXHonJWnNwyGoBxxAo3kv7ORZ8
 dD5g8/JuaFm1wvpdme0GRLLJXQZLd+crh3ISTE+S21I6rQoIshvxR4dkZhiqJ9NY+WVN
 5QhJy1Jle6BxIsnsIHy7bfUSJ7LNcXML3PSxmEobWnG92hw4NC8EkgYvCMA7oKl74nHT
 n09w+LVH1CIacbhbUwAQihRPBwqcnhNDyjqWDDR4/QCzOSwUCbWaKLeLzhPeLW4/2e+g
 z3EAa6gAEfjUL5KWTXbXLrSzECiAeuziLyhVFeA5xVt5P++wEtBaKHWZla6Jy7JbVsGN
 VlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bMoxpevd4f0CgRo2LWH2ZHePqKUeeHvuckwwUNSFIVo=;
 b=kIy9oFvA46+jgXfX8R9tOPuy6AHfOjYBR4O4xsp/B4U6s+7athudEx4pIdpl5WywYP
 q7hjjJ8gLufLDycWH4xXimXQBU+f00Vr/DMBTDXv1Ze7ubmG0yNUCAPYhO0Bn1TH88rO
 h7fDgksvF39A89bTW4wz7soO7GR5IUfviTwZj+VR4VmcrgPX5Ppp3BbV8myueTrswucM
 8Ua04HNoQXMJ6FADMrCEzp2IGHCsOa9Cr00Lqj8Sk8g4fb3x/uNoBBxa7/Ctz7F3K4E6
 PXGX0owmqWjZasbjvC/oM5Sa/XlPgGQT/Qy3UGRKO3BS4BeljT/q8aoEBnFeUrr921Ds
 I/hw==
X-Gm-Message-State: ANoB5pkcpEUbGsEsBHW1uReztFIR73qdKPG/y46i1lp3nykNfgx4dZH3
 QsOBJpJJbogKiq3ONo7TVGwGIw==
X-Google-Smtp-Source: AA0mqf4ypUZl9D8Owoq0E2+eNvd/TU/Bd8BQtEA6rWxWdyXRJaaCks+qfagQ+ILUosjgFBUTx4Skkw==
X-Received: by 2002:a05:6000:12cf:b0:236:6442:2f86 with SMTP id
 l15-20020a05600012cf00b0023664422f86mr30255938wrx.588.1669624051309; 
 Mon, 28 Nov 2022 00:27:31 -0800 (PST)
Received: from [192.168.1.175] (49.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.49]) by smtp.gmail.com with ESMTPSA id
 i9-20020adfdec9000000b00228dbf15072sm9859423wrn.62.2022.11.28.00.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 00:27:30 -0800 (PST)
Message-ID: <ed8637ba-bfa3-f019-2b22-2a15b3fa9589@linaro.org>
Date: Mon, 28 Nov 2022 09:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 03/12] pci: Move HMP commands from monitor/ to new
 hw/pci/pci-hmp-cmds.c
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128080202.2570543-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/11/22 09:01, Markus Armbruster wrote:
> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "PCI".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci/pci-hmp-cmds.c | 126 ++++++++++++++++++++++++++++++++++++++++++
>   monitor/hmp-cmds.c    | 107 -----------------------------------
>   hw/pci/meson.build    |   1 +
>   3 files changed, 127 insertions(+), 107 deletions(-)
>   create mode 100644 hw/pci/pci-hmp-cmds.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


