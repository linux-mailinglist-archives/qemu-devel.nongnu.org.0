Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C062D3657
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:36:34 +0100 (CET)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlaz-0000AK-Uh
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkps-0007aG-9P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:47:52 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:46346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkpn-0005pk-3o
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:47:49 -0500
Received: by mail-oo1-xc41.google.com with SMTP id w9so4363094ooh.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tRBPhLC+NGfiAmS7m8yNwXRy/3gRpYucgLpHNvGofpU=;
 b=B0YiqWusVn0IWVNiLos72WOSPHE7fUE/SOfmAAQsvoTXLuXPE2VWbse+DaNvC1ymDo
 rn+UrFJ48Gj1vTrBJAWgOxaNABr+6YqJ6U5J2e+5mUSXc8igysfKjiDSF6DC5s6isJIk
 glHlDXPUfXWfWE4m9zIQCxIOuiqi75w1wVLDvS24Vn/teK42B5Tvx3Gkr1nm4nQmNiHe
 VdlIx3hx/X/ROEMqJOhwZLzzPLLocLFK7swjQgFVD6zXkQV73ErYdS8MTNKT38PaSg4f
 yHzddvyEfIkMshUDRK1+L9XlHCh3Y7nQ7fiOKbaOyylK6gaaLDvVpg9IGLL7dGuDcr8n
 SLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tRBPhLC+NGfiAmS7m8yNwXRy/3gRpYucgLpHNvGofpU=;
 b=p6Uo/AhcNe7SafNE3xwE8SV9X/qsg6ZG/UbdJHQlS4cXnbOwTb5lv+rLPjmO6GzDWi
 vQWWU5f5Eq2xjw5fjZWPuFvNoHcH4y0yu9YxfsMsmYJFrhewyJUNj71GdOEZZ7tfNm02
 gPj2Ds8OooKsw511RBjTrYx7JWozBzYvvS90ZJEHm19UKmdWxU654C1ovaQCZCpOHlvs
 4AlwiJuZ/T10s04vEfOrFQbludLdSOfJ88q7BTraglXfKQoBZ46FKloZQtmFNhYLtrl9
 StzLauv2IQG9cDCp/gc3YfrT8NrBhRZEA5lkiKvPwwBgO6bviLCMDjveh+C8DR2683OE
 DTqA==
X-Gm-Message-State: AOAM531FRShPqtk3MpDpD93FDOvnc/+VYOMto6VNinhHtPe0mMirTeeH
 +JaSLXugp+FwoWxb4obKkcg+bg==
X-Google-Smtp-Source: ABdhPJwuXdEIcaHz6j/HiK1O8PUcxirP96fQtjoialThuORemN3i62AcO8Zo2bfHm4zF8QedoiYqjA==
X-Received: by 2002:a4a:dc1:: with SMTP id 184mr29178oob.40.1607464065889;
 Tue, 08 Dec 2020 13:47:45 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 11sm1761oty.65.2020.12.08.13.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:47:45 -0800 (PST)
Subject: Re: [PATCH 02/19] target/mips: Remove unused headers from translate.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93623a8b-638e-856b-815c-cfdcf3db3c17@linaro.org>
Date: Tue, 8 Dec 2020 15:47:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

