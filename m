Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754559094B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:47:18 +0200 (CEST)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHtV-0001SJ-Dl
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHqe-0007Kt-S0
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:44:20 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHqd-0005lD-9q
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:44:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bh13so18428190pgb.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=EoYcxRTF74V6K+m3gC9a6LN2HIXl63S47mzcrd+c8IY=;
 b=DEzEUu2F7Q+n+9dUgJFMHwAczJYCSHoBq3MF6LwnXGBZIxfA4WxydEwHd0N9t1DZHm
 OZVJV2cj0CnYOjTH2cNOczDlfSTP9Wg4QgJcB8Ivm9tcjZhzL/pD9ipPqYtLEx3t8NGd
 7e2NhrE0TOAq1ex1bgKZXru4QNuLVxD7cz0Ny4cdV9mW6Y+IlOeSz+drrh5mWm5THvGv
 J3uDVAkENvGtt/wPgU+s9CBu6YukKWsoyfVG67ozm1TK2F2cyW2XPHQcUR3iUfr/PeWz
 afvwxGfEzJY+pNRkUY8hMpCLdQCQ+CC3wUcdRUl3FmAYYYQei4ZRbvmPYSsjgH/6caY5
 Zgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=EoYcxRTF74V6K+m3gC9a6LN2HIXl63S47mzcrd+c8IY=;
 b=5EUPAiin/Fio94/0jUH0BJSQiy23l6UjqPazs8q5teEHqwwoPNKNAfM/lqURxvyLu3
 b5Ms0es5SIu9xEFtlb2WJak8C4M8VF9YGMffZX8ma7HAixQFwjp6XVrSfKbCq92p18oy
 qn3rDTTSj773xTnhPlkm6qlwbeLe9KYF6cD/KxU9q+JQg9xK3ddG3yoegRnBdwJG7ekJ
 fO86e1bFvpOcRZGvEIPWB0qeS30my0gHykEGV8sC8H0KIBKnOj8jTdiMyaDtlMMMrSIH
 53MvF7XZhF2JOYHxlE2GWYlEx/5jznpeQtvY1iKqoBeHXmeuzxziE2OPkazMDAPBLZhF
 GQVw==
X-Gm-Message-State: ACgBeo3Nxmy5DH+LgOLIoJJqLcF4I0BuUNohHWuZCY7D8H7V367BvrFP
 pnkpeUJVX5Kl4wKjMw+GD84=
X-Google-Smtp-Source: AA6agR68PzAJ82MsyV9BQ+U1slc2OrEXkn1QtRQ3sWsvIbpVnMcQTaThP/0ASYiRITlYd0g6UByipw==
X-Received: by 2002:a62:1a14:0:b0:52d:daae:b289 with SMTP id
 a20-20020a621a14000000b0052ddaaeb289mr1415005pfa.55.1660261457930; 
 Thu, 11 Aug 2022 16:44:17 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79425000000b00525442ac579sm240570pfo.212.2022.08.11.16.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:44:17 -0700 (PDT)
Message-ID: <3c21c1c5-dc30-1e77-b8e5-38519e257b2e@amsat.org>
Date: Fri, 12 Aug 2022 01:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v1 8/8] accel/tcg: remove trace_vcpu_dstate TB checking
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-9-alex.bennee@linaro.org>
In-Reply-To: <20220811151413.3350684-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/8/22 17:14, Alex Bennée wrote:
> We removed the ability to do vcpu tcg tracing between:
> 
>    d9a6bad542 (docs: remove references to TCG tracing)
>    and
>    126d4123c5 (tracing: excise the tcg related from tracetool)
> 
> but missed a bunch of other code. Lets continue the clean-up by
> removing the extra field from tb_hash saving us 4 bytes per-TB and the
> additional cost of hashing/checking something that was always empty
> anyway.
> 
> There remain some per-vcpu trace points which don't look as though
> they are called anywhere and the command line/QMP machinery to
> clean-up.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/tb-hash.h       |  6 +++---
>   include/exec/exec-all.h   |  3 ---
>   accel/tcg/cpu-exec.c      |  6 +-----
>   accel/tcg/translate-all.c | 13 ++-----------
>   4 files changed, 6 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

