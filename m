Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E5413705
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:13:14 +0200 (CEST)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSiOP-0003py-Bt
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSiKp-0000w4-DV
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:09:31 -0400
Received: from [115.28.160.31] (port=53514 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSiKm-0004Hh-6v
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:09:30 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 88C0B600FF;
 Wed, 22 Sep 2021 00:09:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632240560; bh=ok70pgASaD0gEMaQUOYdPcamIUfxDdb5BNehopLef7k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XYULna6ToxR6uLgmU2hX2atFVaWtkCLzQ+WF+Ovt2UWzdLukwbtJHlBtEQ2sr1W6A
 RRDlZd1UsYytwxImnoG6lC2UWOCw3aezWtnnsK68VO3aLUnyTaRVRLfqTWYS/nsfim
 k+lUIk1/ShoF7b0KGrRJiAqt67RZ4oLl2oxXDogQ=
Message-ID: <af8eb7dc-f194-aae8-f3ac-544c88d46e5d@xen0n.name>
Date: Wed, 22 Sep 2021 00:09:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
 <CAFEAcA9QPxceBR4hn8FpNbX44y3d28rRmyzrkEABU8dChdBqtw@mail.gmail.com>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <CAFEAcA9QPxceBR4hn8FpNbX44y3d28rRmyzrkEABU8dChdBqtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 9/21/21 22:42, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 18:25, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> Be consistent with loongarch or loongarch64 everywhere.
>>
>> If there's no loongarch32, and never will be, then there's probably no point in keeping
>> the '64' suffix.
> What does Linux 'uname -m' call the architecture, and what is the
> name in the gcc triplet? Generally I think we should prefer to follow
> those precedents (which hopefully don't point in different directions)
> rather than making up our own architecture names.

uname -m says "loongarch64", the GNU triple arch name is also 
"loongarch64". I'd say it's similar to the situation of RISC-V or MIPS; 
except that a Linux port to the 32-bit variant of LoongArch might not 
happen, precluding a QEMU port.

I think cpu=loongarch64 but ARCH=loongarch should be okay; at least it's 
better than, say, the Go language or Gentoo, where this architecture is 
named "loong64" and "loong"; or the binutils internals where it's "larch".

>
> thanks
> -- PMM

