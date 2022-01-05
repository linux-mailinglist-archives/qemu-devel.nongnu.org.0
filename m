Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D74859A3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:57:40 +0100 (CET)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5CPi-0001dZ-LT
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:57:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5CNr-0000G0-T7; Wed, 05 Jan 2022 14:55:43 -0500
Received: from [2607:f8b0:4864:20::62f] (port=37620
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5CNm-0004eh-5x; Wed, 05 Jan 2022 14:55:40 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q14so410440plx.4;
 Wed, 05 Jan 2022 11:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+ts14gz6wYZfJoAQNL3AKoZfuctlqVSCgkQNYbC1A58=;
 b=EApk190mLGvHfQTsPjQVBIp4H0fn08GIwAK7MZ75A0R0XH/vXwpnPSNE/ugYhBx4xp
 LtESdiPw5t3vYgWGrQAfo9KqrOiBCE7aQrrOr3XZS/6w5BEYj8X/WuiATy/SqNfsZK3V
 5q6enwCZs7S0355xLrqw69PreMt5yamZ8L/EuGtZ2c6QmQLEVuqg/6sp2l0S/d3AKAuz
 4U56VaxySa6p5aQyqAzrBjtAtK7iZ1RFVlzc6lMzTpWzxibuhwdf2uhxyjGkyBhVx19J
 5v7LM6XJrIlxykkGefm8ZZFxOwPSOwqPOAJMAjNo2wnwpVCVeDT6Gi3QklWhwKGIANA4
 eVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+ts14gz6wYZfJoAQNL3AKoZfuctlqVSCgkQNYbC1A58=;
 b=r/kINQ6yxxp7ItQVkgzLRnsRJunNCwIDzf4IGPQXkz6CMn6gK5wZyS636X3dp94/o3
 UrdbepVAz3yzeYOE9nNHSqGlFUTDegG5kXjpFb3IuR9m5t2b4avBjywM0e7U0E93kD1y
 oeGI6MZyEjd+YTblWqbWic6yDm67Jz395qOZQhryclSWqMGnWbcuNZklxiIoI+F+5wLx
 6ZDHL8HfmonsFmgn0yWKrQMd9wlegpJIvE2foPTBtGMZrD1stfGoTKYJvd6Vv5F/nhti
 SyZgPOs39XLvEjS5ay9jQliuI9r0qatnuJHwB2Umm0BrzLk9uQGopD9PuZ8HwLDTCIx7
 eVhg==
X-Gm-Message-State: AOAM532dA9ALkCW7hTX84q3Cgr/Byipa31i/fe5Mc4XpRUVWJvcuh/n/
 kCDfd1JIJaxnk5YxIshBxaQ=
X-Google-Smtp-Source: ABdhPJzL82yzoYZrNGzjIg1m2XtxIWOtVwexgXy12kDStOizkU2Gg+LGL+Bqj1CWcilY9KIQKdss5A==
X-Received: by 2002:a17:90b:4a11:: with SMTP id
 kk17mr5944709pjb.234.1641412534820; 
 Wed, 05 Jan 2022 11:55:34 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id b19sm335895pgk.44.2022.01.05.11.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 11:55:34 -0800 (PST)
Message-ID: <42290099-9061-a901-85b3-7aafeff14700@amsat.org>
Date: Wed, 5 Jan 2022 20:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] meson.build: Print gtk version in the summary info
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220105190804.649316-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220105190804.649316-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/22 20:08, Thomas Huth wrote:
> The "gtk" variable is re-declared as "dependencies: [gtk, gtkx11]",
> so there is just a "YES" in the summary info if gtk has been found.
> Let's use the info from the library detection instead so that the
> library version is printed in the summary instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

