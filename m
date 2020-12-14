Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C902D9A37
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:44:07 +0100 (CET)
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kop54-00050X-3U
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kop2l-0003jz-Dh
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:41:44 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kop2j-0008IK-Ok
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:41:42 -0500
Received: by mail-wr1-x442.google.com with SMTP id a12so16648944wrv.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZKgX/xWUpRlRKIYRtZXL3th3GM7iPy5bWOYaHuo6GfM=;
 b=VBoFP8QpE/zX+oxca7N9aGaOsezDnA2Hor/ID12WGZPhgpPi+0RlAMnwWXnVPK+8OJ
 I36kZhJ5qxXfa0TTViJdZvou+DHv4nnN5O1/Mr7c/iSUUwsxyy+NK0KFUPXZK2ssTLFz
 oQpjvjqyfGTFyJ6A7XUIZ3cgZQy+/iabcBf43oVwzsIUX/DaQi/yXLBdpx0kPeuQLW1S
 kDFpCVSDTFmSPhjE3FbrjZipGtQaflXOPTjn+p4meqfC2dYn+XMuit1Lgs0EVN0v2PQo
 OlUkV3NUjm3m/LrSBNwfa9PflisFFEzF1Emf6xweHy6bB4GuYtLUvStzHpqdKZDY+2CY
 A1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZKgX/xWUpRlRKIYRtZXL3th3GM7iPy5bWOYaHuo6GfM=;
 b=DKjunX6zxDCmOrBZdB9PnGYQXIYCqWQoZrHNRhpmQyQxAD56F4msFY3R0npOjp6bEv
 KcTykO1Q7N9Pb//biYm87weQ/c4kTIto5WmdTkVzDIKX/JbhPEyW6U1DSJcFdNy/GA11
 hzrVOTE2bUM/0z+d6QTCbE6OTYh8h6cmbIqE8YYwkQgy3yYfotn+MyYcwdAvHk6lmIwS
 Pv1EalED0tcKypKp432DVfgRtScjZg9w/kltu5n0FF5PpBbphAfmv61IHjeLXWjLybac
 gEMp+S8dyobNoFmbGoFFmfEQ0RtMIEO2iI560Guof0pdd2J2ZiSbYXN+fU3IEjqlUlzM
 Q1aQ==
X-Gm-Message-State: AOAM5318nwN1MHFvxK0MhfpcyTCf8JfUfziemDxXbBop+t+Q2gpSBkbg
 vRk/7Mibu4KHgWTDFO4VYTU=
X-Google-Smtp-Source: ABdhPJzGbM1jR6fJjH6XoAs7sPvQmsUA0LRcWN4gUClg8diBNpJ2HJBQngAToMkZseyRCDVj9rrQGA==
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr17870387wrn.179.1607956899494; 
 Mon, 14 Dec 2020 06:41:39 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h20sm34321446wrb.21.2020.12.14.06.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 06:41:38 -0800 (PST)
Subject: Re: [PATCH 6/7] target/mips: Declare generic FPU functions in
 'fpu_translate.h'
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201207235539.4070364-1-f4bug@amsat.org>
 <20201207235539.4070364-7-f4bug@amsat.org>
 <23c1eb1b-31de-abdd-26ec-be0142d73eaf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <31534064-6da7-b581-2f4a-e872352e84d1@amsat.org>
Date: Mon, 14 Dec 2020 15:41:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <23c1eb1b-31de-abdd-26ec-be0142d73eaf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 11:54 PM, Richard Henderson wrote:
> On 12/7/20 5:55 PM, Philippe Mathieu-Daudé wrote:
>> Some FPU translation functions / registers can be used by
>> ISA / ASE / extensions out of the big translate.c file.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/fpu_translate.h | 25 +++++++++++++++++++++++++
>>  target/mips/translate.c     | 14 ++++++++------
>>  2 files changed, 33 insertions(+), 6 deletions(-)
>>  create mode 100644 target/mips/fpu_translate.h
> 
> Is there a good reason for not putting these in translate.h?

None :)

