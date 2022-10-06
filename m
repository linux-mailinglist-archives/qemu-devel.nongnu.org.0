Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D837D5F6CA2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:20:43 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUY6-0002fo-VC
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTJk-0006FK-6l
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:01:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTJi-0004W0-1N
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:01:47 -0400
Received: by mail-pl1-x631.google.com with SMTP id u24so2077710plq.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sz0k/lyX15waWgrb3OMxfwnjeC0Z94k3iFysFjz4qUg=;
 b=DfC1ozbJmYA9LDLX2qkxcm5gizEL/jvJoh/n2P+Lq7Pz+23x0YxsltpGWUOBhRpbLe
 gk3XHBEbaUzg06IUc//ncDztODWJB5yilW92U9p92UtnaCKguQb7UOfZT0PqVQBsYa50
 JCmux1I+BYmd4YlTjXs8wTvkDOAzVbQoMlXtkPRaSWBai5SOOxXcsgd+5c7atC/i1QEd
 ZlL0lh3OYtXbjOMi3mJIcaOEeovvtwb4Hgaoa0xTGIbi6wxv0l4JI02Es2Z6FMtXwxxZ
 01hgB91jDZFqJsWQfnYuOuGEFjCOyMcXJriTHHiO6eT+EnmX4q6GdMn69RcB9A2M6E1F
 Uiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sz0k/lyX15waWgrb3OMxfwnjeC0Z94k3iFysFjz4qUg=;
 b=ZlrMw4YI9CXRaR8q4iNTnPFWrXFuEzekrXi6eAP82cJCbYvCe/dmcGXX/umf/R0m6X
 WuetfqwxHZYrQwykKEpUvrSM8vVjr6ENh11Ir4D5Yt564wRXwoicaEVP/GTD9IT8NUJu
 87u2bOH5meuaMLdoHwkULmdOOQy2erZIhZltAiZWfRqQszA2aBw+zsNHzJmZCsp5wpNL
 lP9GhMBSU2l8wkdffNTzw3k4f1OyjOpm/0DRAQSGvSgiczf2tysRrgfRo0w/jkYw1iTE
 LSPFne+aRzLhJmMpEyaUep5efMGzA+wEu+su3NiiaT91zpNN2eA6akYkVYs74nrjf35a
 ++rA==
X-Gm-Message-State: ACrzQf30mjcfc12mGlrB89WJGy/38U5BV1AbipiHBC8c3aP0NhM5HZJB
 +zVQPO6H2cow/WM50H85SHyW2tW+UR7fPu+cqQFEYA==
X-Google-Smtp-Source: AMsMyM4kA3fTktv93I4wJKKed3dyRiL8BiJfdUeDy7v4ZswIdPiyOoJgke/Rf7VvrNUlQ8fDr/Yei/85ijXSbCctzTs=
X-Received: by 2002:a17:90b:1d11:b0:20a:9b3a:bf10 with SMTP id
 on17-20020a17090b1d1100b0020a9b3abf10mr345351pjb.215.1665072102955; Thu, 06
 Oct 2022 09:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-30-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 17:01:31 +0100
Message-ID: <CAFEAcA_UOxOdcxYWbcVFd+DEX-nfQ7gsE6GaTpnjAqR5avsOow@mail.gmail.com>
Subject: Re: [PATCH v3 29/42] target/arm: Use bool consistently for
 get_phys_addr subroutines
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The return type of the functions is already bool, but in a few
> instances we used an integer type with the return statement.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

