Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C097538C9A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:17:48 +0200 (CEST)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvx4V-0004wt-HM
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvx1I-0003kx-Qv
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:14:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvx1F-0004xj-6Z
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:14:28 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h1so2990461plf.11
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 01:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cx6ZJevI88UT9ZYq3Kr2Cp7hPm+m5GoGiusr8BW9Ml4=;
 b=GTQgWE8+w2AwpOPZQcJ/++jNNRKkmZQlORpS20a0369JWVrAqGyBozhMCICwY2pc9J
 zSO/EPem0rE9hF0FU/JsbqJdw9CZqD+F3sJ7et0m8Fkkpz/GdEtt7A7C6+BUeBGsyUCE
 UolIPHkMBWFjPeVD0VCOBUi7nzzr98ulbvbhXnFTKz8/yOewlW8L0xmF+t8uPmb4MUab
 EYA70TgvgxzHkQSxRsQ8JW++a2IpBz9J9ZDvhXXv28Vgj2d0g1GS2zFSUMkzL3dFQ4wE
 35i0eha31IQnFK/F/yD7bxCyNny2yKucU85TAGMRBPdGa1Qy52y4GAuZYLcSreBbJSD6
 0IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cx6ZJevI88UT9ZYq3Kr2Cp7hPm+m5GoGiusr8BW9Ml4=;
 b=MeKBBmvXA2KdXHxjoNwD2MVe4ONUfQhxjNDBugq0K7cbYF7NlcXjZ2s4k4HZCY8dI5
 tSZTvdZWOgX3P/70MBti1IUv9rcvVUuKAY/lEHefy2BqVutIdzt0CHNXLfLT2XG2GZXJ
 L/TGZ3bIR4lyUChoaMGARDU2ER7xZk7xpC4mHM710YDOpYmlg6Ddx2jo2PKFVfgXMbX2
 /vvxib4YtWt4O3OLo1BjbEICW2PPuoQ+c72NVd2h/MZDPcBMSYAfz5xC2fNPBD5c4tgm
 4I+EuMO+iV2T9UhiR6leur6+l3yV10guLL6lPJvlak68ygd+ckKFC1QvHhDxitUZpDtm
 Iu1g==
X-Gm-Message-State: AOAM532AoSVhzEfGK19IZOfmpENOH4ruLJ7gI+vMfAf9LowN0yWJXsny
 ucuvrMtDLNtBNPDNJ/fohwc=
X-Google-Smtp-Source: ABdhPJx1TUfBF5IYXv21HMppZnA+mfaP1zqYW/Upe1570Ss0as7Lf8BjtaC4Z+YO4sRWho7m8lJ5zw==
X-Received: by 2002:a17:902:f605:b0:14d:9e11:c864 with SMTP id
 n5-20020a170902f60500b0014d9e11c864mr59957359plg.54.1653984863847; 
 Tue, 31 May 2022 01:14:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090282c900b0015e8d4eb269sm4355306plz.179.2022.05.31.01.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 01:14:23 -0700 (PDT)
Message-ID: <36390846-ca71-54e7-e799-834e57e5ce89@amsat.org>
Date: Tue, 31 May 2022 10:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: CTU CAN FD IP core SocketCAN driver - success with mainine Linux
 kernel and mainline QEMU builds
Content-Language: en-US
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>, linux-can@vger.kernel.org,
 qemu-devel@nongnu.org, Marin Jerabek <martin.jerabek01@gmail.com>,
 Ondrej Ille <ondrej.ille@gmail.com>, Jiri Novak <jnovak@fel.cvut.cz>,
 Jaroslav Beran <jara.beran@gmail.com>, Petr Porazil <porazil@pikron.com>,
 Pavel Machek <pavel@ucw.cz>, Drew Fustini <pdp7pdp7@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>, Carsten Emde <c.emde@osadl.org>,
 Matej Vasilevski <matej.vasilevski@gmail.com>,
 =?UTF-8?Q?Jan_Charv=c3=a1t?= <jancharvat.charvat@gmail.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Andrew Dennison <andrew.dennison@motec.com.au>,
 Reiner Zitzmann <zitzmann@can-cia.org>
References: <202205272119.46182.pisa@cmp.felk.cvut.cz>
In-Reply-To: <202205272119.46182.pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 27/5/22 21:19, Pavel Pisa wrote:
> Hello everybody,
> 
> I want to report successful build and test of the CTU CAN FD driver
> from actual Linux kernel mainline GIT on actual QEMU build from
> mainline git. Test on HW from net-next has been repeatedly
> run by Matej Vasilevski during his timestamping patches work.
> 
> Thanks to all who helped, namely Ondrej Ille for his investment
> in the project and rewrite of registers generator to provide
> headers files acceptable for mainline, Marc Kleine-Budde
> for review, integration and cleanup and together with
> Pavel Machek to provide valuable feeback what is not acceptable.

Nice team work, congratulation! :)

> I hope that we will be ready with with timestamping patches
> cleanup for 5.20 merge windows as well as with support
> for HDL sources parameterizable number of Tx buffres.
> 
> In the long term, I consider to use mechanism of software
> virtual FIFO to implement multiqueue Tx support which
> is in the fact needed in all serious CAN applications
> to prevent bus level priority inversion.
> 
> We plan to visit and present on the Embedded World
> in Nuremberg, so I would be happy to meet you there.
> I hope that Carsten Emde and OSADL will pass over
> information where we are available.
> 
> Program for Tuesday afternoon is given already
> Talk QtRvSim – RISC-V Simulator for Computer Architectures
> Classes, June 21, 2022 Session 10.3 – System-on-Chip (SoC)
> Design RISC-V Development (16:00 - 16:30) at Embedded World
> Conference. Our toy there https://github.com/cvut/qtrvsim
> 
> Best wishes,
> 
>                  Pavel Pisa
>      phone:      +420 603531357
>      e-mail:     pisa@cmp.felk.cvut.cz
>      Department of Control Engineering FEE CVUT
>      Karlovo namesti 13, 121 35, Prague 2
>      university: http://control.fel.cvut.cz/
>      personal:   http://cmp.felk.cvut.cz/~pisa
>      projects:   https://www.openhub.net/accounts/ppisa
>      CAN related:http://canbus.pages.fel.cvut.cz/
>      Open Technologies Research Education and Exchange Services
>      https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home
> 
> 


