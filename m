Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AF1DDDC3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 05:13:18 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jby7Z-00032P-0R
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 23:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jby6h-000282-TD
 for qemu-devel@nongnu.org; Thu, 21 May 2020 23:12:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jby6g-00052P-VR
 for qemu-devel@nongnu.org; Thu, 21 May 2020 23:12:23 -0400
Received: by mail-pf1-x441.google.com with SMTP id z26so4496987pfk.12
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 20:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FO7zJt7Oa9ZKEcf7ce2r35yaZIEt5trXV46z6NE6/go=;
 b=sxhAFgQtsNv101UvEOQ0cQTLtScKWvcnpjcjzdxiD8puw8GNWeJHImTHBTStkAZNg7
 P/Vbq64OKecTlVjixRTtYmy0YlmxzD8RnnPy8LbXFuqp0IQ6OXX1CKQJVMG8+fID2xRv
 ExZzvFaKZE/W0K81XdihZAiHSFkC1sjTLKu0umaW9hhum9eYLRxBgSguzSGda7tBi227
 DWOJUjsfQkxMfYL+kuNCzYcI/u/YEf2hD/3i09jBBcCatU590T3QbOSoilzazCdboqi8
 KOs5kVJhzl5NOLvczZOEEqHqxKFxtiyBAlmaL+jtoX/SfWfa5m2NxmxlSt4RkROZgB36
 QMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FO7zJt7Oa9ZKEcf7ce2r35yaZIEt5trXV46z6NE6/go=;
 b=h5B6PIhB1tganCriC3l6lrrG5xSoGY7JbTcx4+hMRzPP5tlqQ9DOll6spUZWunPGc0
 mlakrQgGWod9GjvDJxEmfqcfgQALJlMpO4s+ZHIvO9MXYjTtV3ZVF1JXGiD3kCA5TXoh
 j1j9mwEjZFsu1Fk3GAD8XyrppN+vNKYbXC5tnWmjSzF7/uuX/BNVbB0NhYAC6OSxXIdk
 c7lGXPaLZYZb+PtzlWME/rHJ6QLF6N0uwCbcTVI7Lb4kSux0nwYFqRRlDf5bDPO/BK39
 gxEKSWMr5S2pSUupcISqmGt+/v9daRHY6w99eN1DrnwdaHF2g3oc0WqnKmkPxYuIkyOB
 fnvA==
X-Gm-Message-State: AOAM532gmKBW02FaAVHytvZPnBU28W8Nkk5SlafoBkh4A/yosrkx187g
 7EWhWn2sMXefL1dA5vWzphGMHg==
X-Google-Smtp-Source: ABdhPJxVfyI9vDw9CfohQStQFd56DSABy+vCMTCZifNf8tsu5viL7Km4M+erTXp5Va/K/nbo0+PXng==
X-Received: by 2002:a62:5ac5:: with SMTP id o188mr1877307pfb.37.1590117141132; 
 Thu, 21 May 2020 20:12:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q12sm4718833pfn.129.2020.05.21.20.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 20:12:20 -0700 (PDT)
Subject: Re: [PATCH 0/2] Update use_goto_tb() in hppa and rx targets
To: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, rth@twiddle.net,
 ysato@users.sourceforge.jp
References: <20200519162144.10831-1-ahmedkhaledkaraman@gmail.com>
 <a0f3967f-e125-d888-bc6d-44414edbfd5b@linaro.org>
 <CALTWKrVGqVb1mjsaoxYm4Y1iQoXYwz7ToC7T6r2EDPp-_LO=LQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e78400c-42be-08c6-492d-dc5596551efd@linaro.org>
Date: Thu, 21 May 2020 20:12:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALTWKrVGqVb1mjsaoxYm4Y1iQoXYwz7ToC7T6r2EDPp-_LO=LQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/20 4:32 AM, Ahmed Karaman wrote:
> Does this mean that there is a bug
> in this function for the other targets?

Yes, I think so.

> That we have to do the page crossings check in both modes to avoid the
> user-mode failures that you have mentioned above?

Well, that or we need to fix linux-user/mmap.c to do all the invalidations
required.


r~


