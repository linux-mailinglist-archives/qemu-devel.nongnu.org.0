Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E26763E2
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 05:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJ5tt-0006At-VQ; Fri, 20 Jan 2023 23:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pJ5tr-0006Ag-Qb
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 23:54:43 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pJ5tq-0006ev-3P
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 23:54:43 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4NzPD2109dz8PbP;
 Fri, 20 Jan 2023 23:54:26 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=NsyJbQbFI
 il8564vjbNd/kpqGdo=; b=qQQb24p1J7Z4uTcLFRG3aPHv566qTSyiCvlIrln/r
 7Jej8v11od1JeXW2FbdBiyAySqSTgMD1RZyFoAhdsLL5JRgOVL2YCS6DyyB6bsU9
 wBIq6FRqaqTuHSbicUIcrFSxkbM1qnnnNHByHw3lEErBMtkPs4tZM/IsFcbDbULL
 6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=gIk
 I6VcR0vB6FQvBUEnGiVggi1j8ow4mZjPFOKwFZTaOM6/fUjVQ6Pw1pS++KOSByrS
 dGE6PR8Dw0GRcrExLfbscvuiL5cdf769RWBAyxPoxmABe1Ks9vWBAms5QCwNo0Kj
 ZxiXTUJ5bXfoyTfyLa5U+aKeHsTnmpXSm8Dtmmg4=
Received: from [IPV6:2001:470:b050:6:4dce:58f9:3c2d:1020] (unknown
 [IPv6:2001:470:b050:6:4dce:58f9:3c2d:1020])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4NzPD14CY5z8PbN;
 Fri, 20 Jan 2023 23:54:25 -0500 (EST)
Message-ID: <50a335c1-6fa4-0b41-f535-2f8c695c1bd7@comstyle.com>
Date: Fri, 20 Jan 2023 23:54:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101
 Thunderbird/109.0
Subject: Re: [PULL 4/9] MAINTAINERS: Remove bouncing mail address from Kamil
 Rytarowski
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20230118113418.1650416-1-thuth@redhat.com>
 <20230118113418.1650416-5-thuth@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20230118113418.1650416-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I e-mailed his business address and received a bounce back from Google 
saying the account
does not exist.

On 1/18/2023 6:34 AM, Thomas Huth wrote:
> When sending mail to Kamil's address, it's bouncing with a message
> that the mailbox is full. This already happens since summer 2022,
> and the last message that Kamil sent to the qemu-devel mailing list
> is from November 2021 (as far as I can see), so we unfortunately
> have to assume that this e-mail address is not valid anymore.
>
> Message-Id: <20230113081735.1148057-1-thuth@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fe50d01e3..08ad1e5341 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -511,7 +511,6 @@ F: target/i386/hax/
>   Guest CPU Cores (NVMM)
>   ----------------------
>   NetBSD Virtual Machine Monitor (NVMM) CPU support
> -M: Kamil Rytarowski <kamil@netbsd.org>
>   M: Reinoud Zandijk <reinoud@netbsd.org>
>   S: Maintained
>   F: include/sysemu/nvmm.h
> @@ -536,7 +535,6 @@ F: util/*posix*.c
>   F: include/qemu/*posix*.h
>   
>   NETBSD
> -M: Kamil Rytarowski <kamil@netbsd.org>
>   M: Reinoud Zandijk <reinoud@netbsd.org>
>   M: Ryo ONODERA <ryoon@netbsd.org>
>   S: Maintained

