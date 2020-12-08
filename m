Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C72D36C2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:15:07 +0100 (CET)
Received: from localhost ([::1]:40958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmCB-0000JA-VK
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmls1-0005PE-Me
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:54:09 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlrw-0003Lv-MK
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:54:09 -0500
Received: by mail-ot1-x343.google.com with SMTP id j12so362414ota.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=naAuxiTlTlYmaaUOq7EgPw6gS27NcD7+9riFEuxemwM=;
 b=uuUal6899hgmSVKJ8le8gGP/L6WssC+TCUwO/nBQkRKVKwOcF+3pG8sjdITGQr2dZD
 3z58+RRLtG1SV7xpP9e7UJh6OkRgGSsxDdG6vxqEEZLa7ESvk+viud/jTt0U1pkKWJ2B
 or6eFMVyyYtFz4QFD5zb+QWcDei7WWNVm6ZfRq9HXADej5NflhBbCcisYNf3buGjA8Y1
 qytFOAWQYZuwRqpSNq1sz7Z4e1KOcv92/CfS8SP39lAFDpjVeUEaRwh0NAWOkpWgUfO7
 9RY7pFP1MNR3EJMv/MwI0QEetNg463srIzlU6zziFTd4DcJvHbCDUXopKpXhR4So9l7E
 HDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=naAuxiTlTlYmaaUOq7EgPw6gS27NcD7+9riFEuxemwM=;
 b=FzfvWjqNF1SqWzuSShqiTF7w0YCRh8HbK0di7y7CcYQNjogGAi7IbWraYTw7hs7YPl
 AEK8wV581gvKSc2gWY+BBjryVrXqflT48d3LpO7hRKwNBlcLPzzDzJbg4spRiyXhHh+u
 TcL6c11OL/q47t+WJF4ibLGcXqXzdXLERYSYdt/hnv5T+ISZJdL6h7RtCK2Nr/FYZq6X
 XexdC53sYjq/oo8KxXVakgWouDczfpmLGefmdrLNLAIOWZpouw7DpN0P2HhwRYHYLQ9D
 NPRMF85bii6mZIvMM44Xl0AheZCd7nzSpIVQuzkRuKtMBXbOH2L5iOSb3dXP/oXgHZy/
 I4RA==
X-Gm-Message-State: AOAM531oUGv+yHaD3AdDq87OWiKE3aZWU4tl+u7GvGF2Cxk+Ja5Qr66n
 k/PyYXc2vIablfMkE+hXCdtPtg==
X-Google-Smtp-Source: ABdhPJyKBu6+rpCR7nBMhLy43ocWnnbE1kFSBn0xvq++ymwDW02SzgMmCaFAzNuZe/dQ2bjLbHP6Hg==
X-Received: by 2002:a9d:23e3:: with SMTP id t90mr285417otb.51.1607468041939;
 Tue, 08 Dec 2020 14:54:01 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m47sm94136ooi.12.2020.12.08.14.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:54:01 -0800 (PST)
Subject: Re: [PATCH 5/7] target/mips/fpu_helper: Remove unused headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201207235539.4070364-1-f4bug@amsat.org>
 <20201207235539.4070364-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f64ee653-02b0-7e43-ed3a-12aefc59e2ac@linaro.org>
Date: Tue, 8 Dec 2020 16:53:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207235539.4070364-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 5:55 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/fpu_helper.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


