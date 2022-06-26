Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5312255AE8B
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 05:51:03 +0200 (CEST)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5JIc-0006s1-DL
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 23:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5JGq-00063i-Eu
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:49:12 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5JGo-0008DY-Vt
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:49:12 -0400
Received: by mail-pl1-x636.google.com with SMTP id m14so5403872plg.5
 for <qemu-devel@nongnu.org>; Sat, 25 Jun 2022 20:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z6SBK6OUocwshIWhJqyLfOBE8D9gJJFDHkgPe5OyZpg=;
 b=ruAExtwPlZ6yky3TG3PP/QSk9wPcQP9WEoiZ9XelUsTiMTcFJyBW9K2V6lpTws4gfJ
 FU2hQvFhUaZ/e4pwvxCTDxwdUaHeprkf9W3VfqYLJSKWOs9zQT31oDTMwvcg7RD7kYkz
 bo+X4MCQdSPGQM0GsRC+D6H+/iJp6fDbHsG/sw6zgD6D8LB4BMdD/GU7Kl3colv1wH0a
 ZDTcIe0Uv8vW4dUKZ5aqmFAUyPk4xCGek6JGE0zYKrPzuvLXdlqyrHwVaKAieoerxPXF
 ljf2aZi255v6xiL6ZGdBqI/K1kJ9PgYhm1JbtsAKJ7e2EHXnrYOmAXplcMHzlg37BiO/
 yV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z6SBK6OUocwshIWhJqyLfOBE8D9gJJFDHkgPe5OyZpg=;
 b=DXg/Jt08Poh5siYnDluku8AYrens+SUCV36MsZsnC8/e3dLqCDiUmZfE+UOwsNEnKd
 EXZpUePLTa/DFCb32RDafVzeolW8j55MMXhEfdYsUcstHwQgmbhDiLwJJZaxVwSw679r
 B0LFDpwQ1hOzfrsUtNfBxH9Uef3Uu5qa6b0HCdl5MpfOfI4MLQwn3fKv8JHYgaLhK5oB
 LGLtyLF1KYiD4XkAk6PDZaL9KPARmixGdPf5ArUGrmCysqm8w3e5dRGPE8SfrdB6KvjU
 x9UygFYIyQCQKrumfihfELea4uaDNlwEmulhf2lbhCn4VNt9//KFOMcVZCXajWuXJJbV
 8hwg==
X-Gm-Message-State: AJIora/XXoADg+faAh5p08FicPEHSn0HDHrDTzphY3UdjaaYKJGcPD1F
 Nny/zkAgO02d6fZULt80Ptx3fA==
X-Google-Smtp-Source: AGRyM1sZgcMUB4qQrPYtxNFURkiqmbf/Og+9nFuS94RAXeIV0xomLym1xVeozdTMnip6ZMP9HwhhHw==
X-Received: by 2002:a17:902:7085:b0:168:97dc:ddde with SMTP id
 z5-20020a170902708500b0016897dcdddemr7346529plk.25.1656215349608; 
 Sat, 25 Jun 2022 20:49:09 -0700 (PDT)
Received: from [10.10.67.53] ([116.12.83.234])
 by smtp.gmail.com with ESMTPSA id
 n5-20020aa79045000000b0051b9a2d639dsm4399057pfo.43.2022.06.25.20.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 20:49:09 -0700 (PDT)
Message-ID: <5564cd28-9b32-8ec3-0ec2-4cd218577b76@linaro.org>
Date: Sun, 26 Jun 2022 09:19:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 04/11] bsd-user: Implement freebsd11_mknod,
 freebsd11_mknodat and mknodat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Michal Meloun <mmel@FreeBSD.org>
References: <20220624214742.89229-1-imp@bsdimp.com>
 <20220624214742.89229-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624214742.89229-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 6/24/22 14:47, Warner Losh wrote:
> These implement both the old-pre INO64 mknod variations, as well as the
> now current INO64 variant. To implement the old stuff, we use some
> linker magic to bind to the old versions of these functions.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Michal Meloun<mmel@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 47 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 13 ++++++++++
>   2 files changed, 60 insertions(+)

Update the comment -- no more linker magic.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

