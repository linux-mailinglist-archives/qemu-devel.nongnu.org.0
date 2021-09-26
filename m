Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CAA4189ED
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 17:18:44 +0200 (CEST)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUVvP-0003Vx-Fq
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUVry-0001ML-HQ
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 11:15:10 -0400
Received: from [115.28.160.31] (port=43042 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUVrv-0007rx-1k
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 11:15:10 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8DD8660B51;
 Sun, 26 Sep 2021 23:14:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632669295; bh=OloHPV64Z/+Usmi0WFwJtVmoPbUAwYQgkqlJxNp9tD8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tAlW6cATCyHTlYsKuZWcgqJgI3OTfizZ1Xa5xGK2nO51iPz2SHLc3ELDgbUQNePRf
 Jolu4eUjsnJCQ73qpHV/rzSA47QdJGq9gQDJqiSz1JkSWTNTrp2yCxFeFK9JrpyFPV
 6I6GNHafBYW487CHYPNfr8WIx3YDqzWuqW2GHMqM=
Message-ID: <48a408cf-91e9-76ce-a2e3-8000f5177d2c@xen0n.name>
Date: Sun, 26 Sep 2021 23:14:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: Add LoongArch support to RISU?
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Song Gao <gaosong@loongson.cn>
References: <e5d5a725-d2f3-8866-4882-11632adb6f52@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <e5d5a725-d2f3-8866-4882-11632adb6f52@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(also adding qemu-devel to Cc)

On 9/26/21 16:25, Philippe Mathieu-Daudé wrote:
> Hi Xuerui,
>
> Looking at the script [1] used in your series adding LoongArch TCG
> backend [2], I think all the bits are in place to also generate most
> of the files required to run RISU [3] and use it to be able to test
> Song Gao's LoongArch TCG frontend [4].
I skimmed over the source code in the afternoon, and indeed the 
encodings are textbook example of what should be auto-generated. However 
I didn't find the DSL syntax to be particularly palatable... maybe I was 
just reading a bit too quickly though.
> Do you know developers / companies who might be interested in working
> on this?

As Song replied, Loongson Corporation should be very interested in 
testing their own offerings. This collaboration is exactly what we as a 
community strive for, and I'll happily review any code here or in 
loongarch-opcodes repo for that.

>
> Regards,
>
> Phil.
>
> [1] genqemutcgdefs from
> https://github.com/loongson-community/loongarch-opcodes
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg06601.html
> [3] https://git.linaro.org/people/pmaydell/risu.git/tree/README
> [4] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04558.html

