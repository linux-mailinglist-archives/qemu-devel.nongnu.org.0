Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0953D0A53
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:10:46 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67JV-0006Ql-5c
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m67II-0005g4-Sa
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:09:30 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m67IH-0002bU-Az
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:09:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so454939wmc.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=554ZGURGUZEAO74KDz8/42sD+kGdY//YxKI9HC52deY=;
 b=SD2iS+oDevdTSMAsKJSVGtSu+lfxyZFhAqJX1aqpvXTrQiJvRR9+wEu4Q9rQUCf4cy
 f1us47DGJN3N9jDq+i6HjqyfSM9ndtZwn2roi3KuV4rQ0n/MhY1VyUNRj9oJ8sF7is74
 cFh/snMeRtVpcuY/a3zzX+UPSpHDVPfKfAkh33NV5u3bNC6cq0/U3Mht/O5RjtyWdpyP
 VxL5052acEmYxN9lbvLX/fZF2JJ0L1MEPud6GtMHDbOE57pwHTJGiN/AmMUQXJMELv1C
 KolleEYP+Yj81YG9vI0vQ1kAFOYxDk/StrFPur/ff8KR7QfPOxas3zWQ44kbXMsHWTkS
 Lxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=554ZGURGUZEAO74KDz8/42sD+kGdY//YxKI9HC52deY=;
 b=k72QQk38g6kwqUBUyocoxgiH6WKCQ9uHGixlKSQFVq1mbQVmnNmaEVZExGDyB6YS2h
 XaC7tGpgqlu3wSiKtuxJdUQwGhbQJA2rORuZfU0CPrHfIgnNZtUXrDIf96e8UqFO7wkr
 3OM5pIHGiSJ1eoIODgtMUjkMAp3mfVpXre16xAKrTprb0jbBlv8SMviZU8IOcIMnpx1b
 1nvvxu/ZwaJOt4oMQYgJXNrYbMKRo0GMT2LmzX8QXdh5oGIEwcTrGZaHEULHi0etj8pB
 dLa03v0nowuTU18BY4UYSAzms1IOgR+Hn6pqAMlEVoRyBr4NroS+VJONUot6pWmgj274
 MAyg==
X-Gm-Message-State: AOAM533vbxyblqaljNYiGFNj9kpagR3VczamHeB1QlWbQ3MPKSnoy+uQ
 4qPT+fsMqipwY0mZXoxbfMk=
X-Google-Smtp-Source: ABdhPJwXVJqRlVNxlPeMYny3N3ePCcrvbWe4VR5e/aMc+Gti2T8oHT5ZBtHFtTTpo9NBP5lGmPkfpA==
X-Received: by 2002:a1c:7e44:: with SMTP id z65mr2741172wmc.1.1626854967497;
 Wed, 21 Jul 2021 01:09:27 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id g3sm26260582wru.95.2021.07.21.01.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 01:09:26 -0700 (PDT)
Subject: Re: [PATCH v1 23/29] plugins/cache: Fixed "function decl. is not a
 prototype" warnings
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210720232703.10650-1-alex.bennee@linaro.org>
 <20210720232703.10650-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d370ab03-adb5-9b56-2d20-97600deb4c3e@amsat.org>
Date: Wed, 21 Jul 2021 10:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720232703.10650-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 1:26 AM, Alex Bennée wrote:
> From: Mahmoud Mandour <ma.mandourr@gmail.com>
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210714172151.8494-7-ma.mandourr@gmail.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  contrib/plugins/cache.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

