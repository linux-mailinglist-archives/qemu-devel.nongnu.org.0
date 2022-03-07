Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2B4D083E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:20:46 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJqX-0000xm-DM
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:20:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRJpE-0007tp-F0; Mon, 07 Mar 2022 15:19:24 -0500
Received: from [2607:f8b0:4864:20::102c] (port=46016
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRJpD-0007rA-1e; Mon, 07 Mar 2022 15:19:24 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so263047pjl.4; 
 Mon, 07 Mar 2022 12:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S5e4NIMPuDjjEsNf5G9G6wKlkNj2irvtivE0fghr8Gc=;
 b=Bg8G0xqoE861PmjF4+VaszbdtSMTJJunqr9IwmX2xiOEp+224r/K+kJGha80iM9g8O
 axy4clvwrwX/b9jekpaQS0lDEELtvhOjPuPZTgd/kNjCMf8KGvae1FvUydPFMUuDX+Vl
 B+E1T9Vj/7gV+ywTx/CGQ9o+NliaZWGQ+DcUpurVTXX4ryLEg9PZRNS1PVaqdvhOB41z
 iVeSWotYyv/oURI2Ie6Clu9H6PsSirnwt4c4zeQgmlgWqpFzlgpScJ4b0DER1j2B0w1g
 u/eIS8spJK2DS+dGyb67x+TJyRZUM2LI27QNaOiqY3WymKE0q2Bj8V2IsmHWE3Umcxhg
 3c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S5e4NIMPuDjjEsNf5G9G6wKlkNj2irvtivE0fghr8Gc=;
 b=56iIpSrkN102mWDOLa6T8hSe1d4VzZDxbqRpqyausNEKnFeHFeCII9dh/6d8nHOi99
 tgy27HttSML5w414XafxyDqK5mplZmLInpP8gVbH/5N1UKnRlKSSh57CqpqztFnOvvL+
 r9K1MxPrKftYusDUDG6G6jS609aqE21sU8jeS40Qufp21xyFoyRrSfqJCkiLDPpwS23Y
 +281N7G3hL7oUW8lATvGm+eVJOzrLlNxHN69EEGjCoOcLuW3AHIfUs7RtCnuTOYD0bMc
 lp84W1LpcRi4AKXQ3hz/xYie/Ge0HcCFkwcKagdIpaz9oXJPEKdcjxnQ19A5Cnkd5gsX
 GG1g==
X-Gm-Message-State: AOAM532mP1ZAd2mH43C03kxmdO3TpjGVmT+cmzBC4VUI8Ub1/c1mrj5x
 nqvsYdvxhEcxOCrLFD+O9XM=
X-Google-Smtp-Source: ABdhPJyPUuvhY2kqwrR6b6qtCTsCYpW8iE+r6+psq9c1NtHeXfVzunAGLUw9brKqwzcuigyX1r73yA==
X-Received: by 2002:a17:902:a713:b0:151:efb5:76f with SMTP id
 w19-20020a170902a71300b00151efb5076fmr4934301plq.117.1646684361206; 
 Mon, 07 Mar 2022 12:19:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a637a07000000b0037c9268a310sm10350743pgc.3.2022.03.07.12.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 12:19:20 -0800 (PST)
Message-ID: <cf546a48-6dd4-bbfc-0293-94f84def9c45@gmail.com>
Date: Mon, 7 Mar 2022 21:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 3/9] hw/i2c: pmbus: add PEC unsupported warning
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220307200605.4001451-1-titusr@google.com>
 <20220307200605.4001451-4-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307200605.4001451-4-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
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
Cc: wuhaotsh@google.com, venture@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 21:05, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index c7ec8e5499..ff644c1d4a 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>   
>       case PMBUS_CAPABILITY:
>           pmbus_send8(pmdev, pmdev->capability);
> +        if (pmdev->capability & BIT(7)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: PEC is enabled but not yet supported.\n",
> +                          __func__);
> +        }
>           break;
>   
>       case PMBUS_VOUT_MODE:                 /* R/W byte */

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

