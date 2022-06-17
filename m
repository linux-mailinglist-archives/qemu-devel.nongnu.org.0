Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5754FB90
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 18:53:50 +0200 (CEST)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2FED-0000m2-5m
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 12:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2FC1-0006eS-I0; Fri, 17 Jun 2022 12:51:33 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:38431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2FBz-0006WB-VO; Fri, 17 Jun 2022 12:51:33 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 c3-20020a9d6843000000b0060c2c63c337so3516010oto.5; 
 Fri, 17 Jun 2022 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BZTcArPER9W2pNqRtdZj1bT8lUVZqsqwwYrSt4JEteg=;
 b=asL8K1UK7OpcNsxuQe7ZT3CAfEMllMtOc9xIfyjfctKuhMZJ0VbM2YfwnkfeKv4P1P
 eFqeP8VGjsm82XskjfzmaZSRyGAdSnlUGnpz4fGfyf0SeP97u23a5ZZJp98AjrL+CXSO
 iNURUdTyByguzb/cxvzDFdlAMqOFrXsh9H0fYtVef9B2vwqqnibkjNBySLJXFwUmB+9q
 ysa5+0Qr/I6G7+UBVeV+ehelk/3qPKW5oAk+EvQvRq1hPmD7QLczr5E9NCTgRhUDmCqV
 CzZ6TnkbQ2cnSplDtIfmcnCHKXFZ1Uxp+IGT3/3l1rp+kP/70cSzwuEvn1oKLyRbk+Wv
 0u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BZTcArPER9W2pNqRtdZj1bT8lUVZqsqwwYrSt4JEteg=;
 b=XIVH5Q1D4Dot6z3iQ1xIhB8vUNwdp3Iv6ivcvMWXFDBqgnyeQ7EzmmqKw5Tb4p/ZwE
 LmVybtRpskA54mByeAyIlhwm2+o37U6f3WRpWddV0IKdrJymcylKanfHHnNCa1WycP0y
 2jL7pAEAyd47mlMpyFb0GeEuH6QEZMauVtdw1EeXzG6zu2WpSFP7s0kmqAFFi2xuZ209
 YUePT08nFdS4L1thkZeV971d5IPcINL5hqH/mk5Cdrl81zrhoy67P1NHOLjrSYFfp+gT
 0xa3arNs8Krfsephxdb3RrZ96BYC8VgQOmeSOEF9NgpefrGRrBNZ47VQjttVovpHU30C
 ghHQ==
X-Gm-Message-State: AJIora/HLavZIH2zO9DH6+p4PgTL1WLiyg7I5EWKTe/QZ3HTyyxMDYtw
 FpgbVB3832KodWiCk+U3f3amn5wa6Uc=
X-Google-Smtp-Source: AGRyM1sexED9bCDdnMqzpE70cMrW8iJlqDAwsHKJwIZ6xV9wYRw6etk9cE/2lLUmpfUVP026HHsHnw==
X-Received: by 2002:a05:6830:12d4:b0:60c:3572:ec7b with SMTP id
 a20-20020a05683012d400b0060c3572ec7bmr4434912otq.338.1655484690413; 
 Fri, 17 Jun 2022 09:51:30 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834?
 ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 bk37-20020a0568081a2500b003289f51c2d7sm2751043oib.34.2022.06.17.09.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 09:51:30 -0700 (PDT)
Message-ID: <6e0da706-657b-3209-bb71-bbcc234f73a8@gmail.com>
Date: Fri, 17 Jun 2022 13:51:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v2 0/2] ppc/spapr: Implement H_WATCHDOG
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220617060703.951747-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220617060703.951747-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 6/17/22 03:07, Alexey Kardashevskiy wrote:
> This implements H_WATCHDOG. More detailed comments are in the patches.
> 
> This is based on sha1
> 96c343cc774b Joel Stanley "linux-user: Add PowerPC ISA 3.1 and MMA to hwcap".
> 
> Please comment. Thanks.

This version worked with the kernel side patches you mentioned in patch 2/2,
thanks. Also tested migrating the guest with the WDT active and the guest
rebooted in the destination.


Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


> 
> 
> 
> Alexey Kardashevskiy (2):
>    ppc: Define SETFIELD for the ppc target
>    ppc/spapr: Implement H_WATCHDOG
> 
>   include/hw/pci-host/pnv_phb3_regs.h |  16 --
>   include/hw/ppc/spapr.h              |  29 +++-
>   target/ppc/cpu.h                    |   5 +
>   hw/intc/pnv_xive.c                  |  20 ---
>   hw/intc/pnv_xive2.c                 |  20 ---
>   hw/pci-host/pnv_phb4.c              |  16 --
>   hw/ppc/spapr.c                      |   4 +
>   hw/watchdog/spapr_watchdog.c        | 248 ++++++++++++++++++++++++++++
>   hw/watchdog/meson.build             |   1 +
>   hw/watchdog/trace-events            |   7 +
>   10 files changed, 293 insertions(+), 73 deletions(-)
>   create mode 100644 hw/watchdog/spapr_watchdog.c
> 

