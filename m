Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D01FB607
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 17:23:45 +0200 (CEST)
Received: from localhost ([::1]:57586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlDRB-0002J6-0O
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 11:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlDHs-0006FR-QO
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 11:14:08 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlDHq-0001Bx-Jp
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 11:14:08 -0400
Received: by mail-wm1-x343.google.com with SMTP id l26so3234256wme.3
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=iCe1PzSqwx9mubhmiiKwXSfOyHh2GSVxal1UdP7RZ3g=;
 b=Qn6XrC9TtMyIlDsOwWh5egrW5MQ1Q2bDsKPRoICSBr1FYwpqH95VaWs7UMGtR/slRD
 EgFSPOt2EQ2I4BnsEOY+K2AHpc6AT9D5sC/W1zdiErfjTopdSdIv8p4gYs/bQVJHafEk
 0za9U0RX7jl/6llPJUoqQFJO0u5caOYjq0DZSqBQr98py7fBAyzNn7LcP7gafDyxpt/r
 7lPPVZ9IaA2jW0w76LNWh9A36g6JNPbXHG/SfsZINROjfrZN+IsHPhYC2Ios8HeSAzp9
 dq8Q0+RuOy6Rt9ZZjflzV1KvgYWzTg7eJp6bIs8xEJNrAqilj8RbpgTnJrX+ZaJ0M9a7
 Oy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=iCe1PzSqwx9mubhmiiKwXSfOyHh2GSVxal1UdP7RZ3g=;
 b=i57NdObnvP3CMTwftkMIcSZvVi2wEzLX8o0F2645Bcf11saA0cmWsFLbTa+Qx4nsvn
 vWr2oV5DrVV5XNj8EJK9pwnlwAuXckzeO8y20qn6nWCkLna9urJLG3i4E+odh/wHVAud
 sfSUrZYVCIkLHt0ldRw2L2nxEZtu8bG8vcHRisX6wRgSi2HVo/t7nkcc7u70uW8ZFB+H
 7iAslmiADDZsdBqbcLs3M8camQ1mNEvs6hcCjQIRrTMkVE8BcY26FJJRTTY6/UEdsMzC
 zlQXV0FV9M3FnSst6tj6KYeMalsXg8tQtjSUfKgtnL9KHDgxvuZxhZPzlsuhkno6wVhM
 SKug==
X-Gm-Message-State: AOAM5320Op1FvI8/8uTvnpbnzdNCbu0qNFqVe/IvaxcoX1ufZgPoECqk
 6X3S7Zjs78f8zBQME2alf8CdPg==
X-Google-Smtp-Source: ABdhPJxQgS3YpjnZx47EaU9Z/sCTFJohT52mXNHGFpeOU0lm7b5cssO+nGHyW21r56JPatlPJhHpbg==
X-Received: by 2002:a7b:cb4c:: with SMTP id v12mr3651087wmj.43.1592320444917; 
 Tue, 16 Jun 2020 08:14:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l204sm4586673wmf.19.2020.06.16.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 08:14:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FA781FF7E;
 Tue, 16 Jun 2020 16:14:02 +0100 (BST)
References: <1592215252-26742-1-git-send-email-frederic.konrad@adacore.com>
 <1592215252-26742-2-git-send-email-frederic.konrad@adacore.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: konrad@adacore.com
Subject: Re: [PATCH v1 2/2] semihosting: don't send the trailing '\0'
In-reply-to: <1592215252-26742-2-git-send-email-frederic.konrad@adacore.com>
Date: Tue, 16 Jun 2020 16:14:02 +0100
Message-ID: <87r1ufyret.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


konrad@adacore.com writes:

> From: KONRAD Frederic <frederic.konrad@adacore.com>
>
> Don't send the trailing 0 from the string.
>
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

