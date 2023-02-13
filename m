Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCA6954CC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 00:31:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRiGf-0000TX-Ta; Mon, 13 Feb 2023 18:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRiGd-0000Sk-9S
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:29:51 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRiGb-00047y-PR
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:29:51 -0500
Received: by mail-pl1-x631.google.com with SMTP id k13so15297645plg.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 15:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0RzPJFJzbWo18HJVfFyebZ8LNGx+sy3IJEu5D6l82UM=;
 b=K1RVxl/pS1xBg+fBL1DNVAPB0lfGZNI3wocKtx68Ms6RQk7zyDdAb7LMmbCdMVrvkR
 qb4IkYqg4McN8BSmIMBj2DTEF3LgZ7n/NHDkdvp9dHf5KcE8WYsN10iuactYxOBONmNj
 5H1Z/cuf/aJAO77PbmPfBeWg5qZA9/OLMBXC7R24oQq8/sBH3uYpmBwab5mpo+F9sRDF
 Q1XFo9mGQPYNTPrFifIFwTQpBWLQvzL/wV8S3J96NGadt/tmZ5cXQYyiOqkaBrsI1Po2
 nxegJhjfZrHRE9DTshTuM6dj20tlTyacSyPmxUM/jJYaSzz+ooS8e67gyXwLMPJrFTrU
 rReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0RzPJFJzbWo18HJVfFyebZ8LNGx+sy3IJEu5D6l82UM=;
 b=iKj3xW5aVqeNyATjlQVkBthnrF3ttRjGJDggzr00LVeEg2ozZX0eBkPaeeRYi3ozyZ
 5bfzXaQaYfywAXEBpLVvz4gr7nhDkzthGqdiy3sYplPSuivQuB5CN7z5utFtRgA8c4Ej
 2exs2JiaASJ2BkolG7SZYRVawG5iMHeeEdFPxaNknJkB3OnPYa3lxihBNLhaKsFNegK3
 ngDSXG7rfu5B37BXbA8USLKuNTk0Rq+4Z0+wZproij9xF3lGGg1tsFp4Ac09hdNEwgBo
 IUwIBWgIO0Z1MnA1DhPZf/alBm85VNoaX+oU66wlWtmluqKohKTgYmQt3BC77IIQVirc
 8NKg==
X-Gm-Message-State: AO0yUKUFv3N845072ZPTBAy0wT+agq1l2cffIsENeSsMNS6NIibzPq2/
 UcVx7LLvHHIHoMPhlSFLqCRhuw==
X-Google-Smtp-Source: AK7set+SqwXSHIKQYjlTcvguTNHfhJvCAwvmPO3JqN8K/lkRmkfNwev5YgUYzE4uaazDGKrktn12BQ==
X-Received: by 2002:a05:6a20:1590:b0:be:9fff:48d9 with SMTP id
 h16-20020a056a20159000b000be9fff48d9mr301443pzj.27.1676330987893; 
 Mon, 13 Feb 2023 15:29:47 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 h16-20020a633850000000b004e25f1bb85csm7709140pgn.54.2023.02.13.15.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 15:29:47 -0800 (PST)
Message-ID: <cc4aa3f3-910e-09f5-e326-7ef5a6f80569@linaro.org>
Date: Mon, 13 Feb 2023 13:29:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] hw: Use qdev_get_parent_bus() in
 qdev_get_own_fw_dev_path_from_handler()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230212224730.51438-1-philmd@linaro.org>
 <20230212224730.51438-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230212224730.51438-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 2/12/23 12:47, Philippe Mathieu-Daudé wrote:
> -static char *qdev_get_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
> +static char *qdev_get_fw_dev_path_from_handler(DeviceState *dev)
>   {
>       Object *obj = OBJECT(dev);
> +    BusState *bus = qdev_get_parent_bus(dev);
>       char *d = NULL;
>   
>       while (!d && obj->parent) {

This is a separate change from...

> -char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
> +char *qdev_get_own_fw_dev_path_from_handler(DeviceState *dev)
>   {
>       Object *obj = OBJECT(dev);
>   
> -    return fw_path_provider_try_get_dev_path(obj, bus, dev);
> +    return fw_path_provider_try_get_dev_path(obj, qdev_get_parent_bus(dev), dev);

... this, which is what $SUBJECT says.

> @@ -67,7 +68,7 @@ static int qdev_get_fw_dev_path_helper(DeviceState *dev, char *p, int size)
>       if (dev && dev->parent_bus) {
>           char *d;
>           l = qdev_get_fw_dev_path_helper(dev->parent_bus->parent, p, size);
> -        d = qdev_get_fw_dev_path_from_handler(dev->parent_bus, dev);
> +        d = qdev_get_fw_dev_path_from_handler(dev);

We've already accessed parent_bus just above

>           if (!d) {
>               d = bus_get_fw_dev_path(dev->parent_bus, dev);

... and just below.  So, what's the cleanup?


r~

