Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C3433C80
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:38:38 +0200 (CEST)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs8L-00044D-Sj
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrBE-00007F-A1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:37:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrBC-0000Sb-6J
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:37:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3343223wmd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5MF9pWAqOcI14fT9TFXIVcKtIqUV1qVmW5ZMKZKoSu0=;
 b=NYFn3x1A5SVkYw1vSzdS807cbHuSjb3rKzLJZ4hRrDWkvqiBVdjm+oqfbxgMMfbLX1
 pjLw+9sSqWKk8JRvE/cWrWFPHNxfSmj6n6Zwaj1dRws39DngV4JO7RaIY7gWxXQTLo8P
 6XG/wXWmNKW6eE5oiuG1NCZsufqDSvG5o9aLpEcVJlYoaVu51s7sXtkSHq8KHVriBJXt
 7iLh1cXAZkzTl3nJJMvK35eehIYiAErKMJQYV/dYHH7lOg7dv8Mx7WYRmz9E7Bk128dn
 rGO4NUTsy3KlqF45DOYfvoWGAzu3AOPVhr/xgK7DyL1swsEea04r5k8uiQi0XtX24J9z
 tB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5MF9pWAqOcI14fT9TFXIVcKtIqUV1qVmW5ZMKZKoSu0=;
 b=uUmpCn5ZO5E6Uo5Zyfo8ij/8+EOk9BS2OPqUxLiPSDRIfE4fCUFDoPToxKEO2iHPww
 Ie5qeBpH49w8xqS0m383/Tr0dJCv/KwkDTf9fyjZj6VBATJCFk1+LDjJPmXSmnpXqS1y
 Oi5CUtctarUnfpZjy5eLY2eg9KEb+IYoOEpo9s209f1avPVOHjDvEEiRTPPiUubZolrU
 b3tvPSmQ8b9YsmfRa+nt7D9BHfekFPeBO6mVpOuTZQGK6aVP/FyerJJSVGgzYxEvTB5u
 GsWX2y5eOWMwXonCjAplFbl9l4N2Z4tGoTBXndmpC9OvgNC7IFDIvDfMOpmuwd5qAPQS
 f3Gw==
X-Gm-Message-State: AOAM530vAQEPb4mYbIw2gbw2F7s5ES+YIONAiu6/IFmH3ddSE2M+yZQJ
 0c/a39Frvl9B8DbpbQuIQVFtsghts/kl6A==
X-Google-Smtp-Source: ABdhPJxok3xDr9xshVUjpT2tqmTevgQ9UYCcvL4rQTc8vCXdEdGsfAu6hLzJO2ifrgHsnWicR7ipnw==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr21706470wrs.304.1634657848658; 
 Tue, 19 Oct 2021 08:37:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm15259737wra.37.2021.10.19.08.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:37:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 092AD1FF96;
 Tue, 19 Oct 2021 16:37:27 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 03/48] tcg/optimize: Remove do_default label
Date: Tue, 19 Oct 2021 16:37:22 +0100
In-reply-to: <20211007195456.1168070-4-richard.henderson@linaro.org>
Message-ID: <87ilxtxbyg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Break the final cleanup clause out of the main switch
> statement.  When fully folding an opcode to mov/movi,
> use "continue" to process the next opcode, else break
> to fall into the final cleanup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

