Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82C38FD5C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:03:54 +0200 (CEST)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSyf-0007Sg-IA
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSxB-0005oq-Vz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:02:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSx8-0004xe-Mt
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:02:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id n2so31419626wrm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNHd4KkCX1F0nw9SxM5u+xtwkO2MbMGgjufuCoHAZtg=;
 b=qBeMUDUmT7snQlRpBne0s17a81djRTbDRwGQMmtQEL4qaoNdJ0t78QI7dQL93hB/RE
 dxXj0+0nlss/2RwAhjryLDv1muqs83jLVuOww+J+ZBWOJxQF/ObkHhr584w20MBWg4LG
 uXFKyt/75+d831jJ9xN+Ik/b8kL6gcrRTc46QplRtEq7KvY/RUnoQ/EqLJ7EtAfpcx8s
 5ZJeAssGwroa+9sYcucc6EUqxwdU2UjKWJdN4FVhEqabM8p5hhqQK49VJ0aLlrwe8ce5
 Ch+CziLaI7JQeK0quYUI4X9d2KnyKkZ8mOtVf1z/U60NP5oQ8xguLQQTjEnw+mmTAKiS
 591A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNHd4KkCX1F0nw9SxM5u+xtwkO2MbMGgjufuCoHAZtg=;
 b=WfjDKvWnEjg2aAjEiPJ/IrGo2gHYs2yQe6bN/VGF4vuVUId9eGNGQAnq47B92lGHIC
 MRZiRTjIP075d4hFBxn9C3puZYO4y+0n/rAixkjFSWda9X7fl92vVhFijO3P57iaiddz
 RFfb7qUpSVcLQZfTTwLblbxWJ9RNhpoh7Ibb1xCjBYy4xE1T9QKZBvdyoDB0eXrONKlq
 TLkyC1ZDiioyrooO7UbMMeDKpJymC11KFLYW9HmBXM9WwivS4oldSxCl4x3syrTDaX6C
 g9V+y59f8QDiYt/bbhQB2pBrMs1RkF7D/Fen9fsRU94l2G28s/MVh9l6rbShd/ngxp5N
 duNw==
X-Gm-Message-State: AOAM532xMM4A1RLaDKA9OBRwwtEZZ+HnP1G130VV04xYDBrsW9r8MHKb
 qpPOxZdRjeFDdIB93+9KjBo=
X-Google-Smtp-Source: ABdhPJzW/49aPjN+UbajBn1dK4ygeKsjD7TT9uN3jk6FTbelMcTf5cs9vsbF7eeMvqZicz3Z3Vj+5A==
X-Received: by 2002:a05:6000:12cc:: with SMTP id
 l12mr25863188wrx.91.1621933337141; 
 Tue, 25 May 2021 02:02:17 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l3sm10283608wmh.2.2021.05.25.02.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 02:02:16 -0700 (PDT)
Subject: Re: [PATCH 9/9] gitlab-ci: Use absolute path and simplify firmware
 jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-10-f4bug@amsat.org> <YKy7uXb+lmICJVY/@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6a748bb4-d883-eb09-2280-7a4e65bc2691@amsat.org>
Date: Tue, 25 May 2021 11:02:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKy7uXb+lmICJVY/@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 10:56 AM, Daniel P. Berrangé wrote:
> On Tue, May 25, 2021 at 10:25:56AM +0200, Philippe Mathieu-Daudé wrote:
>> The GitLab 'add job on file changed' feature doesn't work well
>> with relative paths: use absolute paths instead.
>>
>> Change the 'rules:' section by an 'only:' one which is easier
>> to read.
> 
> GitLab docs say "rules replaces only/except", so I'm not convinced
> we should be going back to the old syntax, especially as that means
> some jobs will use 'rules' and some jobs will use 'only'. Consistency
> across jobs wins for me and "rules" is much more expressive.

OK. I wanted to tag this patch RFC anyway, but forgot.
Please disregard it (the rest of the series doesn't rely on it).

