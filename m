Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2B3CD7BB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:59:30 +0200 (CEST)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ujx-0007Hu-IK
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UiV-0005uI-Rq
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:57:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UiU-00040j-9j
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:57:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d2so22472975wrn.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BPpv6TvLljgzyGky9MIzYU0me6LtU/y7teiosxBONdU=;
 b=wVxomicb133k8PVX+cQO2ehxY2zVwvHBFM0hTxEkfFBUrrw+XvYwy/H0ygJRija3GW
 v7eY8A04CNMCuCNlf1QPDfwKyrCsqojXaDuTRGUGEfNSAdoXhrKeRYx8zchC2SZKD3QX
 RrUEEN0j8fJYDt1rMbKvirgLyF4AF1wXschOwXcxgNinKs6xNGR7/c2B5/lF8lCakS6M
 IOLfGQZslNZqRjxUaSjK8OsAjaj+phXELft8+CbzAR9iyfpRUFp/mWNxec4OK2idCUpn
 xXWC7NlA+MfhTbNo7sojcjk5/qZFUS7TIKebA2nOZV+tAYtPDw4e9EGPzfXfa+AazMCz
 vhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BPpv6TvLljgzyGky9MIzYU0me6LtU/y7teiosxBONdU=;
 b=jlxcNUGKy6Bcq1EKNoCIT8t2ABRST1E9xE+01HyQ6xLS9XNplCh//X1W59qNUkxdOW
 Zt4mqwGQ5fXk9bbwVRHvOgQxp2af2vIIEC2lAEi1ME2oXM/udEZC5FQkboaz+u8GodDI
 tWkcrSCEGelz7mQf3yBf1uBsZbBne8Y9k+9zuMkJ6Tk6d2fXOju36jzunYz859lGPOA7
 ELUcVpWMmWxk50BGPhbzTyr2B1/NC1Z5Ut5s4YmC14ddhY08tTCXsmzY+LlYi2GmwZkq
 0iKRuEXxx3IctVhCrQub8kcXsFq2fCIcBTtQKzg/kS7V7if7rI9J6aOQ2g8nSa0wtEvB
 0xWA==
X-Gm-Message-State: AOAM533RaPGHyPsZM0ILCuBLibn6qYsIqw9jLHgqSRL+pAVaQKt60yei
 7O7QbXpBS+0aTxFn/P49xthPyw==
X-Google-Smtp-Source: ABdhPJyrEY0dqeI8JThYtdFxDIwY4QiezAkqBRJxkNJ36BU8PFO7gK2yBokYQ3jZeq+reBqYZBXFoQ==
X-Received: by 2002:adf:e582:: with SMTP id l2mr30342418wrm.101.1626706676544; 
 Mon, 19 Jul 2021 07:57:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o19sm8250675wmr.18.2021.07.19.07.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:57:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FF011FF7E;
 Mon, 19 Jul 2021 15:57:54 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-8-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 07/13] plugins/howvec: Adapting to the new argument
 passing scheme.
Date: Mon, 19 Jul 2021 15:57:47 +0100
In-reply-to: <20210717100920.240793-8-ma.mandourr@gmail.com>
Message-ID: <871r7upczx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Correctly parsing plugin argument since they now must be provided as
> full-form boolean parameters, e.g.:
>     -plugin ./contrib/plugins/libhowvec.so,verbose=3Don,inline=3Don
>
> Also, introduced the argument "count" that accepts one opt to count
> individually at a time.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

