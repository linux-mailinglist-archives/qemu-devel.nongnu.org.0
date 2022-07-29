Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E619558567B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 23:30:50 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHXZJ-0001ix-AZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 17:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHXWq-0007bW-Qx
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 17:28:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHXWp-000602-9U
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 17:28:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t2so5678425ply.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HUsi5Ww3zL3naUcizI2nLrY9nIaz9dJuNntNvvZX0QQ=;
 b=jPAq/VsAwYkJgvsLfIzQDKbcI27f4GCk0zZX1nFSx/b0hX+k6hL6EK87M6JdPmUb0C
 iiljIxt2uMHDmt72ByKS9KfgwJFXyFrh/jbZQb4UeIHul4mrZN624W2t4NmAY4DC+4+e
 GFobULPZXMh8bZqkrcghHVQD9rAhQQJMvX5cwebWQlmPjU263qBCvDLQzOE9GHJKl6DY
 6s4n3Gz3j8x5iI8phmydUaEhkOB2lN9sVoPVbCEOZqLREcV+5hiHdJjRoKliovVKZsw2
 AbjWF1IQdddCyONqUiW7fIaWUSoOcX6hFEb6Tszy2fvmC8P4W0EB3lDrY2vH20Bo9j1j
 XIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HUsi5Ww3zL3naUcizI2nLrY9nIaz9dJuNntNvvZX0QQ=;
 b=M/2CbQQjSyBk1NXXgUrapEUtAuJq1kWn7K7h69t+Mw8ciWysRvDlupDOHYe2lA/N8V
 qhwxk/qx2tZaeF+fbKSp8ALyApA9nfYR9kTuAfKHtOWNRGJD06CVBYceL7i7Xbt5yxpK
 B3MKoNMjf2cjFoNlmLRCtXGdJClN9OeUs/bC6u7FRp0ZVeEVEPRViLTiI5MNbwUu6/O2
 CHdl8Rmo6wlSEMGc8papSYYapli2DDL7J+Jp7rSkYhVR06BleQlSZe16DB/DbFE21u7Y
 jUKbMtXCHM/cFT0UIfOWlSOWTfT2C54ENdgR0w2Nc53V4VC7IeQGxPF/8q+jLwGAz08J
 jS1g==
X-Gm-Message-State: ACgBeo1YOCIcNGKlHiekSTXkddkkfHIf3JRpvHK+rDOC60TegKN0MbqY
 rpQk8J261DN/I4p68N5+RF/InQ==
X-Google-Smtp-Source: AA6agR6ZJ18XB/pLEBGA5GHfIeFBq4opAzd6UB/ira2W96M9c0eUXPy3GrGCNCtGOHujLOEvpQ3THw==
X-Received: by 2002:a17:902:8644:b0:16b:ea77:a6cb with SMTP id
 y4-20020a170902864400b0016bea77a6cbmr5743442plt.59.1659130090623; 
 Fri, 29 Jul 2022 14:28:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 g138-20020a625290000000b0052ceaba741esm515137pfb.146.2022.07.29.14.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 14:28:09 -0700 (PDT)
Message-ID: <eb895903-2ee4-6505-2922-59b07f926569@linaro.org>
Date: Fri, 29 Jul 2022 14:28:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1? 0/2] Re-enable ppc32 as a linux-user host
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, laurent@vivier.eu
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
 <61198099-b282-3289-aa22-f0176d59816a@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <61198099-b282-3289-aa22-f0176d59816a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/22 13:44, Daniel Henrique Barboza wrote:
> The last Debian that supports ppc32 was Debian 8:
> 
> https://www.debian.org/ports/powerpc/#powerpc
> 
> "Debian on 32-bit PowerPC (powerpc)
> It first became an official release architecture with Debian GNU/Linux 2.2
> (potato) and had retained that status until the publication of Debian 9 (stretch).
> The last supported release for 32-bit PowerPC is Debian 8 (jessie)"

It has been moved out of general support but remains in ports[1].

I was able to install a debian sid chroot with this today[2].
which should be good enough to continue compile-testing.
And Mark has hardware for actual testing.  Given that almost
all of the code overlaps with ppc64, I'm ok keeping it now.


r~


[1] http://ftp.de.debian.org/debian-ports/pool-powerpc/
[2] https://github.com/vivier/linux-user-test-scrips.git

