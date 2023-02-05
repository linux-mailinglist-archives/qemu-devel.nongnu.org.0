Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1872A68AF5F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcSE-0002tU-Tc; Sun, 05 Feb 2023 05:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcSD-0002tI-6s
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:41:01 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcSB-0002JP-IC
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:41:00 -0500
Received: by mail-ej1-x632.google.com with SMTP id me3so26693984ejb.7
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUA3I1PRPBWEuyvkFGwwg5Sov4VJcmE6olL824oYnNc=;
 b=zfX/MFT3HSbVweiM8k7P6cHoMk6eYSGINoedTB9CHaUtv/6PAK9XvniOut/DjfD9cw
 Y68oP+ypuBLQB0BhLx7Z1FshLoVWST8FXqavc4gQ/g/y7RJuzi1uOudb9ymt/9XQJlj4
 TXvGF26O+bJGXBJV3tzbwyURxoKyGjFCeikZaa0ZpNEhQBextGRUYsZXVDebmplhJf4/
 lxIpUnChfB+u8HGVHzsITV2ooosG4nTrVaUHrUnaJY8Lc9TF5NHqsYS3eUPixIEmf6ya
 FsJDHSMEFN6Y76KWisG8ydL+ef7/LqNItyGVmP9XahLK4iM32B97gDU9a0rvfuIEtCR4
 BhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fUA3I1PRPBWEuyvkFGwwg5Sov4VJcmE6olL824oYnNc=;
 b=ua0MYXvH/Eo1eUULusYqwxMaqZEQq4cOcFzXsaIwgFhwIb8zMHR0BIb2Qs9AhV1WkP
 FHLhmPVyscok9lyH3BK7Gp+F/CTWreMIyIZJE9k0GV8//dYJta5e5fR+1gx0uRNdVrgW
 IJ4+vmnS3S8KXgK8U1C7xyvpBXdnLPBDNK9cCocLNnku+K0CtuLDY9s68kL9/Gdzg5CT
 eIu3ie4Z26o2QigSrm+crmXsG1s1uFy2Js8T+aSDF8AjFk8QxLN6jEbtUrEFJtE1XyK8
 +ApobhSm7PxdsTqahHZnb9jOz8wFM7ch9S9LvMiULTNYt7hEtdh59B2sjULpx57HaPvN
 mr3g==
X-Gm-Message-State: AO0yUKUfUS/Zbm3EhvMSRTQMWPPKMwdXG/dZjJe5xALrZuIS3mUnDag2
 DVIxtYLOGnMaVZT2N+lap4B0wQ==
X-Google-Smtp-Source: AK7set+BgyFn1gqxW6gyqwfUdBkS4xyTvKU8WYLZzIeMQPn5VlzK2A0jBmB/b80AbyyHImLa1JnjBQ==
X-Received: by 2002:a17:906:c0c3:b0:883:3c7d:944e with SMTP id
 bn3-20020a170906c0c300b008833c7d944emr15781500ejb.9.1675593658073; 
 Sun, 05 Feb 2023 02:40:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 la3-20020a170906ad8300b0084d381d0528sm3958542ejb.180.2023.02.05.02.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 02:40:57 -0800 (PST)
Message-ID: <077b9581-5b16-13c8-f134-e7e190f75206@linaro.org>
Date: Sun, 5 Feb 2023 11:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 01/10] hw/sparse-mem: clear memory on reset
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-2-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230205042951.3570008-2-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

On 5/2/23 05:29, Alexander Bulekov wrote:
> We use sparse-mem for fuzzing. For long-running fuzzing processes, we
> eventually end up with many allocated sparse-mem pages. To avoid this,
> clear the allocated pages on system-reset.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/mem/sparse-mem.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


