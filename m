Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C15412F3B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:19:07 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSa3W-00051S-OL
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSZkf-00077l-1i
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:59:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSZkd-0007lb-H3
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:59:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id d21so36061319wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8XJaYLsk9LpYy61p8+3B0j6G+YcsjYQS0NivtEB/Rts=;
 b=qRRGq6yFiSlIdy8up9aHYuqrsI7mN9MT/qHuAiyL/o+gyA/gZBXizR31ZpgtoTkmvj
 O7LM5Zk0s0zTFrmtR+a2uMIiBENuBiZapK4bb+/RkEjR3xYSIOslkuso5vTXoOxmqKEJ
 wQ4Zfq2FO22M/8L46whoEw6SPcE5xlDZR64vBDNn2zYP+4NgXi6n/0yc4kNdDChbtfF4
 CSVIXLKB3OGO3i1QutgjjvbIVmRq3YbJk77pGTnWhI9f9Rlz/ZQLA+MdA7MK3Z/jolP2
 GL/K+4/oDUEiNktjDgAousiLJ5VXoj5pGGsj1ZcI8zb0PG5cmZaCJwAe7A2e64M4/zAz
 TiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8XJaYLsk9LpYy61p8+3B0j6G+YcsjYQS0NivtEB/Rts=;
 b=NkgH7Pg85Gwc2YRLoRYu+2phiYYmE5YfXf3KEazqOXFQWeJKc02JXsS2HMw5QvuLKx
 Sxs5OVhuOZpM7iJhpAjen4SV5zD97Z1ikQQrNkefSx/Kb3m/mFvygcjohjeGwvuFCd+U
 RvW4E+qOEdT+PwAguNDhoVCNW0TyxoioXXjUtUZcZmUEebXFkiHlGueLey/aBFsXso/e
 4Lt82zH8zIQI0JeAJblLCNQEzD8c2f/UMsyJ21c2BfeIg3QagNOvozFegZudp7x1cBNH
 4V8zLVQLmz3uWq+yg2PIimgafjuesna/8voWIWZ88zQQJNbtylWS29dDyuqiIcoTu+P8
 QD8Q==
X-Gm-Message-State: AOAM530DKcEdptoCAth/6xpBTesDiZfp5UGqypk8l4vuYPT7id4ERWY5
 ywG4q29vKIv+sCgQKdicSio=
X-Google-Smtp-Source: ABdhPJxdAzCEbUt6oFbrDNQTyw7qgCSWlPe0PZ/Xy5q3PhPH0T5Brauuk6pZVupPo4ZRbx15UHIJdw==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr10229868wrq.6.1632207574045;
 Mon, 20 Sep 2021 23:59:34 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s14sm1681044wmc.25.2021.09.20.23.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 23:59:33 -0700 (PDT)
Message-ID: <1361ef78-1ac4-8d64-2897-3e3b5c7ef3bd@amsat.org>
Date: Tue, 21 Sep 2021 08:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
 <baa4bcf7-9e4f-1745-5957-6d715a14f711@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <baa4bcf7-9e4f-1745-5957-6d715a14f711@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 08:02, WANG Xuerui wrote:
> On 9/21/21 01:23, Richard Henderson wrote:
>> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>>> ---
>>>   configure   | 4 +++-
>>>   meson.build | 4 +++-
>>>   2 files changed, 6 insertions(+), 2 deletions(-)

>> If there's no loongarch32, and never will be, then there's probably no 
>> point in keeping the '64' suffix.
> 
> The loongarch32 tuple will most certainly come into existence some time 
> in the future, but probably bare-metal-only and without a Linux port 
> AFAIK. That's a point the Loongson people and I didn't communicate well, 
> apologizes for that. (While we're at it, the reserved "loongarchx32" 
> which is x32/n32-like, most likely will never exist.)

Are you trying to beat MIPS at their ABI complexity? /s

