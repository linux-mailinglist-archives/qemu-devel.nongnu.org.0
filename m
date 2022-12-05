Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11B642828
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 13:13:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2AKx-0001AJ-VT; Mon, 05 Dec 2022 07:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2AKu-00018h-Fs
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:12:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2AKn-0006yq-4s
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:12:34 -0500
Received: by mail-wr1-x429.google.com with SMTP id bx10so18326170wrb.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s9Nsc3rDMn3lmaN35UE/F0CqI1OwXxSJvqB6cku8uN0=;
 b=EK2zbKQzqrOtqfoCBlPcD2j5jWtg9tfw847FPoRGuMI5N5yRVeK5l9B2O2j+jtOZcr
 bfLpuvQR/FgakgCrx+2F7Gj/xTtZgo0xXpfF9KWSvNFMw0RxpFv9e5HCkIrXAcGI5e1D
 FoO/ZsnYBkig/PZM7KNLglL1hilcGtzfMsNSAmdJZJTJY1iE3FQze9eR0InUShyepIMT
 SgAALeLwgCw6d+huph6hA3nHmJCRxeTmvCv+sWCpBj7UvURwdLlA8LbBQlsZkt9jP6Wf
 21CVnqv3rVf+VTTm+/UFPSJVdvYFw6Dz8Esc24JoIbXmrZmGEVpAP0Dl60cvucrYdshf
 ROcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9Nsc3rDMn3lmaN35UE/F0CqI1OwXxSJvqB6cku8uN0=;
 b=S0NM2tSXV90khvnP1qkC7HFLL70U6QlqQ30//QGnBJQz+tFK+XX7GwbhUHudSNi81Q
 HAa36QT0e/OcZoOPyH5v7+TYO+yzaCtaGIdZShLhrUmkysIS+zY63plrw2iiDMAKTbxH
 a1FmZRcCE0vh11yCOKu8mHwb509+avnyMqK25PTZOPfX+0mw0llPZeUM7tSSuhZ3hE00
 BlVLxEuRwIrITK+3xPyWL2q2IeZSWrYRsy/7j/PnT2iIQMv/b/A9YgJz0GbRxy4jbJY7
 zv3r69iBDA98akR2aP3IkbdBViyHH5H6vgVf/elL/14c8z3hb72DaFRRRyJp65yy1+aw
 NptA==
X-Gm-Message-State: ANoB5pn29qyFHDZ3ACEwOIjAbpDhmzPkr+LiaOCVxzTmv6nsK+kIeOwo
 +k85pDu8L067x0PURr+3WZBtSA==
X-Google-Smtp-Source: AA0mqf5BrIWfAQwWDinDfxVSiVTlHUlJGLU8Pkfp5HJZ1IIPbSQ5mwWiGZ3ZcI6ADgU483fUbi/b0A==
X-Received: by 2002:a5d:4b87:0:b0:242:1d15:914f with SMTP id
 b7-20020a5d4b87000000b002421d15914fmr19700995wrt.426.1670242351212; 
 Mon, 05 Dec 2022 04:12:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b003a3442f1229sm23093570wms.29.2022.12.05.04.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 04:12:30 -0800 (PST)
Message-ID: <ea126bde-a747-7372-3d23-06f20d4f896d@linaro.org>
Date: Mon, 5 Dec 2022 13:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] memory: dump HPA and access type of ramblocks
Content-Language: en-US
To: Ted Chen <znscnchen@gmail.com>, pbonzini@redhat.com, peterx@redhat.com,
 david@redhat.com
Cc: qemu-devel@nongnu.org
References: <20221205120712.269013-1-znscnchen@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205120712.269013-1-znscnchen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 5/12/22 13:07, Ted Chen wrote:
> It's convenient to dump HVA and RW/RO status of a ramblock in "info ramblock"
> for debug purpose.
> 
> Before:
>              Offset               Used              Total
> 0x0000000000000000 0x0000000400000000 0x0000000400000000
> 
> After:
>              Offset               Used              Total                HVA  RO
> 0x0000000000000000 0x0000000400000000 0x0000000400000000 0x00007f12ebe00000  rw
> 
> Signed-off-by: Ted Chen <znscnchen@gmail.com>
> ---
>   softmmu/physmem.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


