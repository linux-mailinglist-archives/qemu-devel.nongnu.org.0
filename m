Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D96520686
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:13:57 +0200 (CEST)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAhY-0004DZ-L5
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAgA-0002qm-Au; Mon, 09 May 2022 17:12:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAg8-0007Fj-Qs; Mon, 09 May 2022 17:12:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k2so21113184wrd.5;
 Mon, 09 May 2022 14:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=93NiOXJ/tyEmztbD8gXiIw+UQv0g8uDHs0kWwQTTw6U=;
 b=dS96qJgcb0kriTJ5gTlPp55ykr+srPlFyqV0JJyehAvgqbs8NWtMCRxIbLU7+E6IBQ
 tO4I4gB9lOCZ+h4YEGJF9nKPxNS1kOx3bjv4AAquUEuIUMMSgZjg743eKA0VEyBaOvlj
 q0IjY82ae1bwZBTCtdcVnsa3Lg3/hIpGhZerc04YEJg1Mt4/FxiBnkl8iUwuahZVRgG6
 QwNsAmxWoQIA70Cz9sb2cO1aFrVW0XQC5oJtilmXerOAa1JlyZTTUXui8TKVCRRKy7WP
 Najs2cqwq9rE/Udmk31D1Bbp6ap57nt5BuXlJ7Lh+3KkGLx9NuwruFdP5KcQQyGjoalO
 lb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=93NiOXJ/tyEmztbD8gXiIw+UQv0g8uDHs0kWwQTTw6U=;
 b=cSnltPDViN7TtbQzzNWRjqJE9lof3CA9RFpv2WZLzBTtq6o3HkobggyNHHzyCACkMl
 5NF4p1hfPMYtIMDhpYe3RharnWkq5O6rF6GK6sO63Rju9YdNYzEeP5yNKWyaUSOwc9jG
 sZDVE9/m8tEktUiG4HvxZILNOtHuQmaO+leFKQweP3j8CK7fIGbP5Q4W0liYkK1jUmZw
 MQzJ3ink22LOyOa/o+nmXCa2gDUIsEW5U/s35rChA9nEp+qKmsjCCsiSSLZJtWoVd4VD
 xNBdmnGgs4kAN+8dbK5VEVaXY9KWNTS/wdvJDiwvish7xUFqF9tBY+MmH91RxAMUSe6b
 Brlw==
X-Gm-Message-State: AOAM5335hQjB5ACwGUqqbIfrMJXxrhFhw1cnOa6HVlo9BDHuZR+WY7ic
 8C/RkwHbEAqDZZm6O0tVW+E=
X-Google-Smtp-Source: ABdhPJzwpm3VxfM+RaQFIbAB0/cYdc+nbX9WSSiKoA18tow6nMtx3PpyJYaJhHxk2DJ2il9ogsCCGQ==
X-Received: by 2002:a5d:4344:0:b0:20c:9156:8ec with SMTP id
 u4-20020a5d4344000000b0020c915608ecmr16020834wrr.71.1652130746801; 
 Mon, 09 May 2022 14:12:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a5d618f000000b0020c5253d8ffsm11975784wru.75.2022.05.09.14.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:12:26 -0700 (PDT)
Message-ID: <c3a65543-e50c-c927-842a-9634f4d562fa@amsat.org>
Date: Mon, 9 May 2022 23:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 07/17] hw/sd: Add sd_cmd_SEND_OP_CMD() handler
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-8-clg@kaod.org>
In-Reply-To: <20220318132824.1134400-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210624142209.1193073-9-f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/sd/sd.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

> @@ -2111,6 +2109,7 @@ static const SDProto sd_proto_spi = {
>       .name = "SPI",
>       .cmd = {
>           [0]         = sd_cmd_GO_IDLE_STATE,
> +        [1]         = sd_cmd_SEND_OP_CMD,
>           [2 ... 4]   = sd_cmd_illegal,
>           [5]         = sd_cmd_illegal,
>           [7]         = sd_cmd_illegal,
> @@ -2120,6 +2119,7 @@ static const SDProto sd_proto_spi = {
>       },
>       .cmd = {
>           [6]         = sd_cmd_unimplemented,
> +        [41]        = sd_cmd_SEND_OP_CMD,
>       },
>   };
>   

I missed adding the cmd_abbrev[1] entry.

