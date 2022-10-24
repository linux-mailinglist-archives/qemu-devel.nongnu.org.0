Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D26060AF3D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:39:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyvU-0001cJ-Jj; Mon, 24 Oct 2022 10:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyvL-0001VB-Er
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:59:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyvJ-0003fv-Pv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:59:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bp11so16138768wrb.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Kec2fu7W90dbrrQg6g16owZzWk8AUr6NdSnRPZoENs=;
 b=uPR6QZUGbeY+8VtkQU2k0SV18mln5EQzyq5xCrlqPFy56DsLwortD56W6MJ85PfanQ
 B/gAjOdtk6Gh0Ge7VLmDHhTQldElxsX5xW2+ZtYcN4ITPt7uetmshri4oQfDa2oInTmY
 9IsLOkQez/eDHl94WoJk7WHJUXZjmU6YWNxj+0vyWro+xlgyVyFFt+50erPkTV70L5G/
 62jaPVsn/4Ep0peDKgXu/e/nSpetVvEeHg7FORskYUoEmQyoNfZpsok/mbKV9S0HzP6l
 7tuLoy7hhq4ziQr9JNbMtjMdNeS/HQtQLHocfaPb+ZlbWBGOHJ634ndtrp6Gc7B1wE+D
 Lr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Kec2fu7W90dbrrQg6g16owZzWk8AUr6NdSnRPZoENs=;
 b=miqfoZpfDbbQOEoF2t0KuBIaL8ZqSVJu3P6ti5EBOi+KgKNiuw8eJSgStKjmksAN6D
 +EnbQYPHeYGKAHQ+YMr/2tHsi9imWwcnLyU1RZH+jkLL8NRa6ghqw9xoY0CXrAWmYFC5
 qDAlA/pd7ogjzJBl/XLmEiVRJqAIQbp8lgme0MUrGGClvOPzaCWXkwlJPAUNc2K7FJp6
 NrhXBDQt4ZCc7tCwsehhRdqFFHZl9lqQ1LkFaM4hiqnbSQk8nZ0HuXwVDKTUOAPVIt6w
 LnMCQnCDsfGLK420HvmcbScgz3lcELTvOBtXbbsdHbucjKbAVd18f/0qUZS2t0/7u8z+
 zn+w==
X-Gm-Message-State: ACrzQf02T/ZPwoJZVe2JtS1eUFQuUYzQc1mlnfOO/TUPPoUANCULRAI7
 dvsC9nQcqeoXSraed/qFgos3ugFnhhJgMg==
X-Google-Smtp-Source: AMsMyM4L8VCBdqoX5/GFKn6hj6IjvGCkgslNOsyZuE/vg8Hy9F02Gao/IsZyw6yopwNClPHRqq38Sw==
X-Received: by 2002:adf:e992:0:b0:236:70ad:3bd9 with SMTP id
 h18-20020adfe992000000b0023670ad3bd9mr3712296wrm.136.1666623568448; 
 Mon, 24 Oct 2022 07:59:28 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 iz13-20020a05600c554d00b003b492338f45sm100885wmb.39.2022.10.24.07.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:59:28 -0700 (PDT)
Message-ID: <97ed96c4-80bf-91d9-b167-edea4fcd7c9f@linaro.org>
Date: Mon, 24 Oct 2022 16:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 08/29] target/i386: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/tcg-cpu.c   | 19 +++++++++++++++++++
>   target/i386/tcg/translate.c | 15 ---------------
>   2 files changed, 19 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


