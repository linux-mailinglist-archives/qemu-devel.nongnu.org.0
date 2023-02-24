Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8A6A1DDF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:59:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZWd-0000Dq-UR; Fri, 24 Feb 2023 09:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZWb-0000DK-J4
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:58:17 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZWa-0003fC-6z
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:58:17 -0500
Received: by mail-pf1-x432.google.com with SMTP id bd34so979508pfb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DJ6YMcMqqVkO2Yq1pRbRxg35LAovBsz1IvyaBn6/Y80=;
 b=Q85q8pCledpCv12KcwJ3IvG0ZDweD8+aCre2jcbtR3+iuQQYNvwAHro11a2UqoM7Rg
 QqKMBgK9czJVJNGL5yGtoiDAoSclqmyo3FL68waQXjKfQoeRxXd+31w969ROl96M/7kr
 D7X/C7SSlOrAhutQMX6K53Rc8CJq+6wEHAzZVy6ngdlEUKmzyEVn9Td1rLJE+rh8xvL5
 eH9Zf7/fUOpYW9Brr83thyH3BsEEDbcbkJzs2DMbOWY9JDGrDR+m6pMuMAn1KfOUbLMk
 9hq0iMjo9swnnCXG1duguSyGXtiJfgGj2nPuG32d6UC+3gwVp77rqf8jkbZsjZ2nLt+j
 IqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJ6YMcMqqVkO2Yq1pRbRxg35LAovBsz1IvyaBn6/Y80=;
 b=IskMOyoE85hgxy5+cUGTmnKaMrWMhQXpXVyR/lgE2fZx61MGcB/av5d8A+Yzu1E7i3
 MuQuSi6dfH3X7DyYTnb3Hcz7Drh0L04cT1vnz6FMUj70ImhLkAtJjqXvAvG12d6pfbp8
 aBLM8QrKKjOrka7gB6eUf7zQoEj5zOZWhOK4bWa3sNSZWGS88Kx3a8JID/0MSZjyLu8O
 sNmeDmbb3TYbCxCRejypemxi9xhxE7rgwQJY5JZ5kx7xu8mJzyGBzz734s24AeyvnkYt
 uzm82S+bJpwruF3QKmasrLE5t6ZPs2tbiClkYQzO7c+SwwAxfuwef5gPVu1NFGod6HE4
 RlSw==
X-Gm-Message-State: AO0yUKWu54zvxInIOEiKVSNTGA9EKM3vqsJBpSEM+IEHFpK8C/aN7b6I
 KK41FzLmmyGtQVQP8Csm+Qz6zDypUcCCykUwK/wKOQ==
X-Google-Smtp-Source: AK7set8dc5jhIzWk64whm6t8w6MLoJpB28p4LJRexILrEBJRrMgPVt2ML7fV1VO32sCpt/STc/fh+DE7CW2ALDohLZk=
X-Received: by 2002:a63:6dc8:0:b0:4fb:b556:c9fc with SMTP id
 i191-20020a636dc8000000b004fbb556c9fcmr2978023pgc.9.1677250694556; Fri, 24
 Feb 2023 06:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-18-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:58:03 +0000
Message-ID: <CAFEAcA8_rbuXgj9BbJitDTZcW-Mho8CxpJmouG_JahzMHmTQdQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/25] target/arm: Handle no-execute for Realm and Root
 regimes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Feb 2023 at 02:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While Root and Realm may read and write data from other spaces,
> neither may execute from other pa spaces.
>
> This happens for Stage1 EL3, EL2, EL2&0, but stage2 EL1&0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

