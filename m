Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1036F4A1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 05:53:40 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcKDj-0006Xl-Es
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 23:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcKCi-00065f-Ac
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:52:40 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcKCf-00005G-Q1
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:52:36 -0400
Received: by mail-pg1-x530.google.com with SMTP id t22so13321052pgu.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 20:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QDPi0FHYt1keELemfNs4XU/iLHziPuShvZVXbLfno0M=;
 b=bE7ixIiHV+s5/TFn4yry6JQCFch2H5w7/vq2NESIB9DpnhElbWIZC3sZp5XIWvdviW
 0NtKj4vWoBn3xgT8S/K9owCdvLztJq+skGjt5pIUBZS8fyqK/l4LTTJhy57X0Axrsi6p
 Ylm+9dOpMIxxJ/88GVxnJDpGPVk/TJkBWJFgOciXCRMZT5uIBHFMtNgiEkW4kBOm2K0x
 iKzyWE96E/UzFVSaVjr8GqJNfLxPaw0MZKjv84cT6947z9FbNomi9Y8Uh8TDL1pkB84f
 mkl7TNBCnNc4ioXCQhX4SmRaBf/bh2OAIY4bY0PeleQt6uoYI3Mozn/rxiwFrjv+yJt4
 5mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDPi0FHYt1keELemfNs4XU/iLHziPuShvZVXbLfno0M=;
 b=WrQcbBCvLsE0Y3YHFi56PQgjaH3QJObOizbJ39E7n9eUKi0m62dmTqZM7vvt6qod/3
 rPeU1iavRHLaMr6qx4hDjfjQ5GDzKrsxGiFwwfPn39+FSiXjdMBncw4tWYLn5b4IsNMN
 LqYtxtL2+UL6N/ZkSVtn34euYlQWh9hqIynewpwHiHgsiRtTdkFHC05YRoN2ooNI69ro
 psiUV9+Xkv7QKEWtOt+4Uv2//61Et1PB7gHGjXFmeLLTID8kN450k3WJpYbdbba4Zv9V
 NATlrnjKIOAg/CV5wak8g1v7WbKDvSZc47aPgzLHOxUsjWMg3ViViTAA3uQYNZi2FaTX
 P1SQ==
X-Gm-Message-State: AOAM533F45aJabVpiAqudA1/HWhHPouDqh+ximdmUzq9Y4jjXODcvFB0
 b8q9BL0HWth9EMrERfWVQn9BYQ==
X-Google-Smtp-Source: ABdhPJxwcv/lZS3kWE8GHFtOCBms8MeaeRl6OGxKJ2uBijqKV0VpOWMlQnUP2KcgKtVabOrKyqSirQ==
X-Received: by 2002:a63:f908:: with SMTP id h8mr2910060pgi.153.1619754752131; 
 Thu, 29 Apr 2021 20:52:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id l62sm523242pfl.88.2021.04.29.20.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 20:52:31 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] target/ttc: renamed SPR registration functions
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-7-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dae2a19a-94b8-b2ae-71d1-4b3d6698f156@linaro.org>
Date: Thu, 29 Apr 2021 20:52:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429162130.2412-7-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
> Renamed all gen_spr_* and gen_* functions specifically related to
> registering SPRs to register_*_sprs and register_*, to avoid future
> confusion with other TCG related code.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/translate_init.c.inc | 860 ++++++++++++++++----------------
>   1 file changed, 430 insertions(+), 430 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

