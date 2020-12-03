Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AC2CD502
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:59:09 +0100 (CET)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknGO-00004r-CD
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kknFW-00084i-Ql
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:58:14 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kknFV-0006zp-28
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:58:14 -0500
Received: by mail-ej1-x629.google.com with SMTP id x16so3041113ejj.7
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/bDVoYv54VpQ3bTHC+hiMbEyAfLnOKtgQjcuIxh19Qs=;
 b=M0gv2lpF3jyefLqwciU2p6RsDEJTqAQvAaAzv8FPID+BYCUPVelBpes+jvFmkNiZ1k
 nAaIpNBP3Pw0QsTbiwQkyUwAnt1y2aRxOUo7wY8p88BpL3G0DYznb7cwlE5/D3JcxRDa
 a52xQJwQJ9sa5oqxfLwVKFJhuXra3ajkSf7jOmJM6dXwqkRpBC4WBAUPcaHZsKhDK482
 URpe2X5DsmMs//oG2o29Fb35d6HuXf6sX3wqZakNQeZz/pISVc8ROIB5ojjWgN+DmrwZ
 N/7TohrQ5BNfkLJy3KkcpiBrot23Fztr6zVFmUEl/H1o3EMXIVbI8u+pjAp5XeLzzeOh
 1Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bDVoYv54VpQ3bTHC+hiMbEyAfLnOKtgQjcuIxh19Qs=;
 b=W+8fCQNZQZKmRwXr+9BqjTUeIqRMw874k2z9wxK21d29p8SdsM/qIDvwjI5tNqVm3z
 0H+0r928DPpEnF3rGO/b74FPnVe3wqx8xDyAR1Lp9uPIuhLhgSqliGJ0F749NpIU7+qU
 m5x/pDaMyyMDGJH++TZzHr74R1d4tDRTx9OmMoUabxyZWSn8qvRw7eu0vFVjmI31Yu4t
 072AtbaVQwl8egd61cIfvCQ2Xg/7Jp5gR+5IRrYka80kHO1/s1bHPJiOah+x4uwmclwk
 14KT+Q4dhRSKq4QSQQH0eWbUSjUm+VHuJQoPfo53BVTFzPLIy0PzBA+3MCdurjmvVHdy
 KfFQ==
X-Gm-Message-State: AOAM533HVG9mxM+0kmD8rnP7W5w1ZLf2UP+8+30ZvZ7oLz8rbD9/WSTT
 whgX9KNXgmlmIcjYuTrxtYdH5y1IqytgzguRWnEWHw==
X-Google-Smtp-Source: ABdhPJymciFOQOLczTDsBkE1DXozfVjDe3Qh9n9WP8Fmr899Gce0xA9ABImTcl4ROL9OiDtHt+1PWC5Zt5iRIhc3wOM=
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr2182566ejv.4.1606996674708; 
 Thu, 03 Dec 2020 03:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20201202101655.122214-1-mst@redhat.com>
 <CAFEAcA8N1Qh0gUX8oTTPOEuq_+DRzJ+9V1RqKzVhXN+4aoBZGw@mail.gmail.com>
 <20201203054505-mutt-send-email-mst@kernel.org>
 <CAFEAcA81DAGk7TPLKpExJ40cipRXB9L1wXz7_3=0xLkcPWJgEg@mail.gmail.com>
In-Reply-To: <CAFEAcA81DAGk7TPLKpExJ40cipRXB9L1wXz7_3=0xLkcPWJgEg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 11:57:43 +0000
Message-ID: <CAFEAcA9rbZnfKAk5Ug-hFM4NKNsvjZBQKq9PGHnH6HWwPv3KbA@mail.gmail.com>
Subject: Re: [PULL 0/6] pc,vhost: fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Thu, 3 Dec 2020 at 11:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 3 Dec 2020 at 10:59, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Dec 03, 2020 at 10:20:03AM +0000, Peter Maydell wrote:
> > > On Wed, 2 Dec 2020 at 11:03, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > Patch 5 gave me pause but we do need patch 6 as
> > > > it's a guest triggerable assert, and it seemed
> > > > cleaner to just take the whole patchset than cherry-pick.
> > >
> > > Is this only "fixes a guest triggerable assert"?
> >
> > My understanding is that without the patches a rhel7 guest triggers
> > the assert if started with vtd enabled and virtio-net with
> > iommu_platform=on.
> >
> > https://bugs.launchpad.net/qemu/+bug/1885175
>
> Bug reported in June ? Is this a regression since 5.1, or
> was it this way in 5.1 as well?

MST confirmed on IRC that this isn't a regression since 5.1,
so we'll fix it for 6.0.

thanks
-- PMM

