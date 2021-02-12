Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058231A481
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:27:57 +0100 (CET)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdAa-0006rt-9v
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd6y-0004O2-Bt; Fri, 12 Feb 2021 13:24:12 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd6v-0005cP-VD; Fri, 12 Feb 2021 13:24:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id g10so341626wrx.1;
 Fri, 12 Feb 2021 10:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rwxBhTU4DWrEGz57b3c2WGOuvlSikIa3QCncYp+DECo=;
 b=Awlm8xC00/szu9T8Xr98s+H98S/UlqQmLnlGqyd09fyTBbd48tG4xDEd37nws+gHMn
 89xgqzf4e58YP+ECYdGasWb3n59gCYpyDE3OE64VvfmxQ/3+nbjN+uQKtEAkZXq0uaZi
 XxuKODPr9SlQSxAXNtDdsEZ+1KiJm8okht3a9vazoGpq4zf/VKXEwDgDHKoW4pUR5wzP
 xwtMkojDwPD76WCLTejKj1ksh0fp3XwSrpXXOH4C2hrYtzQThxCE9KZBBhAk+pSYk5ed
 ogyILxZZIt53o2kv4PyD15C0yOzo9L0IUXKaMnQXuDfTxPiohDV9ksVgYxakI9GB7YtG
 d2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwxBhTU4DWrEGz57b3c2WGOuvlSikIa3QCncYp+DECo=;
 b=jKIEYSWZQncX9o7/ZVseiHYKvNPeKceI+yYuzQ4hh3K2EMxPQsY8UWEozXeBensFg3
 V5lSFHsR+d65ICn4/piOvsdQGu6ICjEWf4ze8WERUR95WD+vNgxC6+rhoCEfJrgDjI5Q
 RZHZNUtEIwzkBl18jQ1dfxIqlmBdgjNHBeCScU7PsoYKK2iEFsAInsMGDoYXI5NRSVgD
 NRbZ4lC+2rzhFIsVW9LIiuEtWl9nrtM0ByG/4lRUxRI49pjg/53S/Jn6C3fJQOlXvkRJ
 3IKVUB3qMRtom1FkpARo9HrBiCd9MY7Iptv3MCvCm8d7UTwMO68ejCR9ompXjXtyj7dS
 +nZA==
X-Gm-Message-State: AOAM533KmHEGr26fa6eGX7bYmBuzGqHOlJxGZNGEJMqqPd0083gMshdk
 /9QiM6zvWCuQbIVH7Al6rlt6bC4UfaA=
X-Google-Smtp-Source: ABdhPJxx1xWGRY0MY4DUw0qrA82eWIcQf63XeSRCqO7PiFCeeI79STwzOB6i4fEaKAmOnRdoGE9tXQ==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr4862710wrv.314.1613154247431; 
 Fri, 12 Feb 2021 10:24:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j4sm11092660wrx.23.2021.02.12.10.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:24:06 -0800 (PST)
Subject: Re: [PATCH 07/24] hw/arm/mps2-tz: Make FPGAIO switch and LED config
 per-board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-8-peter.maydell@linaro.org>
 <CAFEAcA-pDBHjZqswjEo4S9sLOao3vnOM05HdjRhJOGY4Q-GkiQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eca7eb67-554c-5a76-2581-f2e8c50abb86@amsat.org>
Date: Fri, 12 Feb 2021 19:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-pDBHjZqswjEo4S9sLOao3vnOM05HdjRhJOGY4Q-GkiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 2:51 PM, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Set the FPGAIO num-leds and have-switches properties explicitly
>> per-board, rather than relying on the defaults.  The AN505 and AN521
>> both have the same settings as the default values, but the AN524 will
>> be different.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Followon from the update to the previous patch, trivial rename
> to squash in:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

