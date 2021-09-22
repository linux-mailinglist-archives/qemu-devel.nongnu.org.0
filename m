Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19566415079
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:29:27 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7vp-00080F-W0
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7Kt-00033U-Sz
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:51:16 -0400
Received: from [115.28.160.31] (port=40934 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7Kq-0006rS-EW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:51:15 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6EB6A63413;
 Thu, 23 Sep 2021 02:51:07 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632336667; bh=hY5hwqlOEgaowLoI8Hc45Z7sDkdyAyQLm1CBDPbsrsw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hIzFDmehzS0Tq+Pk+PJ0LZZQ0Faoi1/Rii/Egq/uZVddMLP5i6GaxWEwgkBnLqnGr
 W2gkWgiklZqL7cU1IKE0ho2jHDIs/XAU3gYXKE4esqNuh1FGgsQJPho9Gcbrncmx3y
 whPVWDEqvx1LIeBMaRwTe90t941ds1BrR++d0d/0=
Message-ID: <47989395-3dbe-ef72-4037-a23fcb5cd15a@xen0n.name>
Date: Thu, 23 Sep 2021 02:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v3 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-5-git@xen0n.name>
 <c3bb4d03-62bb-5b5e-caa4-7c8a90059eac@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <c3bb4d03-62bb-5b5e-caa4-7c8a90059eac@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/23/21 02:37, Philippe Mathieu-Daudé wrote:
> On 9/22/21 20:09, WANG Xuerui wrote:
>> <snip>
>
> The generated code ...
>
>> <snip>
>
> ... ends here, right? ...
>
>> <snip>
>
> ... or are these helpers also generated?

I actively hate writing these by hand, so of course the whole file is 
auto-generated with some quick Go scripting in that repo. Even including 
auto-formatting with clang-format so I could directly pipe the output 
into this file...


