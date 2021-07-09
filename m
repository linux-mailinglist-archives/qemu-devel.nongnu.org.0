Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D903C269A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:05:58 +0200 (CEST)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1s4j-0006OQ-UD
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1s2x-0003qg-1k
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:04:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1s2u-0003Rf-Ly
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:04:06 -0400
Received: by mail-pg1-x533.google.com with SMTP id 62so10262904pgf.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=55376FlShbfPcsZv7XMqyB5HRDZVzDcZP8T+42ckEaQ=;
 b=SRfce5GCESRAhIEBw38GYX/oz9kqXlyp2nRm0XlX99y58FZNgM0U9uvdxpE1K059RL
 0thhLhSt4GLsu+8bSs4wB7VwI2raGyr8jYYp+I8t6NslaimZuLyIH806ejSleniU/ini
 rLQyYtGzSmN5gE7lSb0ijbGxnRjbCp11GSRUNppXbMkYZaaGf+zCYxXHS0aFLgSbR1Dq
 qf6XJM5P+/S9A45eZ2u6KcqLw3BtNKUuTGH7yiom5ei0sH3M0dP/ggGf+lggQhMTovRD
 QiHLydPfdwbG54VPyEnsM/CmypbpJay2yucQyA2kNJbu5UbvujLa09oOWFpYGzLnicDw
 QjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=55376FlShbfPcsZv7XMqyB5HRDZVzDcZP8T+42ckEaQ=;
 b=RiJ5fNc2m6uOUDSddwGtPzk8T8nqhZLmWwXrv/z/ZMCFfUKQRyafkqZHanP+WKoLIa
 EjGJ6A9QEe6P+l7Nhh7g0ANqb6BKI3nNiY2MSNBwejDb3n7lC3C8Uy3obrZSN1z+0uz5
 lKNo7lGV2A1cnzfpc97HpHWG1McKdACqosZYFconD4YM+bUF8UJw1sP5gSPWwHEpmgV4
 RibHp9+6+V81tOk+Fi8leyYc/88hR3yyghq0bQvwp6qLVbjWhEfgO4+JPf/j7E+653cW
 mQ+PvWz6I//KBIX8r6VbX3kGuBHUFIu3wLf6s5FCowTFrtbS1CMiKdHp//aOHdb3B/Tm
 RzZg==
X-Gm-Message-State: AOAM5304kUAWa885VEoI7IkJQjrVVIBHfOskMPhiyuhnY3YqV/dWMZgL
 KUusHoZbl8yVOjZEkUHdMbPpOA==
X-Google-Smtp-Source: ABdhPJyIymF4Xk0eJOMIx4G9IpjcMbZxj9523gzOGc29H++NmUEjNxuUEEQZmu48Bga8WM2Z8pUzxA==
X-Received: by 2002:a63:fe51:: with SMTP id x17mr38320110pgj.58.1625843042966; 
 Fri, 09 Jul 2021 08:04:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j16sm7671185pgh.69.2021.07.09.08.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:04:02 -0700 (PDT)
Subject: Re: [PATCH v3 26/40] tests/tcg: make test-mmap a little less
 aggressive
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210709143005.1554-1-alex.bennee@linaro.org>
 <20210709143005.1554-27-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82e42c90-7152-4cea-948a-71fede1060ec@linaro.org>
Date: Fri, 9 Jul 2021 08:04:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709143005.1554-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, Taylor Simpson <tsimpson@quicinc.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 7:29 AM, Alex Bennée wrote:
> The check_aligned_anonymous_unfixed_mmaps and
> check_aligned_anonymous_unfixed_colliding_mmaps do a lot of mmap's and
> copying of data. This is especially unfriendly to targets like hexagon
> which have quite large pages and need to do sanity checks on each
> memory access.
> 
> While we are at it clean-up the white space and style issues from the
> legacy code. As we no longer do quite so much needless memory access
> we can also remove the hexagon timeout hack.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v3
>    - style and whitespace cleanups, reduce loop even further.
>    - remove hexagon timeout hack
> ---
>   tests/tcg/multiarch/test-mmap.c   | 208 +++++++++++++++---------------
>   tests/tcg/hexagon/Makefile.target |   9 --
>   2 files changed, 104 insertions(+), 113 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

