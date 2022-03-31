Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D044ED7C4
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:31:08 +0200 (CEST)
Received: from localhost ([::1]:36398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZs55-0002Hc-Mb
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:31:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZrwJ-0005fb-Dd
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:22:03 -0400
Received: from [2a00:1450:4864:20::429] (port=42731
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZrwH-0006bH-Ry
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:22:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id r13so33037506wrr.9
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yPdrt0D2Tu35DI1At3oHY8Pwrr0qG3TgR8pPowsQnMM=;
 b=oJGeq7/UNz4hMYOwhrstifXqnWYiT7Dnj8Wug84hGicjKF2tzcOhEUSLnsGhEBvEVw
 VtdoayhS0WJHq39POiouCHAGCW8hf6+it4rhZ9U8i0M3YaNKk7LL7RgUT5Z6EWjBC+BM
 9W6ag+2/wfH+2WHP1CKktdqobaKJ6E0+7Cti4NYRiNDe7LEbX9g8D3bxyja4v5Ja/kzu
 IuTPQ+ky0k7RVMQuOzezQXjPgtRDWqBVDDssHA8g5g3uzzAxp9DOQIPvihxH0qmKEIyA
 plJuS0YEBWuFamahRKagee0nTOUtG2Q/yNFbnBy4Xb59bP1estXNzjMaUHPuZdyz3wMi
 r1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yPdrt0D2Tu35DI1At3oHY8Pwrr0qG3TgR8pPowsQnMM=;
 b=S0tZEH84de7rl2VJwWb7sLFNdGOFUtqZ/aMHTGJoHT5Ru5gJ0E/Kzs6scfPVvU7FRo
 c+ResKTEE8FgEPdlvj27Oao4WXPioONpP/fh0Lg5Nx7jYycMKocZpHnWW6o72khSgWsy
 SyFZED0vmAyrsH+v1psH50zYZ53CNrwVB5nhN2+0g1FA0Gj1MeZHK1D7ubz6Hks4Cd40
 R34MVFU3br9Ju3pmgpN/AUVrG+QJFd9ZcXwofgQ7osc27SKU0dWWZzR/+N6bRFh8+iX0
 S23W50SA0CeFELlfgdXDcVrHYPgBVojEHqhJ/zp5o/USRyQ4lBJyY5TF6c1HgKxkiw4O
 afuA==
X-Gm-Message-State: AOAM5321PontEsIdpRIyXHvMvc6PwoWjiI/461XMZi8pcIHTEF7BTz+8
 DpbDAWqvA1i7KCy2IEwP13k=
X-Google-Smtp-Source: ABdhPJzNYhzij1crKrVJ3oY0sBUHFEIg+z364VpRQPguINfLFIAfAStBauWldEqOF0k2qTupOtW/4g==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
 p1-20020adf9581000000b001edc3414ed1mr3435327wrp.299.1648722120316; 
 Thu, 31 Mar 2022 03:22:00 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:49f5:f512:3c8e:a801?
 ([2600:70ff:f07f:0:49f5:f512:3c8e:a801])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adffc06000000b00203f2828075sm19420060wrr.19.2022.03.31.03.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 03:21:59 -0700 (PDT)
Message-ID: <bdaeed93-34dc-673f-426a-89845ddf4992@gmail.com>
Date: Thu, 31 Mar 2022 12:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] qdev: add uc_requires_machine_allowance flag
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220330161215.235231-1-damien.hedde@greensocs.com>
 <20220330161215.235231-2-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330161215.235231-2-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/3/22 18:12, Damien Hedde wrote:
> This flag will be used in device_add to check if
> the device needs special allowance from the machine
> model.
> 
> It will replace the current check based only on the
> device being a TYPE_SYB_BUS_DEVICE.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/qdev-core.h | 6 ++++++
>   hw/core/qdev.c         | 1 +
>   hw/core/sysbus.c       | 1 +
>   3 files changed, 8 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..f5a05ced39 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -123,6 +123,12 @@ struct DeviceClass {
>        */
>       bool user_creatable;
>       bool hotpluggable;
> +    /*
> +     * Some devices (eg: sysbus devices) are only user-creatable if
> +     * the machine allowed it. user_creatable need still to be set to
> +     * true, this is an additional constraint.
> +     */
> +    bool uc_requires_machine_allowance;

Why not name it user_creatable_requires_machine_allowance? Also I'd put
it just after user_creatable.

