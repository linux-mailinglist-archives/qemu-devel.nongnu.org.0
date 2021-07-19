Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A883CD80B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:02:18 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Umf-0002c3-Gu
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UjJ-00071b-Kt
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:58:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UjG-0004Wc-HV
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:58:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso13049885wmh.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=UkKHMaIvTnUX2M4AruSy2BoxM3NEfb86RNgRvD0404KE+Fn0OQKPQ4JAo9t5A+QbDH
 W2guxEIVGlUPECE8ORFVjRWbpvYYjYB77sWff/zyuRDQg8uw+p66BoFe6ITN+kmgZ4jb
 Bd4Kqlibib/nYn+PPDBYPoQwWLbBTawD2y1BoUOizB+c3Mm37ZUplAa/4q7rk9jFUwG6
 3GoMdUWfHdhDKXX7Az+MyMbMJwlVyqUO4H4IT0TGxQBEzPhE6WHEj9JJPVtKwJ/qZktg
 fSeQ/JgtM+MjQ4rCdYpjSaJ4I1sM15BoRsPZ6WHJSLXiaH0sipPZNcaccjhfnj2wymEm
 gORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=FYV2Vf0xL1/WfuEf6YRFK/dNhsVGAUc/GeS3IRAc5M9xQDwzgKk4hpkKScLNdozdEO
 SnA0AwsG/HHWX7lIgF7hVIUxWLXhyp+RFibN+EK5I/kcy5V1Ci6Cd1zAYwaEmj3+ItVP
 8YFWJAy8kC5pph/Av5qUOfuhd4UH3RRJGobkpw3EjA9UIdYZwIJqS82b7AEjvbPTsAFe
 UsEvh6ZBfaWDSd8IAi9ZzBVhJ2oMfJqbr6JwQR7+MY+UPvTwX59MRoNAwm35ZxJp5TjI
 8el54ra0nFKvgo7iD85DCl0iEwHB7q5Uz+uTvObQ86MaNX6RDwUXRon/jqHKyWZaJkwI
 /lhw==
X-Gm-Message-State: AOAM532j84/XnAoiI7Uo/4qVXs4IJTf5FDJGF7HF/D2Seb9todGlJIS8
 hIeAUE5ssjZO3JzozECvSL96UA==
X-Google-Smtp-Source: ABdhPJxRSMClgBrHr6IgOvVzAYSLp/oYF/70JM+HLeuIggTpCfySVnyT9EQ0q7nBHm+Fq2UwkTaWtQ==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr26998066wmi.49.1626706725226; 
 Mon, 19 Jul 2021 07:58:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x8sm20509634wrt.93.2021.07.19.07.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:58:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E54531FF7E;
 Mon, 19 Jul 2021 15:58:43 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-10-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 09/13] tests/plugins/bb: adapt to the new arg passing
 scheme
Date: Mon, 19 Jul 2021 15:58:39 +0100
In-reply-to: <20210717100920.240793-10-ma.mandourr@gmail.com>
Message-ID: <87v956nye4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

