Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E0D52069E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:26:47 +0200 (CEST)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAty-0003Wd-Pc
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAps-0000KB-GT; Mon, 09 May 2022 17:22:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noApq-0000Ne-T6; Mon, 09 May 2022 17:22:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id x18so21188910wrc.0;
 Mon, 09 May 2022 14:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tP6Mel134Zj8y+l9HaL24ydmBSCzf0R+7INfLd1V3mE=;
 b=JZouM6XRSgVkvbrjbxJi+dvphTif3Le+9R2/qQpBvqwRIMBXY9gZIeBYHRG4MmtwaY
 NPA2Hv7c4mqRfEMSEYwAidn5kAVfxZ8DD9g5n8lc3QtSlEb0AoK6PomN5cjA9KzXQ5H9
 ruQ0EuElIixBZr82vAPG6A3qemRrPJpb/iBmTYPBsrnWvDmNsVzelkFTZRAr/8h3kRHr
 cLcuPwhUsjSv0SLKl8Y/tKlIa6wwG4SdynKBQuhXtjYGKkPRoZQRbtAAnuJhLfqSjFnc
 l3yHb8E8Pvoterq/ig7djZfW68Ko/Bog0yCkaOmM6ewzz4egWmX6gqzX8gx9V+WeSBG6
 k7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tP6Mel134Zj8y+l9HaL24ydmBSCzf0R+7INfLd1V3mE=;
 b=5s0S5cIfgHBbExGySY7Kki5CBtYno8igEPX9M8ew3RXQLRq865+Q2Tb/oF8McDxh4b
 5yyyuNjAeexBV1KUxhYG+BlQCKy3ioaXV/DaPci01QzTjfQhbWnU3bOvT9yqQ08ljU33
 RN7DZ6iFAsheQZS8tlp0vmVVPHEBB7T32g7iutnmviwouPnzymNtqkpe7lYRKuIxNkf4
 R7wHkTUhdvAleI1C3/vkmc3CMBb6uX3ZdwAXXv7FGdEk9rzs1PXq7btK6P4ub9E4IMUS
 b6YATXk6gUrhDAIDryXwoiqsercX889pNda8HbOgoaCsrZ+6zBxyDOclpbx7skWc10uY
 ejvw==
X-Gm-Message-State: AOAM530ZS9RN/1nHhw+ffdgR2YBv+9yj4V3og4jlw7QJQoWoyE7b3X6E
 GzO402FQF1126C5g8QWcSeA=
X-Google-Smtp-Source: ABdhPJwmPzBUWoPY2PVMHbMp67U6UHSrivYllJqs1xuIZOcbXZDLhzejoBgU2kTLII11f8J/Oycmpw==
X-Received: by 2002:adf:ce89:0:b0:20a:d917:5234 with SMTP id
 r9-20020adfce89000000b0020ad9175234mr15996413wrn.265.1652131348941; 
 Mon, 09 May 2022 14:22:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 be5-20020a05600c1e8500b003942a244f54sm335487wmb.45.2022.05.09.14.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:22:28 -0700 (PDT)
Message-ID: <a1f41abf-4cc1-f0cd-5fa9-c882d6be4b02@amsat.org>
Date: Mon, 9 May 2022 23:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 17/17] hw/sd: Subtract bootarea size from blk
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-18-clg@kaod.org>
In-Reply-To: <20220318132824.1134400-18-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Joel,

On 18/3/22 14:28, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> The userdata size is derived from the file the user passes on the
> command line, but we must take into account the boot areas.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/sd/sd.c | 6 ++++++
>   1 file changed, 6 insertions(+)

> @@ -655,6 +656,11 @@ static void sd_reset(DeviceState *dev)
>       }
>       size = sect << 9;
>   
> +    if (sc->bootpart_offset) {
> +        unsigned int boot_capacity = sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;

What about adding a tiny helper?

static unsigned sd_boot_capacity_bytes(SDState *sd)
{
     return sd->ext_csd[EXT_CSD_BOOT_MULT] << 18;
}

> +        size -= boot_capacity * 2;
> +    }
> +
>       sect = sd_addr_to_wpnum(size) + 1;
>   
>       sd->state = sd_idle_state;


