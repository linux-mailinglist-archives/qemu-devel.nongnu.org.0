Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737F4CE137
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 00:53:44 +0100 (CET)
Received: from localhost ([::1]:54674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQHjz-0001cx-19
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 18:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHiq-0000kY-BR; Fri, 04 Mar 2022 18:52:32 -0500
Received: from [2607:f8b0:4864:20::62c] (port=45802
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHio-0000RF-UL; Fri, 04 Mar 2022 18:52:31 -0500
Received: by mail-pl1-x62c.google.com with SMTP id s1so9077884plg.12;
 Fri, 04 Mar 2022 15:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KhJf++smB1V8NQssT4pZZQfcG1ZDHuXc1GVhlQ4sx7k=;
 b=kPYyw7Yvrr+q5Z6EmmhcxrT5eK84RwWjZwx6/LOWCcAH0hyOIB9QXiJ9l8GdboVASE
 yC08Jh4OOVKk7npjvbTXvSGCl6gdJ/myTiEhonIIPH5WcGPwyclHsooAY2ekRZM6r9bg
 JrNNPrRzX+RSqUWLZmzf0INoaxerTt5U7BTZ4HE7naAAWeB/oLzGaQVbjJn+UNvUHPta
 HYhJ0KLQLq8EjjTkQosvjkbTZi4Qxts8+c9S1J/U7WWhiJCcxBhkDwcdg+NI8O7UXNW1
 p0sHMwzCiIohpq4ZSl28PPoElEiufsjrWH/MGgZcs2V95kWjh/IPDuNCWuQc/iM0nTR5
 bRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KhJf++smB1V8NQssT4pZZQfcG1ZDHuXc1GVhlQ4sx7k=;
 b=SUYN4TNyD3n2+WUTo5wRy5YYWWVZ2vIYHJBXGN14G1NsGledxFEQ/CIKQ4klqOmDWL
 oONkmn6qH3GqrE6QrA4RY6R+CWsiA95JEDt5GATTJOXXk1+PgchDGfy9WYUSY/FsZsXw
 9vwJujkBpLbbQksA/VHb4H8TVUoU5AUN5moLFUDzmfU3qO9ax3HVs41rIQjebFbnhmWw
 gU5VYS3qo60EWgDoWNlkeyGkq38zxwmCJMzxlY67gzhbCDOc3kye5oV+wEVlJbdv/DrO
 b9wI2GwKWm/QT3zQLU1X6KVijVPomqS4wdHUmUnHcY5xXSyk7hdgi7GsjIE9xnZJsCIR
 UtnQ==
X-Gm-Message-State: AOAM5334fpoLTYHdgvcwKxjP5V98iRyp6seEZaoTRHN6Gzj7gTMEes89
 4wMIHVRZBLGqRccMS2dyMEU=
X-Google-Smtp-Source: ABdhPJybvXTMGGc4wVXH9kfjz9xaOIxuudTc+7fPmvg/Zyw8sjdNAzEQTQECulEUyleJlWS4hM2S4Q==
X-Received: by 2002:a17:90b:350c:b0:1bf:1dc5:1c3d with SMTP id
 ls12-20020a17090b350c00b001bf1dc51c3dmr8366446pjb.53.1646437949077; 
 Fri, 04 Mar 2022 15:52:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 rm8-20020a17090b3ec800b001bcd57956desm5488198pjb.51.2022.03.04.15.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 15:52:28 -0800 (PST)
Message-ID: <6a47e93b-66e6-66b4-b980-8c2447a49429@gmail.com>
Date: Sat, 5 Mar 2022 00:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 5/9] hw/i2c: pmbus: update MAINTAINERS
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-6-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-6-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 02:50, Titus Rwantare wrote:
> add self to MAINTAINERS for the PMBus subsystem and related sensors,
> and set PMBus as maintained.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


