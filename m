Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A005E4C4237
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:25:40 +0100 (CET)
Received: from localhost ([::1]:44950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXn8-0004Sb-UD
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNWs3-0001y5-MT; Fri, 25 Feb 2022 04:26:45 -0500
Received: from [2a00:1450:4864:20::435] (port=40498
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNWs0-0003w9-4F; Fri, 25 Feb 2022 04:26:39 -0500
Received: by mail-wr1-x435.google.com with SMTP id n14so3471718wrq.7;
 Fri, 25 Feb 2022 01:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E9VYwlJr7ripGYZz6jv0kEsEo81EPhFZ7XIDa/ZKyI8=;
 b=J+DsCr7On3tEDSDomADA7YVgHHxqsAlq43SoDhKywNoZGjDFMcmqohZE0AzgHunigD
 b/gbyuJ8sauzEiou6bb3XBaAbRAc0ZXtP9Jk49wCLiNXChcyXe5OyCyaXdCLAYeE2Ro/
 xzv2gJhIhBKNm/leBCXKyS0+iPah86acr3pTW2swQYvMnwCihAkKCeZ8Npe1gUNpdqJD
 JLM+1EF6z+3OGb8aCi5j7ijodZEY8p2xpCHP7/WFQ+YPPTfAS06Sd4oHpg76wrVbTcj5
 hXWq+sXUVAgtJq4gSsjPjV+ffEZUtnc34IGbr+5Ac5o+2x1I33M6lOb2lrK67451o6KU
 9ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E9VYwlJr7ripGYZz6jv0kEsEo81EPhFZ7XIDa/ZKyI8=;
 b=XmRXCCvDyUgANUTth+FVPE1KP7RWRWySCHeX/O/4s1y2S0ScHlQvuTdU98TuW8uMOH
 RNI8AsTe6iW1ejnmf0jlkFQrzUkw2YYQxZg46B/WQ1WGp1spY/955xHRecn7ekhwqa5T
 yqHW0Wt7ZGp5G0ipPM/6y5fjdb2x6DZTJ4eCU9fM7to9FI5TAdu5lvdKaxmdMn+XMMvB
 22oEso6PzJ4b0DzMgAB7wneGIxFNURWqkBei9TAp3P0ooinwTrmBAtMyIxoF7SCjSRkG
 yhWGvwd8KmXeCYXJB+CYs04SHgm/WuXYWbKAJtQeF1CGDOxqpXd/wuK450IbAOEl+f/T
 zVbQ==
X-Gm-Message-State: AOAM533NJAROdO0EDtDNwrZKSLKcTEiS3jrYRDbdmaitXvdF+ZtX5IC9
 ElakkQf39DQmGy9hxPxnqYc=
X-Google-Smtp-Source: ABdhPJz6AHMdFAqnR2/Qn+HCIEwmXiGP6Wxzn8xSbJS8HNFyNFJnigk140DqnTPqynQRSZ0HUeABsw==
X-Received: by 2002:adf:e54e:0:b0:1ea:9746:16d5 with SMTP id
 z14-20020adfe54e000000b001ea974616d5mr5355124wrm.186.1645781194078; 
 Fri, 25 Feb 2022 01:26:34 -0800 (PST)
Received: from [192.168.237.175] (21.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.21]) by smtp.gmail.com with ESMTPSA id
 q17-20020adfea11000000b001e308004bffsm1776840wrm.8.2022.02.25.01.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 01:26:33 -0800 (PST)
Message-ID: <976be1ee-0aff-8097-5390-7a6e4c286d9e@gmail.com>
Date: Fri, 25 Feb 2022 10:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v5 00/16] host: Support macOS 12
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
 <CAFEAcA9MpiwF4m5tBfDfnq=QubHA=Ej=XvEodBbVcBbi-MriCw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA9MpiwF4m5tBfDfnq=QubHA=Ej=XvEodBbVcBbi-MriCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/2/22 16:26, Peter Maydell wrote:
> On Mon, 14 Feb 2022 at 18:56, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Few patches to be able to build QEMU on macOS 12 (Monterey).
>>
>> This basically consists of adapting deprecated APIs.
>>
>> CI job added to avoid bitrotting.
> 
> Hi; I'm going to take the "obviously correct (to me)" cocoa
> patches from here via target-arm.next:
>   * MAINTAINERS patch
>   * ui/cocoa: Remove allowedFileTypes restriction in SavePanel
>   * ui/cocoa: Do not alert even without block devices
>   * ui/cocoa: Fix the leak of qemu_console_get_label
> 
> Let me know if that's awkward for you and you'd rather I
> dropped them.

Sure, thank you for the help here. (Sorry for replying that late,
the amsat.org domain is delivering mails go Google infra with huge
delay - and way out of order - but this is being worked out).

If there is no objections I'll send a PR with the non-cocoa macOS
fixes for 7.0, so Monterey users can build QEMU without having to
disable failing features and flooded by hundreds of warnings.

Regards,

Phil.

