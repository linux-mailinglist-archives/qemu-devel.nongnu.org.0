Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF62E8C59
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 14:52:33 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw3o8-0007Ms-QG
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 08:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3mN-0006tt-Uv
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:50:43 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3mM-0000sY-IO
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:50:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w5so28231344wrm.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bnPHHmZWFicls6vyMGSiQjTXQ45AbiZWa58qRDvleHc=;
 b=r6frUGYAEdhEEpZY8HyQ5FB0AKBlUoHb+Z4cnUuRi35JyBtQLlguEj4j6tMq39UD7X
 Q6UdO6i/p0NBIsSeHXNNs38F3QnibW0TaBmOb7IfnEsuhpPv6RQ8+MREqS4Y8j7YT5TA
 NPOCT9kL4BfLMaxsitb3wLC+YTsGqrEXNAXHwfV863APtgQ1v0b0dSTJZ2DsTzJjFDqg
 uDbgEBzd9lSpAHo1JX2VXESgiUUydDKVpvH/aMvu7N6/lxPNwY+St3Bx1ngzPR97GrTZ
 mFAttKmxw6r8bd5WPE4Emy5k6eQJmm90nTZpFHg9xJmqhON2XSUfImB2E3zR5YZkIiDl
 pPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bnPHHmZWFicls6vyMGSiQjTXQ45AbiZWa58qRDvleHc=;
 b=BgL37CFuwcQY5blbIEp2aCzIIA7pfFixl6XioxZOSer9isgFpYtzHcLz/+Ix9tNK9J
 Q3C1q3FWOROVG6WJ/6c9JkldRyy6WdHPTnd1Qa0dQ8gTVXwf6QDdFR7svoLfwnwqHRx2
 2XWgamQZSdYR/PVTu1ff8C1Mrs+rVLd/DXu6sYEr+Nk7Tlxw9gjtqDnTyKbDUNKDh2+a
 3S803241ZALcB1PVMEfU2lnn4OKAcXruRE3GUpWq3HxSaqgcpLaeOcIt7AleGyXUZB31
 MQud2CS/0r+d3qyw/+bH7SjCyD8YgWFJRjxv2GriFR8HftqHKNUwRMxXquG31G6Li0I1
 cFnA==
X-Gm-Message-State: AOAM530MoZ1YTd1DzLCAljtzcJYKPEYgXpAhm83h4COczEHRwsBrKF+u
 csKTBdyq6YHkUqMjXbE5BDs=
X-Google-Smtp-Source: ABdhPJzjyws3dvFnnvPOZBeQKY3VlMJlTILg3bOzp/8zsVLNyik85a+Wjqc66qgnnQlprGHyCGkWlg==
X-Received: by 2002:a05:6000:368:: with SMTP id
 f8mr76064554wrf.150.1609681841221; 
 Sun, 03 Jan 2021 05:50:41 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id h20sm93720485wrb.21.2021.01.03.05.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 05:50:40 -0800 (PST)
Subject: Re: [PATCH V19 0/5] mips: Add Loongson-3 machine support
To: Huacai Chen <chenhuacai@kernel.org>
References: <20201221110538.3186646-1-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2276bcea-5c59-a0b2-d21e-47c9f793b614@amsat.org>
Date: Sun, 3 Jan 2021 14:50:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221110538.3186646-1-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 12:05 PM, Huacai Chen wrote:
> Loongson-3 CPU family include Loongson-3A R1/R2/R3/R4 and Loongson-3B
> R1/R2. Loongson-3A R1 is the oldest and its ISA is the smallest, while
> Loongson-3A R4 is the newest and its ISA is almost the superset of all
> others. To reduce complexity, in QEMU we just define two CPU types:
> 
> 1, "Loongson-3A1000" CPU which is corresponding to Loongson-3A R1. It is
>    suitable for TCG because Loongson-3A R1 has fewest ASE.
> 2, "Loongson-3A4000" CPU which is corresponding to Loongson-3A R4. It is
>    suitable for KVM because Loongson-3A R4 has the VZ ASE.

Thank you Huacai for insisting up to this v19 to get
this machine in good shape.

Series applied to mips-next.

Regards,

Phil.

