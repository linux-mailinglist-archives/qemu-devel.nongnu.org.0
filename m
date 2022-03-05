Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C94CE54C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:35:26 +0100 (CET)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVVF-0002uU-Kw
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:35:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQVU0-000257-9K
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:34:08 -0500
Received: from [2607:f8b0:4864:20::629] (port=43805
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQVTy-0005xd-Rk
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:34:08 -0500
Received: by mail-pl1-x629.google.com with SMTP id e2so10180094pls.10
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 06:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=uuoI8bnyvL9gV/Hr+BellMxkSVDu/Fl8d5jMlTsf6Zg=;
 b=Wp/PybBnDzB/IJii+DdtFaxW2DwwjnZZ6PWxTb/YKhRYRxjkNyJWd0dpG+2unhljsJ
 26KAVgr69n2RUlDP2jvztsRet+93COExgIMrT9HM9/MoaMSRy1CJN92mizlax62BErpN
 TyCjUasUDyeDQJNSEbsIzoczIzwIFO9a/XpAD7nE1iyYz3UmmhhqXaKlTAnMijPWwZe9
 Ibao6Hi1vMfouEZs/bXn4AJBuFI7OV0TaKLh6iJqPYwz4PxEebRH4SdFx+nAiSY/s+tm
 GmuHzfHjp3fkuxeqruJNP16GoQQyHJYS+tHRXr0Od3F4JtLbITpxuiO1hmLXKN1hlSCs
 Nhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uuoI8bnyvL9gV/Hr+BellMxkSVDu/Fl8d5jMlTsf6Zg=;
 b=znJ7cX54TVydx0QYimqhqea7/tWAcNb2hK59D/AUEZ1O4VLdFfd2KgFCmWqJwWdavs
 gtW9Dl4JUqU5T/t2SlP1CFIh3t6bynB9N209N7bpqyb0z3WDUGyKVwJXKVqrayeObIP3
 bYxbXjNFTB58usdJfut00z+2o+6Vq9KjwqM9ad5nRG9A+G2m203Cslg8lFy0r+xMpc5T
 wCFNkMkIKj4BQfbmyNzSunCMa0yoZcT4nWvj+vlW+dV359aGaZV3iO7aV7wL48LKLnbV
 QYQO8w+YqD18sXC25onN6zarZu+ZqNmox5LMkm6EqA+71OkABcgUIUDx4rtptwEliH+x
 886Q==
X-Gm-Message-State: AOAM531NOhf9v41wTtG1gnINRy/3VObllOSWHlvKVcS77M0iWawzb0MX
 uySclpbQAoPCeN4bL+JtJmU=
X-Google-Smtp-Source: ABdhPJxsuYTZobix9mV78uuNIsM9o+bwCw9H/ABiPHGMbkYtMTgY1Fd4DQo5RRNbS9UH/NEQmzQocw==
X-Received: by 2002:a17:902:b602:b0:14f:e42b:d547 with SMTP id
 b2-20020a170902b60200b0014fe42bd547mr3560601pls.91.1646490845438; 
 Sat, 05 Mar 2022 06:34:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a63f34e000000b00372738b27a4sm7081179pgj.42.2022.03.05.06.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:34:05 -0800 (PST)
Message-ID: <97fe5156-d103-8af6-ab9c-cef21d7f5d18@gmail.com>
Date: Sat, 5 Mar 2022 15:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 00/12] mos6522: switch to gpios, add control line
 edge-triggering and extra debugging
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 15:10, Mark Cave-Ayland wrote:
> Here is another patchset taken from my series to enable MacOS to boot on the q800
> machine.

> v3:
> - Rebase onto master
> - Add R-B tags from Laurent

It seems you missed all my R-b...

> - Introduce MOS6522_NUM_REGS in patch 7 as suggested by Phil
> 
> v2:
> - Update patches 1-3 to use the BIT() macro
> - Add R-B tags from Peter
> - Update "info via" patch to use a target-specific HMP command as discussed on-list
> - Add patch 10 "mac_via: make SCSI_DATA (DRQ) bit live rather than latched"


