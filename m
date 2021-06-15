Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A73A86FE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:00:02 +0200 (CEST)
Received: from localhost ([::1]:36862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCPw-00032w-UB
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltCMB-0005zx-S2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:56:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltCM5-0008JG-L1
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:56:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id q5so19128730wrm.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GcjR6jeJZC5W/qcDgsiLTwjRbaPk26Wbohvs5L/rc3U=;
 b=nSIpTdwTXoKEl6jSlqp2OeaKTisv5faT6+LNvrtQ8eHdeXTNyRsk8Sc20POPw2574f
 Ip+nNSCMu5VEn5b3BccrSrI+HaNXKufmIjR/KJdXsP/deQ47vfD1lYuB2hymXil9zDUq
 MK09A4PXljyJisxM+g1sOr7uRVhdGv5B3bXYfC2LLnh/0wT0VRI7QYu5BQPg5dWZdNDF
 LNxTbgcTbDRrNuOCgum4wbJ5VmB5mCr4wLmx1uWsF1QvCJxakzQsfy0fOiAF2Ihulvpp
 y5YvBGSj1mmFjj3rDAWfVCEparaTLLh9TYNKzIv+eKc7JzrOrXC2f/WSsjlkLyxPTpUs
 ThAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GcjR6jeJZC5W/qcDgsiLTwjRbaPk26Wbohvs5L/rc3U=;
 b=VX3zX+PIl1fiwmtMD8BxfMBUpJdwjY1lhd/CGbAov5zUXBQMaOtmFW7JK4jCsM0QXy
 6mJwjUDtYrfnX3nmUry18Jk5W+n/2bBsmbYbo1n3yVUa31wqFcPJPMCrJbfNcz6khM/4
 SduTytE3Co/zmNuyjdqLtAa0RUYjpKLB37GCCH8zwidXcOcd22v8CIvObheTmTMIOJn+
 QCO93+gtc0k5k7Nb7o25LfM/OneL3by5rG+KPWr1zWIYzdia6QQTLVi/Ec3iNfnIoZ2T
 1MBKW2PYrXZkRPvkqh9ECXeOdGYkjjPenHOehAzKpPuob/voN80G2T1g1dS4d+OHOfcz
 ceXQ==
X-Gm-Message-State: AOAM533AI/T/tYdXcbN8/Dz2eDZ67zKAutqVpmPn5dwV4zgD0Ns9QfV4
 VdtVTKlmsRX3Qcl0bFYxqy4=
X-Google-Smtp-Source: ABdhPJzldwgc2kxrH5wtzVANy2cVBW5ECVLu6tia3xVeafn3fbqsglZ9TTonfn+hlBGME9/NY5IHcg==
X-Received: by 2002:a05:6000:1542:: with SMTP id 2mr96888wry.4.1623776160088; 
 Tue, 15 Jun 2021 09:56:00 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n13sm21800150wrg.75.2021.06.15.09.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:55:59 -0700 (PDT)
Subject: Re: [PATCH] tests/vm/freebsd: Increase code coverage
To: wainersm@redhat.com, qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>
References: <20210531100348.1655156-1-f4bug@amsat.org>
 <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a1e344e-cc2e-9e4e-87f4-ed3119aacfe5@amsat.org>
Date: Tue, 15 Jun 2021 18:55:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.095,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/21 10:53 PM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 5/31/21 7:03 AM, Philippe Mathieu-Daudé wrote:
>> Install more dependencies to increase code coverage.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tests/vm/freebsd | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> With or without this patch I got an error when `make vm-build-freebsd`.
> It fails to install packages.
> 
> For example, with this patch I got:
> 
> < Output omitted>
> 
> ### Installing packages ...
> Failed to prepare guest environment
> Traceback (most recent call last):
>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 634, in main
>     return vm.build_image(args.image)
>   File "/home/wmoschet/src/qemu/tests/vm/freebsd", line 206, in build_image
>     self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 255, in
> ssh_root_check
>     self._ssh_do(self._config["root_user"], cmd, True)
>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 242, in _ssh_do
>     raise Exception("SSH command failed: %s" % cmd)
> Exception: SSH command failed: pkg install -y git pkgconf bzip2 python37
> ninja bash gmake gsed gettext cyrus-sasl gnutls nettle jpeg-turbo png
> sdl2 gtk3 libxkbcommon pixman libepoxy mesa-libs zstd usbredir
> 
> Is it a known issue?

I'll defer that to Warner, I suppose the package repository got updated
and I am not hitting that because my VM installed them earlier? (Similar
to the problems with Docker packages). Is there a way to use a snapshot
mirror of FreeBSD packages?

