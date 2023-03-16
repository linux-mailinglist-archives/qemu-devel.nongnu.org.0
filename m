Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F66BCD5E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:57:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclI0-0004sB-VR; Thu, 16 Mar 2023 06:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pclHy-0004ra-Qe
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:56:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pclHw-0003dz-Vh
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:56:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l1so1086044wry.12
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678964211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QiAh+y264aJaI4frtKI541OsuoMBfZSaxzXzs9N2XZQ=;
 b=XMxDlD0hIuVvHBmT+viruv9dsP8fwy3kAcO71tHh1xtbpkKCppq8RwpURKX55NCBwG
 GgBKMqHSw76ydTIAlPtRRmnZctMlhp3JFCh5cLY34QJjD/5Mh6qkNcGpoBy1epXvSsiD
 G77Sp1KMhrG+3uVq9s8k4aBc+YM6NQr6xPys7h1zLw1VEvvVWjThSWGJgCwDKLLTT9/T
 Hl6IobJrKY1NujNztTcQNecbEu5InfQPxX3xdFLvG6yTq8b0ACv2oREHzH0BXGAphTTD
 Zmtjz/PuKHOnEK4fdp/0juXori0UGuFbMGgu/D0d5JnbAXD8JekZJ+IvV1GL/FFUPTRn
 idLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678964211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QiAh+y264aJaI4frtKI541OsuoMBfZSaxzXzs9N2XZQ=;
 b=mxCO2Nig0wx2lLjx88crWUGSniV/ekMgc13SuXo/WKFAxO36HEAxvURmEJ85Hey3hd
 9cqIU6Zf4TfuOOHIBPjv7DT+byDg5hz2LjSaFjcb8+h/cynPYBeII38aDji0+lrBTCwI
 oT2qcHRh8KzA+IuAz+8CWbs03WEfv4HVtval8vZY+Y4pgjUH36FODJhBcl2jz2rmkxsv
 dHl1h3B+de4ehWevUcnsH0NEnH16dHEUW3cHvnZNloDzdXZTRSomfaHk7x91QqHcG8VQ
 ybaeEABmv0htPf8w7iPfNgPi5y/rJLlMR4ckCsScWkZDOvRysfIhUr/59zsg/6ED1Cin
 5UBQ==
X-Gm-Message-State: AO0yUKX87TG5op2YqusWaRVTjNR7sN1RfZLtmKIpIFl29QG23bTHn+xs
 Ltv018IGN9Uc3a7wCKILsH6VGg==
X-Google-Smtp-Source: AK7set+NwD2QrW21wn/RPyTmiuVGOukDavjv/EmS/ahVVbUP2yWIfg4+uWGn/CIMrvsDfxcq/oTDZQ==
X-Received: by 2002:a5d:6511:0:b0:2d1:6104:76ab with SMTP id
 x17-20020a5d6511000000b002d1610476abmr2547216wru.2.1678964211056; 
 Thu, 16 Mar 2023 03:56:51 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b002ceaeb24c0asm6975820wrt.58.2023.03.16.03.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 03:56:50 -0700 (PDT)
Message-ID: <333abd8d-035d-b9c9-a934-26876d33d7d0@linaro.org>
Date: Thu, 16 Mar 2023 11:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: dropping 32-bit host support
Content-Language: en-US
To: Andrew Randrianasulu <randrianasulu@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/3/23 11:22, Andrew Randrianasulu wrote:
> чт, 16 мар. 2023 г., 12:17 Andrew Randrianasulu <randrianasulu@gmail.com 
> <mailto:randrianasulu@gmail.com>>:
>     чт, 16 мар. 2023 г., 11:31 Thomas Huth <thuth@redhat.com
>     <mailto:thuth@redhat.com>>:
>         On 16/03/2023 08.36, Philippe Mathieu-Daudé wrote:
>          > On 16/3/23 08:17, Andrew Randrianasulu wrote:
>          >> чт, 16 мар. 2023 г., 10:05 Philippe Mathieu-Daudé
>         <philmd@linaro.org <mailto:philmd@linaro.org>
>          >> <mailto:philmd@linaro.org <mailto:philmd@linaro.org>>>:
>          >>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
>          >>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>
>          >>     <https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>>
>          >>      > <https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>
>          >>     <https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>>>
>          >>      >
>          >>      > ===
>          >>      > System emulation on 32-bit x86 and ARM hosts has been
>         deprecated.
>          >>     The
>          >>      > QEMU project no longer considers 32-bit x86 and ARM
>         support for
>          >>     system
>          >>      > emulation to be an effective use of its limited
>         resources, and thus
>          >>      > intends to discontinue.


> Still, pushing users into endless hw upgrade is no fun:
> 
> https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-makes-more-sense-than-recycling/ <https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-makes-more-sense-than-recycling/>
> 
> note e-waste and energy consumption
> 
> This graph does not make me happy:
> 
> https://ourworldindata.org/grapher/global-energy-substitution?time=earliest..2021 <https://ourworldindata.org/grapher/global-energy-substitution?time=earliest..2021>
> 
> Note this paradox too
> 
> https://en.m.wikipedia.org/wiki/Jevons_paradox 
> <https://en.m.wikipedia.org/wiki/Jevons_paradox>


>          >> [...] I also ran qemu-system-ppc on Huawei Matepad T8 (32
>         bit Android,
>          >> too) for emulating old mac os 9. Yes, I can wait 10 min per
>         guest boot.
>          >> Fedora 36 armhf boots even slower on emulation!
> 
>         Yes, but for such scenarios, you can also use older versions of
>         QEMU, you
>         don't need the latest and greatest shiny QEMU version.

Thomas answer still applies: if you can use QEMU v8.0.0 to emulate
macOS 9 on your Huawei Matepad T8 with 32-bit Android, why worry
about trying to use future QEMU versions?

