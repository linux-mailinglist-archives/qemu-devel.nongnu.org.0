Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A612DB727
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:35:18 +0100 (CET)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJqf-0003LJ-3q
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJT8-0004VW-FB
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:11:00 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJT6-00062X-Pq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:10:58 -0500
Received: by mail-ot1-x343.google.com with SMTP id f16so21082427otl.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wTMQDLsyjqLUPdBjNd2tYsE4oew6FnlOhnAcVZzKNgU=;
 b=Xpc3DrAJ4PRP1g8NNA95kpEHtyrpHPvJaGCBbofubsxIrI7kjaSbqTWWPvWeqXFtW0
 +0WWKGn8hMRkHXeoa63PiY3RnhcraTkHJ3ecW4daktBOmGCjmTsvai5NKIlvm1y7o20v
 i5TV/EVXy0nmGx6J4O/u49W1Px6d+sijPRq01B+KU2/bfyKgs3ftdunXshclQox9eNwr
 AC+8caMMhjRdHaKjLS44LzV8SZD4+Bu0ObTfEaUhEzAXpb2pVuaqSWbnrxO/rFQqAo+j
 zFjgIdxK1LIXV6DV7m+xY1MclAPMutdO6W6yK7lM9wQbqOuhkfYbQ7gEEEP+QrxKNVPC
 GOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wTMQDLsyjqLUPdBjNd2tYsE4oew6FnlOhnAcVZzKNgU=;
 b=VQPnaCvqEGQUm8uYgXRMBEtKGNCeAabjMInXceYSi50X3FeNCZPrQXkdty03q0nXGJ
 Y8MBIYs0CfXd1NVvI6MHBBD7onhYA5lrknKTklazNMfz6XpxwDhYwgWTvDNLIgIBZYTv
 uDzyVtheW3kl8GHKN/yHiQzmKYLQottQaeIVIIMCEp/qQHD8osej86+l/wLD+BzIsqaf
 bEsisgeWJcFHkcSbOJ4BQ2NLBpuxeiFMcXo3AHEGoJVMvc3mE6iVLwsCgGXEENh5pAu4
 NG7pRymP9eX6MWdLHJxxsC7YRlZ1SU5KYYSkI01pv7QmceEIrROUIrTwNovFhjjHBuPL
 /nuA==
X-Gm-Message-State: AOAM531m+4zseusgiGhvhUI5wnZ6PZOYblwZQKcYX+aYANW0ubrSNS2u
 BLkOoc5/a7uYl6Ho14nfrkI9oA==
X-Google-Smtp-Source: ABdhPJwqtGGljFISM+gVi4Q2iK6ihzuMOgL1IrxJPWgK18uVDmsw7qct1hUIIKFAYWS0mCnlfNN8KQ==
X-Received: by 2002:a05:6830:458:: with SMTP id
 d24mr24416668otc.163.1608073855396; 
 Tue, 15 Dec 2020 15:10:55 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d62sm75839oia.6.2020.12.15.15.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:10:54 -0800 (PST)
Subject: Re: [PATCH v2 17/24] target/mips: Declare gen_msa/_branch() in
 'translate.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00d52bce-ad68-6465-cdc4-e34faa6cf4d1@linaro.org>
Date: Tue, 15 Dec 2020 17:10:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-18-f4bug@amsat.org>
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
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> Make gen_msa() and gen_msa_branch() public declarations
> so we can keep calling them once extracted from the big
> translate.c in the next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 2 ++
>  target/mips/translate.c | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

