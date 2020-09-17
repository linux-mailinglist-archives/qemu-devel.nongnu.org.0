Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8826E6A5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 22:22:23 +0200 (CEST)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJ0QA-0007hl-HQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 16:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ0Od-0007C8-2M
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 16:20:47 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ0OZ-0000kt-Fy
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 16:20:46 -0400
Received: by mail-pg1-x544.google.com with SMTP id u13so2034485pgh.1
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PUYNx8vHb54MnOyLJGyqn0cRxFPGteb6vyh23HkPHQY=;
 b=s+mMvUnM9odVW91mnKw+jZr90Jxfh7RVzIcc5oXTk1sVlJ02yd9s3jrME26rLJwvrB
 EPr6uGSYV9T6bheqGfIHNQs2+OAK8Ni2Spj0N8jv4vAvwnAQruMdkZX5Ja24xqIUlzQI
 dT1391lEMODuklQcJUZ1MxCmKPzbFuPwdJUJpsSE/JxInUU8+xuH2Rs1T0b7lCbzxEr/
 H1ddwng05C7ieN7Z4YQu/vHevPxafiug/j8p6qiWMJdTPku0O0vXPtL6GtRsA4dBwptM
 7Zf3ujh+ecR0MCqzcx89v/ZJFltW4lT8hIvWFzG1aX0hAD4XMpGBrfjGhNNh6aP+4vhE
 lSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PUYNx8vHb54MnOyLJGyqn0cRxFPGteb6vyh23HkPHQY=;
 b=sliiRTFWaaXxrzd2r5Cc+OMs+LCwDTpSZDrFvBRj/DWXsJwBWemzChVJUz5WbaydMT
 AKPcS104eC5wASWtMnFifGcIgxX3RNEg+vUqRQlaZPhhJ4La9qGlAWDdpflZPU4MwJcp
 4PJ++DT5nXM7OI9/rzcMS878JkRwyFZOSeyze3k2k4pZWhffFzhRLY+P6eHhzN+/A/aQ
 2nLKx+tSW4Sz6z34AS6TzoscotUhyC7PhQHO5kg9J7GBPq3mx3/xzWjhWWIR88subpx3
 xcN3bGpxry7LY8o0yTKnABWAatXOPqPQKI0Bd4jOl6wRQJBl5QL9tdiDodYtTQQJ9h4r
 4IHw==
X-Gm-Message-State: AOAM532mZ+Fl/fRA7SuXYOqUKIYR2aIywRRiqwaggNsMap0/Lr0YD3I8
 mr1P4Oy/WABOltgGhQC09JM1cQ==
X-Google-Smtp-Source: ABdhPJyNA2CArFBMRjDNcCHK9jpBIGF0THdqXbErLwD3TxEb+HERYvKpisI0JPU01u6s1nqe3VZ2tw==
X-Received: by 2002:a63:5006:: with SMTP id e6mr11047786pgb.338.1600374041663; 
 Thu, 17 Sep 2020 13:20:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a5sm461722pjd.57.2020.09.17.13.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 13:20:40 -0700 (PDT)
Subject: Re: [PATCH v2 04/10] disas: Clean up CPUDebug initialization
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20200914230210.2185860-1-richard.henderson@linaro.org>
 <20200914230210.2185860-5-richard.henderson@linaro.org>
 <1eb5fb1b-4341-88e9-16b1-f9db78eceadb@redhat.com> <875z8cxri5.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab340f7d-a1db-5888-97f1-1ad7ccc05d83@linaro.org>
Date: Thu, 17 Sep 2020 13:20:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <875z8cxri5.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: luoyonggang@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/20 10:06 AM, Alex Bennée wrote:
>> By the way, while you're at it, could you please also remove the form
>> feed character in this file here? ... that looks really confusing in my
>> e-mail client otherwise.

I guess, sure.

> I'm not entirely convinced that is from Richard. I've been seeing rouge
> ^L and ^M's from all sorts of normally unix clean contributors. I smell
> mailing list shenanigans.

No, form-feed is an old gnu coding style; we got this via import.  It's some
emacs next-page thing, I think.


r~

