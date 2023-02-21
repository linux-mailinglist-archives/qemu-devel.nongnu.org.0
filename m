Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BB69DB41
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUN9p-0005yC-4D; Tue, 21 Feb 2023 02:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN9n-0005x8-8W
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:33:47 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN9k-0005nl-Nf
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:33:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k14-20020a05600c1c8e00b003e22107b7ccso1824473wms.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=81FZ0aWrNO2WF8nFdL4BSyYZ3IkQyB2kdmgv2xRwN4k=;
 b=FjoVDMYkerfv6i2hla+sTyLdIJ0h915ZYwvRUxOd8oSjYqJoPbvPn2EHf7DePyItY/
 tNb9+vJgqxNXOAhtR7dyE2ctgGJkpFlaWa6gYogXO5iibtoGcbtaAeB5krDLyUFQz/8N
 tBkRtDaefP8VIeB55h2S1k3HoCGiEvoq1Bq1B69oj4+i6QmJxbm8cKh1STFqBGgXEuJ3
 zsYPPH/G8eDZOmbS5u9w67B9diSNBylCGkATc8BIM+lebTbXVk5EgPIVd4j3yedas8L4
 S09cy8hHST1m10xnyE2E46ViXk0HuNhdMBVX2Jqrln5EPm60SF4SdtHJ1zEj5RUIpCna
 UeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=81FZ0aWrNO2WF8nFdL4BSyYZ3IkQyB2kdmgv2xRwN4k=;
 b=pBnZLJkatIe4MqwWSdRzbHzYSFPOWjO0VpFapsG8nXPOtyoXwbnC5ORTtjxUAOoTHl
 0yEokZhTnLDrnrKtxjm65AqNin4U1+lHq+Es/04g6HrVkl+vJomkjU0yZIF0sh9V5DwW
 0EOxcY780r+ptCPPh+Sr+ZNWuL7ToRMZ1UPNvr/zFPYeZjj8jsH/IfN7OrJEe8TMTqXc
 6etO7R6Eyb1SCmMx4rcYlTSWpEIdhJGuP5qd3qdBfY9duH4EcU2CIC9FyVSCiAIYMgM8
 0uVoMf3Lot5rgs+l/C6fJipEmJzZ/aD/xt6t/qB1dT8of3POeeA1uF8gmY56PSsouw8v
 Vmug==
X-Gm-Message-State: AO0yUKUB9ld2npsA3qpRqiCEQItX9geL4FZTez1K2s61jJgSaVBHyYIp
 dsjE2EXyrFnu+YkwXRxYuxpIQQ==
X-Google-Smtp-Source: AK7set94cZj9BQ9d71esbwCiETgmxdn/8HQOpMGAIDwHpvhQ83jYVenbaRCVkqlS3XlTuihJr87s/g==
X-Received: by 2002:a05:600c:1da5:b0:3e2:1dac:b071 with SMTP id
 p37-20020a05600c1da500b003e21dacb071mr3229392wms.13.1676964822843; 
 Mon, 20 Feb 2023 23:33:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4742000000b002c59c6abc10sm4216518wrs.115.2023.02.20.23.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:33:42 -0800 (PST)
Message-ID: <3831cc5b-560d-1842-d49b-c0b16aeecfc0@linaro.org>
Date: Tue, 21 Feb 2023 08:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/6] configure: Add courtesy hint to Python version
 failure message
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221012456.2607692-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/2/23 02:24, John Snow wrote:
> If we begin requiring Python 3.7+, a few platforms are going to need to
> install an additional Python interpreter package.
> 
> As a courtesy to the user, suggest the optional package they might need
> to install. This will hopefully minimize any downtime caused by the
> change in Python dependency.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   configure | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



