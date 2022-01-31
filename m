Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E534A492A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:17:29 +0100 (CET)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXUm-0006Ir-He
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEWyQ-0005qt-QZ; Mon, 31 Jan 2022 08:44:03 -0500
Received: from [2a00:1450:4864:20::432] (port=41571
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEWyN-0004JH-HW; Mon, 31 Jan 2022 08:44:01 -0500
Received: by mail-wr1-x432.google.com with SMTP id h21so25507471wrb.8;
 Mon, 31 Jan 2022 05:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T8tu7PHP64Wh3NwNRP5ujO0rSthz5ycMNE0XMaxl0wo=;
 b=kptaPjC0Fp+ls2S7iTSn0v+QzGZEB/Wg5SGYzyDAZRl7j4TmbxRIythnkOjcRpwM77
 QozyVQUOGRy0wFB61wQbb44P7e5zPq9O5Ua5kbdur5WxuW5BY4d92hbVml87f5kjP+H/
 jZx3yb5rxAd0U4/YbAwlkclKgeiDx/mz9Bydgj2HJBIPz/YzAl5rUjMdmc9/YjiK8Sc9
 6Pm0234CIvQ0lPSV4ax7oHq5hch2yVX9ksHHg9iWv37Q5axzvyYiHdwWmy2nOuqaXY4n
 0qg5R0oJhFI6q/VEf/i+N9dSCYaby1TwSMiRm8kANPsQvj+OAPjQUbeL2osgEkG2ibD8
 yxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T8tu7PHP64Wh3NwNRP5ujO0rSthz5ycMNE0XMaxl0wo=;
 b=l2oKfbxaKeuiW4RKENCoGRNZXAvaKLep2dNE7gk7gSe+HLq5ALFBFbUDsgPIbb506M
 ab3MHjxvUxdNXdp2Z7VAQVKz0WzWnnqgptC8eBiHC6qurOvcofv7lyAZzpaRTvhnjp2k
 q+IRY0oUSdc0yPX1HnanN5/ZpnAdua3R2AvIUutoNZfHpGy1yXMAjSIG1oMMRfTzvtxt
 1b/PgEqupx8grhRtx9wl+y0cAug5bgG0kXQ7tysMY3DWVvBzRkimc2RaqSnkkHX5aXaY
 lJDiZ+qm+EVwMu+mieKm9AELCafFEzVtPnRBCXlgKLMInOEvY/5MVKW8kPnWUI4utDr8
 QyiQ==
X-Gm-Message-State: AOAM531RN997gefHRPFKQPwgCm2rWoHsx08l/POROR25015gGKHZZYS7
 tywBq0MNTSLt/EU40+rPRTk=
X-Google-Smtp-Source: ABdhPJy9fIK+A2PPK/NSPh1DJkDKwYnkezF0ZCDvUUWa5luRwLD7lLzISJ4gFiwDnscRQBrjjlunhw==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr17400279wrv.493.1643636637364; 
 Mon, 31 Jan 2022 05:43:57 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n26sm9500763wms.13.2022.01.31.05.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 05:43:56 -0800 (PST)
Message-ID: <eabe95a4-752e-d18a-1846-66709008c2c3@amsat.org>
Date: Mon, 31 Jan 2022 14:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/ppc/vof: Add missing includes
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org
References: <20220122003104.84391-1-f4bug@amsat.org>
 <cac5809d-87d0-28dc-8681-e2b8c92a9534@amsat.org>
 <20d584f8-54e4-e9ad-b125-77b25067532f@kaod.org>
In-Reply-To: <20d584f8-54e4-e9ad-b125-77b25067532f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 31/1/22 08:45, Cédric Le Goater wrote:
> On 1/30/22 20:38, Philippe Mathieu-Daudé wrote:
>> Cc'ing qemu-trivial@
>>
> 
> It is queued in ppc-7.0. I should send a PR today or tomorrow.

Thanks!

