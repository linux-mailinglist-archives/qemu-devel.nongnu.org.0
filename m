Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6CC1AC5C5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 16:28:53 +0200 (CEST)
Received: from localhost ([::1]:35026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP5Vc-0003Vn-K3
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 10:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Ub-0002XA-P8
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:27:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Ua-0002D2-Ol
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:27:49 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:47078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5Ua-0002Cm-K7
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:27:48 -0400
Received: by mail-ot1-x343.google.com with SMTP id w12so3154510otm.13
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imUwsrg4zm7K3dVi3ANN1ml3OhfIyAqYieMkMrLSbc8=;
 b=IwtguvsmsVuf5tBB627e317tnkz+hrzt6aX3VxeYCu24a11DNTEomGVTVafdaU4Vro
 iOuyQwA/z7ETTGLJIR5NRMwLsw08qCnmEJdtQqRHdoqDUqcnzkppS1uqAsMinbgD7Yw7
 Ku/wCgFRQEbFQJJ4YV/YhGgEo6FHbepFMCRgF855CGnoBnCKEtDz+7Q3zbQ1rdscjnUw
 nCmIjAY3fCAuIAxq4/Pg4NtfqF5dxYCXFFaRc7AsawflHAvKxy3kGxxU7EHD2z/9dOBh
 ZXgFqL507p2se0pk7pPQib6fT1+Qv0cV2YIg4qn8zWlbYYb+DfdCmi2185JNRmZ/N3ah
 nnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imUwsrg4zm7K3dVi3ANN1ml3OhfIyAqYieMkMrLSbc8=;
 b=ihwSYzKVfq9sSwZWdOKuBgz7RnAUsaZ2c0/ASSePiWkAVSpbhtX+3DDiI0RzOT4Ioo
 qYiI/vLxd/Q/mc+cyc6p8AOi1DxeeVoIjZutdpikDmYAa5uVus7w+GJm0t/3gib9UVGZ
 MBg6Hap/rxdV7SDmQXqAecn4pEuEqiDn9ulL+msguDTQbpaErR1zpi8ozGT9+e8nZ32z
 QMrzr4DN8nJP2rwLtDjx42YzzfEyfNNMWBgdkZfffgK55tEkiIctAURyjuAYy3Jt5U4u
 MMl7PqPFt07He5QHsR1Cn1lZ6vp3GdFaqcyjPJwVeMfwb3y0HnvygCKRHAV6MOhX4n9j
 8BtQ==
X-Gm-Message-State: AGi0PuZUhXPr21yr4rSmrs+rw+XuHGjzY6i6qw5KCHhOxvnl0nefQ8SK
 HCv8H7ufPlyg9SsQ8JtGQYV1BNvrI/3WeCsZc4NXNg==
X-Google-Smtp-Source: APiQypK1aXh3lvwp4jkD52klj5fBOM9jRt06f8E+aJ+pukrPpkRsIXjy2PibTjZWBSUZTL2unStjomTt+CsUukQxoi4=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr5449274otc.221.1587047267227; 
 Thu, 16 Apr 2020 07:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-17-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:27:35 +0100
Message-ID: <CAFEAcA8nSANczC5SE1gnnWXCLiB-svziV+14oKSUyj2T7s=1rQ@mail.gmail.com>
Subject: Re: [PATCH 16/16] target/arm: Remove sve_memopidx
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> None of the sve helpers use TCGMemOpIdx any longer, so we can
> stop passing it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

