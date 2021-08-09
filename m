Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E393E4B44
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:54:31 +0200 (CEST)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD9Tq-0000xQ-Fu
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mD9So-0000Aw-S7
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:53:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mD9Sn-0007c5-Av
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:53:26 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so27500pjn.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=friHGhwjkjqrLJfTDjMAapUMiSru0NpKYBuEdtTn5JE=;
 b=DitKz9scsC5g1FWU9A2SF69MV8vkFvfDjat/Kq1aeZ5kb+tpeKpnHUKr3eyoOqkfHO
 GKTfT+O1N9f/ABWmva9TdlKwjlHRMOmUSoIr8i1Knqqo4XjpBs5fAXB6LrU8ivSHzZnL
 3tueleKdCncGGkAyAxi/HtJssdtDoQn4uocY8475BaHUkHC7bVbxUv8co1hkmR3gOqET
 WMcL51850oN7HBrAv/eKj+pVIwz9Iz4WNpZYgMlQbHuYF+gBp+wz+u5SqOPDNCNAISgD
 KhqhSAxtPMC/o/rU7o+55+PNUcu2NKfILRSvEGLdVsppNVE7FYWX476jI68gVEUaK+UK
 Wg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=friHGhwjkjqrLJfTDjMAapUMiSru0NpKYBuEdtTn5JE=;
 b=Ni8Xivgk9Hs1RekdQl3EiU0rnDR7iBApJOCeHs1+vAvNORFHX7RXGkT1WHQ4TcnD5d
 XAAxHFRNblygA/GVr6m9+PW6OD6AydZQJ3yQSqxJv3Abp96TqvT6mUank64KgdLHxinu
 fVxnCkj+eZewO320qrKzg9u8ZmPKpvw8QXN5t4au9fy4gAR2G0E8M74HiEzP0jjVBhKI
 +6pDso5qjidG++PMGD19bz7fsnBO7tQ90yJilw9VozHZhPae8ErjdUdhVDnz5GUvTT/Y
 w1oxrUjYt597I5cNLXI9blGIJ5jZLf3Nkiw9khFCYCGqLHfCUIsk1tgXSVcDqE1FU+JZ
 bVeA==
X-Gm-Message-State: AOAM533x5nNdAgoTIDtzrC093mRtctryK1qkeUoSAUDVrtgrrt/guMr4
 +CnZKmyNXEHCLcp04SybwzU/jw==
X-Google-Smtp-Source: ABdhPJwrBju/CjWnzbDJyD0fgFQOhQ74IPs5mM4OirtR5snzySLQ/W5JJ5DwuFTign/xGv48NP0q5Q==
X-Received: by 2002:a17:902:7b93:b029:12b:a0a5:78d2 with SMTP id
 w19-20020a1709027b93b029012ba0a578d2mr21398216pll.51.1628531602960; 
 Mon, 09 Aug 2021 10:53:22 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id y7sm19906238pfi.204.2021.08.09.10.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 10:53:22 -0700 (PDT)
Subject: Re: [PATCH for 6.2 23/49] bsd-user: pull in target_arch_thread.h
 update target_arch_elf.h
To: Warner Losh <imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-24-imp@bsdimp.com>
 <d20c2d8b-6020-2f4c-d3b1-ad8e66ec836e@linaro.org>
 <CANCZdfow5E6fAf2Y4AZh_Qxb0FdP-TrvYpLXg-oxFE23pVPDdw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8595ff5a-059d-3df7-5457-241cd360ee22@linaro.org>
Date: Mon, 9 Aug 2021 07:53:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfow5E6fAf2Y4AZh_Qxb0FdP-TrvYpLXg-oxFE23pVPDdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/21 11:43 AM, Warner Losh wrote:
> BTW, I've started to notice that many of the
> items flagged by the style commitcheck.pl <http://commitcheck.pl> script originated in the 
> linux-user
> code and it's still that way today...  Do you have any advice for what I should
> do about that, if anything?

Fix em on the bsd side.

We have so far resisted style fixes for their own sake, only fixing them up locally when 
we have to make nearby changes for some other reason.


r~

