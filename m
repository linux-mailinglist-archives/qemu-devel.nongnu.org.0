Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D541A5661D7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 05:29:28 +0200 (CEST)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ZFf-0000hS-Po
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 23:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZE5-0008CM-BH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:27:49 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZE3-0004Dn-Nl
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:27:48 -0400
Received: by mail-pl1-x630.google.com with SMTP id k14so9938446plh.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 20:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fo/KzOhVnyoAV4ft9RxSm/XB92EbffsTFcXxsAw9P3A=;
 b=BfLaygkigeRNFJwAn8C6+6vtpa40EEubQIxPbDx+MdyAxh6wNIpPaolXeIIV74heef
 z/gvynqh56TNCDR4NCKsefWoAaReff0bgZE+bC05ldu1TeXUiafcTOj0r0lXr9YVpU2N
 rqc/0UyO5hipPZbCBB10qnVp5foSgEfnV8icqWSaTdCiP/iN2E4IHunyFV9L1UXRQMZe
 uaY6mM0nmKwuHDr0E8ySvwlxwlLed2tZ5K8fmkjuiByVRUhStLENwrhFYraz0DgJRfwW
 60PFW7nAYg11dj9IE8vvDr2n05xiDTNOCVauuiUn3d2FqiaNYb3jDB5tyzndcFL+ZmR0
 21Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fo/KzOhVnyoAV4ft9RxSm/XB92EbffsTFcXxsAw9P3A=;
 b=YA1q0cSDHILLp88d3Q6rV1lkR/jOnSnNUOPXIKY5mjV7Ri+RG+jAYYHAIv3kLl2Hbp
 AuQ6K2EqNgCi5NqOZkBZJ9cV6zriMMa0ivwI+VKNWtIuIC5J/7dj3gVFLNkkwyalQimy
 LG0e4ChuVOmp8mGCSNcWzuARFlDq7gyxxpEqeKTLd45btSqEDbjYpXCtkOYk7qyyroPh
 WX4iWmkhcjX18Twt7eF+2Bp9bfHmW4QiHS8PjoH2D6qOY+KSg/RwrSBccwjQKlFbznfk
 Vbedjt+1kIgbmFBH72hITDDCVRzMC+ewGjnFAlCg4Uq5MBshKhp0DDn+vemn5/X2Lvd4
 eV4Q==
X-Gm-Message-State: AJIora+Yd5kbd5gASDA71ggRxomV0bLWWMA7QgBhwM7JGGolFYoin3T0
 ADHC2QZOHOBevCuhJjtUOGpiqQ==
X-Google-Smtp-Source: AGRyM1vSsnHdt+LzJE+4HetBY/SX7DGvXPo09nk+PoMjrmycT8gUrVshazvOnfwPrGTh40PZP9x7lA==
X-Received: by 2002:a17:90b:4a82:b0:1ec:bb6b:38ce with SMTP id
 lp2-20020a17090b4a8200b001ecbb6b38cemr41282469pjb.149.1656991666304; 
 Mon, 04 Jul 2022 20:27:46 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b0016be593b9e6sm2705671plc.167.2022.07.04.20.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:27:45 -0700 (PDT)
Message-ID: <35ca949b-2e33-58ab-98f6-4742f757d05e@linaro.org>
Date: Tue, 5 Jul 2022 08:57:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-38-richard.henderson@linaro.org>
 <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/4/22 17:38, Peter Maydell wrote:
> I notice the kernel has a bunch of signal frame test
> cases in  tools/testing/selftests/arm64/signal/testcases --
> do we pass those ?

Most but not all of them.  The ones we don't pass are those for which SVE state has been 
discarded across a syscall and so the signal frame record is expected to be missing.  I 
thought about fixing those, but decided not to do within this series.


r~

