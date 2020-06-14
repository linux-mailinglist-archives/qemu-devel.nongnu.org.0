Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BEA1F89B0
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 18:51:07 +0200 (CEST)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkVqc-00074c-0H
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 12:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jkVpd-00067I-TG; Sun, 14 Jun 2020 12:50:05 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37752)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jkVpc-0001FL-CA; Sun, 14 Jun 2020 12:50:05 -0400
Received: by mail-wr1-x441.google.com with SMTP id x13so14691581wrv.4;
 Sun, 14 Jun 2020 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sy9N0d3YApakExR6rUJK7+eb6MC3809lHza6nfMAD08=;
 b=eqZQYHgkLTcaSj3OBD18SFIMMLlEVVUtOhPxmdL0jlR0uy/Xndgyc8bLJcQ0O8BCu0
 lCR9reLTYXlV+Yrvm1dMJ64S06WWtTN9PVK95nygqnqIERC18vW0xry+0jD+9PgrG0Km
 9tseHTLUA1x4H4xTCoEVV6dKfL8A6WzedSPbgIl0ciZ2IBv6HmiCaHeXE5Lp09CSSp+p
 +22mf/2go9V82B+SHL7SMZqqjBMOFvxlV5BxGTcFxQa20rqLJF9tVq4p0uXrwRy0iAbI
 tHPww+Ku3bpCd9eMkHKH5ZefarbHVtt3mhhxs9FYMPL2UFcSP0SUHPgJmQYoCbot498S
 2LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sy9N0d3YApakExR6rUJK7+eb6MC3809lHza6nfMAD08=;
 b=luGftgANeoNOQGAB2EzpWIJNEfbuRmlImirgC/1I5xt5tWjrEVgNw3tI1I+NNsitJS
 vZ3f43c3P/ENTfW89mllsmujNEqnKyqB8aYOvF9/47ydYPcI5QLnO+D5Gdq8iYPKdNCJ
 uuxQVEozit0BNOSb5HsDTXXamtJmyt6vkVJ837MSN0YeBU8Jo1j/2g9So7lOCn56Q01m
 WD9zc3Au8qntR+zCeSI1oWqyhMB6y5HjeP1Pgs5k/zDXLlH+GMsSjj0sn7+4A4lTBBTr
 JTQNCOoAcHU3ImW5MAzxif5HjScBAwxxHnIvP49ydQl5ImgpgO4TfEjCD9bRqidcUUjR
 T4xQ==
X-Gm-Message-State: AOAM532HR+0X/E+JleguTyXmvMSfQoltxChIpwOoQyO/mEBGZsIIN+Kb
 2EQTFs/LgtK9BvJwj1e2XVo=
X-Google-Smtp-Source: ABdhPJxlCaR1ktNhqBYGfGieSiLpvjcAdxnkJazeEVrSmvjZYDlZyX5YHITmqGJYsWfdZg0J/3LWig==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr24415599wrq.259.1592153392082; 
 Sun, 14 Jun 2020 09:49:52 -0700 (PDT)
Received: from [192.168.1.40] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id 30sm21626533wrd.47.2020.06.14.09.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2020 09:49:51 -0700 (PDT)
Subject: Re: [PATCH 01/22] adb: coding style update to fix checkpatch errors
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, laurent@vivier.eu, fthain@telegraphics.com.au
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
 <20200614142840.10245-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b86bc62c-1cbe-96cf-8e4f-d282fe2a6d1e@amsat.org>
Date: Sun, 14 Jun 2020 18:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200614142840.10245-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On 6/14/20 4:28 PM, Mark Cave-Ayland wrote:
> This will help ensure that style guidelines are being maintained during
> subsequent changes.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/input/adb.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/input/adb.c b/hw/input/adb.c
> index b1ac4a3852..bf1bc30d19 100644
> --- a/hw/input/adb.c
> +++ b/hw/input/adb.c
> @@ -44,14 +44,14 @@ int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
>  
>      cmd = buf[0] & 0xf;
>      if (cmd == ADB_BUSRESET) {
> -        for(i = 0; i < s->nb_devices; i++) {
> +        for (i = 0; i < s->nb_devices; i++) {
>              d = s->devices[i];
>              adb_device_reset(d);
>          }
>          return 0;
>      }
>      devaddr = buf[0] >> 4;
> -    for(i = 0; i < s->nb_devices; i++) {
> +    for (i = 0; i < s->nb_devices; i++) {
>          d = s->devices[i];
>          if (d->devaddr == devaddr) {
>              ADBDeviceClass *adc = ADB_DEVICE_GET_CLASS(d);
> @@ -69,9 +69,10 @@ int adb_poll(ADBBusState *s, uint8_t *obuf, uint16_t poll_mask)
>      uint8_t buf[1];
>  
>      olen = 0;
> -    for(i = 0; i < s->nb_devices; i++) {
> -        if (s->poll_index >= s->nb_devices)
> +    for (i = 0; i < s->nb_devices; i++) {
> +        if (s->poll_index >= s->nb_devices) {
>              s->poll_index = 0;
> +        }
>          d = s->devices[s->poll_index];
>          if ((1 << d->devaddr) & poll_mask) {
>              buf[0] = ADB_READREG | (d->devaddr << 4);
> 


