Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98683E8BA5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:17:42 +0200 (CEST)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjQk-0006Og-10
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDjPo-0005Wy-RX
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:16:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDjPn-0007FF-8Z
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:16:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id t1so2463450edd.6
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bD95ItngIJixfApiESQgKn0EMLgpOaYaNv9CgmTXLbc=;
 b=Wm2Kv8aHmG3HuTa+0bcAiqmk+T6YT5jPttGVJ6WHSwybsOorCTJZathJYgTpE5v4Gq
 0dzAGWrtkmgyXJf5mstaSVI0WaJjuwS3XcMbsJyY/QdrzbL2SvU2dzwk+4NkxrHIQ/Of
 xsAj44mxNcYkkvQINpAf/SGmms9+EYLbWxkXGZSvFkVxHqlqzslBv4di+pW85+wLaMUB
 NNMcLQO7y63iCAm9gYxSNSCz1nZLRpW1eixK9SBzFDFhwkopqTKU8TQg/nx3UHHZ4wpn
 R4PySqhhcBLlglU00H+oOqLqFZ1CcFvyZqgEzlxx8lv9MN3PKH/sUKtrFs6eWuWHU1Wn
 9EIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bD95ItngIJixfApiESQgKn0EMLgpOaYaNv9CgmTXLbc=;
 b=RBIMRMnx0H+k9NdGCYyLqM8X5mF0w3HZE+Zn2oss+QgFgKYoX4HKxAIeu39OYWzGXs
 HM9qVJ9vhYvFQst6f+YEDA+bENh3/LEySzYkAkUVJw++xsw9hiE8ox5ku7vIt+zbz1Ze
 fjyB26fuapl5QYj+i2iHWh65fEfFYTdykMlDJ3v/k+4njl0La8bBBRxa4WecdWFd0TR/
 wjZiQ+pcnkAL9KVH88vN2jFfpr50q0ZAkr1aP09yOR7Aue5C6R9/Nt07fuVUZAenrlXS
 r3gs0XIFimsQl4lDs5VKzlw+DzIcwjS7zP/TNaR7MEf1mHyBxJAThtclSGeGHZPzF+fB
 m5RA==
X-Gm-Message-State: AOAM533xZtsHLNSgPvu/akrY1uw1+aVdwZ7EOGCCkOX18CxJaqXAa5St
 MvQhMOEye2Y6T6KuC24cHR3vrB45oc9TMIPxBA9kNg==
X-Google-Smtp-Source: ABdhPJzw4S+krBLWK0L8tDso13mhGOSed6TAKKIhl+PD8kXaZS+vml5g3pOvxFrHSarFsQ81AWZcTtnWoWHod/7gNKg=
X-Received: by 2002:aa7:c647:: with SMTP id z7mr10101905edr.52.1628669801379; 
 Wed, 11 Aug 2021 01:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210810124403.771769-1-clg@kaod.org>
 <CAFEAcA9aHX53JkEW3hbjWfeK=LL8QKxWopRAx4pcV6V=PKv3QQ@mail.gmail.com>
 <b840d4f3-efca-feaa-3834-375c8e51eb8a@amsat.org>
 <CAFEAcA9Yj=HwZcpg1S0tw7Oydnis2+_KR+5WimH6C43iWapxKA@mail.gmail.com>
 <a673221e-d297-9bfd-21f4-d44c15f61a1c@kaod.org>
In-Reply-To: <a673221e-d297-9bfd-21f4-d44c15f61a1c@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Aug 2021 09:15:56 +0100
Message-ID: <CAFEAcA_OB8AJVJB_Og2rV5ciO-FgYBMt_je=vuwOu+5DwsCGew@mail.gmail.com>
Subject: Re: [PULL ppc] powernv queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 20:36, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Yes. I should have added a 'ppc-for-6.2' prefix.

If this wasn't intended for master, can you make sure the
cover letter includes the "PULL SUBSYSTEM whatever" subject
tag and has "not for master" in the body, as noted in
https://wiki.qemu.org/Contribute/SubmitAPullRequest
please? That way my email filters will ignore it.

thanks
-- PMM

