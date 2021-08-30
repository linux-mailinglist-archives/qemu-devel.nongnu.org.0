Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B23FBC82
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 20:34:57 +0200 (CEST)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKm7U-0005LG-Oc
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 14:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKm5h-000461-AS
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 14:33:05 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKm5f-0001Hh-GJ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 14:33:05 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g21so23026722edw.4
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 11:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIb+v+rO2iKAAEuvpG9L+K/Oq3mzUri3cXNmFI8shbE=;
 b=mi+b5rHejx3HnCm/WuJ1AqWVrhAJGFUfIZHpp8EbvmvmOohvv4eSv50X2tdQ4ncuhJ
 ZLxAVBizCzsZvWpqwwrDo5is0l4hL9xleQaTPPzGc1bvmzvXWAgaweq4WH65aiqsXhtF
 4Id9OZSKJEZBOpqomQpHdTXwyIoNoJZH2oE+XijEm8NGx24BhO2tb1wfC82K2hYVF8Ze
 GRXQeuwrSI9BnucWLXqFTxCPdl/aZMSnKwDa/J7zTUtgiorCVjdlcXmOc/peHs9OIw26
 tLYLU++Tru4m/7/mpf6Zluj2Als7BveX39sHDaVzDqJr1WoKhdrBEWfd3v9/LWMa0VnL
 i6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIb+v+rO2iKAAEuvpG9L+K/Oq3mzUri3cXNmFI8shbE=;
 b=Y6cnAAarUVp6eMyQ1MZKZfXBu6WyPplqjTQNM7ixlYYfiFBBDhtmxXrZUNN/uSx0+b
 WPsuXL1eSLJoEjx9KX112NDZKmGAoyv/Xt1Ba84VoAwMEcPcDkfSwVI+qXRwYqtuuVSn
 NJTR0fLNxyIDI5axNw+xh9aGHhkHBI0iKsXH1USNCIevhUFpScRbdIXT09a7ukFb49T/
 eBRJMbDrxRUEXHv+VElaWcFMLY1EpVGWLPfWtQl183lObeTy/5wxUEvhIoYwsA/5fjdN
 FPe/RibFGU9dj9URowBxTs/PpikeUJmNFUJpA5Nhp95NXWkjmmpESvWKEJ3gz1Z+6f3B
 7Wjw==
X-Gm-Message-State: AOAM532BWB4sX1KF/UAKMwsiZAdJ7eg8R3q48Ih/BsNF+fJVzKL7PEts
 0seuk2XQnXJcm1TDw3l9+7yesWxAgPBkFVFABAOJtg==
X-Google-Smtp-Source: ABdhPJyhBcV+FCWrXH9Ujn7LMQJCGVHT8JG4iknv6F4RgkPkFmusUNlap6ZxzqYeH5CImo/3Ameukka0Nc+NZK747hg=
X-Received: by 2002:a05:6402:2816:: with SMTP id
 h22mr12543570ede.146.1630348381975; 
 Mon, 30 Aug 2021 11:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-2-danielhb413@gmail.com>
 <20210830093446.0b80edfb@bahia.lan>
In-Reply-To: <20210830093446.0b80edfb@bahia.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 19:32:13 +0100
Message-ID: <CAFEAcA9chWuKEOiGce-Db8Orz81eCjKhHvvbOKAuRMW34wUQ=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] hw, spapr: add 6.2 compat pseries machine
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 at 08:36, Greg Kurz <groug@kaod.org> wrote:
>
> On Fri, 27 Aug 2021 06:24:51 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
>
> We usually introduce the compat machine types for all archs in a
> single patch. One was already posted for 6.2 :
>
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20210823122804.7692-7-wangyanan55@huawei.com/

Would somebody like to fish that patch out of the unrelated large
series it was posted in so that it can get into the tree sooner?

-- PMM

