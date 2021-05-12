Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85B37B523
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:51:01 +0200 (CEST)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggpo-0003fw-FM
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lggoe-00030S-Bh
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:49:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lggoZ-0001mE-AY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:49:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id z17so3136500wrq.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IkYSIaOevh28LmB6/7QLYztraVyvLM4ElFeRbc5h5+A=;
 b=kU8KZh83cNjHXr2eLVL3mWnUvRqA1OQxH8aoFYnV8du530tEU0q90wGOdphNzOmlEC
 +E+XIEeSWqM+A7h3gXczTy0uKtLagnWBNvBG2v4BfzsZBBaHVk+0m9luOeDVespTziA6
 B7pm0bmwM3N3PgBOoT+5dF04CDDSXVeYi3xFfo3W1lyHshcGASJnbuDg8efNyYH1fAOd
 K+D0Kfnh6XCUh8jpWd7IlRm05dwyDbJErQSI7Pn44dR2Tjz55JZuwxZNmDQ1HKCT4dtE
 NgckeUqvLpnP19IEVpC1XTcusCmhEM86NRIOiYvx4V5Oa9a0FjtNkM8Iu6OZT53l0f5A
 mScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IkYSIaOevh28LmB6/7QLYztraVyvLM4ElFeRbc5h5+A=;
 b=kdg6HiPyJLQvK8Oes6CTyICDbgzb1ImpI3hhO+4Pj/iACn0KmYeHkiYGk4xMYzpAey
 vQOhvLIF0lf3G+WCCeuDxNx8xaryHlmIHfOAJctk6v9ozHhJIXea8Dt67VjeKlaQGh6M
 jM6p3e3C9Q3OeoBU07HqhVdfhjdaZmdS103x5mHlOrZlvHAf0h+CFV5iBweWR3A0pren
 gTqlnL7T3SkqV9fvaBryCZmyBHa3Tkzp2Mbow9UWamdqiBMtyYe5pzVMYwdMZqx/99Sp
 G2l3/YvpdMy7L2o5TwkHr5lqbLvOiE/jGNYKaD0vxTV5no2JNtpu3tQtRb2RFPPxeU53
 hnhQ==
X-Gm-Message-State: AOAM532CVDlcjR22oIPhwQmTqR8dclFUkRP8qsQSfVma2eUgiIaL0VCo
 on5BDOfJJhafIcmdNfmyMVI=
X-Google-Smtp-Source: ABdhPJwxGhrtJ4AnDGDecuM4MSZuXCzpFNlUF+ypd4luI+sgCOGOIye+Z/7VI08haf1v9md/NAd5rg==
X-Received: by 2002:adf:f190:: with SMTP id h16mr42326065wro.221.1620794981532; 
 Tue, 11 May 2021 21:49:41 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e10sm30603968wrw.20.2021.05.11.21.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 21:49:40 -0700 (PDT)
Subject: Re: [PATCH v2 29/30] cirrus.yml: Fix the MSYS2 task
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210504100223.25427-1-alex.bennee@linaro.org>
 <20210504100223.25427-30-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8039feba-b319-aa4a-63a5-db13f011882a@amsat.org>
Date: Wed, 12 May 2021 06:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504100223.25427-30-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Yonggang Luo <luoyonggang@gmail.com>,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 berrange@redhat.com, Li-Wen Hsu <lwhsu@freebsd.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yonggang Luo,

Does this look OK to you?

On 5/4/21 12:02 PM, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The MSYS2 task in the Cirrus-CI is currently failing with error messages
> like this:
> 
>  warning: database file for 'ucrt64' does not exist (use '-Sy' to download)
>  :: Starting core system upgrade...
>   there is nothing to do
>  :: Starting full system upgrade...
>  error: failed to prepare transaction (could not find database)
> 
> Seems like it can be fixed by switching to a newer release and by refreshing
> the database one more time after changing the /etc/pacman.conf file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210427185524.281883-1-thuth@redhat.com>
> ---
>  .cirrus.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f53c519447..f4bf49b704 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -67,7 +67,7 @@ windows_msys2_task:
>      CIRRUS_SHELL: powershell
>      MSYS: winsymlinks:nativestrict
>      MSYSTEM: MINGW64
> -    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-01-05/msys2-base-x86_64-20210105.sfx.exe
> +    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe
>      MSYS2_FINGERPRINT: 0
>      MSYS2_PACKAGES: "
>        diffutils git grep make pkg-config sed
> @@ -130,7 +130,7 @@ windows_msys2_task:
>          taskkill /F /FI "MODULES eq msys-2.0.dll"
>          tasklist
>          C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
> -        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Suu --overwrite=*"
> +        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
>          Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
>          $start_time = Get-Date
>  
> 

