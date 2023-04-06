Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D876D9CB4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:51:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRsU-0008Nd-Vi; Thu, 06 Apr 2023 11:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRsS-0008NS-KB
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:50:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRsL-0003F1-0k
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:50:20 -0400
Received: by mail-ej1-x632.google.com with SMTP id by26so2461064ejb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680796211; x=1683388211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+EDlHC70P0QB5JU8eETHGoqlAY6pq9IJg5SHPOQYFXI=;
 b=MBe/rzi7Xb/JFsES0DZDYjft+p+cnuxjEqbfErt851pMdPhEDbnhyWXyJWKTulhirf
 UfZVq4m63UbmkYYT3p3S2wAEpI540keotWcWCqiNBHj8WhLH0EDbFLKW59Q8ozNx/Mc9
 LFmJMAqHcLLT0WcNklof03P3lYKOEYSQL5bycc5absUhJl/rM7v1rEjoCaIlllTROhid
 WUZ5l5wHY+IHxpcTXTW7etAQQ+szfnKQCpQfo4XR95kWDHRj2ksk4+K1Pk3jnFTpa4TW
 VDozLkS3dlSLkajPNRq/A1jdYIyOPw8+Nf2VXZ476VxHS+QqzwZhX/BJ1mgRIcBZUoAG
 zgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796211; x=1683388211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+EDlHC70P0QB5JU8eETHGoqlAY6pq9IJg5SHPOQYFXI=;
 b=4IS7JPADbKvl46WOM7Fofrv0EnADH9SGIuGu3bPvs5a1UJSuMjtBM4rDRnuUTx1bMb
 BP53bJ/qwjW9/H7rc4THNEtgjWcK8lSGCfNTyHBumQe7fyGMTNfSKaMn0Itp9mu2OHwu
 7ENP1L9oNPYVKTxs+K19WaVYunubnXQMQFVgDwavi6jTd1eWCVWz9DcPpJUgrhPfztPC
 7jV9VBwmXzWieuisfiGxzLTLrElQSllBTh7r+gJBXNrHLIHDioakyfQMWfUPjqNjEAoH
 3Kl6bBAjSWeNEs90LOLHAH0syCYEujmqyFDzEqtS0Msb909+70bLrlT8KMRNqfwwa76E
 +kOg==
X-Gm-Message-State: AAQBX9c1DMRm7PjxtYoZlIbq/4uUgfNVZM1OGmbvPdAnLEgXbRsH05DF
 pSStE9jX80gGq+djQVigJ1uP3fJZkekBce5+HLdtQ+BtfQnpWRYM
X-Google-Smtp-Source: AKy350a/EZ7yFP9DN9Jnwsp8sFGrOx4i4EP0qCsFEKJSCJLrClEyYQmkEd7sxliLVcFGCHQMw6WmMZCciyzcGB/pP5c=
X-Received: by 2002:a17:906:9bde:b0:924:efbb:8a8b with SMTP id
 de30-20020a1709069bde00b00924efbb8a8bmr3604663ejc.6.1680796211120; Thu, 06
 Apr 2023 08:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230406154347.4100700-1-stefanb@linux.ibm.com>
In-Reply-To: <20230406154347.4100700-1-stefanb@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 16:50:00 +0100
Message-ID: <CAFEAcA_6FgLU=-03gJsRbiqE89Pp7qQwf-cicr8iSVLTXQJ8kg@mail.gmail.com>
Subject: Re: [PATCH] util/error: Fix use-after-free errors reported by Coverity
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Thu, 6 Apr 2023 at 16:43, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Fix use-after-free errors in the code path that called error_handle(). A
> call to error_handle() will now either free the passed Error 'err' or
> assign it to '*errp' if '*errp' is currently NULL. This ensures that 'err'
> either has been freed or is assigned to '*errp' if this function returns.
> Adjust the two callers of this function to not assign the 'err' to '*errp'
> themselves, since this is now handled by error_handle().
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Do we think this needs to be fixed for 8.0 ?

thanks
-- PMM

