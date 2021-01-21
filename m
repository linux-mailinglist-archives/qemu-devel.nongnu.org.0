Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E12FF513
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:50:49 +0100 (CET)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fyi-00051J-QS
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2ftn-00016o-KQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:45:43 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fta-0005DS-Of
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:45:43 -0500
Received: by mail-pl1-x630.google.com with SMTP id x18so1880004pln.6
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/wVvb+vl1snSEt1cjoeyE9ib1fzpNNMF8MXyH3aqnxw=;
 b=EGfjBRU8YlUB69QBsR+S1WxJ4sqcpwWu2oSCPYpMg10O0ch/wQKDhhvWOsD6by8BV4
 TP6sYGe+VMduU5R5F6b42WK8Ee4xrpmU115CNLGvSkwy/FvIzxqLqlOoTKEp15U3jRRG
 PZLA5cEeqJnAr284VUUtBB8kW1BtJ0RpSrrDo1G4wOA2A9edIFx6jLgxCc8jtgp8CF4M
 NxtoDzibUc8StCtOulI1vyE20X2/R977h6rieWSEYphj+FcJF/Kp5Ph2Xiqc7VXhyHnv
 Eu/3y/T85LbojYyvVaSnZ++jTvFO0tUzhwwlK7xgZw3OeXKWiy+sJE8jAdJDRNVu8Bir
 hnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/wVvb+vl1snSEt1cjoeyE9ib1fzpNNMF8MXyH3aqnxw=;
 b=AMojBLTC2dRRqo+RZ4EgV3rOQYciVyliSGdBqqtTbbQTbNOnKlzG2P+lqB6OqCvU5v
 PVGZhLzcpT05e61XMpqEqEqKupv5RFGFmPJ5nIkV/et0yRD/jzinLPlg5kEIveDDdIWk
 ECHCCTeKrn0uzr/Oq+KaM+XUv1T1ILOAlbHcy5o43bty32DarnkzsjqFwU7yVFc1tW/e
 3NNBcwKz9fAd1E3mcMg6RAkBbfhQDs444BZ8A/jBtYXVygIZprvDtg+D7so7mRY3Mfv5
 0zyulV6K01TU3M6Ie6851UxQhRDnPoo8pp37LgrRL/ij75LJKINhf2HebC8ionoIeYga
 OmRA==
X-Gm-Message-State: AOAM533md3JpmggVqTlg35/BG+8wTZVH2GaD91G1hw8YLIS4paS/b7XD
 tZgA1webmiFAyKSMSD0f+IPJNQ==
X-Google-Smtp-Source: ABdhPJwUNfzZxLhWkK2f16hDi2APFjBav3bZ+ktUwS7cYeM8Kv8OLeK+M0RlUrevMB51IFgCRadVTQ==
X-Received: by 2002:a17:90a:8814:: with SMTP id
 s20mr1108990pjn.69.1611258325867; 
 Thu, 21 Jan 2021 11:45:25 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id y22sm6439911pfr.163.2021.01.21.11.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:45:25 -0800 (PST)
Subject: Re: [PATCH v7 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
To: Alexey Baturo <baturo.alexey@gmail.com>
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-7-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <541512ca-4055-b761-f032-10ef1b3a3c11@linaro.org>
Date: Thu, 21 Jan 2021 09:45:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110185109.29841-7-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 space.monkey.delivers@gmail.com, Alistair.Francis@wdc.com,
 kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/21 8:51 AM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

