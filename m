Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC763649AB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:12:48 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYYO7-0001y5-Ac
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYYMa-0001J9-1r
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:11:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYYMY-0006wf-Ca
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:11:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e7so26026278wrs.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=whxOVumdcjZE5BOBTqYvIEdJtFYBhPqEeyi1hyvf75Q=;
 b=nntefzDKgAHpkcsoFUV1BnYw3Ng6MOnLlv8iX7OQLl6R0qP8PhPBeu0gdSYq5x3+VM
 o2AgIK9DcXwEtWcHHVVqB0zlhbwNdylRsbEOyrpViVfuoUr6J5MnTpFc8w3/TSBsJKOR
 dJI2cwmM8xd3mJTSlTpJDCjkWINahGb052qC8H/clDhOCG+RV25/fYgsH/uwL3XOVea1
 jYyiQGc3g62I7xJQbmbQY07ZDwyWnbwLKqHAXBvMLKOrW5fkuyVZr6JVIVj+UxQ2fgfG
 fuZKUnqdQVt+EUEd1nj3A1xWQvkLr0GHp+TlNTFFHFPhmixfiBDikpmiMy5T7iT7GXxa
 qHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=whxOVumdcjZE5BOBTqYvIEdJtFYBhPqEeyi1hyvf75Q=;
 b=Dpsft2GwJ+vJOES9vJK4B3CLaUPW7DaiV663+9VYBXGSzxWLvt8PYbGsBk+rSSM0ZD
 sZsqxqWnm0lJHErhwWVj9808ia7JwT+VIGGtRSvB3W8MqLScLZMOR8LXYBAaUQebnBEV
 iMrgRQRnUENKdvXrCFkX2ur9ijNZurz8xXIWBIkW4ecDhIfXmahJ5tUDSV/kbGbZo133
 5l0zn9ju+1IvCSI16M8Z+867zpWYtZEIfalNMJziYvhm4242nHJ+GMUddX+XPwkdiUlM
 1rDtKgsLYA9e9PlHJniifBi9uemujUQimaO/w4LCPVMBQg4y93vFjObGKFrs7SH+J3Ln
 uKfA==
X-Gm-Message-State: AOAM533fKAr4UCTWj7BHYKoPpPjSieDJsezGEoLPW4heKNiDYOVydygS
 CRcVIde2RwuqR6QIc98MLy8=
X-Google-Smtp-Source: ABdhPJzfunUKtl3f6Efi+3BaN9mUH9On1/s5Cn+dvbmVG66eouuls6wjL8a7hKu+mNv50CwKZBFzPg==
X-Received: by 2002:a5d:4287:: with SMTP id k7mr16818464wrq.244.1618855868777; 
 Mon, 19 Apr 2021 11:11:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u11sm15824522wrt.72.2021.04.19.11.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 11:11:07 -0700 (PDT)
Subject: Re: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
To: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
 <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
 <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7c630c72-580f-ab67-be62-aaf01768c5a6@amsat.org>
Date: Mon, 19 Apr 2021 20:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
 Stefan Weil <sw@weilnetz.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vince,

On 4/9/21 3:10 AM, Vince Del Vecchio wrote:
> On Tuesday, April 6, 2021 11:21 AM, Richard Henderson wrote:
> 
>> I think we should retain the deprecation until you actually follow through with any of the upstreaming.

> In sum, we're investing in open source nanoMIPS tools because it's an important technology for us, and QEMU is one of the key projects we want to have nanoMIPS supported in.

I'm glad MediaTek has interest in MIPS and is willing to contribute
upstream and help in maintenance! QEMU MIPS codebase is huge and I
don't have the time/resources to maintain it alone.

Regarding the nanoMIPS deprecation, don't worry, we are not going to
remove the nanoMIPS TCG and I7200 core because 1/ it is not breaking
anything, 2/ it is in good shape and 3/ most importantly there are
users in the community.

The plan is to drop the nanoMIPS disassembler because it is broken
since more than 2 years and nobody ever cared to fix it after Stefan's
attempt in Nov 2018:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg576504.html
So it is certainly unused. Unused unmaintained code has a cost and
negative impact to the generic project development.

If you think it is worth having, you should consider moving it to
the capstone project (https://www.capstone-engine.org/ - it also
uses C++ btw), so other projects could disassemble nanoMIPS blobs.

I prepared a series [1] which split the TCG code from the big
translate.c in one file per ISA. It helps maintenance, as we can
have finer granularity in who reviews/maintains what (using
MAINTAINERS sections) easing collective maintenance in a community.
I'll Cc your team for help with reviewing it when I repost it
(give me up to 1 month).

Regards,

Phil.

[1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05879.html

