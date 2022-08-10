Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE158ED3B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:29:32 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlm7-0006He-JB
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlXX-0000iy-DN
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:14:27 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlXV-0003PD-Qb
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:14:27 -0400
Received: by mail-ej1-x632.google.com with SMTP id w19so27657041ejc.7
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=0A+7I9wIeTRR/WwFlIyzEqf9IgADKymWG7YByQYTQP4=;
 b=whlq6MKmgsb1B/xPLJf99S6NA1JgQXd+ETth3Okc/3q1bqNkFL7ctgDW/UBBl9+4YY
 uZf/WmZEifli6AukWMW+zoGVM6IZ6f/2tJiunow/jodqN8ODVUb2ZU3fuU4o+i+yJOCN
 vHgtwu4RHcS+wjadxF1UvVvE+lQNwrG3+IxHyiH3jGfSzCeBrcgQ4ikNKMp0qcJ37mBW
 76SR52xatcYzXd3L9t4qEUzBF92Uum4g0sHPSDVzAsq5kVH6yWlnbSW52uTvJXK1YPax
 K6rOER2RdqfTl5O1Hi5FtJBoRpelN39/6M2GPnQ8VeSsxZnYYXzjUOoux7LUwwf5ycV8
 K+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=0A+7I9wIeTRR/WwFlIyzEqf9IgADKymWG7YByQYTQP4=;
 b=WwgaV9qtbxc+mIO/PzBM3zFr5PTcrYARzyPvaJtFXggC/S+8VvcdRA2BAT8FSd33kM
 sA+OwHtFqQLJRkLI7Qo3neK05KRZbOQ8e6u1uHQqx6O4ZnBV+kl77NRojaZX8lkbxLeK
 rPTEUyWc5EvbtgWgHGM6krPVUaszU4fYWXl/JQIUgb5+cMj3T4CHVoac/ILAh/yICrdQ
 UYJWDSHGKWnz+sXYb7G5RIDXCBPIt83vlbXhvHt4BjL630O9v3AecVUZBfdwhDqhL/ec
 +lIokVUtMvHauiRodWn5M0pM6UzKNHz5oOAfTmp4o1PUy4ma3zFQWw/2GiwmVf7TUnip
 d0+g==
X-Gm-Message-State: ACgBeo3GY7/vWGmrwOJhbxCCNZkurRYSJHOqU0eZiZeOHjv17Em6b9In
 7gm1euN6MxqZRkio34o/pFcPLA==
X-Google-Smtp-Source: AA6agR6gfZCDxPCfawgBE6T4piZPxR7O2D1i+FP0G4vfdlCGpoDZejiOd7jqpKdO7RffWz/aDrcmeQ==
X-Received: by 2002:a17:906:cc5e:b0:730:cf6d:5451 with SMTP id
 mm30-20020a170906cc5e00b00730cf6d5451mr20724650ejb.725.1660137264044; 
 Wed, 10 Aug 2022 06:14:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170906304500b007262b9f7120sm2276009ejd.167.2022.08.10.06.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:14:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1554D1FFB7;
 Wed, 10 Aug 2022 14:14:23 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-19-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 18/62] target/arm: Add is_secure parameter to
 v8m_security_lookup
Date: Wed, 10 Aug 2022 14:13:24 +0100
In-reply-to: <20220703082419.770989-19-richard.henderson@linaro.org>
Message-ID: <87wnbgkzps.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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

> Remove the use of regime_is_secure from v8m_security_lookup.

s/./ and pass its status down to the lookup instead./ ?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

