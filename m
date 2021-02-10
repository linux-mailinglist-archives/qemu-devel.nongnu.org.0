Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C131695F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:46:53 +0100 (CET)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qlX-000148-OE
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9qjS-0000YM-0c
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:44:42 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9qjQ-00076F-GI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:44:41 -0500
Received: by mail-ej1-x634.google.com with SMTP id y9so4629751ejp.10
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TPYe7jLSjQSDnzDZ5r2w5LMuy+nWIlWIt5/5RNTP1fY=;
 b=DmQPLMzBfJSoc9Oi79gSmne5Sy0Ox2529U18xTJKUi6EOWXxXVfbOBXIWLJRDtZbpd
 KUPtVnip81Cf9r8EKFqW5hbtwE8YZSvkeDegam1IYqQmrxQG5KI2i2dhlg24DwytW+Q6
 q0q51kIcmTIiOm1VOijSYUGh91Q9OWK9avpavRDBnvwRsS2OE3fbKhDm5f3nNnpn/zns
 SXP2HxDtiI7c8QE7K69mbeSAbiI7laaPQ2hYrbTwSbcX8P01R0KwJ/SECFfSJ0f/lkBq
 pq651GUj/vGW8BulVC2X+KYQssDcaY0cdhDEiwPJtil8j9bzZaF4MqYdRptNkq8kYmdH
 cdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TPYe7jLSjQSDnzDZ5r2w5LMuy+nWIlWIt5/5RNTP1fY=;
 b=FT4BtZva42bSPrgwuYFp9VqXfrnVMOeaTf6kAgFTrgzKyDzr9UN4noy/Z/F2hCo6jH
 wpHnMeDhydLAmNc0JQilRWoi3PPyO6hbjcvZe2PiewejqOHmin+dn/oGaequ47dwdJC0
 VnvACu/br872IGcKpJi3SE8zOBCYlGefs/Azavoq/tPScCLhn4OfsIeRylgtvIYR6yJh
 N8lfeoTryWBqbw6H14voaLaCWfiXdMRmW+8PWPPHDyPZ28ek5ec56DUs8QqeVfOzvlOu
 nYAf/NxlPbY/oafkdJOcx5aTWwcHCJaeQNPhhigMsup23bdj1Jy+9PlGtxg1YP8qSu3C
 IQTQ==
X-Gm-Message-State: AOAM530y4z0stquOdhYrhz07Ji5Vn9rz2Ej4A1Q4OFJvnIlJ2xNlQQwN
 cjgwRq/GpU/87Cv6/7RXmDN4sE6JKxQ=
X-Google-Smtp-Source: ABdhPJy3VW5YDDwacmvXrlU7YVtUaHqm9PQXcaeAVMtSZGZqx8FtfYkYmVMTxoUe1K5s/yzT/G30Ug==
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr3331503ejv.143.1612968278131; 
 Wed, 10 Feb 2021 06:44:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kv24sm1343109ejc.117.2021.02.10.06.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 06:44:37 -0800 (PST)
Subject: Re: [PULL 0/1] tricore queue
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210210092955.124757-1-kbastian@mail.uni-paderborn.de>
 <94b43ee3-2b41-aa58-fbc9-b6cc99f766d1@amsat.org>
 <20210210121811.dpokh232b6kteo6y@schnipp-desktop>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <18ef8a11-3136-e0a8-1449-a667143520c0@amsat.org>
Date: Wed, 10 Feb 2021 15:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210121811.dpokh232b6kteo6y@schnipp-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kbastian@mail.upb.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 1:18 PM, Bastian Koppelmann wrote:
> Hi Peter,
> 
> On Wed, Feb 10, 2021 at 12:18:57PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Bastian,
>>
>> On 2/10/21 10:29 AM, Bastian Koppelmann wrote:
>>> The following changes since commit 1214d55d1c41fbab3a9973a05085b8760647e411:
>>>
>>>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-02-09 13:24:37 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20210210
>>>
>>> for you to fetch changes up to 52be63523e80bc92b8192a1e445fe499650085ac:
>>>
>>>   tricore: added triboard with tc27x_soc (2021-02-10 10:26:38 +0100)
>>>
>>> ----------------------------------------------------------------
>>> added triboard with tc27x_soc
>>
>> What about this series?
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg776774.html
> 
> The patch of this PR was in my queue for a long time so this was the first thing I did. 
> I missed Philippes series and just reviewed it now. I also saw 
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03467.html. I'll review
> that as well and then respin.

Thank you Bastian!

