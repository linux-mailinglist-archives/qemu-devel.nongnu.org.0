Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4594ED7BD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:24:08 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZryJ-0006aH-3Z
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:24:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZrui-0003nK-F6
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:20:24 -0400
Received: from [2a00:1450:4864:20::433] (port=38764
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZrug-0005yk-Sc
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:20:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id i4so14233924wrb.5
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JKTTxvbM3hjmYWnhdxAdjFnYyF43XDrTqMx8zxYwNaU=;
 b=QwDptAt9X8e10S2oxq1gXvYuL3TWcjdHIrfIWLc9t8JGBtx7NyN++twCQOdvwt+yeL
 4V8mOwFsrcIMEVHR25oScWsxiOa8vwqN8CepsV9OkQxvvdPozsP1opNTECOp0NEov3zc
 A3+zZ8UI6H3lUVXM6IeXmU5mai+MqtgwwiLbOiT9Ph3hCZYsY3HkUE+ZPoskU7TbBGG0
 82hpEY4n/k8bav0dIROzj0hkj8UckxexN7FoSwKctGA1KxBMRZEDqZzXiOC8ytyB+Npr
 mhl13SyJcsduMpmXPCyZsse3CS9nwQqtfLpNOHX4IeWmd1Ujhxgx6NGp9LANm5HWlCvh
 98qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JKTTxvbM3hjmYWnhdxAdjFnYyF43XDrTqMx8zxYwNaU=;
 b=JnPB7mTwPnOfE9mXaZxvkDfgPYoCfpfMBk+H4g2KyBTmhLpI+AwSkeuOoGn+4U/AXF
 hF0xsOhit//1tHzhWXn4TZfXc/grucPLDXLn9EQPK97wYFzsnsmT2p16xf70tybVmiKj
 pzNXIGxiqS239m4+jnh113XlO2q3ZwpghIKCscsv3k+CY/MDh0Vy+jfek39Njd/I1+76
 WKJUQW5Ew9vWitbDqS4Yn9mz87sfCnZM0JOuCi/b/ndJKXcENPFdoTGEficj4rkrl5oQ
 i/eRqo50vab1mLN/MVDRJO1FGHlslojMJOv380vd0aNskbsblKkRdi02np35yDGIaYOq
 hrwg==
X-Gm-Message-State: AOAM532kyak6JSBNbAFEMQWbwsfOTwrrkgZI/EtZNqVDH8XSyxcQWQvA
 brogmlqQP/TayiGAzCWIUIk=
X-Google-Smtp-Source: ABdhPJw9w7rsDKIXTlbJwk83OZgX0ev3b8e2hRhrTvNgZ8vBXIevhuhW/fmznuR3LtZkub5XwqXUgA==
X-Received: by 2002:a5d:64eb:0:b0:205:d418:4798 with SMTP id
 g11-20020a5d64eb000000b00205d4184798mr3598676wri.11.1648722021597; 
 Thu, 31 Mar 2022 03:20:21 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:49f5:f512:3c8e:a801?
 ([2600:70ff:f07f:0:49f5:f512:3c8e:a801])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a1c4e01000000b003899c8053e1sm9360686wmh.41.2022.03.31.03.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 03:20:21 -0700 (PDT)
Message-ID: <3a7ef250-b087-a661-e998-bcf9b4328f04@gmail.com>
Date: Thu, 31 Mar 2022 12:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 2/5] machine: update machine allowed list related
 functions/fields
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220330161215.235231-1-damien.hedde@greensocs.com>
 <20220330161215.235231-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330161215.235231-3-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
> The list will now accept any device (not only sysbus devices) so
> we rename the related code and documentation.
> 
> Create some temporary inline functions with old names until
> we've udpated callsites as well.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/boards.h | 50 +++++++++++++++++++++++++++------------------
>   hw/core/machine.c   | 10 ++++-----
>   2 files changed, 35 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

