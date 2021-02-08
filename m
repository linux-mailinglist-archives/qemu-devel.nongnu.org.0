Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC16313AF6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:31:25 +0100 (CET)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ANg-0002pg-Ez
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93XK-00045l-5s; Mon, 08 Feb 2021 05:12:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93XA-0006rY-Fu; Mon, 08 Feb 2021 05:12:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id g6so3367383wrs.11;
 Mon, 08 Feb 2021 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X5Jrnx2nZe72QoyHvWR2MF6rDUOE6q2BUZRUJPWW/B4=;
 b=TcbD6q+SVmCzlf6T6dbdYv4f/Ut9+7QAw0Kkte6KTp4MTR1+pjzA1FBHuJXYjDQCh3
 VPOu3LY7SCGUvVkwXAAjZgjiXIkNRlRW4jDEL2RGL9mXMmVGoFM+TkhWH3jOk39vlk5a
 9NSC34BOWJWzcppzsdaCFmnKhz2q1Kj1Ih7kWN9QCKFbZW6jCgwVai5qFBZeeNJW47JN
 TkpdpYL1fmV3nV2Tjz8vCAUYHJYRGFu6mhwdR38nTyucxw+xjiVLSp60it+U0iRyItra
 /s5CEAO24ekybn08ECkqpAhQHuklSa6SbZnbQY0Qi17j1bMxstVeT2/KHHJsoLDkHGx3
 Tsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X5Jrnx2nZe72QoyHvWR2MF6rDUOE6q2BUZRUJPWW/B4=;
 b=gcBCW17Du0x2aNqwFAD/IgJwAYvZW6Gwaq9U/UG0kWVejTLOfGUtJ+5MfeHCsWN8Rl
 5wtu+pBcmc+kGxD+A9KPStRXr7elH7JkbpVKtd0kyY+JICX6QYbLX04ptjR3fXgfAm9n
 NXUVtsf9b4cDjv/okhLRv4iDRrDHdpXmdkGzFHfp7TocJ88MCkwniyQtmQv4o1iS9ZFU
 i1ipUzRZAAm85Lourqvg1NTXjwGCLloQXrUUqWM5PIt43p53Yj97VsLwnDmkqiaoc1cK
 ccqkp++kYJTncvvdwBIEnQzI/aabXYJ6UgGIQB3lvL/mOZRhMQGnmKj8iJ9voQ91Py1s
 HIww==
X-Gm-Message-State: AOAM533AvF8o7FEzEWwcrKGnyzkj9BNbdd30QCU+6yGTHWHgNoLemYIq
 nAbvUwtz1l6OLhZrU+mT/H0=
X-Google-Smtp-Source: ABdhPJyNC9yotHAgIM4kedwSJJnRRhIXy6lRV6nO1ljIWzrbrmU6yN5iCTlLQPAMRtKHUC8/LEeFTg==
X-Received: by 2002:adf:d085:: with SMTP id y5mr19473463wrh.41.1612779158291; 
 Mon, 08 Feb 2021 02:12:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n187sm20243579wmf.29.2021.02.08.02.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 02:12:37 -0800 (PST)
Subject: Re: [PATCH 2/3] hw/sd: sd: Move the sd_block_{read, write} and macros
 ahead
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
 <20210128064312.16085-3-bmeng.cn@gmail.com>
 <da07ee87-7134-564b-3743-34e1dbbd7f67@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <43c410b3-4e29-6236-cee8-4b5f69bfff89@amsat.org>
Date: Mon, 8 Feb 2021 11:12:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <da07ee87-7134-564b-3743-34e1dbbd7f67@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 8:04 AM, Cédric Le Goater wrote:
> Hello Bin,
> 
> On 1/28/21 7:43 AM, Bin Meng wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> These APIs and macros may be referenced by functions that are
>> currently before them. Move them ahead a little bit.
> 
> We could also change fprintf() by qemu_log_mask()

Hmm in this case warn_report() maybe, as IIUC QEMU aims
to support using smaller block drive (which this model
currently rejects), in which case this wouldn't be a
GUEST_ERROR. Can be done on top in another patch, since
this is pure code movement.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

