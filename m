Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0432E689B78
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwvL-0001gE-OD; Fri, 03 Feb 2023 09:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNwvJ-0001f4-OZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:20:17 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNwvI-00035C-6g
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:20:17 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so4766960wrb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ydfTch62j6ShfUVfmjbhB5PiXRMbJpKjA2kjR0O9PnY=;
 b=sbFxaqbjoV1w6VBS9EgbdjUDjVLzpdHN6KmuyMN9zfsQM8X+xCJA87ZQ2RI3IB8GyE
 314HRIDlkewOvHDrGUsslQyuwg2D8oKe5nTR75KrNtIEyC0a+P2C8bZYFKPg64z6GzRn
 rkb4qiki6hbMnHjSD2iwA+TBBLKdjKnttsyV61Ddpf8F5TKmzDUhjWpyCvKcEpc3YqZG
 Xrjn/M2JXcElFgMFae/RnDH8CucIcycX8mXfhhrqwrpuTbRU2Cf9IV08nySLj16TkdbW
 tKwHJzd5WVlXvMu99REUollVCYDHB/jC8knypG4UUFjFuNgRl8Lkf4130VR9PiZz8CTw
 2XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ydfTch62j6ShfUVfmjbhB5PiXRMbJpKjA2kjR0O9PnY=;
 b=snfv/i3GYTI9+liD9QoGQxkd6lEOXoF7aXau/kYrVkc2y/uzxvVQrQQJVHn2UQGJKG
 iKHD6ImYzhXGXi2Z8Kfq8W0+IR6CSP7DWvcwyU+LKnQTweAb60Kg27L40IuU6JnDlhMs
 /2/dPmj7UVUfhw7B5ArKXAaMOk2kHj4yyLcvQj5cJSAYuzwmzezOvJ00ntWdbS6QjDYq
 keWDAC9OJ9qV3uycp+eV4QwEiKaKQV5yEQpo8iQO3aou2a2o1Dj6QVyuyCjWCTezO6Lo
 gqdqAbyRJQ3KlhUX4mTLHaQoKvkqjj2tw1ROFvK8HvgB0Ki4oIFiIbVRAgUzHLi0haFu
 3VJw==
X-Gm-Message-State: AO0yUKXy/0CeApqMKsfvk7kSLu2ikspAVzotfn04M6ExVERI0e+Mt9bn
 btWB2gDzH3le6mW/mfIw4PP7gA==
X-Google-Smtp-Source: AK7set/BKfSgtkQog/hbGIm6xgcMFxYHevBIWReIoGFJzN/Ch7b1TVVXRVN0W0FRqvPFerxAGb+uOw==
X-Received: by 2002:adf:fe86:0:b0:2bf:b36e:f6ac with SMTP id
 l6-20020adffe86000000b002bfb36ef6acmr8342818wrr.39.1675434014219; 
 Fri, 03 Feb 2023 06:20:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d5989000000b002bc7fcf08ddsm2250255wri.103.2023.02.03.06.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 06:20:13 -0800 (PST)
Message-ID: <70d0e6fe-c801-77a5-53d1-58837f59f86f@linaro.org>
Date: Fri, 3 Feb 2023 15:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 15/36] tcg: Add guest load/store primitives for
 TCGv_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-16-richard.henderson@linaro.org>
 <874js5u2pu.fsf@linaro.org> <ff52f5bc-9072-7db7-d5f0-e4cfee0cb527@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ff52f5bc-9072-7db7-d5f0-e4cfee0cb527@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/2/23 20:03, Richard Henderson wrote:
> On 1/31/23 23:52, Alex Bennée wrote:

>> Worth splitting the patch?

> I'm confused about what sort of split you're suggesting.

Maybe a preliminary patch with the LD/ST helpers:

  include/exec/cpu_ldst.h |  10 +++
  accel/tcg/cputlb.c      | 112 +++++++++++++++++++++++++++++++++
  accel/tcg/user-exec.c   |  66 ++++++++++++++++++++

Then the translator functions:

  include/tcg/tcg-op.h    |   2 +
  tcg/tcg-op.c            | 134 ++++++++++++++++++++++++++++++++++++++++

?

