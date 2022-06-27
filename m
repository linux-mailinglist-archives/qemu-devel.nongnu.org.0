Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2155B8C6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:53:40 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kV1-0003v9-Ko
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kT1-0001bi-BA
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:51:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kSz-00051i-Pl
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:51:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id ge10so17618368ejb.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0/cDPjH8+eQH7UkVvGt4Z/3quo+1uwQm9pZRhLFds9w=;
 b=fvDVGb69WyTQIEMZb1FiB8yH78DUYxdDcNpvyJK3Rxn45mYA5yy/e7mslZJkkJKulO
 kW+KCOBIATI18jBVqCsUNKhRQSKhilKTlm6EGI2tv3xfmO6tucTCbvJET+vVQYwhNKwc
 aH2xPsCyPhltfwJreqimKyGQyiQtVY2B5XX029VwECCT6GSXd8m+tFO4OOk1eT+IqQKa
 oHeRFuEGSvwLdUplEr4SBjJdkOlJArAm2kP/CTkW2pxO35+guMBOXc9LTr+7bSqoSV4a
 YDWq3AY5qYr5Zrw/RZhZ0yseTbhCSDaj93hCqtcg3+MsuMeyS14ywgKRngf8Zlj6W3sG
 2Hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0/cDPjH8+eQH7UkVvGt4Z/3quo+1uwQm9pZRhLFds9w=;
 b=e3dQqr0zTZQQeLLct9997YJxvpC/mElSrqvyqy5ZNQBaWlDQHXi5ofRuVw69NF6foq
 6JFNDrYPqr71bQICZgRqGH3kyP8/CJH9cLq+j4mjfS5Onr6W0xI7Lha2MQHsU0WrRVtk
 x4BHyZ0KOal0avWw6lcoJqpt+T3qqrKuonqcblZjh3k/icuG0oQK7ZTbIfS005lHVrZX
 dtRR2g9EbBMZF1CJFoAYqYcPTInwOMB2Q/GIBn/hfs6c6ENNafAuq+5StMh+oaILu7CZ
 oEqJZswSvxIL1Xmb604n7n6dIsRhjNML9zFtzTgL7itXJ7Np9MNP2H9IHSzqrNg9JmNn
 zO1g==
X-Gm-Message-State: AJIora8K45xDOwKjnq4ZVAKKPzJsUNgBmzP+Nke47NmC8ZI70vgpsvNE
 rzJXq+MLANojimg1Mrz9F3clBw==
X-Google-Smtp-Source: AGRyM1siIgAeGrnVAU7oyuZXooAVUbgk2BzZudhYcaKr6F6g/cK0qdU54/ASgA6Y1m/5w2OZe/oB2w==
X-Received: by 2002:a17:907:3e20:b0:726:2c09:3fa4 with SMTP id
 hp32-20020a1709073e2000b007262c093fa4mr11753940ejc.101.1656319892416; 
 Mon, 27 Jun 2022 01:51:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a1709063fd400b00722f66fb36csm4690526ejj.112.2022.06.27.01.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 01:51:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E87261FFB7;
 Mon, 27 Jun 2022 09:51:30 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-27-richard.henderson@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 26/53] semihosting: Move GET_ARG/SET_ARG earlier in
 the file
Date: Mon, 27 Jun 2022 09:51:26 +0100
In-reply-to: <20220607204557.658541-27-richard.henderson@linaro.org>
Message-ID: <87o7yelca5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Moving this to be useful for another function
> besides do_common_semihosting.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

