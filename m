Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0140D784
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:34:47 +0200 (CEST)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoj8-0000V6-Rc
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoVN-00081u-6l
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:20:34 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoVI-0005wi-8T
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:20:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id d21so8570852wra.12
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d0iKR5WMLe8R+MupCEze5jmsI8mxg2Y+/xLp0c2yn0I=;
 b=q5f5kRkv8F8Ntw21lJKzFRGfatsUXHJTeYRtKoZdVjhZ8PbgwjpfIEaOI3fRCv7LGc
 TSLkjlkCjEvoAz6lxbHKR0jwNoM2UkCRgo8d9dVs2sekvywyXv4p/5dUuVGZgBe1t0+b
 5GhKE2tbNjw9H3fnV65sgi2LD6EKI8/++Mo4XKrxzGaLjEHFm0hY/B/eo39WuVIOE10A
 MB/vyBa8tkNBIws7D92Gb+SN3L+spsQif5cARYIi82KjBeABXswMrRw97mRG30efBrgu
 ooiv2wzLQoybqDP2aBraFXXRbqER5fA1p6FzqwZX5QNRlgSt5/bvS/Qg2GY2nwfY13yi
 vFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0iKR5WMLe8R+MupCEze5jmsI8mxg2Y+/xLp0c2yn0I=;
 b=7nn7pEMVC4KdY9eNeVckC2M2NosNLy+OW8EMggY42NiPdvlbqnf1qbzVY1lsxfdwQS
 XOGxgJwE2j5gyrXJf0Iiblq/mt7EbRUe8EXiYXWJv3ODH3webgXPJA4YZ12FmZqWhPkd
 rBJgvgXwJUFTT4dxnha22FpNecEmGuAcacnUV8o58zk93i0s5A4Pu1Jx2pxl5Cmod/nZ
 3Jn8dvB9GAbYuBCvsDSbQZhf45SyD7Hr9K0rtCp2nxDlwgS8rEsa69bTt3pfLbxH4aBu
 IZVj0ql3XPeman2I5a6T4j8fs819HKn1ZLOVf0z3THX11YAGh7aXkSAV80plmOnuN6HP
 yW2A==
X-Gm-Message-State: AOAM533hfua5MdTBppmQ8FlAFYBPCmPtTYMNXdayugA4mT6OgPYuVE2V
 9DQuO9jHiothm/5vTFIUTGcI1IZgh645Nxk/aWW69A==
X-Google-Smtp-Source: ABdhPJwtwcJYjRbZFg2kLkYJgXJHZoIEk4poMRjnXXMgcfT2LI9RwvVM+b/CVUfIboVRBIxPPS/rqY65RRqpvWZrOnQ=
X-Received: by 2002:adf:f185:: with SMTP id h5mr5221988wro.302.1631787626432; 
 Thu, 16 Sep 2021 03:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210915164329.13815-1-pbonzini@redhat.com>
 <CAFEAcA_6kdWX37d+Ak6nQVywE6f_4sGYvQZ2_H3+9ONzi7HJeA@mail.gmail.com>
 <79f8bd2f-3bda-b88b-1103-87623b2039c6@redhat.com>
In-Reply-To: <79f8bd2f-3bda-b88b-1103-87623b2039c6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:19:35 +0100
Message-ID: <CAFEAcA9Zu1khN=uRYvbm_xem-5EJAmXV3z_S0bKZO3YO_OxUzg@mail.gmail.com>
Subject: Re: [PULL 0/4] Update meson version
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 23:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 15/09/21 19:34, Peter Maydell wrote:
> >> Paolo Bonzini (4):
> >>        meson: bump submodule to 0.58.2
> >>        meson: switch minimum meson version to 0.58.2
> >>        hexagon: use env keyword argument to pass PYTHONPATH
> >>        target/xtensa: list cores in a text file
> > Was this intended to be a pull request ? AFAICT patch 4 at least
> > has not been seen before on the list for review.
>
> It was intended to be a pull request; but it was not intended to include
> previously unsubmitted patches of course.
>
> I have removed patch 4 from the tag.

Patch 4 seems to still be present.

I would recommend a workflow where tag contents once tagged
are immutable, and you use a fresh tag name if you need to
bump the pull request.

thanks
-- PMM

