Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF16068FF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:35:40 +0200 (CEST)
Received: from localhost ([::1]:55804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZGK-0006E3-Md
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:23:20 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYst-0003We-0K
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olYAm-0004D8-CD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:13:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olYAk-00034f-Kw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:13:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id bk15so35360529wrb.13
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MZ6ZSAFuC6jxEdSJUH84ly20OtOmHcZggx9nN3/50ZI=;
 b=hFlZjaAUu0DhGZH6g6OwnW8B2NZOJycf6pQFyrdUGNSiPjEFuzOQgfvYa5w4HsW4FY
 sMUwsJ1kBTx5uVycMlEc0bE51aHCFcfo9Qe6tdISwGeZpAwE+z7qqOCdsHURAVLYh2Zl
 jDORWFYNemWflIMneI8XYYXKafzFJRqIjgSV0B20vwQDvhLEVdGAw7Txkj1zJpk8K92K
 2omaP1a12em5aZjrahYucVti77n5iKQ4/QBvaqerKpjqXM1ztssthJGhpnVPakqQu9xs
 F5P0bPmAyTQ6HyPgtX1XkBpwdJ4uWT4gsCe0zzSlbfu4ILUyuPWCc4UhyvkEiZ6UEW2d
 xU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MZ6ZSAFuC6jxEdSJUH84ly20OtOmHcZggx9nN3/50ZI=;
 b=2/fuJIHlQ3WFERT5SdlkKsmLvOrxES4+ILsTGVM3FYmIbJIbFYBjR46Kr1T4L5ntXd
 7kDTukeBP2ck1Qq6fAE9Ak323+DiEDaAErVaFdWuhsM/eBAhenlKvv+y1bjHTa3GPZPC
 iItjOZtdz992HlJ/mGZnZMsyH+6WXhn3ReNwkq3p34b5Th+B6hOqIpuiHRy2ebmg+C4y
 BNjgTVlxMcW1Txhvu4s/HXnbB7JrNzClbUWw22cI/lzHvKvdYOA4Zp07geEyjFZsrvTi
 OaXuseZnwTVnxhzBSRAeQ6BaWVUBW2KUPLmg4xUijMJ/EZwOalnU5XeDejjuYB3+9PIu
 92XA==
X-Gm-Message-State: ACrzQf3+7BOJuw/j8/bdSeTLocP4huKW7dIE+wwyycY2EFCdJjQwwnM5
 /C9PowNjYOUa5EC4qI8+ZnT9Lw==
X-Google-Smtp-Source: AMsMyM6KrBoQfRUn1EE/vBBqBhYDyVIHHblOBwEo8IFdUC6bxlaCcS2pfJtjL9hsHLN+nA63oKa8hw==
X-Received: by 2002:adf:e54a:0:b0:232:caad:38f3 with SMTP id
 z10-20020adfe54a000000b00232caad38f3mr8928314wrm.108.1666282408783; 
 Thu, 20 Oct 2022 09:13:28 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 l3-20020adfe583000000b002205a5de337sm16618446wrm.102.2022.10.20.09.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 09:13:28 -0700 (PDT)
Message-ID: <bafdddfd-f299-4c3c-ea39-89570c6212cd@linaro.org>
Date: Thu, 20 Oct 2022 18:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 18/26] tests/avocado: set -machine none for userfwd and
 vnc tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-19-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/10/22 13:52, Alex Bennée wrote:
> These are exercising core QEMU features and don't actually run code.
> Not specifying a machine will fail when avocado chooses the native
> arch binary to run. Be explicit.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/info_usernet.py | 3 +++
>   tests/avocado/vnc.py          | 1 +
>   2 files changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


