Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCD5390029
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:41:19 +0200 (CEST)
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVQu-0003Dh-T7
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llVPb-0002WY-Bl
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:39:51 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llVPZ-0003xW-Tw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:39:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id n2so31966698wrm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qS0ENB19bGsOKYOcBG1Yg58t5j1Vuj82yPyIix5unqI=;
 b=oBwxHZha0K8NhSm691tWFY/scs+p4OW6LIXI8VT53R/7y5At01lgZYu7PvUJLOHtg9
 YWhEZmiswEVido+xGixvRH9cb4LX4gaxGGuVb3f4pbezm8HHMZYCe2nuMq2MBRyPlZY+
 8GFGqXVLs1J6X4ThR3O6q4x5oQubcUaB2GfU209UImVAmDcDJcYxdiqv554b01Hu9g8P
 7DgHFYhfAoyVgdosRWr8Wumk3bAEHH3nJ2YC6wmRIZT3ZUincFpVUhUn0urxbgrtftNU
 rI1Pz9vpFNMxkVLMgidWceHlPuMIRt+tsQAWgvQ7VdAUpt/YxDi1H+0jZrCHKkZ133Tv
 1SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qS0ENB19bGsOKYOcBG1Yg58t5j1Vuj82yPyIix5unqI=;
 b=YMnWDy9axKBwzUukJI+sXIk9VC4HZUtQNqa6zTSzh3Ew0sKdaVqBMAUxvgJVFlah8v
 amBmqiUyu8Rv0mljL5Y6q7gExnVYD7wQ+rMYJ4LgpvJ4++gZ1NKCXZ1L2tCUEIR2+LCg
 8oc7kN5eFQR1mmOVga2POe4dX7YhHNDtL1hIYb1BdqFYe9BJkYR/1+/AAG9dusDt9AAZ
 yWDgdOEF5dbukjQYaSBsfTcDd8qr8JKh/I/ovxEJolhc25F6NLS2I1ApVuvMnGqGu5ca
 m0A2ri6N7Zb3rTPrvinb9tMXs+dlB/ZSC4NyH7/dpWjdsq+0zQ2rT8gvRK+Wh371tEJX
 uPtA==
X-Gm-Message-State: AOAM531TuDiKLSwQpmFvxDPIoNsqa0X+KK+RjLA0x+Pdg2TGcxRoRnQk
 aoeGs0Sr/eKAE1fGyN/t8L0=
X-Google-Smtp-Source: ABdhPJzNxDOA6Df8MrgvBkY1p7jbPIjUJz0tnSBOgsHCEliblC+Eg8AcPDmW5CSpfOCHZPJMxO8ekg==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr11775244wro.162.1621942788517; 
 Tue, 25 May 2021 04:39:48 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d3sm15713284wrs.41.2021.05.25.04.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 04:39:47 -0700 (PDT)
Subject: Re: [PATCH 5/9] gitlab-ci: explicitly reference the upstream registry
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-6-f4bug@amsat.org> <87v9772hm6.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <48ddf20d-91c2-bd09-42bf-13af907559d6@amsat.org>
Date: Tue, 25 May 2021 13:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87v9772hm6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 1:10 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>> From: Alex Bennée <alex.bennee@linaro.org>
>>
>> Since c8e6793903 ("containers.yml: build with docker.py tooling") we
>> don't need to manually pull stuff from the upstream repository. Just
>> set the -r field to explicitly use that rather than the current
>> registry.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210520174303.12310-3-alex.bennee@linaro.org>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> [PMD: Rebased]
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> FWIW this should get merged with today's PR.

Cool :) This was in case Thomas sends his pull request before yours.

