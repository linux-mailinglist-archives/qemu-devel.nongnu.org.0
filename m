Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757E7651FC3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:34:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7acm-00062Z-6K; Tue, 20 Dec 2022 06:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7acj-000626-30
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:17:29 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ach-0005A4-0G
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:17:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z10so829982wrh.10
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oE0w/m6oa6qJ+qOfrZDK4id9TCXURxmkxuZYH2EG2VI=;
 b=WBDq1YZ8g1DtQ/trBS/pjmILrdd1M4wzdGzRY2vfNvPDhpUsjDJotAlkV/DwZ0Jhyp
 3ShOoBmPJXnvKmgTG/3cLCzGXWhkLSSQQs8JyWnnB85KPr2+KF/WXfAmjiOeHvmwdDtm
 RH4Zuo+nUxvjPxIvBtHvaunbwg6ZfziQPyT2d05ArCuNq9RTVGid8jxEx+w4uIN4lL+1
 Kpcu5+Z737OdwVvGrOdYr2feP3h4XO1FFhWAmnk3fYdz2Ek6nMf9ZUwLIfylxP94mrGS
 hd7pk0vsTer+arMXT2bk3NcjWPD0/5FMrgXnHJFZFNn41zKjfdioyDLcbcYM+Nxnb1jy
 ezwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oE0w/m6oa6qJ+qOfrZDK4id9TCXURxmkxuZYH2EG2VI=;
 b=T/K7kk7AV3tZ/wOioP5b5k6Gty2A9jEXuZS4bXmYNvgLronqQKrtDgifoXsqTUIJ8w
 HgrAPRbvvShdW/JFXfuomNMah11ZgXR63w6iWxuQILp9cu1o3JqcpPu3eQ8ZNVV8JfXq
 teg4dKScM243uc5OkR5NvpxOghYbleYnqZrw2RRAIVhMipIs33Wg4IAVtbz6X8KC5y+8
 rj4eX4D+0yCOex4AwLcQ3MY5ZG54w9Ya/TXiB/GOTSn4v5EhZqpVR5LWRga8CgXdPfip
 jXn3EdGK38RJmeIYD9CnJn9no9RLz0EFWn1Tb/RKBcymZRC+W+7VHZqDyyrnkQh67cMI
 xvJg==
X-Gm-Message-State: ANoB5pl3E2DO4qWuo1bHzKSsAmYeRz5aWxA3BZm+55Ok6Ig1ZmZuCQ/m
 +4+4GuTguOsovjx1qmGaCo5xXg==
X-Google-Smtp-Source: AA0mqf4U1uEjMaDvkryLZsV4CbUhmnDh+SLTnD7MprelnJH7/GETkGn0sV18UuTXiIrOuNJYuHH06Q==
X-Received: by 2002:a05:6000:124e:b0:242:2b66:fcf9 with SMTP id
 j14-20020a056000124e00b002422b66fcf9mr27544523wrx.27.1671535044503; 
 Tue, 20 Dec 2022 03:17:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y6-20020adfe6c6000000b00241e8d00b79sm14448269wrm.54.2022.12.20.03.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:17:23 -0800 (PST)
Message-ID: <447fe63f-782c-78ea-f16e-58298530e89e@linaro.org>
Date: Tue, 20 Dec 2022 12:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 16/18] ui: Split hmp_mouse_set() and move the HMP part
 to ui/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-17-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220090645.2844881-17-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 10:06, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/monitor/hmp.h | 1 +
>   include/ui/console.h  | 2 +-
>   monitor/misc.c        | 1 -
>   ui/input.c            | 5 +----
>   ui/ui-hmp-cmds.c      | 8 ++++++++
>   5 files changed, 11 insertions(+), 6 deletions(-)


> diff --git a/include/ui/console.h b/include/ui/console.h
> index e400ee9fa7..e7f375312c 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -65,7 +65,7 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *entry);
>   
>   void kbd_put_ledstate(int ledstate);
>   
> -void hmp_mouse_set(Monitor *mon, const QDict *qdict);
> +void qemu_mouse_set(int index, Error **err);

Can we return a boolean to indicate eventual failure?

> @@ -594,10 +592,9 @@ MouseInfoList *qmp_query_mice(Error **errp)
>       return mice_list;
>   }
>   
> -void hmp_mouse_set(Monitor *mon, const QDict *qdict)
> +void qemu_mouse_set(int index, Error **err)
>   {
>       QemuInputHandlerState *s;
> -    int index = qdict_get_int(qdict, "index");
>       int found = 0;
>   
>       QTAILQ_FOREACH(s, &handlers, node) {
However no failure is reported, errp isn't used... Do we really
want to pass it along?

