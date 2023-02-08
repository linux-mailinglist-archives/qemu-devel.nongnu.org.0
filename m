Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7BC68ED7E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 12:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPiGm-0002uC-QH; Wed, 08 Feb 2023 06:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPiGk-0002sx-6S
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:05:42 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPiGh-0006Sk-Ad
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:05:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id z13so5578269wmp.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 03:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+oxgQkLgrwggiitNciyvkbbDJsSOd9i2jbRRS/D2bxw=;
 b=p++S7aUFN82moA1EXynIkG73n02J+naZdYcbD6RhhC0gEl1LxR5beajVOcrgq0sBSV
 VRA9elMu/cMltZ/jzuDoqatvuezBwNnIAzyqz5HeIMdUMoI7rdQrDsvaT96MrwpupLh2
 QOWjNdzp6wHQGpiuI+R0QU73KkmzdsxwbhtEc9+y9fUa8ZEHnWpmvNRyVvNTfLqy9Obc
 PyHa913DRaFovCFAhZ6l/411v1vpUMDjpX6r7/qbXrI7DSqPOupRDkGIUyL6l5d4eADo
 wgVWK9w2jaAcMJHpVgZ1BtJqE7uaawZNmdrzdB83LPzevm45BDOnxDPH917bmpCyb9MR
 IjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oxgQkLgrwggiitNciyvkbbDJsSOd9i2jbRRS/D2bxw=;
 b=fh6qFyA7A0lU0icjJ0hX16w32Tf6OBj94OSLN8Lev8/BwVlHn2DuiVp6qvkMupdFq6
 f9ikytRrp3bebFaMPIxURWCl8O1b2GYMRI+iDHpPlOCmeUtRQ1sdQPyLVfkkE/I5thNG
 qTDdMqUuCX2T+T6WG6XYYpRWL9Qy1ohweFzOXmmMDPFWuCo6irP3EhpqyBv7aNnBOXwo
 czZKmLdu/s9wZ5kLtKboaLCeshuc0hcuOgKDnZipU1XYpPFgk5PtxG2kzpJk3gfGE+9b
 HOLgWPe6DDXyzwWlVeqWP3ksG7U3Jt8N1CPUqfZwqFwpzxdKEkt1zUTchjEmm2YJ3bMs
 ZDRw==
X-Gm-Message-State: AO0yUKVJ8jtyWjgGnRDDjk0BAqNLmzyD3KcBEtEPPaeU9r4i886V1H+r
 U5owMXLF2rq07JF5/WyGfPJL2Q==
X-Google-Smtp-Source: AK7set+/B+lUb37SLmNNXDgJUN79QxSVM/+A9vu0AKFgItrxuWdOQJ7utOxIVuy7WVPJJuu0KmhnqA==
X-Received: by 2002:a05:600c:996:b0:3df:f85a:4724 with SMTP id
 w22-20020a05600c099600b003dff85a4724mr6123136wmp.39.1675854336954; 
 Wed, 08 Feb 2023 03:05:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q3-20020a1ce903000000b003dfdeb57027sm1582567wmc.38.2023.02.08.03.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 03:05:36 -0800 (PST)
Message-ID: <ff9756f8-1b95-f68a-1536-08eec30f7670@linaro.org>
Date: Wed, 8 Feb 2023 12:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/1] readline: fix hmp completion issue
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, joe.jin@oracle.com,
 Markus Armbruster <armbru@redhat.com>
References: <20230207045241.8843-1-dongli.zhang@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207045241.8843-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/2/23 05:52, Dongli Zhang wrote:
> The auto completion does not work in some cases.
> 
> Case 1.
> 
> 1. (qemu) info reg
> 2. Press 'Tab'.
> 3. It does not auto complete.
> 
> Case 2.
> 
> 1. (qemu) block_resize flo
> 2. Press 'Tab'.
> 3. It does not auto complete 'floppy0'.
> 
> Since the readline_add_completion_of() may add any completion when
> strlen(pfx) is zero, we remove the check with (name[0] == '\0') because
> strlen() always returns zero in that case.
> 
> Fixes: 52f50b1e9f8f ("readline: Extract readline_add_completion_of() from monitor")
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>   monitor/hmp.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 2aa85d3982..fee410362f 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1189,9 +1189,7 @@ static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
>           }
>           memcpy(cmd, pstart, len);
>           cmd[len] = '\0';
> -        if (name[0] == '\0') {
> -            readline_add_completion_of(mon->rs, name, cmd);
> -        }
> +        readline_add_completion_of(mon->rs, name, cmd);
>           if (*p == '\0') {
>               break;
>           }
> @@ -1335,9 +1333,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
>               /* block device name completion */
>               readline_set_completion_index(mon->rs, strlen(str));
>               while ((blk = blk_next(blk)) != NULL) {
> -                if (str[0] == '\0') {
> -                    readline_add_completion_of(mon->rs, str, blk_name(blk));
> -                }
> +                readline_add_completion_of(mon->rs, str, blk_name(blk));
>               }
>               break;
>           case 's':

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

