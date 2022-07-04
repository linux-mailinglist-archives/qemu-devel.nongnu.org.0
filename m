Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49EE564CF1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:32:38 +0200 (CEST)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EhK-0002PZ-2T
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Ed6-000126-Hs
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:28:16 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Ed5-0002vO-12
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:28:16 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f85so4158222pfa.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kjk1Y8DBwgLZXJs6KhzrVzILc5F2VQUnMW1oXSt0H9k=;
 b=xvJ4/P2mv2FHxdEQZRXjqVqYaHjjZOzGgl1F54jyQmIp+hgB/PddOK1L0WQIS13E6D
 sqvJD+Khoh31O2qo32VHX9kKfbhBcIjvpKLTRWSi1ZdlYu73SVPEGdrjk9DEFqF2wVO8
 2hCKM5v+GlHwKJ/gN+xmng3qroqeZEXTgwuo68Z2FGNRlLsvIC5W6ySvqwETn46wSrXO
 lfPysr4qSFyd5LsuFnzqQPNug1wD83Ig1ScyEpLD34Wu7r4iFL1Zuvo/UAMs3rzX2lxC
 q/z2hMAcMaDW2cU5Bkzh7yEZzEjSTLBQJdnibZq6wMVjqE+RgTh5h3Dn9hKR8SrKvIcU
 dgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kjk1Y8DBwgLZXJs6KhzrVzILc5F2VQUnMW1oXSt0H9k=;
 b=MoAvzXxOCwtKa1cW35QavhzNdrJqyLuxE6Cuo91+N6iW33nRPXy8lZCyaCSxOR/XN3
 6jq98+z2TOVhASKG9XzWdzyFG2/ok7YL6i1Qqgg+O8QCRL35UF5fBmZU2OCCO40cMGTw
 zM3B+LEcMt67muEL3OTZfZCYSk+RmT0UCBuU50a1hH2ZU4URv/b5c50SDQK8C4Ptvhy6
 ia0eW9yyiQa04SQjCZ4m9bn3Fi9FL5qhl8evFvgqwhN/nqBXbhZlFSHzOUSIzMIJF30J
 wfQfM+ULBV2KltfaOpB6Yg3UwOwTJWFdsoLkdKLWBAiT/dZTWZaNO+IY+sYgiWRiP5gl
 dKEw==
X-Gm-Message-State: AJIora8xyffJWR34xTxguU4itEbKb/U0A5WU2lF2r8XjEkbMz6DWZc7/
 5VrvhOumi5Poxm3R/SOyMjUYyg==
X-Google-Smtp-Source: AGRyM1tLkTISDvDv6xKdXleuYG9Zqrad2BVCvzAIxjgW54WZaSuJD3TS9wvNRFw2bdlWoDMUr/ofkA==
X-Received: by 2002:a63:548:0:b0:412:1de7:89e0 with SMTP id
 69-20020a630548000000b004121de789e0mr7817701pgf.373.1656912493524; 
 Sun, 03 Jul 2022 22:28:13 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm1687968plh.205.2022.07.03.22.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:28:13 -0700 (PDT)
Message-ID: <f67efcc1-e261-1701-5cfe-92cf1f908fd6@linaro.org>
Date: Mon, 4 Jul 2022 10:58:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 10/11] hw/intc/loongarch_ipi: Fix ipi device access of
 64bits
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-11-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-11-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/1/22 15:04, Xiaojuan Yang wrote:
> +static const MemoryRegionOps loongarch_ipi64_ops = {
> +    .write = loongarch_ipi_writeq,
> +    .impl.min_access_size = 8,
> +    .impl.max_access_size = 8,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 8,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};

Is it really valid to write 4 bytes instead of 8?


r~

