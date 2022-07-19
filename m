Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F376757950D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:13:32 +0200 (CEST)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiMG-0000gQ-4p
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiCf-0004X6-L5
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:03:37 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:43984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiCe-0003iM-6E
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:03:37 -0400
Received: by mail-qk1-x72d.google.com with SMTP id o21so10586721qkm.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LDg3OJ0ojekHcHgyufOeCWDNqKkF0J5+hs0js38p4ac=;
 b=ltkCo+9bPdXpjm4f9ulTAQZ++oFjN1nL+fWqomrWxGWZ4bH+Z77ElK1qhXSvsVkhIt
 uidQ4/qOt8q4FC6kbPK4AkoqSe5QDCQWvM8iJpnjv8G2b3QFymtFxXZ1seIKbfQ9VSdB
 bJYwIJTrU4U10D1XCkS6wajGlKU3oo6z77XDHU7Cd2xV3lobCWYXLij/8jil8PReTOVm
 eawqzkKTuOdC7fexB5HGbaftq8xGenl3R+TzdD0uIkDdMQfZ5HOX+3mEb6FG1RB2WKlw
 cUnM+Th6yodBitCvSop4L2794aEecIo1h0wuDtzI3U6yFZ1uPvTsqr3BSg9KgowYNIPj
 eAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LDg3OJ0ojekHcHgyufOeCWDNqKkF0J5+hs0js38p4ac=;
 b=0hLzETAEVGNxoCkFPebXbZTZQpwY8J0JQqx5xM6LEahO0HhZvCVMtr/dNSNpsBtLD4
 oeFFUmgyzc69RSLNA9lCbPU2OjqrWtPlZjOekiNOpZgeT4wK9I5JH8BDyJ8yhzsap68z
 RNOIxPOKwnGXDL+poWUtsetF4gGbfqY7NwoYvqlqAUFFeERt7/hWzNrLtSh1VrcqJ9/D
 IDk5VsTxHjUD1oCn2eA51n+pFHk10SEQoRH5yZWXwbt3pMvn4BoJggMDWbaj5iHmdQli
 avyHMH5UdF40opO0nnLV2j8Y32WnMpA4s4RmmhdZj1ppmZzFTcPIbbxZXy5QZvPGF2cI
 VLsQ==
X-Gm-Message-State: AJIora/o0Mw76htgmbnakUPX0PHUoaH+9QgWOSRDdijU6075T5TMP6Xa
 jOAZ9pc0/uWbqsOsHgdKw/Rk0w==
X-Google-Smtp-Source: AGRyM1sdE9pzSe0PAdd2g7HdtLwNyY+KBKybhKAfXNCWt5H5xMtan4kZYthtDQs41HKBio3wohd0MQ==
X-Received: by 2002:a05:620a:27d5:b0:6b5:e7a3:30f5 with SMTP id
 i21-20020a05620a27d500b006b5e7a330f5mr5825358qkp.595.1658217814240; 
 Tue, 19 Jul 2022 01:03:34 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a05620a2a4d00b006b5763bffebsm12804799qkp.34.2022.07.19.01.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:03:33 -0700 (PDT)
Message-ID: <0c3aa229-f6d1-3e6f-a141-c708a7d052cf@linaro.org>
Date: Tue, 19 Jul 2022 13:33:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/6] hw/loongarch: Add linux kernel booting support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-4-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712083206.4187715-4-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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

On 7/12/22 14:02, Xiaojuan Yang wrote:
> There are two situations to start system by kernel file. If exists bios
> option, system will boot from loaded bios file, else system will boot
> from hardcoded auxcode, and jump to kernel elf entry.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/loongson3.c | 114 +++++++++++++++++++++++++++++++++------
>   1 file changed, 99 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

