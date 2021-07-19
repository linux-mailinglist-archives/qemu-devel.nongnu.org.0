Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB43CD7BC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:00:00 +0200 (CEST)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UkR-0008VG-Q9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Uj0-0006t3-P3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:58:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Uiz-0004ME-Bw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:58:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id m2so22458646wrq.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=ZE4qXZr+Mu/AN6P/hPg+6Nps1neuwS952xO038oB8BX7rTItyHvVPDrkaO/gWca85k
 +ScKfk55K0KC60SyTzSHqEFtm0Pwy5Y1D+OC9sRKc/HYXkEK7VXe2qeHxmyC+w1IQlr4
 VQLrXVhxophPgTbbbeItAlCEgNI+WP3szkDKGM7HhOX4KEibJYpXsej09RXG82coxWSP
 hCWLg+oOMlJKSnKNiCvV5kRyrzy/OYOBvK96w2+DABS5K60ai8W6RTOp3xfMS923btEB
 y3/9+IFWaH4jL8RRN+6QZkLIY4oLE0CYR+w97dwLL1S66ntL/d7y8n9HBJXOsuEJAKEk
 dnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=aotaVHKuPJqW6OqmGQaiutW7+RXldZNLkRZe1JXHe6BEK4YdiNpYOv8rBNjOModi5q
 RkAol/2+FBwBjTQsSBCiK66rQrSmjOlHhrWtCV1Ooqe6WTkvdnC0EaXJ79J5KELGy6mk
 Ti3Mg4RK7kIT1G3cORna1xCaZO9Gk6klIsiciCQjZTa05UU6u1HmvFy8l3Ifcg0VUmSA
 LsCrXpoRpD1osjWjS0IxaDlz2TUl5m5oxLSBPrvvzK+N9i4MnPp1p1ynZH8tXWUC+Wh9
 mmpM2sQfj827WzPas3iUIdSesGD26uEHGt9VtMCp5ARGLLH5Jt+Fgi3XNfeyi60x/FZQ
 VdhA==
X-Gm-Message-State: AOAM530fQ0o1EZiCwMzwX0/gfTzSWI09vuhPOGgelgSuau0jWNaritBB
 j5BEVEwZLPlqieQEge8ykr65aA==
X-Google-Smtp-Source: ABdhPJw8mta0tiRTg+YTGvUnRQKxcRslZZx91SGrHuvlKB/JapntIkXXszqAlCfQyeg7blvoc7YjNA==
X-Received: by 2002:adf:a148:: with SMTP id r8mr29295724wrr.415.1626706707776; 
 Mon, 19 Jul 2021 07:58:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm23204072wrr.90.2021.07.19.07.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:58:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 760471FF7E;
 Mon, 19 Jul 2021 15:58:26 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-9-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 08/13] docs/tcg-plugins: new passing parameters scheme
 for cache docs
Date: Mon, 19 Jul 2021 15:58:21 +0100
In-reply-to: <20210717100920.240793-9-ma.mandourr@gmail.com>
Message-ID: <87y2a2nyel.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

