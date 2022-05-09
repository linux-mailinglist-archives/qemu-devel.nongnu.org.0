Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31A520674
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:07:52 +0200 (CEST)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAbf-0005Ea-Fn
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAZN-0003Qo-PS; Mon, 09 May 2022 17:05:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAZM-0006IC-4D; Mon, 09 May 2022 17:05:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so239417wms.3; 
 Mon, 09 May 2022 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b1tNsAaBqAqeVokbdFfhI5VA9s+unXIRvUTsQppRd/A=;
 b=jiCqxnFRJFlwurgGzbvB+673S7CGrV6A3omvbSsbaJ+4pIFbAS0m6nO/KVgMdE/0ws
 dUV006CiUcSzqROAmRayNiZFQnVFPdI1j9G0Irb/9Z+KhAkTYexr43KQ2wGJ76PCeZX7
 YJvBLE+cheyzHfojlf7OIB6247DiYPymUhByakLO8FK5y1hgOWdzdlAqn5qhwAbKicMn
 2aF2bEnaeS9BDm2BVo9U6tu/HXVOb7RjvftuZkSAVL9NXgH3/qTG7iJ+EfQBRDwmW1Ng
 glsb1WIbVORtRUaHxHrfxVHCm8TVIEEzEgJzs+3Uk6X9ZQl7N7PEtw0sDfh6CH3beVz4
 Q+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b1tNsAaBqAqeVokbdFfhI5VA9s+unXIRvUTsQppRd/A=;
 b=Ds+vFIP3mwu/2oNxbHJN5KZQO0oAUhMq+ChykGweIcoKqegxZ8fW0rJ9exS840LBUK
 rhxm2z+Shrr8G9Txdu6GXzG1XSUGERjc7FNfiVqHBnApDQhIrA8hCsJBLFEECIpBg3xP
 bZaUEBGR/fIRFqxaQUXuOJESsPT9T0w4E25f7YKOfdKGVFEoz6hYnDYnJnz43UZnCC/A
 q9ebdOPqL2SLtpVJc57SxaC19RLgon7cWYjS1f8oGP5zkYvrryax81bPzkwevl84uzl6
 Y9y8/lN+Cf+Qr8McPIfPli8u4T3W/HnKTDhYWPAUTuoUD7xNH8b9nboY3UsIfSCSnl9h
 D0vQ==
X-Gm-Message-State: AOAM532J3h6125NiDcSRcTwztGeE0annT+Bkz5hK3McDIo7Iu8TSH1vq
 cqeAH51F1AqIe/NXedxV+8zFhdruuHc=
X-Google-Smtp-Source: ABdhPJw/IkQMDc4dhyYDOJhFdz8hq1sF3qCIGOZkGtMffCAz4Jv27KHJ1tzVHfHH/y1+1h8stpSlZg==
X-Received: by 2002:a05:600c:ad1:b0:394:1585:a164 with SMTP id
 c17-20020a05600c0ad100b003941585a164mr24667390wmr.101.1652130325660; 
 Mon, 09 May 2022 14:05:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d6701000000b0020c9520a940sm13913089wru.54.2022.05.09.14.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:05:25 -0700 (PDT)
Message-ID: <12c97f3b-6d3a-cab3-3768-d41ed68e5de6@amsat.org>
Date: Mon, 9 May 2022 23:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 10/17] hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-11-clg@kaod.org>
In-Reply-To: <20220318132824.1134400-11-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

On 18/3/22 14:28, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/sd/sd.c | 28 +++++++++++++++++-----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 25e86c893bba..602ed6eb0701 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1042,6 +1042,22 @@ static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
>       }
>   }
>   
> +static sd_rsp_type_t sd_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
> +{
> +        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> +            return sd_invalid_state_for_cmd(sd, req);

There was a bug here, this should be:

                return sd_illegal;

(see 
https://lore.kernel.org/qemu-devel/20220509141320.98374-1-philippe.mathieu.daude@gmail.com/. 
I can fix upon applying).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        }
> +
> +        if (sd->state != sd_transfer_state) {
> +            return sd_invalid_state_for_cmd(sd, req);
> +        }
> +
> +        sd->state = sd_sendingdata_state;
> +        sd->data_offset = 0;
> +
> +        return sd_r1;
> +}
> +
>   static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>   {
>       uint32_t rca = 0x0000;
> @@ -1285,17 +1301,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>           }
>           break;
>   
> -    case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
> -        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> -            break;
> -        }
> -        if (sd->state == sd_transfer_state) {
> -            sd->state = sd_sendingdata_state;
> -            sd->data_offset = 0;
> -            return sd_r1;
> -        }
> -        break;
> -
>       case 23:    /* CMD23: SET_BLOCK_COUNT */
>           if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
>               break;
> @@ -2132,6 +2137,7 @@ static const SDProto sd_proto_sd = {
>           [2]         = sd_cmd_ALL_SEND_CID,
>           [3]         = sd_cmd_SEND_RELATIVE_ADDR,
>           [5]         = sd_cmd_illegal,
> +        [19]        = sd_cmd_SEND_TUNING_BLOCK,
>           [52 ... 54] = sd_cmd_illegal,
>           [58]        = sd_cmd_illegal,
>           [59]        = sd_cmd_illegal,


