Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BF4BBE7E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:37:14 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7Bx-0001t5-5D
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:37:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7AU-0000bh-Qm
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:35:42 -0500
Received: from [2607:f8b0:4864:20::629] (port=33316
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7AS-0006O1-Mz
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:35:42 -0500
Received: by mail-pl1-x629.google.com with SMTP id l9so7749287plg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UKdJ/CgDClu4t7kCJlR+7OPRGwxOsMG1emqcd9o9iUI=;
 b=L/YFvEa7IgZvP5PVYzc7ipg4JWdK2JY+OER7jVWMmcBbdJUOCgNJyXxivTYvquRr3+
 mpQSzfXIMB8Mw9YhGBjpv5OLaCNvVYy3UPHsgsP3DO//Aka+z5I1GJXb8WKXgxQ3kNQi
 fbefSGEfaoM6lnCpyUbkdyjetEKYCUCPsfk1PX9etNwHps+HG0kN7zCKf3i4oEGdqe4f
 Wfi6PSt/MKO6FfmrBqEGya2KIxKTuO6kzaCR2KIz9v7V+P4Zuc2P9uvRjARsjEDzZu7V
 I87uuVgz3iUlshU1aINMkT6UumxGq0sxRxHdTpVkGembV8QwKIzVc4ow/ismNpB9IpOo
 rV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UKdJ/CgDClu4t7kCJlR+7OPRGwxOsMG1emqcd9o9iUI=;
 b=X2uSUBWN+LdfsShNhnNtsAcf806/ZFNAc9+Pnby/PrDU1S1YcZis2JfvkmOQ09ld9T
 VQK+SELpfisHAli4kj6hJ6uvRd6rNnq3b76N08zyZt/rHZzK5mtjf9lUjvy70HUaxDLc
 PNqEivjuyZMWawYHTg8O10cHedyNi9nqTHrvwFP9c+I+ZrAw5TZHJciIeLydWeI+mMfT
 XBp9t6VjXf3DEE/QdtM2kdbT7WtxzGPZOg5iUdMICfV/8Z4HMgQOpUAffdDjUHmz4MP+
 7DddEL5KZQw2d7oLBum9Hxo+PnUpbm+udMFwsmjeEj0L1Bg0xzKJLuBlN8SmJ520znoF
 okBg==
X-Gm-Message-State: AOAM531T4mOsfNUeXFsnX52x4EM7uVob74Hodtm6smwqCvp8m6ZfZh9b
 aJRk/rQfGAKBBPgBTZ/Suz4=
X-Google-Smtp-Source: ABdhPJyeImdFk3TUEJmnu5OzOMO9BzTylA7Om2QobVbFoEjjsQST3+/8Lj29Na9BppX4UAtIHshpxA==
X-Received: by 2002:a17:902:d504:b0:14d:a773:6f84 with SMTP id
 b4-20020a170902d50400b0014da7736f84mr8738432plg.60.1645205734939; 
 Fri, 18 Feb 2022 09:35:34 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id k4sm3811232pff.39.2022.02.18.09.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 09:35:34 -0800 (PST)
Message-ID: <c073385d-3d87-2013-11f2-ec6b2085525b@amsat.org>
Date: Fri, 18 Feb 2022 18:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] qapi: Fix stale reference to scripts/qapi.py in a
 comment
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, vsementsov@virtuozzo.com
References: <20220218145551.892787-1-armbru@redhat.com>
 <20220218145551.892787-3-armbru@redhat.com>
In-Reply-To: <20220218145551.892787-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 18/2/22 15:55, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/qapi-util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



