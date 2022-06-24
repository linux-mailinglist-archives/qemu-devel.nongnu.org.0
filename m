Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89CD559D63
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:35:44 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lLT-0004pK-OP
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4lHI-0002Et-69
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:31:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4lHD-0007BA-Pb
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:31:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id i64so2859406pfc.8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=29W+82SpTKmUsGB9SCuKZg2Hfhtk4R14E32zHi2VUAo=;
 b=bljEhkuAqM/67PyormXbeWFGewNzPe2ltT+ZkRsNeX9Y/jc/TG15TwzzfPLVCPT64D
 nq2v6S3OJYAaxapl3uIp7HDjsJ8QZm5ImM9YQiYStdlxqgnpurj2nflSilX1BQahz3S5
 LFYXzbYkoQM4EoJ2D9ea4KbI0AeEcEXeX8O7yqrNGsT2jJiBL8qkGAPLiiLXntpgUyN9
 IhzyqSEb6IJQ9Oe7y0r4BAKqBtjPdmYjz75VrRfcbEkxjTTUlo8ELzrgL9BClCt9aqRF
 Ww7RN3ZkaCj78cARpwHrmBINIIAsPTuahVQL7aCkMJ6w/PA0sBe/x9RSy1Rgb6sOk0Aq
 jW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=29W+82SpTKmUsGB9SCuKZg2Hfhtk4R14E32zHi2VUAo=;
 b=CXRCRGwaJEN25PhAcIa9KR0S0iNODrV4t9FczVyEp+rPA5mSk0h2ZfOfUjur9BiCAf
 vLWfRp4fyt6d6mqfBOnG99K+mWHD2jz9v046xg93aDLU5MaR2RRLr2mQSEYXGyR5GELY
 TXpQuWiZnzbxFid8c2VmrmvayRHDVfMkRtla8Lc4zehVuuW0FJJPeI7p5LiQ5OSlPGB0
 tvY1wcATlxmIvu9Fomf8++6wgvlYwM6sBWG//cpdh2AYZtVtFdC+2Tm9jgifAIHsAIIt
 0h82PT37FggRA/Vom8tsemGEFriD2QSYa5On9Rd0y+t4CuEmQrIE/AUriTOqr/HZTSIR
 2z1g==
X-Gm-Message-State: AJIora8OztieX3BPwvsOYOHDKuN7qrWP1QpspbObBy/+K0Wa/xvM3n6f
 v0Z85SG/Ko1lLzq0OpXc8q4=
X-Google-Smtp-Source: AGRyM1vyOLdrtAZH6jra7/pkxsqghWQjisU1CHpiupS6S5bH7zqIL30Zq7TXfrCh6k6AGJGG0uWb/w==
X-Received: by 2002:a05:6a02:11a:b0:3fe:ab7:32fb with SMTP id
 bg26-20020a056a02011a00b003fe0ab732fbmr12286731pgb.543.1656084678230; 
 Fri, 24 Jun 2022 08:31:18 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a635745000000b003fdcf361df6sm1738165pgm.87.2022.06.24.08.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:31:17 -0700 (PDT)
Message-ID: <75c27174-98fb-cd45-7aef-43ef40ee8775@gmail.com>
Date: Sat, 25 Jun 2022 00:31:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 0/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220624145039.49929-1-akihiko.odaki@gmail.com>
 <cc7f1005-fe08-320e-0108-8585760de7b5@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <cc7f1005-fe08-320e-0108-8585760de7b5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/06/25 0:26, Paolo Bonzini wrote:
> The only change I'd make (which I can do when queueing the patch) is to 
> change the directory name to something "strange" like "=install", so 
> that it's unlikely to have a directory named like that in the $bindir.
> 
> Any opinions?

Actually I prepended qemu- to the directory because all executables of 
QEMU has the prefix. We can safely say QEMU installation will never 
collide if no file prefixed with qemu- exists in the bindir.

If anyone has an idea what should follow "qemu-", please tell us.

Regards,
Akihiko Odaki

