Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD268AF90
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:39:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOdLa-0000Pt-8O; Sun, 05 Feb 2023 06:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOdLY-0000Na-0o
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:38:12 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOdLW-0005l0-Gx
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:38:11 -0500
Received: by mail-ej1-x635.google.com with SMTP id p26so26813986ejx.13
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W5th5LYZ1lCYxEfxedN2+ZiqZ/EPFH8hWVytmOGgPvg=;
 b=vK/k81nHmAm4lu9ev1GrvKpmL/JbawXQlHVBhwxY+JIKw+v/p3ImtBZOF9jrvVDf9X
 21ukvc27wFzIEO5g2xHr6W969SeWgtpMX97C7euChvo98t1rmp7DLp8Rp3DgGxiYjYHP
 JdGCIpyQsCpm+P6jLo0s9/MbMFuNrEaNGoRXnSYY6rZ8HZqx3H9IVsrgwb0j0Xg+CBba
 6ADyIa+VXPpg+JLWIkyAAWnY5BpWkd8qqnhn7mY2fSK3qGnxDqs72FxxD89zF9T+f74l
 D1RXp6HkARjxlpQRhUizpQCS5jKacqHwWkWbYwZOFeRBVUa6i/1M5jenNvdukkSt6Dt0
 iFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W5th5LYZ1lCYxEfxedN2+ZiqZ/EPFH8hWVytmOGgPvg=;
 b=s95jmPl0EG9qrZfZultvLAmMTwPgeuNgjh1i90pzkpOwVKZ85qRIXVKbP/qcWJ2OiY
 73L3KvZP6MWG2WJDJc6FILDGwo/ukSM8K826Gid9KJtq4qdHpihw6Xg6/BcOOQrrbpAM
 F/VamCoYufFc5uVN6DqusbhFDYcay4is26rerjoXqrsZ6ZCGHUI6KZffV34DcU2l1AK5
 +x7wu71ILigvIXq6IBNixoTm6itbmqxL2YHL6v/ifCf6m2qCk3fpw5zVMptLFnf/h+uD
 WyWajw1BffynNSAneYorbRdhVjzkZXyelo2YbJ1v7VpQJnFsO6Wtv37LsY4qZnPKsWNS
 WUdw==
X-Gm-Message-State: AO0yUKWxc3eNBOewnUCHMwAypcHhTPbAcAZm6uq1Djd8FciehEpL9rG9
 zTg50uckxJcN7Jn9g8StRTY3Qw==
X-Google-Smtp-Source: AK7set+AdNOHpoi9GpIYnwuAEOzgFaWmzMqRbVpvpMLa+W/yf229wLzeSt8EhKwfinPLmvYHC6HZBA==
X-Received: by 2002:a17:907:97cc:b0:887:aac3:9340 with SMTP id
 js12-20020a17090797cc00b00887aac39340mr8768002ejc.29.1675597089330; 
 Sun, 05 Feb 2023 03:38:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a170906350e00b0088b93bfa777sm4064800eja.149.2023.02.05.03.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:38:08 -0800 (PST)
Message-ID: <d68aab49-40da-f396-541b-0cd7f3dbf575@linaro.org>
Date: Sun, 5 Feb 2023 12:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] docs/system: Remove "mips" board from target-mips.rst
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu
References: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
 <20230202132138.30945-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202132138.30945-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

On 2/2/23 14:21, Jiaxun Yang wrote:
> This board had been deprecated long ago.

s/deprecated/removed/

Indeed, in commit f169413c27 ("hw/mips: Remove the 'r4k' machine").

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   docs/system/target-mips.rst | 14 --------------
>   1 file changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


