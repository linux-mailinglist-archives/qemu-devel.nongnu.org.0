Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76067410055
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 22:39:57 +0200 (CEST)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRKeK-0004w0-2e
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 16:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRKdB-0004BD-PA
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 16:38:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRKd9-00070L-0p
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 16:38:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u18so15361095wrg.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 13:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y/uVeqNYy4NaEmmLgcIJkBd2+eA9fMYT3GYrffpHuGs=;
 b=gi2T0Dbrf/hLVg/VAlhecBOCeGHO3AQ18nrX4ZIk2OZ8XuMootNJzE+IdODZU64nCW
 GnE6pJrwdmE6F96qpYNmlacruqSn5j7qdCIMYY8SEC9gsHzZys52ol8C4XFZx0dmWqvS
 9lm4ct9lhvnKR3LAQkhzjCEkYbQwKdJUvnGD7nR4LecRXH6TeR3kZZ3BEwkIo6wDjx50
 RlDRCHivePGY9P4uW7LPw46OnIsOPxxoEcHJdTxnsELcstMv/AShtUAPhiWz+O+0qE0l
 mP+8RLgRvPcXgpaxRaYt1Ll3S1XinOBU22txe06hzla3rxcvBlaNrNy9F7tjZ8n5bF5E
 7rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y/uVeqNYy4NaEmmLgcIJkBd2+eA9fMYT3GYrffpHuGs=;
 b=hRA/11mBld5TMW7h5XWLrOpAZi5PlMU/ooCknMWN0c75YJv7DNEsXN9JQg4BuQEln1
 TLBJJgWW0bThpnEkRA3oAxHXITmju+VTDZo9OtSvBAkGIGfwvxiEgoiqeVmI/kNLUUIW
 MqU7amfVSdNWCQ4+eHeTxiF2QVWMGDOU3I8E8j8rdmhX0+DkcbhhdtvPxQQ7zBehRezc
 H6JV0FuogpgL3KpLwMLUdlD0PkAw8tQ4ZlgCwaKQYMkW3wtapiCqdhzxp78tnEzWZfFq
 u41Bv9AvRYy+Tp8LYmUDTzc4WKQV6G9XrRo067F/+mxgO5OSZbd4T2ftePpb5hSsbLtB
 8uFw==
X-Gm-Message-State: AOAM532Y9DVvoaAGS5/+mWA7XyjqEhOPKvg2ECXKbde/SAhwCqlz6q7A
 xQ01dxgR+Kwid1oJJAGB4xI=
X-Google-Smtp-Source: ABdhPJxTALd+U9CYh8gWKrRMfhPnyEQlTO5teY54emwzaYg2fJXpEd+U21P4S+AhLPyFFxJIXBpXZg==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr11611544wri.89.1631911121021; 
 Fri, 17 Sep 2021 13:38:41 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id r5sm7561866wrm.79.2021.09.17.13.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 13:38:40 -0700 (PDT)
Message-ID: <12ef13f3-9d8e-e6d8-25d2-6d6c592941b8@amsat.org>
Date: Fri, 17 Sep 2021 22:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 03/11] tests/tcg: move some multiarch files and make
 conditional
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
 <20210917162332.3511179-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210917162332.3511179-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, aurelien@aurel32.net,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 18:23, Alex Bennée wrote:
> We had some messy code to filter out stuff we can't build. Lets junk
> that and simplify the logic by pushing some stuff into subdirs. In
> particular we move:
> 
>   float_helpers into libs - not a standalone test
>   linux-test into linux - so we only build on Linux hosts
> 
> This allows for at least some of the tests to be nominally usable
> by *BSD user builds.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Warner Losh <imp@bsdimp.com>
> ---
>  tests/tcg/multiarch/{ => libs}/float_helpers.c |  2 +-
>  tests/tcg/multiarch/{ => linux}/linux-test.c   |  0
>  tests/tcg/multiarch/Makefile.target            | 15 ++++++++++-----
>  tests/tcg/x86_64/Makefile.target               |  4 ++++
>  4 files changed, 15 insertions(+), 6 deletions(-)
>  rename tests/tcg/multiarch/{ => libs}/float_helpers.c (99%)
>  rename tests/tcg/multiarch/{ => linux}/linux-test.c (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

