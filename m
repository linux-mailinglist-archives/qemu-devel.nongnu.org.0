Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A842D3745
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:00:07 +0100 (CET)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmtq-0002Cq-5M
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmq2-0000Os-I5
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:56:10 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmq0-0007xh-KC
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:56:10 -0500
Received: by mail-oi1-x244.google.com with SMTP id s75so535193oih.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 15:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DfyPBy6ACVthl5B4hPAssaAuvv+oOl0RQ7ShELX0PlM=;
 b=LEasbFfoZoL/im+sFywdc4Y3plPW3INbwEcpPaopofCSS993Qz3H96eD9fd/2ANtaC
 lUC4jxoV7ELOeUjh4WSBZE9wwY6rpCdmII4xJ3BHpW8ri4X/VfShw4HJxseHhPc/BrJ+
 zffNFMYyQNcy8hoV5dxfUw1gveda/Uclka44YQYf8r2YVtfGWXXv/qGfoeP9urjwIo9L
 YfDJYq+X4y/yOh9Xec7nUGOHpNHEfEIK3UV/CNsyo8MHMPknkaE8WcRdQuI98e1D9913
 SyGWoGamnFCuHMc43wNJjfCzEC+wCEsFQx9CaKjgmv1//oiMS5BB5YlCC/VdcrVbvAm1
 pETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DfyPBy6ACVthl5B4hPAssaAuvv+oOl0RQ7ShELX0PlM=;
 b=iQ0FGvk7nbdUUq903lwaBnWtKEL+g8O0Eg004sg1Nt6vzsjU8uP4QsW5FOuvqKKLt7
 y+XX5FV9eWNtA5/iagSCHK5Qg3czY6LaGx/MPetkwolXUXC9vI8uVI7NtOkMMQt7Kf9q
 d9T4n9TOG6i9s03TDMw4om9eeVd4ENN1RmHuKbgQue2ku+wuKegQQo9QB7AIeFp5Uf8X
 eBcwdrqiKQbRLSPacpxxtzQ0rbIlBZc63DBgXAEM2HdMxpgx7HOwxsfQTchdjuyRq1B+
 kqJSZpHWTYECxKj7fN0K3XBksWucgzt2WT8nPNzd50N3j9jmfJx1AqS0MKZQhYjT+mFK
 lORw==
X-Gm-Message-State: AOAM530UhTxSIWNVzxUzaAyteGErVGoJWznW7CHxuoG25nOuexMzXGRL
 BTb590EO89skQwVBqIEyY50v4w==
X-Google-Smtp-Source: ABdhPJwIqzDrw5d58apyIC8szvFZUj6p1bI17dw/BcAh1TpJuIN/vl80n62XWPlZNa3rmhfm9lUwGQ==
X-Received: by 2002:aca:c057:: with SMTP id q84mr325534oif.86.1607471767442;
 Tue, 08 Dec 2020 15:56:07 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s189sm92095oia.7.2020.12.08.15.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 15:56:06 -0800 (PST)
Subject: Re: [PATCH 14/17] target/mips: Declare gen_msa/_branch() in
 'translate.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45ab33e0-f00e-097a-74fb-4c7c42e29e33@linaro.org>
Date: Tue, 8 Dec 2020 17:56:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208003702.4088927-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:36 PM, Philippe Mathieu-Daudé wrote:
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

