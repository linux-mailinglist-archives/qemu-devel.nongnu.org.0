Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A451205815
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 18:59:37 +0200 (CEST)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnmGl-0005yx-Fj
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 12:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnmFx-0005Th-C6
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:58:45 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnmFv-0000Ks-DI
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:58:45 -0400
Received: by mail-wr1-x442.google.com with SMTP id b6so21299325wrs.11
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=jLujH8z7TJU9u/evnTRL+oyitCVDncHuIz7gwPOSjAo=;
 b=b7zcgn8r0BunniVCaIBNZfjQtrGTE1FZcPTmmH4gYDJtTINu1dmk/oMSjFk/sO6DY/
 LcamIw3u4Os3QIKzEUaoF6LVr1GoYHkY61rFhNgxwEDV4djDJqOA+HSJq30VOnnGC1wH
 EFN3IOuzM+eJ2tR7m3zaVNo6tTjw641B/v+W2XxpIGOeeWeg7RscOpPVOPbpOBFn79Eh
 K8+7cU3p+2B/nIbItr6ekP7JEQtiji+L4uUrhsPuZUo0xIEpwcz6U6Sh3+i+oyvXaY/f
 P/7MYCwG7jpsWl4zvIolagT/t0C57JEivOA6fuF2tvmD2ZS0T3fGFu90+WNaD9RSTcZ0
 ElSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=jLujH8z7TJU9u/evnTRL+oyitCVDncHuIz7gwPOSjAo=;
 b=ib/jp/uJrxbjxff5D72YEfiy/04JnRCC3i+IOEPZfI53TV8a3eJ5H5nwKu+G6wkdAf
 iyYnXW7nqNCD+fPdiQvSYQXm0az0P009kyVFVJZE2mFntXlZIePf12RNex+IUZ9O5BsX
 bvyseDCnuFWhvEk3FPLIIhOclAn0cW7JClZaxlACR9yJ3vC33LMw5hk7rHFz5v6Cfw8f
 /baSb6iWCyA7GWRvHoWr4/IWHzWw8hbNrg1VlM71YBXFgfET561y0v6xnAbELDfjg19m
 OfuTORMz+48zMMcS8epMPv5cna6TZmKR5krPlALzdw2DD61UxRzTCVcqNpMM/WoySKZS
 AmBw==
X-Gm-Message-State: AOAM530BZ6AqcajB46Z9PtFYfjVTXZ38oqGvD7NH3rf/F/lX8mHACC9S
 WgALs7hAFSY6QxoOF3FObtMxCg==
X-Google-Smtp-Source: ABdhPJzqPObGaUWn82A/HdxbDfgc2GNufaWoowJenQutjg5OcevNvt+lBC8K0rR0BeqnkrHHcJFpmw==
X-Received: by 2002:adf:c3c7:: with SMTP id d7mr25697947wrg.51.1592931521506; 
 Tue, 23 Jun 2020 09:58:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v7sm3113615wmj.11.2020.06.23.09.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 09:58:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 736AC1FF7E;
 Tue, 23 Jun 2020 17:58:39 +0100 (BST)
References: <20200522023440.26261-1-richard.henderson@linaro.org>
 <20200522023440.26261-22-richard.henderson@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 21/25] ppc64: Use uint64_t to represent double
In-reply-to: <20200522023440.26261-22-richard.henderson@linaro.org>
Date: Tue, 23 Jun 2020 17:58:39 +0100
Message-ID: <871rm590sg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We want to do exact bitwise comparisons of the data,
> not be held hostage to IEEE comparisons and NaNs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

