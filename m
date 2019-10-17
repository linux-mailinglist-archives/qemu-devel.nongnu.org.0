Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF7DB07F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:53:23 +0200 (CEST)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL79V-00076E-Ss
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6Xk-0001qp-J4
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6Xi-0001MX-Ix
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:14:20 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iL6Xi-0001Lv-AZ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:14:18 -0400
Received: by mail-pf1-x444.google.com with SMTP id h195so1751398pfe.5
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fHu0fqoyDawlm8tlrAY1puVj2uQC6I+LzbSxH2oIJ4E=;
 b=g0NEYuJKrdhgYLVxzLttLiLDkNp3j/3DUkfIt/qX4N6rDx3tZwv0d7h3mxxii+42i6
 Ddikd4SQr8UYE2RIggqAB81KAoDG+A30DOAWyJrhSQcPlvqxGrP9Z7q5qbO65OREanKk
 UtZd8GarDwofwElmB+rBeKWiQ2HJPJG5dGdn707ZNWfhMJa2fo4wVcIXhs6AxYgcrGrZ
 gB/naHBc5Tx5zDFPL880Zsi0ksABsaEjGt6jVll2d88G4RJxZdJsdvozpWttuJP6X+qo
 IjYSz7/u8gwChui9yO4ZjPymgtBjK3vkmHpWCQZP9U3SNv85soFa+wG2dUYSEOD4lYCt
 ZLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fHu0fqoyDawlm8tlrAY1puVj2uQC6I+LzbSxH2oIJ4E=;
 b=GfsUp9eLQh5h4jUCHgzCgDfSxPZFVPSgwu8IalXaUS/ITkO2mmSoJyQqFiSsICTRKl
 CF58bDrf4ptL4sbwz4oyMPWrlaEu9ylqkDhVtZc1ooRzxD4+oS52KYeMAuZahKpFkhyt
 cNsEZOqdrI5hTW7L0GvIJK4+EwgLYu/eXZZtIU/uX82lQXjabafMVNzqVE90KhTJVszH
 tCLQPzm2PUguR+EkjoMiATiXqvtTb1t2PNwQHkMhlFV3Qz1UdE3uuHHE2z5PfTmfJntS
 Rb0aPP1xfnCKRGRED+H4zYxxNhYkAe151pYOiKFKoROnWNgVpiISFrwqVKlvy3/KCrx4
 tTMw==
X-Gm-Message-State: APjAAAVB/xfYG83yTDCDqUWpQXyX3zUx68SGX/ECeIxs9Xs02mMpWbku
 VDOlqPm/75ncGKsuKV5G1UYs/g==
X-Google-Smtp-Source: APXvYqyft5eJYHw1xGBifYT5zF94zQgB0cNOVEVDBJJt115V9vz8l4NVS87MbIcZceavwPyvPdnizw==
X-Received: by 2002:a63:5417:: with SMTP id i23mr4490011pgb.305.1571321657067; 
 Thu, 17 Oct 2019 07:14:17 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id c8sm3065910pfi.117.2019.10.17.07.14.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:14:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/timer/xilinx_timer.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d0e9bd48-a7f0-32d9-b3bd-bcab8b2343d4@linaro.org>
Date: Thu, 17 Oct 2019 07:14:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017132122.4402-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/19 6:21 AM, Peter Maydell wrote:
> Switch the xilinx_timer code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/xilinx_timer.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

