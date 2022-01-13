Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8AF48DB2E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:58:51 +0100 (CET)
Received: from localhost ([::1]:46164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82V0-00012A-5M
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n829a-0002Wx-LM
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:36:42 -0500
Received: from [2607:f8b0:4864:20::434] (port=42579
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n829Y-0001dC-Ms
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:36:42 -0500
Received: by mail-pf1-x434.google.com with SMTP id i65so187500pfc.9
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8TF4cj+M0pEoa9DN+clA6qZ6uy7CUwTJfllIL/5fCSk=;
 b=XntYrXETKlEnYGoMBx1FI0k2V6LwS0G4psZ+OwQI17yV6cGZt50hQiwE7UbZUwJlwV
 xeIeZn/Zupirdtr/VQe3bzvEHAs/uKt5aIS+XK8ghO7nDckWu+gqcatACgqRIC+DCpv0
 KNZhoHG6Ff5T3/+9pkaK6uD+2vBF3KLae/QzzeBW1KHlpWQzsKSh/fYzQgEGojFSmB48
 JMvRDeB/6Z+ySEdeqof9vVYe0cVwtFIdtfiJulLN5VQUhtpnoNRf5IKISHfujgojHKog
 rMi2xLfYn+T9j6DD0LuHlgAGX+BtJtNZPxQwnTpuSsbMEo8taGr1l5HGxXYBMIQIEbhL
 3Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8TF4cj+M0pEoa9DN+clA6qZ6uy7CUwTJfllIL/5fCSk=;
 b=lUtQ338Nr4P5663TeVG0MTa6WjG1+lS845kuskp9RGILs/yZJpsDYXg08R8m3QmVRI
 PF+7zMnh/2O0MMQorS9bC1x6QgUTvMfND/pbzxIcouv/iNnFdGbuUKGVBG6qBbDGPRnO
 C18/e4cvpwtjbFApbwzH5RHJWhQx2OHHY/xbZ/ucnkpEHMYexhhiz5R5hA3wYicMsaXE
 SBm9oQ5UCb9VVoqAC+kqwEjzskBEkgIuxqmGK+kLwvK/M3Qh1AjXcT+BeQc6DvTPCcEj
 uRws8e6DtOE24cFSxRp+433Op/r83e+WsHB3hYjwjjX7nzmUUji8T7TB/XfiVrKOvKWS
 dfLA==
X-Gm-Message-State: AOAM533a3OW26MkCkNHB2Mw10hL1pW93WnXxRComnr04yQu4M/n8ZHc8
 aBjIvlbQiDfQgj3aviAjvrp8RmG8SYvADRtd
X-Google-Smtp-Source: ABdhPJwxuzvROneuTl/ruRmfjEwvjqfbD+fKlEd/wlhA/kDj3CahgjjxrR+toNgR1Gy6i1frwEfmbw==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr761781pgd.422.1642088197697; 
 Thu, 13 Jan 2022 07:36:37 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id c6sm2861503pjo.39.2022.01.13.07.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:36:37 -0800 (PST)
Message-ID: <e42f34ed-79c3-6436-e56c-2aebd96acfaa@amsat.org>
Date: Thu, 13 Jan 2022 16:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PULL V2 00/13] Net patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220112083220.51806-1-jasowang@redhat.com>
 <CAFEAcA-CLK0nRgQk8nu0iEcKwGg8tNE=gbXOkR4Pc6RSW83CKA@mail.gmail.com>
In-Reply-To: <CAFEAcA-CLK0nRgQk8nu0iEcKwGg8tNE=gbXOkR4Pc6RSW83CKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 13/1/22 15:00, Peter Maydell wrote:
> On Wed, 12 Jan 2022 at 08:32, Jason Wang <jasowang@redhat.com> wrote:
>>
>> The following changes since commit 64c01c7da449bcafc614b27ecf1325bb08031c84:
>>
>>    Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20220108' into staging (2022-01-11 11:39:31 +0000)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to 99420f216cf5cd2e5c09e0d491b9e44d16030aba:
>>
>>    net/vmnet: update MAINTAINERS list (2022-01-12 16:27:19 +0800)
>>
>> ----------------------------------------------------------------
>>
> 
> Let me know if you want me to apply this or if you're going to update
> it with Vladislav's v11 vmnet series.

Note, there is also a v12.

