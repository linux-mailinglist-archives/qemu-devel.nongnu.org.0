Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155B4C4F8A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:20:40 +0100 (CET)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNh4v-0002il-TJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNh3L-0001Vl-MX
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:18:59 -0500
Received: from [2607:f8b0:4864:20::636] (port=36466
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNh3K-0000hG-2b
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:18:59 -0500
Received: by mail-pl1-x636.google.com with SMTP id e13so5728546plh.3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=wj63cDyzdjEbK42UnvqrwQrgZ028V4UuvtEWxZBbpk8=;
 b=eNDEfjQvNwKzbz9XNbqpaNoGsSjW9V/a6dBaeHE8oueWkPQjUoBhHAqzvYA/5q4Zwl
 nPAN/zlkFQj7jLZxXwIqqggyZQo+ngYV2aogrPXVC62A6L2woIVsEwIxfaNFBWoovr+E
 nR0X8/eEflmSgY6z8LxJL1BILBnnlNxtb/BjWmW8GNb14WxyvaXqIoYUUdH0W1CWqdje
 qZNr490S4Q/pH5PBlysZtkpSX7D+DRfZ7iglIfFsvzlhvWU6cZQ1GvsS/DGPtCGikNPe
 r/udxqq5v+B2v4AlbDit9xiZ9oGzdPaDJfh9hJr4ViQ9YKYtm2y9m+v842jJNpHw3Tpk
 koZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wj63cDyzdjEbK42UnvqrwQrgZ028V4UuvtEWxZBbpk8=;
 b=wKuiCzEjFOFWuvwekKisdhMJ+1Q4Y0vFycRoAdVZ1v/UfTZHfxRCn/ajjgkw2DdwY4
 Tj/HwzIM7M2OYzM4MWyMZLjvkrhvrVuPmsnjmyImZdUc4vuxh+aXSWZWxUzzxXK+SP0x
 ZwQXsZez4W6vH83cenStSELk+ripiyxlX5GDsH/JBMohr+YeAORbeK4xAOvticFFBH3e
 pPyJ7ZUiLalDHNrwHrVS5N31B7ydOSpjGe3TSHzuyYL+12BSEBsSmGA6YYCYUKtGm6ah
 J8wsZCXAFEIWYP9uGYpJ7eLXsQlvGJ0xqcXaq1DpGI4qysiNbTz97BRY/xuHuyE3eyud
 pP1w==
X-Gm-Message-State: AOAM532zhd78Tpog7QIFNuU/avII71Cdka+CN8Ki4+IzSAqH+gagHsND
 TWXCwQ9BE/tMDxfHl4kpN3fktA==
X-Google-Smtp-Source: ABdhPJykDPxyWCzcEOTftQnTtGqaceAAGeOvBkqlArUCHjYIDBn82LUVa5FP/d0SDYydu4WbPhrKQg==
X-Received: by 2002:a17:90a:ce16:b0:1bc:72d7:312a with SMTP id
 f22-20020a17090ace1600b001bc72d7312amr4789441pju.218.1645820336531; 
 Fri, 25 Feb 2022 12:18:56 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 j11-20020a17090ae60b00b001b84b44080csm3063269pjy.33.2022.02.25.12.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:18:56 -0800 (PST)
Message-ID: <084c43bd-a069-b20b-9132-fe920cb63cb8@linaro.org>
Date: Fri, 25 Feb 2022 10:18:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 08/18] scripts/ci: allow for a secondary runner
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 2/25/22 07:20, Alex Bennée wrote:
> Some HW can run multiple architecture profiles so we can install a
> secondary runner to build and run tests for those profiles. This
> allows setting up secondary service.
> 
> [AJB: this is a fairly ugly hack, I'm sure this could be expressed in
> a neater way]
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220211160309.335014-8-alex.bennee@linaro.org>
> ---
>   scripts/ci/setup/gitlab-runner.yml | 34 ++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)

Ugly, but working I suppose.  :-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

