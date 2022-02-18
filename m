Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC84BC280
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 23:17:34 +0100 (CET)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLBZF-0003up-4N
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 17:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nLBX4-00036z-Jd
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 17:15:18 -0500
Received: from [2607:f8b0:4864:20::102b] (port=34433
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nLBWh-0002Yq-UE
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 17:15:18 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso8761849pjb.1
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 14:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cPakRrj0MSVFNvEMSPsO+gFj3WFLNvssYI0/A7sInok=;
 b=Rvxkz36YBLhInOab4iAHF1CFkHjQyQg4s+HMQ07j16nvF605hqKbmNw+Odr3Z0OlIf
 qy3iTB1lywu92QNl5P4w/NbucEq148O6uopIaS+bO/WcUnnkp2LidjQuoQMD/4f9D8gl
 wYsycU9SlGkQVv+l0JtQVLB1bYB4Syy8y1+Nfg8pOUUIpvO+vdp277VH7efWByAxxD7m
 ScRzrrr0p01T6RL5QRohFDee9AWkP32kb9ZwMuqlN7RRXQP+Zo+YznEa+tU3hxqF1bSZ
 a8KeeUE3OMfRAHMFmCzY29JpQR2jXP6sfxIl0Gx+GMGlqejq/0rDSbFRpxZhqJMsd6/I
 lw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cPakRrj0MSVFNvEMSPsO+gFj3WFLNvssYI0/A7sInok=;
 b=fpWiZQQpU5JZyIWdkWbbWYYOlmFqwBfxmOOdAdrtWx64cFxDrAs6VAxTgmBfJxXYbV
 TCsCcdXS6BRNRoPoELhW9lTzBovIov8FO3Zx5Ww5oQxx9kmmxRI8U7GaDxfIFn5rqhMR
 y7tiVL/f8ihqBZ033I8T/Fi/sk+YUvAlCxXBqd2vv1RSqmSuZGSpRhLJypUifNiGVFog
 cl3c3EZNoPERagzTCfdbv7281xi0DBuPynzcmBzhOWI3QsD54dPDdq+LKq34i1WrlwQe
 5qRDe6yZnpUvY3Iz34wBhZkLmSHb/40BDBZlkDEGOAfN8IPr8+B8JScs++cAAHZmAw4N
 htuQ==
X-Gm-Message-State: AOAM532Sqcni5SMQ0AI/d70tno0T5V5MjA8qFqfvnbKpjpMwvPgSySHU
 xF+moytgHpdR/fwqaySjNec=
X-Google-Smtp-Source: ABdhPJzB/1+M0govLC9PZSJbcf2JIRCWF2v3AZusC8QCp4wB+eeHOqo4Eh0aguSU+8XjYDHeKlrCNQ==
X-Received: by 2002:a17:902:ee51:b0:14d:36d6:3cfb with SMTP id
 17-20020a170902ee5100b0014d36d63cfbmr9413670plo.121.1645222494407; 
 Fri, 18 Feb 2022 14:14:54 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id h5sm3856745pfc.69.2022.02.18.14.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 14:14:54 -0800 (PST)
Message-ID: <59b4fb65-10b6-8d4b-e257-cea50381f168@amsat.org>
Date: Fri, 18 Feb 2022 23:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: configure: How to pass flags to the Objective-C compiler?
Content-Language: en-US
To: Joshua Seaton <josh.a.seaton@gmail.com>, qemu-devel@nongnu.org
References: <CAPbYy+_XEvLYuPa5jgMde7YAgk2Cx4wDi=QnJiLn9zT5ALjROA@mail.gmail.com>
In-Reply-To: <CAPbYy+_XEvLYuPa5jgMde7YAgk2Cx4wDi=QnJiLn9zT5ALjROA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
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

Hi Joshua,

On 18/2/22 22:58, Joshua Seaton wrote:
> Hi all,
> 
> How does one pass Objective-C compilation flags (e.g., a sysroot
> specification) when configuring/building? `configure` exposes
> `--extra-cflags` and `--extra-cxxflags` for C/C++ compilation, but
> there isn't an equivalent for Objective-C.

You can use this patch (which is going to be merged soon):
https://lore.kernel.org/qemu-devel/20220215080307.69550-3-f4bug@amsat.org/

> In my particular case, I'd like to specify a particular sysroot for a
> macOS build.

Regards,

Phil.


