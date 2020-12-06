Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80B2D0359
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 12:29:56 +0100 (CET)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klsEl-0006ZF-1r
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 06:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klsDN-0005uT-N2
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:28:32 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klsDM-0008Hc-5E
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:28:29 -0500
Received: by mail-ed1-x543.google.com with SMTP id l5so10567346edq.11
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3DHs/AzSBtEOHANPILEgkMmU5MdZu+yFGJLjGHc+p+0=;
 b=WrQTn7NO4O6HI6mOlsKl/WipS1NOaxkOI8gIQTaZWgqNECsuGDInlEiAXXYZJDDLtj
 JdKnoZ0Mu2y1z2mG9iSI6YskX0BeODo1bIfDd07CCCxoZh5+QadCR0rvODqmevJevMpy
 PNx9dKYGv95rDUImKmCVwDjhg9FM+0uBUBUm6T8OHDdbAA6dxID6SDX2c2sHtkcmCfOq
 7YbIgk0BMNtjKzHNGAV+Z44ogU1KUSdqf8HVuTCe3MUP4Cyi3n1mtksEWQkEWErwsMQy
 7SHofpDBt9EzRmIAiybneM49IpE7PHLN23cUIQ60TbJrsB9Wg3PFuFs/5+LaWrICojnP
 R3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3DHs/AzSBtEOHANPILEgkMmU5MdZu+yFGJLjGHc+p+0=;
 b=Qs7Ck+hMmLS5Uq17t4n5KW3M/bwh8XEiNrdqBn+j91UCtUwEtyxTnlsWWULevlsvQF
 6x/GZBCU8p1kSJ+xD3AFItl9YDtpz4UtNM5Ly7tUGjbcHhnZy13Ji9e+4iPxvvLKKEOh
 TLPY8p8kiD5mNgNcE+CY304mofCQKBqraCCB/pdklN0q/AN2hRCJiAJtkbUyYwplEZto
 tizQzDADtdL+QFQB4MFNH16179E8TEg5oYLQJQ5grzGHKXHiNbO4BFAOYX2iEy42GipO
 roLZN+etODshpoYm3soJb//s3KBZmmA7YKVZs6erMkXayZhO0T2jGT9zB/mDIsiN+toP
 mD7Q==
X-Gm-Message-State: AOAM533MrNJ40hMnRcfO5Hu+Du4/T0Lo8SyP0iCsMndMU0OX+pYfN1M6
 5EAC2VWUCIJjWdHQ9vPLY+4=
X-Google-Smtp-Source: ABdhPJxkQS3e4+HjXXibjrtgbYy/PSulb3NfG514NYR/qk0cAgrPCT00PEX3zrvuiAiZEAmTFxnsNA==
X-Received: by 2002:a05:6402:8cc:: with SMTP id
 d12mr15307020edz.0.1607254105422; 
 Sun, 06 Dec 2020 03:28:25 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id bq20sm7606624ejb.64.2020.12.06.03.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 03:28:24 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Huacai Chen <zltjiangshi@gmail.com>
References: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
 <fdc553b5-af0b-1705-7f33-a7fd2d524fb5@amsat.org>
Message-ID: <eca91ba2-2f06-d69b-2b26-c04cb4745452@amsat.org>
Date: Sun, 6 Dec 2020 12:28:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fdc553b5-af0b-1705-7f33-a7fd2d524fb5@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/20 3:18 PM, Philippe Mathieu-Daudé wrote:
> On 12/5/20 10:22 AM, Huacai Chen wrote:
>> Use @kernel.org address as the main communications end point. Update the
>> corresponding M-entries and .mailmap (for git shortlog translation).
>>
>> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
>> ---
>>  .mailmap    | 2 ++
>>  MAINTAINERS | 8 ++++----
>>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Now also:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

