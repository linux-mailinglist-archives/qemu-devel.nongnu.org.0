Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C37F4A66DA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:10:54 +0100 (CET)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0QP-0004MH-LJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:10:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx8v-0001sY-OC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:40:37 -0500
Received: from [2607:f8b0:4864:20::d35] (port=39757
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx8r-0002cd-Px
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:40:37 -0500
Received: by mail-io1-xd35.google.com with SMTP id c188so22159274iof.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1tKtBSJ67siPqI4xzU250qNWMszlIdTiv1JBsOlZQu8=;
 b=DpQnvgLO4gdFeDcBRTyxO3hCVckTN+FcVF44moE2ItMq7zgMKJ9UzYSffnihxtDpoe
 4qtfU+1ziFLvYDvwSxYJhxT/z7SEqiwoqWCgSu69D1wU0CSOi6lALQZCxtA4vAc9WBKz
 iSDNUT66SwJO2aVzaYZ/1uvwGYQeAXerqOrCB3pBazFNRIKjV62OfjC+goWZL6b1jJjo
 2mAosF9nYikEXYyXZDzMFOyDi9TnYLcrkcqs8PXcMyVMLysPzRbV6WI/RORCdneCtvGm
 duKHRTM94ki1hprmzZ4UR+1rRT0K6CCAZelOMNentjMEiX0MQGyqCZ9K7NFpSGqRbokp
 WkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1tKtBSJ67siPqI4xzU250qNWMszlIdTiv1JBsOlZQu8=;
 b=6za96qguIclfdYEnAQyhMDZ+fcAMwOpdakKXcSjOr7PvsxaCZJ+VVP3plglf5FAof8
 vF62w7JBhj0TIk/Aws51ZWg23kPDhxMdZrh90dHY0pmPdDW991wRZ+sauBkGj7kccwnU
 X+7B1Kiu1xeckSj82Errys83AuAUfDW62fpuitbGcRyj/NYpQ/YSo0ijsoOO/s/08dj9
 bl+6QrsG7m5O/fm3miXmRyBFaILWfAdt43D5LKyp4JGmprEFzfvP1ukvWZBHtoSUqKkT
 mr2sCY8ihyFPbYfYMTAgnwHLBuKIxO3QWQA/ciTJkWjlcZvaaseLraqS8MvCcV/JmrIz
 ATwQ==
X-Gm-Message-State: AOAM532vk/LbKShn5sJVYIqzGOcAgW7LmoY0ItSnlEgU3pO1NZJjCbNC
 +SJu/0PAubtFrQ0QYbpvQ8D7ldir+5LRo6rz
X-Google-Smtp-Source: ABdhPJwR8aeo2FTN6rReiSffvdxT2j4KTEjovj5C8PuT/3f2oUhS0Rc4suezx29N/WW3BZ9dlCFZHw==
X-Received: by 2002:a05:6602:2b8b:: with SMTP id
 r11mr8898468iov.96.1643737223992; 
 Tue, 01 Feb 2022 09:40:23 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id q14sm14424381iow.1.2022.02.01.09.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:40:23 -0800 (PST)
Message-ID: <e4f4935b-f591-5062-fae2-bbdddd677d1a@linaro.org>
Date: Wed, 2 Feb 2022 04:39:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/22] bsd-user/freebsd/os-syscall.c: Add get_errno and
 host_to_target_errno
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-13-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> +/*
> + * errno conversion.
> + */
> +abi_long get_errno(abi_long ret)
> +{
> +
> +    if (ret == -1) {

Watch the extra blank lines.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

