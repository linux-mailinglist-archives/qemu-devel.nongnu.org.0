Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D34A6ADF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:28:33 +0100 (CET)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF7Fv-0004nz-Ip
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nF4IR-0004BU-Ix
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:18:55 -0500
Received: from [2607:f8b0:4864:20::82a] (port=42893
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nF4IP-0007RZ-4E
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:18:54 -0500
Received: by mail-qt1-x82a.google.com with SMTP id s1so2924946qtw.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 17:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oXJZCXpPvAUhOmNk61/LMmh7qSftq29XY9v2J/Wx2mU=;
 b=J0fdUObhD9YhfT3K8ZBK78IyFQY4hHCFtNnTGygJxaw2uCdlnu0IOxJEhLFd7N6Q7V
 orzY00ZhFh4NAEwO8GQVKSmdqZTaps5+MRsMa9g2Itff7jKLMl7sOv6QmHrXyxL28Ds3
 V08YYGVUcCGfYYX0Tp8YuOm4tnHjiR8WqNcRsT/M7bpX6E2X0zIB9MDYrELt8iHlobSi
 ogWvXGw64/oasyNARQLQ1bHyXYMsCE++A9lYGUy3eKKburUfJmG+VkNnGV4n0Z0cfRNP
 UJjQoA5TzREsI2Ao8LUABnJswcXU13KTNWWgX9YuvZ80u+ergZqfy19nf9+m/UMP5No2
 pa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oXJZCXpPvAUhOmNk61/LMmh7qSftq29XY9v2J/Wx2mU=;
 b=cmiyyjDl7YbNWh+HxauyFF+ZryBra7Mvn3qobUMwgiYzacMIambfbgfyAlWSKYpTnv
 EqhLTxK515pKAK6Euf8TGCieV61bcE0Kqi9fYSNg0pP9BNIvLnLMv/RXWptbwLomcKVW
 wvlAZBf+8cfYH5qR8QtVeQTyX32BDicjLns1UhWxzkLPVQ/PKNEPbP8QoDgdYZ6LWe2A
 hEQQ3sygP0LzZs4C5um84I/aUv+2l+qSajjunjN59RZK8EQfXfDDqzvJ4X01kWJZ1eeU
 tb6yuHENCK+bDnPafMcEOgc6kA39aNVKONybhk764dqBlUrv2Htghl2raorPf2y+t3WB
 oWMQ==
X-Gm-Message-State: AOAM531andeV/GZL1OnBUbgCGNsW1ladMKR2UHviOxrxA04OwYqRHK1g
 OOJC5oQ3PCY59FK5QiLvd+Q=
X-Google-Smtp-Source: ABdhPJyMSIHxgQHAMqWmK0t2XDNsBvZ3RZlT2wjz6DMdX7VKMJBsIVILgHJTzgLAE4kXZDpjIxtW7Q==
X-Received: by 2002:a05:622a:494:: with SMTP id
 p20mr7356567qtx.652.1643764731752; 
 Tue, 01 Feb 2022 17:18:51 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id bq33sm12479167qkb.64.2022.02.01.17.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 17:18:51 -0800 (PST)
Message-ID: <7f660c06-e966-9ff8-5b89-bec9b63e8149@amsat.org>
Date: Wed, 2 Feb 2022 02:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 12/25] docs/devel: mention our .editorconfig
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, fam@euphon.net,
 berrange@redhat.com, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
 <20220201182050.15087-13-alex.bennee@linaro.org>
In-Reply-To: <20220201182050.15087-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 1/2/22 19:20, Alex Bennée wrote:
> Ideally we should keep all our automatic formatting gubins in here.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220127150159.1489286-1-alex.bennee@linaro.org>
> ---
>   docs/devel/style.rst | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


