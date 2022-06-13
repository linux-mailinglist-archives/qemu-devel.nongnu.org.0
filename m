Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217C654A1C3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:50:03 +0200 (CEST)
Received: from localhost ([::1]:37072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0rwg-0007vu-1F
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0ruE-0005n4-Vm
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:47:31 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0ruD-0004MY-I6
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:47:30 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o33-20020a17090a0a2400b001ea806e48c6so7275476pjo.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hySUQUzyBW/KVWc0U7eXZNMxnrY6SFBCnTc0TL1iBXg=;
 b=muR7GS/lZGEs+IEa+Qd6VsXn5C/jrqHB54JpAgYvsPeY5bxDua/qI0Ap1mYkhYScNn
 qW5N7N+1rUsCuAPDYPbo84uSCYoyQ4RNeMrwFAY/FIJ9t44MW4LPoV4godC1xGbzd1fS
 CINFWQrF07Y2rHLukDvJ9gBXB82VH3pSFzTxj7SpOliDGFtJ731xAe5ZuJlzq+glQzWu
 WU1mOvn9N9R5CWQyvxcBbCh+WxGpTOWKYaVJ9qltGZwDDHd2ZDZeUe21aGCBUEa8/SDH
 LxlIYZRwVipYjBCaLPXfSXkftW3dEEzsO0koqJ/Us/w8kfbNWuyZdQ+Wt7boJe9nWOFH
 rzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hySUQUzyBW/KVWc0U7eXZNMxnrY6SFBCnTc0TL1iBXg=;
 b=fEcws8f4IbUVea8yZfyk1zV8R6tHn9p22W078vMxg4R0uowE0gydebTATooaEyD/C3
 sSakucAvFw/oALKjhUj3uzDp9blzCN/39w1VeV+8Y0rfIONmW0u/Pzi2Ur2b7uGYoW3R
 AAhHpWdqXy7ZEoTbfr5aDWM1n7dgCxDa/LnKxvjlA1iJk8zZ5oOB5o4T2jgsBmQ/5sBE
 lYXlZJXJLAu1TLc7hIHuheLHqV3HdhmVXsBzBYhfLGxDm8aNw7xzqAjzm61myQQnmlpx
 FiYWtbsapS4OR5vRBWRIr1oEJaMLEbAEoqpE7LCAVfyqO71KP0I5QrC7rjn1WWfe2cmt
 vQYQ==
X-Gm-Message-State: AJIora9T3G5FJO+0DwqKACH90znHRe308NcvR6atkSYMSoEVByZGv36x
 I+px+xVQKEsPj2+yREYvJLidYg==
X-Google-Smtp-Source: AGRyM1vn2/gW3qYqgnGEsnsy8u8jrdFnqrVUBXdeg0PnSxdHV6q3WNmXY7s7YWqDw74s5QqrYtq1JA==
X-Received: by 2002:a17:902:bccc:b0:161:ffdb:b8e3 with SMTP id
 o12-20020a170902bccc00b00161ffdbb8e3mr938634pls.113.1655156848219; 
 Mon, 13 Jun 2022 14:47:28 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 iz20-20020a170902ef9400b00168c52319c3sm5606747plb.149.2022.06.13.14.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 14:47:27 -0700 (PDT)
Message-ID: <59ac3207-1d25-d001-59ce-9ced4d4dbdbe@linaro.org>
Date: Mon, 13 Jun 2022 14:47:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 5/7] tests/tcg: disable xtensa-linux-user again
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220613171258.1905715-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/13/22 10:12, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> The move from tests/tcg/configure.sh started enabling the container image
> for xtensa-linux-user, which fails because the compiler does not have
> the full set of headers.  The cause is the "xtensa*-softmmu)" case
> in tests/tcg/configure.sh which became just "xtensa*)" in the new
> probe_target_compiler shell function.  Look out for xtensa*-linux-user
> and do not configure it.
> 
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220608135727.1341946-1-pbonzini@redhat.com>
> Fixes: cd362defbb ("tests/tcg: merge configure.sh back into main configure script")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

