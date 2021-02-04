Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A930F572
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:56:27 +0100 (CET)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7g3X-00057D-1s
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7g2I-0004Yd-24
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:55:10 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7g2G-00079X-F5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:55:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id a1so3851864wrq.6
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7Bo58QsslRpu+TerGsfgE2m82F82JOfEjVLgj3RT4Y8=;
 b=Jnpl5ZZBh0jzhxehyhA4CsD50ZrL6zTmaOto5nHSGIXNot+EZJmcxuEPADX4FfM6LD
 oMecks5NBFwwtFAzKTfAXqw36qprS8S2Ek6jejMVZw3RcVWUVzH7/leAPNXX6IPZ03v2
 y8l0t8kxyfn/mb8tiQiwoSdSiTj8FpcP3GipUfqFkMwTk2wwbWTRNSIsW4NxaY4bFN+a
 SZ0TZAcGW7mFYrus0BIWQgY9RgxNKVCXmxl4V3qtKXo4QRohVjgmyD+3QYArKuliH/L3
 AOB4QiOekGlnrEHNQ2JMo/KBoAcTNnJqz812JWR65h3b+gRdWMBIGZpU4K9r/WXpQckt
 8L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7Bo58QsslRpu+TerGsfgE2m82F82JOfEjVLgj3RT4Y8=;
 b=uZ44VSFjxWyq6Ogf+Etl1tXOaW7zbgU2aFj29s6ea8J48CPcPx2di1devR+MA94YAu
 swVCtq6Guj5QrOOzqDOGB1qO5fJTsxRVleGKsKU8XSB78Id/E4K5SCjcokhheG+nGnF/
 t6KKAHYJROGgZKdD+PJwv2jjuy/JWWdctmJX8NgNPCA2VSEZSLcrqXwp22NLI9DFPgpP
 FoA8T7WlSVAWuP7KmHqRLNvNKhL67dEeqKb9M7YqTc+t+ZPMr+QvAXFd/1cwqLxiRM6T
 5/X582eHXdCLUFlY/0tqzMIAmv4c50wMg5kJbUrr6E5sTKdsjSYWkK9E/e/xkdH2EktB
 ouyQ==
X-Gm-Message-State: AOAM531NmG9JqZHy6vsiWqJydLc5AevU1MIiRP33MaZW8BoPhpEXcv/V
 LSaNI6mG75ODTbC5zkicfIzycw==
X-Google-Smtp-Source: ABdhPJyqwuW90fzlSm3PGJRRj+p1BAh1rCL4/2aEiEokIcwNXGwlWEhj3W6ki3e5C3yW2YP4fJKrBQ==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr9695752wrw.379.1612450506765; 
 Thu, 04 Feb 2021 06:55:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q7sm8402728wrx.18.2021.02.04.06.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 06:55:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBD951FF7E;
 Thu,  4 Feb 2021 14:55:04 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204015433.885239-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 79/93] tcg/tci: Split out tcg_out_op_{rrm,rrrm,rrrrm}
Date: Thu, 04 Feb 2021 14:54:23 +0000
In-reply-to: <20210204015433.885239-1-richard.henderson@linaro.org>
Message-ID: <87wnvnq3w7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 70
> ++++++++++++++++++++++++++++++----------

Hmm duplicate patch tripped up my mail tools, did send-email have a
brain fart at 79/93?

--=20
Alex Benn=C3=A9e

