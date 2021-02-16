Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD431CBBF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:20:37 +0100 (CET)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1DQ-0007yw-Mr
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC19z-0006Oc-9n
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:17:03 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC19x-0000zR-Lg
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:17:02 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hs11so16853489ejc.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mrcNB4k9RUwc44gWgceW68StAnowKvGyTsZuFGnwWkg=;
 b=pL5txxO08tjc14UPTwlJHDbzoMXt6sHpao8HWzTwyLARSjuJP15daSb07CjuvARO2R
 mV6kElN8yptQhCawcOExBrMrmYDuOBeEIEU5RmZ8q2gNzpItFypnX+TmOSirwt9ZKgZJ
 OOi4BNeaWtJZZqUzbzOz86hSJ7rGsxlGdRPTs6v5l0K2XZ8MibthEymaFEPSiC4MfnMV
 J08Oq+gjgN9pphu30zvbuZ6YzrYoSOmrwRVsxIqExIjiRLnVygI4a/7oIHdkIv08dkOR
 VP7+H3yk9eZxZUkFUQnkho4IBgRm+J1t8hGuq7i/Kf3NwnAM+r1tC/BVCiKYEpK2PPRt
 /yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mrcNB4k9RUwc44gWgceW68StAnowKvGyTsZuFGnwWkg=;
 b=eCraKar9JBgVw7nV3jTv/K8Pru6thiKqWGD0gmus58yQl8fwNqoR/ilD3XlEf5ZenX
 NlWzHv+/MCRwR5C78OoJ351+LuH5hmaRUlqBxMF+QqPwchPqwMMzowyuwTrx9j/sGey9
 IMTEihZO1p4JgCl6/ytIUpsXu/LxItmL7oqESt4vNAKYgEaYe7n03ymjmjNeS70tAQXD
 nmjFNtggDr9nAMV2ZE2lTarav9T24eVNDWs2V7QzmJ5JFELZpxVUzoURbsMMUZC1q6CL
 AmMMPNCkAjapvvVLUxnfXlRSfurU3gRDcqJFrGRgiIovquDR9YHkz6i3E7N2ludqa/Su
 5eNw==
X-Gm-Message-State: AOAM533RIfVHLuKNOm2GB0PmkqrVjpcqy7u6dpbsQaBWXIUJQZEiEn4b
 +bolLcrPeTE/mCGUqP+XfCowOmTo8Xc1dQqZl+71RQ==
X-Google-Smtp-Source: ABdhPJwIg6eBMb3QYYJxC0MsdZJJhfUuDfYacXzmxjx1/21DHWE8djK54amTnf/G6qfcjHRgeFN/MWihoTLtOvKLumQ=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr20612805ejd.4.1613485019613; 
 Tue, 16 Feb 2021 06:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20210211085318.2507-1-luc@lmichel.fr>
In-Reply-To: <20210211085318.2507-1-luc@lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:16:48 +0000
Message-ID: <CAFEAcA_ZihvLVDXwnkYtp+c7Vh-Cz8Jeus-0XjtGOE6Oi_b80w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself maintainer for the clock framework
To: Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 08:53, Luc Michel <luc@lmichel.fr> wrote:
>
> Also add Damien as a reviewer.
>
> Signed-off-by: Luc Michel <luc@lmichel.fr>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)



Applied to target-arm.next, thanks.

-- PMM

