Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6E69A9E2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSybz-0005Mi-Qx; Fri, 17 Feb 2023 06:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pSybx-0005MX-Rr
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:09:05 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pSybw-0008V9-7O
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:09:05 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D52151FE6D;
 Fri, 17 Feb 2023 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676632142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwqhDemca5tm6ozGAVKjVcQtbQL2r9vAx58cA7M/m0w=;
 b=i+lbLEc8D2VbJtqzmhdUmPUNGVY9K9zygxvIZ631+/LFVm8EK/ZRb3QKrVVN4ZQ9GLFgOx
 I1MTiO+jQTwOBrokYfktF+gLUjEPl8lb1wawBAuXO5ZQSi6UGVSXizz2LcQodeKwjGgN+q
 ZixlFlfKvLHXQznvA2OA0rY6gLGM738=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676632142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwqhDemca5tm6ozGAVKjVcQtbQL2r9vAx58cA7M/m0w=;
 b=iFix+Qr+1X7ld87bRXZOdtADBbehvWrz0IT0oK07XQDRj6f0aP4qDgnjn0xkTLi57KgrDd
 P/GXkfOTSIZvoEDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AABF138E3;
 Fri, 17 Feb 2023 11:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7KqRHE5g72MPQgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 17 Feb 2023 11:09:02 +0000
Message-ID: <5c2a4cc1-78c8-e2f8-4d0e-fde9a9d42eb7@suse.de>
Date: Fri, 17 Feb 2023 12:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
References: <20230130114428.1297295-1-thuth@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20230130114428.1297295-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/30/23 12:44, Thomas Huth wrote:
> Testing 32-bit host OS support takes a lot of precious time during the QEMU
> contiguous integration tests, and considering that many OS vendors stopped
> shipping 32-bit variants of their OS distributions and most hardware from
> the past >10 years is capable of 64-bit, keeping the 32-bit support alive
> is an inadequate burden for the QEMU project. Let's mark the 32-bit
> support as deprecated so we can drop it after a while - this will help
> us to cut down our limited CI minutes in the gitlab CI, for example.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 9f1bbc495d..ce6463e72b 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -181,9 +181,20 @@ As Debian 10 ("Buster") moved into LTS the big endian 32 bit version of
>  MIPS moved out of support making it hard to maintain our
>  cross-compilation CI tests of the architecture. As we no longer have
>  CI coverage support may bitrot away before the deprecation process
> -completes. The little endian variants of MIPS (both 32 and 64 bit) are
> +completes. The little endian variants of MIPS are
>  still a supported host architecture.
>  
> +32-bit host operating systems (since 8.0)
> +'''''''''''''''''''''''''''''''''''''''''
> +
> +Testing 32-bit host OS support takes a lot of precious time during the QEMU
> +contiguous integration tests, and considering that many OS vendors stopped
> +shipping 32-bit variants of their OS distributions and most hardware from
> +the past >10 years is capable of 64-bit, keeping the 32-bit support alive
> +is an inadequate burden for the QEMU project. Thus QEMU will soon drop the
> +support for 32-bit host systems.
> +
> +
>  QEMU API (QAPI) events
>  ----------------------
>  

From our (SUSE) support perspective, we do not support 32bit virtualization hosts downstream,

and in general I am in favor of the change.

Ciao,

Claudio







