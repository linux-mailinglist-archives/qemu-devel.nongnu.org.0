Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D824CC0CD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:08:32 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPn4B-0003Kd-Ab
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:08:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmx4-0003C1-FO
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:01:10 -0500
Received: from [2607:f8b0:4864:20::430] (port=42964
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmx2-0001Si-EF
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:01:10 -0500
Received: by mail-pf1-x430.google.com with SMTP id a5so4902086pfv.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C1tZIF0H1rUnNK2fPlLgMfrLS74uRynydeHD3ZOyfAg=;
 b=moe9JR6flF3UULVslUXNkpXwYV14nlgT5Q3f4la5cFXcKnmJxtap5233JMQmM2LVG1
 7ow0+9LGRLk7Qu58sfdtUF+AZuZWJHwfSB1ZgphulOcenvyyWsBDWcD9ZR+EA9neP5pQ
 ccENtdMSp7b9k+LZnLeofs898vSgQ89Tctby0Oy8Ff3cu1tvT7ZtlFpS0Rg8a16jolXq
 BWDoAfTXbAWKpcogWAzXK/e7JfqIGfUu0VZ/HaJmXYh/8xN0ssxwGBm7nwKQrWGBEU9v
 uSRopTDB+DUeNcdMWAigHd0/JmUGUKLbaTtN7iRJ+SDbEjJz9C2f41PRoosEK8tBbwtB
 I7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C1tZIF0H1rUnNK2fPlLgMfrLS74uRynydeHD3ZOyfAg=;
 b=erLCbJP73wOcLotuAcRIjCVikt3acSyWVTJWs/1042yapv+0DXqK78EvOGt53THBOk
 aeOYXaOE7NyL5G+PSZgaSVcY5oeUaTGeflk6IJSpvwYmVW716NLA3dC62L8bvcIySO54
 1RybP2QU0mHaMY2/o8We1ErBfUXIgilyt9A5MeyGBeDPQ8ialZEEB3lLbvCrywx8NpjN
 +xgjJ6phL7bnBen0SxqCwbaKLE/3ZEbsCEiFc2Xd3LsEPGFwHcn9HTwT2wcInhYTHNVK
 p2u9NgwoyWcHmzJQ//gdmMd6p5c7Gp9V0qf+gX292uNGvtfX1yQ2ftY61BORUUxUtHbp
 rEeQ==
X-Gm-Message-State: AOAM530GW+TG7y5fARRX1nGk/T6NfWPPfN6/fwKxhU88kPlv5MPO8w3G
 LcwmenpYwlJ8rj5x2Jh1Hs0=
X-Google-Smtp-Source: ABdhPJwLQRatHLGLebxvOpRRgbOHYXD4HwXYKqB8J0W5U932WEBkjirbOwhHrkJvGStiz4hHukjCZg==
X-Received: by 2002:a62:1d42:0:b0:4c7:f78d:6f62 with SMTP id
 d63-20020a621d42000000b004c7f78d6f62mr38108504pfd.33.1646319666960; 
 Thu, 03 Mar 2022 07:01:06 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 u19-20020a056a00159300b004e1590f88c1sm2942860pfk.220.2022.03.03.07.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 07:01:06 -0800 (PST)
Message-ID: <e5b0bc65-61a2-7805-b409-a3deb8969fe3@gmail.com>
Date: Thu, 3 Mar 2022 16:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 01/14] machine: add phase_get() and document
 phase_check()/advance()
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-2-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-2-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:06, Damien Hedde wrote:
> phase_get() returns the current phase, we'll use it in next
> commit.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/qdev-core.h | 19 +++++++++++++++++++
>   hw/core/qdev.c         |  5 +++++
>   2 files changed, 24 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

