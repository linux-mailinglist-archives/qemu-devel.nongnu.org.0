Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7E474682
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:33:56 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9oR-0008CR-M2
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:33:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9mv-000746-9B
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:32:21 -0500
Received: from [2a00:1450:4864:20::433] (port=34755
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9mt-0005Th-Aq
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:32:20 -0500
Received: by mail-wr1-x433.google.com with SMTP id j3so33071975wrp.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 07:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+iDPPYJzi/bFJtDzMAdatId/BUXhHhe/GP2GwhGydzo=;
 b=BRlQJB7D4Aop/RuvD95qXxU2eovxYEBnui7+xCrV5Iv5xDmIbTK1L0Bi+mxK7ivOy0
 8+T9eMjfWQ0LZ1XTw95eBMIWL/Ks3MlJToqUt7gBaGYDJHzUV6cunooXdWn4rczG7uSF
 nBmaq/IwRwGbbB+KSqawyzeg3ZIBYK+KkA1nh3YP5Jmnw0GbgLOzJfrRZT/pwq5EmaaC
 JhHE+Ak0Dr1+eU+uotC3yqEJUB3+DlHMl2KQTkaEd1FkdeUyditIJhjTFDMEC8ewz+0b
 /LGoMd40FzT5vtTEC50Gs74EYOao6N5Ppz9vgtB+NmqJ6v256w/o2++5rGe2VMhleYIz
 fiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+iDPPYJzi/bFJtDzMAdatId/BUXhHhe/GP2GwhGydzo=;
 b=0gM5nU5yMjmA7jEFVBUIUW0pQdFhDRSLeeCBCGyiAMmRZXs5oCf6R/S4c5DT43Qbik
 ipf8/uEMHqS9/3nlqSiRejgdUwlVzqzP5XR/PSALxNMvFfbUhfDiZ1RTo6596vXAsEAx
 BrNITQ807Ytm56ZK6xDJ2//HPltrNdmZUDP1CmueGxXqpqQPxDLxq1zid4PXgNaXzxHP
 siM+VlKlFGXlIVv1MnjXEwME7bvvaE6TkPrKike+j/2hSrwsAz4OK997pF3g0Wfuy/JK
 MpY67eJCTaWL0/V3sXrAS30+3hhmrpld3Qw6K2TNSpe20muGQvXMzZBJKBKszxJHeEak
 nAiA==
X-Gm-Message-State: AOAM532B4bum1hmrMDP3ZBiHfbTa6sCLXI8WF6NSt9FMwtOwZwHEqVcM
 TNltosCz1AYJkaJibIXGiEk=
X-Google-Smtp-Source: ABdhPJxmZaxssQlExtlttxdDqSKUiySsLeKCDDh0/2QANZk21qs/qOTh6B5XGH70YHFglof3zCkVHA==
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr6673959wrq.221.1639495937867; 
 Tue, 14 Dec 2021 07:32:17 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e11sm263347wrq.28.2021.12.14.07.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:32:17 -0800 (PST)
Message-ID: <051d4faf-b9a3-e1ee-ab20-cfec327ec7b8@amsat.org>
Date: Tue, 14 Dec 2021 16:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 01/15] linux-user: Untabify all safe-syscall.inc.S
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 01:25, Richard Henderson wrote:
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/aarch64/safe-syscall.inc.S | 110 +++++++-------
>  linux-user/host/arm/safe-syscall.inc.S     | 134 ++++++++---------
>  linux-user/host/i386/safe-syscall.inc.S    | 158 ++++++++++-----------
>  linux-user/host/ppc64/safe-syscall.inc.S   | 134 ++++++++---------
>  linux-user/host/riscv/safe-syscall.inc.S   | 114 +++++++--------
>  linux-user/host/s390x/safe-syscall.inc.S   | 140 +++++++++---------
>  linux-user/host/x86_64/safe-syscall.inc.S  |   2 +-
>  7 files changed, 396 insertions(+), 396 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

