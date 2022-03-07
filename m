Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5E4CFD41
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:45:42 +0100 (CET)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBo5-0003rm-0b
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:45:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRBlT-0001A3-Lj
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:42:59 -0500
Received: from [2607:f8b0:4864:20::634] (port=35409
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRBlS-00029d-5c
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:42:59 -0500
Received: by mail-pl1-x634.google.com with SMTP id n15so3521448plh.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4odH6U8Pivs8O7m2aa9H7/TXHdSsws83YkqtYFqBWIE=;
 b=f6mY3e8AgwgaCAwx8V+77YfNwDtssO6k+NJjhxygyPszR9GWtkzyx8PRoxwH/C+2ut
 WQibV1FryBxlSyota48SemF/3Muz7Zy2Hil0GilPtKi6nEKeXWuGxrKpV8MGoMJ0aHHE
 UrkJUshWkbI1YtnIuLyDN5OSASLq/ZZjnbLtniNxof1be9yYaMiukeVo9wiCosKxPn7I
 7EJtJnB+WAUmzBMtsqZCaBIlzqrGRNSlP4cAr4R7A9oZQIjmlAH5sHzf/dD0xcwKwvX2
 YMOYYPDdWSP2pUBYIEwkVx711aSXoxWQ7OiO+818/WcLDxnK2kKA2B9815FfiMmg9NcJ
 JvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4odH6U8Pivs8O7m2aa9H7/TXHdSsws83YkqtYFqBWIE=;
 b=SFdC7jC8lcw/66yPT+9nR0K+WR/Uxf/FLEnQHmddW1nb5F0D5LXiMs3l/2bA2USYAs
 MgIOivHfPIEfQPv+wAj3V6wKQe/QIPfXvPM+UiW9PWE55s9TPODICH9XB6/PelrZTa8e
 awhm9uxOHWSF9qACTlP37zlbT6d2NJKS4lI2CdUO7imHJrvgUvQgafCnGwHh2/07RPaN
 P21s/yg4oAJ8qcS6lnMS/pScRPc+PmJEbD/h/UGMejGS2fzvQq9OJrZ+uIcF6WI13pv8
 8Xf3f4LiUkLU+JKtC9gJMq3r75JC+OAh4rHlQSgpyDdukW/Fpj0hM8xWGZqQDujUI+t/
 7+Cw==
X-Gm-Message-State: AOAM530e33iIORRiok7Mw+CMNSz/4d/NabA3NuyBVO8iOzyKbgKO+18d
 4E1U1UqebVyZbrxiz87QkhSrX47Y794=
X-Google-Smtp-Source: ABdhPJzQQLO6be2ZIssF7axlA+a2QgN6IBEA8iqb7l0e2JlJgorS/d3tc6QkzlupWMono2F3NjaEhg==
X-Received: by 2002:a17:90b:4b07:b0:1bf:5d59:a936 with SMTP id
 lx7-20020a17090b4b0700b001bf5d59a936mr5605229pjb.96.1646653376273; 
 Mon, 07 Mar 2022 03:42:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056a000b4a00b004e12fd48035sm16475842pfo.96.2022.03.07.03.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 03:42:55 -0800 (PST)
Message-ID: <0736a795-334b-2904-5fca-ac8493cfb676@gmail.com>
Date: Mon, 7 Mar 2022 12:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PULL 00/16] MIPS patches for 2022-03-07
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 11:11, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
> 
>    Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/mips-20220307
> 
> for you to fetch changes up to 9be5a9f464c1fc106a4aaf941f7792404c43556d:
> 
>    tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag (2022-03-07 01:35:07 +0100)
> 
> ----------------------------------------------------------------
> MIPS patches queue
> 
> - Fix CP0 cycle counter timing
> - Fix VMState of gt64120 IRQs
> - Long due PIIX4 QOM cleanups
> - ISA IRQ QOM'ification / cleanups
> 
> ----------------------------------------------------------------

Please ignore this PR, I'll send a v2.

