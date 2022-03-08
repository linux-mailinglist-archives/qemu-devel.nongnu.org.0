Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C74D1B78
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:16:11 +0100 (CET)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbZK-0002Mg-Dc
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:16:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRbSG-0008Ak-AK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:08:52 -0500
Received: from [2607:f8b0:4864:20::52f] (port=45003
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRbSE-0002n2-Hh
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:08:51 -0500
Received: by mail-pg1-x52f.google.com with SMTP id c11so4305671pgu.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=92tn9D6CvKOM3YHgm2FPxtPVLIQRccqrPlpyyjK4ysI=;
 b=AsCr7XYV4p1P6v9WcOdH7PgPohBLBtJQZknIlotrMj/rbmrNmgt1u8HynyUcHANNc1
 iknwgm8yDXFpBgmv0MTQNtHsX082OMZ9KamIX/LD0UJgHTO/e3i3JYmpCWfrWkgoEacx
 RwypoMxt9ytdyrFcapsVWVQdvMlRl3UB8zA53psNrjnMg8LECIUDKUKWuyq1JucLDUEk
 YzYCKwgScd+mCAEmxrWSuU/tfaMtjRg0oHCim8hkmz7OLnEZQ9Aa/2ffbUsewTSj1u3Q
 463KxqJ6r/Av2z06FDM+ATzCzcW9gjv9NTWDyC39ADgurWGFrfhvizBtHtEUB/pr5WAN
 1qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=92tn9D6CvKOM3YHgm2FPxtPVLIQRccqrPlpyyjK4ysI=;
 b=o0E65jpKnzmIRjJiecONANwKxmQf3vl5il345A5CVURdf9UI+GldM62PkqDGadSH3N
 c159ESel+yjm1IRCtr8WcsNAMHNqnj/TvUM/z5l/hdh5/eC1MMHlO65M001TH7jNVaHb
 saQYx5xqZNyVbVefm1pCZCcpz/pS/mJCQ2nTrEi9448r1K8hMWLAgdhBm9NwJXzdVgHI
 K3TfB47LkcJv3B+MZVIMXItpOkh7SXZstAfABBryY9gJrCQqoYNMtkg/rZuZOlN9Txa5
 nuccpqHDMFVmG/XqS+D0BGvnBKvsuES7UWlS4DzFhbZgZd2YjwvpdS+1mxqfSwhp3/Kh
 aWzg==
X-Gm-Message-State: AOAM530exAD5LMEGdxshb0MntFry+czPoe7AbMEBh/nFO18jSqeSg1WM
 cKDnaENyXhofd6oarynW2Es=
X-Google-Smtp-Source: ABdhPJz6Ssx8lX+T7sQlEYUz6nFcVAk1B1aPKxU3dxi98hn1+avzGtZzYdzeAQadTLcCmDk2+1DrdA==
X-Received: by 2002:a63:8342:0:b0:380:a9f6:b822 with SMTP id
 h63-20020a638342000000b00380a9f6b822mr558225pge.541.1646752127606; 
 Tue, 08 Mar 2022 07:08:47 -0800 (PST)
Received: from [192.168.16.175] (11.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.11]) by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm20785522pfj.43.2022.03.08.07.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 07:08:47 -0800 (PST)
Message-ID: <cd9a9fda-7187-0601-49ca-20c649ba6cfa@gmail.com>
Date: Tue, 8 Mar 2022 16:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 11/11] MAINTAINERS: take edk2
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-12-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308145521.3106395-12-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 15:55, Gerd Hoffmann wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org>

Hmm?

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68adaac373c7..ad1c9a7ea133 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3144,7 +3144,7 @@ F: docs/interop/firmware.json
>   
>   EDK2 Firmware
>   M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> -R: Gerd Hoffmann <kraxel@redhat.com>
> +M: Gerd Hoffmann <kraxel@redhat.com>

Thanks :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>   S: Supported
>   F: hw/i386/*ovmf*
>   F: pc-bios/descriptors/??-edk2-*.json


