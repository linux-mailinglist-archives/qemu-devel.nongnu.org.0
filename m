Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A434430565
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 00:27:20 +0200 (CEST)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbs99-0006rO-63
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 18:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mbs70-000695-JG
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 18:25:06 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:23080
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mbs6y-0005xc-Uo
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 18:25:06 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4HWyPF5f0zz8PbN;
 Sat, 16 Oct 2021 18:24:49 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=wNOpyTVpx
 f9eBI4nVESPolEPn1w=; b=E1rz/8JskgDJqi7bPDbfSZk4zjEYivqR3oy70i8CM
 Db7ETvKWIX65YWSaEasRbvX+mkLIgSheNsm+HVB2bziUJmzmqGtsYtiW7oCFaMVL
 /K4dqrxjy4eol6wIrHdcJ1E5y7sfAqG4UBzAMn9IQ8ufthbXP2Hs9MtawWkRPbG9
 90=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=WxI
 SiMN7QLYXcxmOHojaBZX5lUG23bre3fyIQbmS2J+3WLTR9d+4lzjGPbLq1OHBx/w
 H4jssIrl4HyMhQRGCu7PktL2lq01bKFxdK+vwsdOIyZWL6F7NzRFe1ZoNoFZZbMv
 e67YpyrrgE/ET85o3pe5IivmQ31fdth39Cd4NN00=
Received: from [IPV6:2001:470:b050:6:4108:2707:9ffa:126] (unknown
 [IPv6:2001:470:b050:6:4108:2707:9ffa:126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4HWyPF2cqdz8PbK;
 Sat, 16 Oct 2021 18:24:49 -0400 (EDT)
Message-ID: <2844409d-7d02-178b-cd1c-52180506e99a@comstyle.com>
Date: Sat, 16 Oct 2021 18:24:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH] tests/vm/openbsd: Move timezone set to after disk setup
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211013163129.983810-1-richard.henderson@linaro.org>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20211013163129.983810-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Yes, this is the correct order. The timezone question comes after the 
install sets are extracted.

Signed-off-by: Brad Smith <brad@comstyle.com>

On 10/13/2021 12:31 PM, Richard Henderson wrote:
> Currently the install gets stuck waiting for the timezone
> when the installer is waiting on the disk.  Swap the two.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/vm/openbsd | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index c4c78a80f1..cbb4006ef7 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -119,7 +119,6 @@ class OpenBSDVM(basevm.BaseVM):
>           self.console_send("%s\n" % self._config["guest_pass"])
>   
>           self.console_wait_send("Allow root ssh login",    "yes\n")
> -        self.console_wait_send("timezone",                "UTC\n")
>           self.console_wait_send("root disk",               "\n")
>           self.console_wait_send("(W)hole disk",            "\n")
>           self.console_wait_send("(A)uto layout",           "\n")
> @@ -130,6 +129,7 @@ class OpenBSDVM(basevm.BaseVM):
>   
>           self.print_step("Installation started now, this will take a while")
>           self.console_wait_send("Location of sets",        "done\n")
> +        self.console_wait_send("timezone",                "UTC\n")
>   
>           self.console_wait("successfully completed")
>           self.print_step("Installation finished, rebooting")

