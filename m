Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462954A7DF2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:33:33 +0100 (CET)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRwB-0003Ss-Qf
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:33:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFRtQ-0000Jy-7s
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:30:40 -0500
Received: from [2607:f8b0:4864:20::102a] (port=54826
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFRtN-0001S0-UB
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:30:39 -0500
Received: by mail-pj1-x102a.google.com with SMTP id r59so1098828pjg.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 18:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5k8P8ft/590WBkAcO00R9atoa7PNz54SNNRz1Z9B4Xs=;
 b=HgAerBQ312V83+cp0V5A6+6QJIciYPdimk9xaUOaYEKJ6TH6JLkzzf7u0JyO1EQT2T
 0yDJ7aX+ht8/gOgtHL6+AtEOfU7UjXP509fPaj+f+hi/jAitE+FKPsUvsIGQhK1Hl7PB
 1lw9khnGrD5kXJcku/0HnbeMsVEUz+TPJW2aJ0XTiSJ56Bn681fHDUJ24sdTIBsAxOBi
 mrU5CNOfIAabPGmZl28lcEuKuHs9jbMDLJiwd63kRSQ1GZLbxFI74aqdiRxoVMfNY5If
 YALtelEZWJOP0W/PfnUiw1hWkGorADBpbSBbW15XONx323RfKQb6Y3mWCd+rpSggWuY7
 7aCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5k8P8ft/590WBkAcO00R9atoa7PNz54SNNRz1Z9B4Xs=;
 b=YM5QJLMPMbiKJMh/rRIPsgiv6mb6W4SauB04SVqc4/tGJNI7fNgAfhkSOHNAPYl8wC
 QkwbKNQKpHDo5ZuZsLJTGANU298WZkl6AFgx84cpBD3wI+j5HVhOong1NEh402OBAFjS
 F1QcVDKlgK9i81YVaeKqqzlW19tMMvXYfmUGfN84GfnXrMNbGGuMiqx2uNUlgdkazWiB
 ABdd4PMypb7tYjIft9JNDZ1IUvcg5BBFi5HQZmtAG8asBQJYlmb7ZLh0c1raaN8ZkRkK
 sv/rCATzJlM6OAQ0muq8tcCMVGoN41lNTRlohO+ianQsXd/I32kS6Xbhs8NWSY/uAKRe
 laCQ==
X-Gm-Message-State: AOAM532RJqYSeiAb0xIk4e0L6CPydRFDmI+Z1FU95xuIru7HIvBo4ZUq
 1qMKZxFQQNMNF0qusYMNgL7gSw==
X-Google-Smtp-Source: ABdhPJyKpLZegb3QGxG1vWX/v9eahSYNlnueCljGDVKYHoFDUOE6mnX5kmPHTlB4fEg4ESxNK6qwLg==
X-Received: by 2002:a17:902:e8c9:: with SMTP id
 v9mr33621128plg.171.1643855434068; 
 Wed, 02 Feb 2022 18:30:34 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id mn2sm7504523pjb.38.2022.02.02.18.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 18:30:33 -0800 (PST)
Message-ID: <e9e11a61-131e-4360-e760-4175d75cd27b@linaro.org>
Date: Thu, 3 Feb 2022 13:30:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/13] hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:31, Peter Maydell wrote:
> Make update_dte() take a DTEntry struct rather than all the fields of
> the new DTE as separate arguments.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 35 ++++++++++++++++++-----------------
>   1 file changed, 18 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

