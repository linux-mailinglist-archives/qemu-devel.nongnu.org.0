Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74B4BEB4E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:39:47 +0100 (CET)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEXC-0005Va-Uj
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:39:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMELY-0004Pv-AH; Mon, 21 Feb 2022 14:27:44 -0500
Received: from [2607:f8b0:4864:20::62a] (port=35407
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMELW-0003SW-Cw; Mon, 21 Feb 2022 14:27:43 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i10so13708023plr.2;
 Mon, 21 Feb 2022 11:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qbxua3vSH5ftP1sSbsW8W5JmQTTxMq36rEIZymCJ+M0=;
 b=YIk7JeIPbtkIpx6zn7xXucG81k5FaUlRT9gN3J8dS7espZkAizVPHNl+VUpYrxNBM6
 yBsyeaOWX3qLTh7k+8U8X/f8SJyRYch/iHgP7rxIBunt0AMRnnYs2cWtjCWVKgQp7dFD
 lfieldlp6a7eAMTeHJMrbi0FPpDz4tnmzboQdxkz+E0Viho89VYC6+C5rP2g+su2VS1t
 SD3f1NTqFHY5sck7Ws6Ks/AIJL8fPcm8V9jH/ZU7DfndB5Bwno2zGsaVFIuBkDoJ6tO+
 R+KCii3jLb/QSjAXwpdaoqVsj24a4EP27uOoCr7xSnZybH50ogKKmPoKnHE7TddiPVR0
 p0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qbxua3vSH5ftP1sSbsW8W5JmQTTxMq36rEIZymCJ+M0=;
 b=JzeG7oPS5UnmtPA+iUbLb+I6Wh69k6bHttmuLj6NcSHf+O5OyhOUn6A72jUTFtAAf7
 LJmFnJ782vSC2iF2cS4tGsQ1m7Hcxmxos1B81aLsLxppgcz3IsqFBFQ86vA40YIpQpjC
 N6HzrWy0xIlJwGngJY3RUf9eum6LOS3qAN0NrO9kF0EYcXFEd3IyHjATsJibcLFmFvoU
 hyl7Hjm90UV5IY8ffwL36eeST5ww/O14ukQfKDqmZt6HqgZofsHYgy6JZzUd+WU82RRw
 WBOs6cYYN99fk7ASTEuDm4hzcsu6NtyIEQGwqynjBE315H7pj0iCDuOQBiweAIB4qvFQ
 SCsg==
X-Gm-Message-State: AOAM533taCBQMWrHNHi2BR6ETpMTTJvuRzRpZQuEgqZOLtsMhdA148jW
 4fREjUc7ae/baQRk9GxwKs8=
X-Google-Smtp-Source: ABdhPJwm2k5jmf0kWVd3ZdtvlPV5ZS3lEsxFiFupm2V1oU+HlH2RU4JnnOF/k4y/Bc7P0A8l1F9noQ==
X-Received: by 2002:a17:903:2490:b0:14d:57a5:a472 with SMTP id
 p16-20020a170903249000b0014d57a5a472mr20371906plw.17.1645471659643; 
 Mon, 21 Feb 2022 11:27:39 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 z11-20020a17090a1fcb00b001bc58804974sm130652pjz.27.2022.02.21.11.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 11:27:39 -0800 (PST)
Message-ID: <3036ce6b-a201-4447-fd07-64516e0390fd@gmail.com>
Date: Mon, 21 Feb 2022 20:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/3] qapi: Move RTC_CHANGE back out of target schema
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <20220221192123.749970-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221192123.749970-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 20:21, Peter Maydell wrote:
> This commit effectively reverts commit 183e4281a30962, which moved
> the RTC_CHANGE event to the target schema.  That change was an
> attempt to make the event target-specific to improve introspection,
> but the event isn't really target-specific: it's machine or device
> specific.  Putting RTC_CHANGE in the target schema with an ifdef list
> reduces maintainability (by adding an if: list with a long list of
> targets that needs to be manually updated as architectures are added
> or removed or as new devices gain the RTC_CHANGE functionality) and
> increases compile time (by preventing RTC devices which emit the
> event from being "compile once" rather than "compile once per
> target", because qapi-events-misc-target.h uses TARGET_* ifdefs,
> which are poisoned in "compile once" files.)
> 
> Move RTC_CHANGE back to misc.json.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: Greg Kurz <groug@kaod.org>
> ---
>   qapi/misc-target.json | 33 ---------------------------------
>   qapi/misc.json        | 22 ++++++++++++++++++++++
>   hw/ppc/spapr_rtc.c    |  2 +-
>   hw/rtc/mc146818rtc.c  |  2 +-
>   hw/rtc/pl031.c        |  2 +-
>   5 files changed, 25 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


