Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5C6BC79B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:46:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciJW-0005O5-Iz; Thu, 16 Mar 2023 03:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciJH-000593-25
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:46:03 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciJF-0006M3-AM
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:46:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id o7so633062wrg.5
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678952759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=14jW9z7PBj+9y98MCeoWCjziKnlU95QGVZXCt8bjiyw=;
 b=MZz4tflnsPma2V7QpFiIf+2wTREqe6NaWJVLgrrVe3NaLhCcfY2YC7qlY+j5UiP87T
 Jwd4rN3muV+V32YkiqEh16VIXpNtHvMSp5Kh2JAgkz9IrNOPhNq91g2ygMMpPdXnuWA4
 RPKRQ5NUSXWabc+EtvkH+NybPROZYz+DVgunoPJa3FqJlJqdM2pyDtO+2IfmT+hm20lL
 o9i9kBnezIBVIA0ZD9GYNS1UXqoMamBX+W7YmUNe/seEnimOPVrMDpWU/urgdDtfLCmu
 MYabu9hFsCpSY0MsR/9IdHoPW1tt4wKiOihlt1xvEl7R75D2M0A4gPbAf0uO85G7l0V9
 nzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678952759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=14jW9z7PBj+9y98MCeoWCjziKnlU95QGVZXCt8bjiyw=;
 b=7APu/fPNj6UHrZr7SHLcwvzmQM3glcEynNzXYwrR6h7UZ++KlwQ5VZpo/Fuq1JflL7
 C6B4Hf7c/hPcRg+3YhpQd0x1fjtEZpt2ZtOcrcUo2TLtrvhduFkJIYC8K+iPXp5RU4G7
 NVmw9zYaOHsNVDaV7OVSqXTQ+7o4WFkvu8ZbeQbkRkdgztl4dQHpull/6/UeEGcMfRoe
 hm5tPxCVEEe+B/mAumFw9REXiMyp/QrMJtr1nlLCHSZuQXJaZTcGfjWtcd5BlCeV2Ynz
 /4kSEG1Q8VQAkoM0UH+OHx4x2Y01Gy5syXIoz6MU/aG95zpWeF+asky9hSOkn0Xnm0XC
 rx+w==
X-Gm-Message-State: AO0yUKX+pTjzh3lYbWMIfd3mALUO4tUWj3LexdS/IHUzJARCir5674nd
 50nxp6LiOIveY7jbC4mYhNSPFw3tHQJ4aic5tDfeqQ==
X-Google-Smtp-Source: AK7set/zJZu2JvlpbqhHF0E02c4LT142czJoidezgCQ9d+1+JN07WlGgkR/D8nieDVAT81tdrrLSOQ==
X-Received: by 2002:adf:f209:0:b0:2d0:27dd:9c40 with SMTP id
 p9-20020adff209000000b002d027dd9c40mr3501848wro.26.1678952759728; 
 Thu, 16 Mar 2023 00:45:59 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c10-20020adfed8a000000b002cf8220cc75sm6496820wro.24.2023.03.16.00.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:45:59 -0700 (PDT)
Message-ID: <ebf2cacd-39ae-7c36-a0a1-1ec889b5deed@linaro.org>
Date: Thu, 16 Mar 2023 08:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 12/14] tests/qapi-schema: Cover optional conditional
 struct member
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-13-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316071325.492471-13-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/3/23 08:13, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/qapi-schema/qapi-schema-test.json | 3 ++-
>   tests/qapi-schema/qapi-schema-test.out  | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


