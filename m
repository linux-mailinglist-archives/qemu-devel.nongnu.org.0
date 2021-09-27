Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0E418DDA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 05:02:06 +0200 (CEST)
Received: from localhost ([::1]:51072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUgu5-0000ej-FV
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 23:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1mUgrq-0008BE-HM; Sun, 26 Sep 2021 22:59:46 -0400
Received: from [115.28.160.31] (port=50876 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1mUgrm-0002XD-2V; Sun, 26 Sep 2021 22:59:46 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4718860B53;
 Mon, 27 Sep 2021 10:59:32 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632711572; bh=d9zeiC3dHTH7FGLHG/L42LUIvVA8SMcli69vOMyHDrQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uW3X7R/WFqoI7x7UF3i6UkUyYmvoZTtb0LnD//cqvPcdOPvxVdoEgJ0sRgOgPUtSJ
 uOHuK2KabMOuqAxO28yzxLVac9H3b9D3zWgZopGthhmpNfzsizx+Pw/MNdwSpwj9hJ
 4ZBTW8Nctn8/jAvYmHvL3Egnm03c6m9844BguX7A=
Message-ID: <3e568166-8a73-7c1e-9d83-38b907fab39d@xen0n.name>
Date: Mon, 27 Sep 2021 10:59:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <92569fc0-2c0e-fa91-d9c8-d1345741a68b@xen0n.name>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <92569fc0-2c0e-fa91-d9c8-d1345741a68b@xen0n.name>
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 10:42, WANG Xuerui wrote:

> On 9/27/21 06:01, Philippe Mathieu-Daudé wrote:
>> Reported-by: Warner Losh <imp@bsdimp.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   bsd-user/meson.build | 4 ++++
>>   1 file changed, 4 insertions(+)
>
> I'm newcomer here, but this is just 4 lines of Meson, and two similar 
> usages already exist within QEMU proper so...
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
>
>
Hmm, other replies pointed out that one can also make the top-level 
subdir() call conditional... And we seem to have more than 2 usages 
following the latter pattern instead. However putting the conditional in 
sub-directory makes the logic localized, which is arguably more friendly 
to someone casually browsing the source code.

As both ways work, I think maybe being consistent and moving things to 
top-level meson.build has more value?


