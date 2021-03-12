Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD973389F2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:22:14 +0100 (CET)
Received: from localhost ([::1]:56316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKevt-0001YE-7B
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKepd-0001us-6e; Fri, 12 Mar 2021 05:15:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKepZ-0002Kc-Qn; Fri, 12 Mar 2021 05:15:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j7so1450735wrd.1;
 Fri, 12 Mar 2021 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t4Z5rchJiNvz/+ixJpMzOrK7GkoS5jHoTl1AreSJqcM=;
 b=BU5avEEGwCeBII7pouw5TZk2X8j4oeyPumG2YLW68H+6knan1r/8GyKu0Vitq7YdYc
 MrC5qHUBIK+fnK3q4d0qtX2jgBvK56h+0/bJ33Ag+GKOgMkL+fPkCchCGi2Jq6BBFNX2
 PXT0zobzs6/qnsRwv6WXLWpPaZJLaEiVuZ2cWa1RRH2NwHhg5pQu2cIADU9LVyFYIQoR
 XMwatd4ks+hWvvT8fUjemDPDkrXNrIEHMsdeliHvkXMW9Lmbd7PUpTP9GPOTJhPPw0g1
 k0TqfUFMSGosAhyFvgj0IMZeGh/S/i77G0JkPLQgSw3+Vj8d5i2SztDezGBtVjOVNxyr
 qsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t4Z5rchJiNvz/+ixJpMzOrK7GkoS5jHoTl1AreSJqcM=;
 b=Th7vf/EkOeyk1nEVE7A+91O6jlA221YuJJFZqws4+vxNsVdBYACafQ4mrA9Hyf7DCF
 3g6ByLSj2NSrY0ZO3arHurwOU2xMJxPCabIXzAeDg7tvBxEu2qr4xw4sd2pkXslhoqHl
 Q+pfhlZDkub6nFVJHYBhW39DzXT9/yk34jaOW3K/N+WGeO5uBpWUhKaqDImmfqo1maE6
 fFETKs22RM1etkbQtBsNXl3BVR+UT6ygAOWlaNc4/9YoPnScoa6TURyC8599BvqOT2EL
 QqXxCaaHN6Y8JwA7rm7EkJkbvXESOMG2kyLqgqpnWajQCB/wAUHzIFSd9Cu34HERnC9o
 En3w==
X-Gm-Message-State: AOAM532JRuJjEGYw3WAw6OSpQ3BpMz6eEZP6+sBB0vrS2E1ch2N2sKes
 pSG3xErg5tlxv6zDmaeVqr+2lO/3yeU=
X-Google-Smtp-Source: ABdhPJwqEFvJSr2ETchAtkV0kEEqhaMzlk9uQk8l9bi5MABlZNMEueq185ko38jzpt30AO5Wm0pwpg==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr12886773wrp.303.1615544139086; 
 Fri, 12 Mar 2021 02:15:39 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 91sm7828066wrl.20.2021.03.12.02.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 02:15:38 -0800 (PST)
Subject: Re: [PULL 00/22] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210310214504.1183162-1-laurent@vivier.eu>
 <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13bb89f8-7ffd-b22b-d6ee-8b9eb88c9575@amsat.org>
Date: Fri, 12 Mar 2021 11:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 10:52 PM, Laurent Vivier wrote:
> Peter,
> 
> my "git publish" has failed at patch 20 with:
> 
> Requested action aborted
> Mails per session limit exceeded.
> 
> I think my email provider has added new limits :(

With GMail I could pass from the 20/session limit
to the 1000/day limit adding to ~/.gitconfig:

[sendemail]
    smtpServer = smtp.gmail.com
    smtpBatchSize = 1
    smtpReloginDelay = 3

