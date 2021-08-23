Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCF3F4F8E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:35:35 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDrC-0003zj-AY
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDpG-0002CH-IO
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:33:37 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDpE-00074F-RO
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:33:34 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c17so17297975pgc.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gzQUa7DSNtLGgrDY18qGROO8fqelsPzWBS0nMn+TMmI=;
 b=TNH9sWgLTzyj0m2n+UUt01X7Dum+ZQJtpgvVzkYeBy7vmXLHbBX60EikDP62c9WVRY
 v/SomzSvFtd2VTcxt5RO85gpcbwJ6ZxAZYVOUo+kepb1NqUDs35qwi18jqWE6CCaQOSx
 BfpstCuvdz+5+ahstidqZOx+hetEvRRh585pXRDTpfM7a/EyY31+YhG+RehALDdvJWnM
 zgkD/NNMUvfa7vjSalIJsOKc31G6xXeIv87XcUV2ciZgKheMHPHwd9HsjwQ/8damxzCZ
 D0v86FAtC1AairEpHTsCDWxPtb+AD2sgH+6Mn0QvueSeKHXqoFTydtvuNxadZhQ9PjFU
 QE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzQUa7DSNtLGgrDY18qGROO8fqelsPzWBS0nMn+TMmI=;
 b=Lt6n/hbCESZtoxCkk87aN/bAu/zq3HiAdD3xAt/P+4fOJf9XHexNlmAyehGhxdA+lU
 GuTX3ddZDwHbXnCjKxUp37+c1wJ5ekCA/d+bw6TnOIxequDMJOx8Cwy+Ct5O2Mn3RZ7F
 IpCxaQw8WzMnAtlSnDmVRikpGb9RjLF8kYdkoodwhOeYG7Ix3juaiNtZW1dDVEYCBTFi
 T/zUKv91yOOgSJDCitrHKrpLfwbhFrhMwcH4Ue1Lnq2vZFCNfPIVfQ2vUaoc9PjeIMcR
 lKsT9TlF16bPV11Vwhb7wA26kcTweKzOYV3f39MAdjhbj5NK7AYw7La4NR4qXnCDZ/mE
 2fRg==
X-Gm-Message-State: AOAM530kP41mhfEABx2celGIpLcrd1+K7r0YxinnUDoUlPlrAPTPae9e
 9etbvMURRBrWHkV8fbflab8DQA==
X-Google-Smtp-Source: ABdhPJwzf3VpfEiRzlxUrvcocyoWpIg6uEF6zO6JPHxFLUxZkVzyRJAE3oxz5od5vW2RV49ubypD6Q==
X-Received: by 2002:a62:7ed0:0:b0:3e1:99bb:d824 with SMTP id
 z199-20020a627ed0000000b003e199bbd824mr34711339pfc.34.1629740011475; 
 Mon, 23 Aug 2021 10:33:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u16sm19604456pgh.53.2021.08.23.10.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:33:30 -0700 (PDT)
Subject: Re: [PATCH v3 13/15] target/riscv: Remove RVB (replaced by Zb[abcs]
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-14-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48a0f562-e6ff-d40d-ce9e-9f7d03a7dfa6@linaro.org>
Date: Mon, 23 Aug 2021 10:33:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-14-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> With everything classified as Zb[abcs] and pre-0.93 draft-B
> instructions that are not part of Zb[abcs] removed, we can remove the
> remaining support code for RVB.
> 
> Note that RVB has been retired for good and misa.B will neither mean
> 'some' or 'all of' Zb*:
>    https://lists.riscv.org/g/tech-bitmanip/message/532
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - Removing RVB moved into a separate commit at the tail-end of the series.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

