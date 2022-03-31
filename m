Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A534ED7B8
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:22:18 +0200 (CEST)
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrwX-0004G2-LK
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:22:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZrtu-0002ZR-LR
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:19:34 -0400
Received: from [2a00:1450:4864:20::42d] (port=33332
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZrtt-0005sH-5m
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:19:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c7so6473759wrd.0
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CE1JDaGINFNRlWyE0qyF9AJjFeI4XB4dXl5RCEt9AxM=;
 b=g9PzPpPr3H6Qs6gdlQfhlU2PB6Nqocs2mnON2FY6YXl6GH+oniNtwr51khJKjDkn/x
 ZJ188ax5z5kWetG8jj+AEeDBdXI+b8bnhjlMdUnO8MeCOJbYsRF2XF2B44vzRVYkYjHH
 olPX6l4b5XpOmUdRTY0OO9WTDhrt81qK29ZzpL1GIt5RDK+NrRpHdaLOomBC/fNSNBrb
 1KsnSHD37PvdJhmWnn1N/9aaJEOMh5duXMNAppHXQ6fichdie38BDpHZBQ/GMXDHUUfM
 axf/8RysNO+CjCt5hSYd+EGeRzRxdBO/no3PqP2CY3U91GHU695YKtRIkRpDIWa7XKgJ
 8uxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CE1JDaGINFNRlWyE0qyF9AJjFeI4XB4dXl5RCEt9AxM=;
 b=OxTgyXfU9LYrs22+eWneqAnd8HaQSt98+U5xobMwl5Ny4LWFdw0K0rF/Klalkj6uUH
 /jr5VSLuqsCUsxJJBOkl7/Hmvq/q8hHtcCZjtQFGgT4atQagUZyEOSD2m+Y/RR71JzJL
 B8/afkf7vsc1jAvyh+x72Idmp0ictm7772GbUppPpgf11symSlvCpE5mxltTRZmfXN0h
 vPfr1l51EgtX5DocgqYx8FT0C4lL1tOplf9vDZ8aASoljAz+MFTdBsEf0KzBHXUKurQq
 qGEigoXJzc9KzJcuKKGORPzfp24guSWEAB9mgQ3FdIhE+laO31mMcUYT1avEQhukrHsc
 lzeg==
X-Gm-Message-State: AOAM533iDzig5+ODQAWIb8oHN4KIN8tBVVuCm0rihiUj2PiswS7TvhMg
 aO40ubwdU/Uy3bCI7hmQehc=
X-Google-Smtp-Source: ABdhPJyA64crfWfQSHQfZoiNuUGYa8PWOgXaHddL0rxlJx832ecwx5l+sdcRcgnwYUEH8vmLypdfAw==
X-Received: by 2002:a05:6000:2a8:b0:205:a7be:c330 with SMTP id
 l8-20020a05600002a800b00205a7bec330mr3596258wry.290.1648721971479; 
 Thu, 31 Mar 2022 03:19:31 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:49f5:f512:3c8e:a801?
 ([2600:70ff:f07f:0:49f5:f512:3c8e:a801])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a5d6d52000000b00203da94cf01sm19378653wri.14.2022.03.31.03.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 03:19:31 -0700 (PDT)
Message-ID: <ca8cef3c-5903-7235-1295-a2dc79d461dd@gmail.com>
Date: Thu, 31 Mar 2022 12:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 5/5] machine: remove temporary inline functions
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220330161215.235231-1-damien.hedde@greensocs.com>
 <20220330161215.235231-6-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330161215.235231-6-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
> Now we have renamed all call to these old functions, we
> can delete the temporary inline we've defined.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/boards.h | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

