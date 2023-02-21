Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170F69DF15
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:41:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUR1A-0001ZJ-Mt; Tue, 21 Feb 2023 06:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUR18-0001XW-CT
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:41:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUR16-0008Uf-LG
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:41:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id 6so3683549wrb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gxYfiXluE/ZrCjBCrUjXqbeaZhzoumdiKkKHRsJMzQY=;
 b=FGtejNHCIY5jTJpccNyczSilTGCVPBQKB5iRBKogz7mZpgeLpuy/9Oq64hIkcp3OCj
 XYqf7MNk6Dw4SV1ttumV9X9hDjxqCrsQUAi7QgaodlmYu95pShq3MAC7Zjq0100o9i3F
 ZyzZP/+tbD5m6xkt8iIOhI+ZJNC5RLH8UXA2tImFMau9zS4kta0WupHt1W3i+n5kOlUq
 /Jvvy7/TUiyV2xFtgeWqEutYk0ifemw1moSAlOPOjR4ipgnq+hWR3akzwvmF1wr8luWJ
 fd9V2g2gb6XsrLVSHPQzIordVf8Ug4272UMLmIGj+Ab5HddXC1AIoRDoZKjP17B+mMtI
 Ib0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxYfiXluE/ZrCjBCrUjXqbeaZhzoumdiKkKHRsJMzQY=;
 b=I9DNUthY3c4fKt7fitgZWC+KF1e/8rFm3UeqSl/QSKcYWJi/NdVQ5QVYqYZeoJwie/
 aoT+O8CDABlU3CEtsQL3gHwqWcJ+EjZKsPzCNR+DXU1DROdcfXGmvzzggZQNt71Fqi7b
 EsAkb8wpeARb0mmFWivDHHKVvJz0rxZ1UyTxVh3DfjhYg53JBIXr/PRcQEf3uQtGmYLY
 zZb/QWPdY7FgLMSV7MzskMfvbsphuIL6e5c/GcNHruJOI8Tj7U2iVp3LsKHo447bTh7v
 8qA46qt5oGCZ/IwHyp9A4jkMl6ISQxjJC+jhUAZf4ov5txiya6et/VT7lSZTY62dYR5c
 8SUA==
X-Gm-Message-State: AO0yUKUT+Hy5dMBL6MAaJkIZZy/T6V2KoPwhXoOvrxmo8xsO4OMjjPD2
 nXWt7ZDKys08MzBNxQbJjfkerw==
X-Google-Smtp-Source: AK7set9JkgtGiZrPkO4sBsTv84S80uHNQUYcDgBgndg1wbMAFPTfsaAtz6fR9QhmW17I9rC2GDpMLA==
X-Received: by 2002:adf:f347:0:b0:2c3:b47c:a0d9 with SMTP id
 e7-20020adff347000000b002c3b47ca0d9mr2988778wrp.50.1676979662694; 
 Tue, 21 Feb 2023 03:41:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b002c553509db7sm8541312wrq.52.2023.02.21.03.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:41:02 -0800 (PST)
Message-ID: <170a0ba8-d85c-4b31-557a-d85b12b88089@linaro.org>
Date: Tue, 21 Feb 2023 12:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] QGA installer fixes
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Brian Wiltse <brian.wiltse@live.com>
References: <20230221112157.418648-1-kkostiuk@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221112157.418648-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 12:21, Konstantin Kostiuk wrote:
> resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2167423
> fixes: CVE-2023-0664
> 
> CVE Technical details: The cached installer for QEMU Guest Agent in c:\windows\installer
> (https://github.com/qemu/qemu/blob/master/qga/installer/qemu-ga.wxs),
> can be leveraged to begin a repair of the installation without validation
> that the repair is being performed by an administrative user. The MSI repair
> custom action "RegisterCom" and "UnregisterCom" is not set for impersonation
> which allows for the actions to occur as the SYSTEM account
> (LINE 137 AND 145 of qemu-ga.wxs). The custom action also leverages cmd.exe
> to run qemu-ga.exe in line 134 and 142 which causes an interactive command
> shell to spawn even though the MSI is set to be non-interactive on line 53.
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05661.html

Per 
https://lore.kernel.org/qemu-devel/CAA8xKjUQFBVgDVJ059FvGoSjkv+kZ5jB1gfMNz+ao-twH7FDRg@mail.gmail.com/:

Reported-by: Brian Wiltse <brian.wiltse@live.com>

> v1 -> v2:
>    Add explanation into commit messages

Thanks, much appreciated!

> Konstantin Kostiuk (2):
>    qga/win32: Remove change action from MSI installer
>    qga/win32: Use rundll for VSS installation
> 
>   qga/installer/qemu-ga.wxs | 11 ++++++-----
>   qga/vss-win32/install.cpp |  9 +++++++++
>   qga/vss-win32/qga-vss.def |  2 ++
>   3 files changed, 17 insertions(+), 5 deletions(-)
> 
> --
> 2.25.1
> 


