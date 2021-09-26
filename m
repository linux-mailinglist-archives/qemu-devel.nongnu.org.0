Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440EA4186C9
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 08:53:04 +0200 (CEST)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUO23-0005Ua-1H
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 02:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUNzf-0004NX-1D
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 02:50:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUNzc-0007Dr-Cl
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 02:50:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s21so983363wra.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WaKuTKcj36YQUxvYAZy8EyJV7goX3d/v1JJ42QFjZTs=;
 b=TFHdREdtkul+bwTCWrF8okeEm7J6raiUc3xDkz6F60uFaLT9AILw6KwPZq7jItNVQO
 1XP8xIVxwyUnx9mrQDNAisdex7yIqPyStuZ4Gv/SxLtaGmIIRwJrSLpXXAjVOTCAC+Wp
 MeiNr1rvE7Qj/BqLxASpHVi48ZiTDodVYLyjBS1ShCgmsVrBhe5loa71WcPp9avhPXgt
 uRTJk+G8Hz78G/Co9MQHVrLdNy4ip1iY6KVIPB6YsLhwnQvaordDvnaJtDek8ZBJbxgg
 +aPQXBSclZYFOk8k4+HFhMYLcjCpo+Ecko5//+QT2vRbMN0kAj+XED1HJmh/Ap2YQdRI
 Wahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WaKuTKcj36YQUxvYAZy8EyJV7goX3d/v1JJ42QFjZTs=;
 b=tVr4vLKbHuNDUtMtw3/zJO0MrJm+wRaWTuRANZo6lmO5gCSAIVhH7CaReAS6GqF+tp
 Xb7tDNaRX2zjMhcLC6SPcDZLyoGX6+mfjGtxAmqpPFAC4Wz9Na9iaYTrzH6KhL8EJfcF
 3BQpaS/8Cf7AURkxKzbzgZYuTaLo8vDvWUivB05Xri2hI7C+8+wG+zM/UpS48sDg7aQE
 bc2vDddOTbJEXmZIl8eV+3N/16et0UfK9KnOR1WfIQkEnBNlmJHBSCiXE7rmg0yoIx6q
 6IpG1iIS1XAflr7Bjlc/MvA/QbY2Esy6f4w9GKU9F+hkdrSPSBLYEm8X+o6wDr3u+CzN
 VULA==
X-Gm-Message-State: AOAM531vbslwGqEfXVo8HKogZMPsAx7Y39e8FCJA8/mp3V6RqE39eMl/
 abVBkWTfSAdYKOX6gzQ7fag=
X-Google-Smtp-Source: ABdhPJz1ZbOY/raMtc3mOigJAYP1qgooKHNUH1IXsnsdrJ9mODZpPu31ysLSupNc/LxggfFUpspKtQ==
X-Received: by 2002:adf:ef07:: with SMTP id e7mr21081915wro.56.1632639029965; 
 Sat, 25 Sep 2021 23:50:29 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h7sm4823292wrx.14.2021.09.25.23.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 23:50:29 -0700 (PDT)
Message-ID: <0da20601-ff95-edb3-d905-6572f85bf2fe@amsat.org>
Date: Sun, 26 Sep 2021 08:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 14/30] tcg/loongarch64: Implement bswap{16,32,64} ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-15-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210925173032.2434906-15-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 19:30, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
>  tcg/loongarch64/tcg-target.h     | 10 +++++-----
>  2 files changed, 37 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

