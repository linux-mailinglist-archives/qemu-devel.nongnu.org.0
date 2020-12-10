Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC8F2D5930
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:29:40 +0100 (CET)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knK8h-0003c9-Uv
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knK4F-00012E-2Q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:25:03 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knK4B-0007LN-PR
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:25:01 -0500
Received: by mail-ej1-x644.google.com with SMTP id a16so6797041ejj.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S0JYnvx+8x6KXqypygWykNS8ABB3q2AZ1ZDyBYrlofw=;
 b=twTfr8v6xyPUG6nSYPjDL08gRiOIg5bHPLU9UV/++rfHc72haF0/hXNMCO8PzKc4tT
 rLDmH4QrMStM6p9rCzqezrjuoTrcZC9RqP2IsRg+pCjLnTVOpMqwtbtjQmH0gUk2frPI
 WxT//3IRImBNS4OcDV0roi6wvtLS3FUXHTmnV6s+EBq2xGFgKXNMflcSrFECe/mp0ENC
 GZ+b8J6TMimdkpQNZCMET4VvxFXbclva2upwWTJqFK1ciNKoJY1Hbf9I/1uh9ZMt00tv
 vLzOhblFoFrx62fUu+27EUzT97AuTGqLjysdKLatU7xJGTQ3kJdbg7jzE89PZW7ZcHpJ
 6wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S0JYnvx+8x6KXqypygWykNS8ABB3q2AZ1ZDyBYrlofw=;
 b=XVD65CvzBBgadaIsOlJRWHPEXiVZNHTCHujJxxI5XD36dUUqszNI1CXheg4RL0vNAO
 aOb+jq1Azzc3aY1Uwvh1F0s2/fT4pD6Q4ZdCOCCxwZOhcqqN4XWIYbOKSF0toHVTrpHS
 KLKz38+km9RtmOQnc/uCIq0o+PlqnUoU7GSW0X9zkVwEY45xrP1Urk9n6wZ801fosfJn
 LFdGcCzp9P5DJGCgj4mXH65Ne6nfucNsBC51l77RsW2OnFRX8hNpdoF0sqn4TndeZ2GY
 bLgGa0uv4PjCIcGuAmdr9UDJxo5hDpYuRkOGS7YBJLZJnkyrHBrZ26DUBWZhSUEZkM5/
 5iZw==
X-Gm-Message-State: AOAM5316wPuKOyNDrfHAzy2Ulvv5O4NOTuJz+fb1KDW/w4YbtI/bSyk6
 3psbUKYVU09+8pp9uLTjTkg1pYx/bo6OUEJrUDXU5Q==
X-Google-Smtp-Source: ABdhPJyFnCK7oav7vngMvwdR4DQz1ZY8YrUX7zyFiL/0ED+K5Qc7qbQuexoCnT0JV7lExF5h++G5ttFOfBfnfhJSWyg=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr5915244ejf.407.1607599497556; 
 Thu, 10 Dec 2020 03:24:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <20201203091404.GA687169@stefanha-x1.localdomain>
 <CAFEAcA_YTeBy3T5umkRKnUx90yqLD1HRHzcW9FsA1iDJGezcEQ@mail.gmail.com>
 <20201210111355.GD416119@stefanha-x1.localdomain>
In-Reply-To: <20201210111355.GD416119@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 11:24:46 +0000
Message-ID: <CAFEAcA8yPV57wzFYFuWFX4hBnsfiBS5hQsoix5=CFvFtsPoQUw@mail.gmail.com>
Subject: Re: [PATCH v12 00/19] Initial support for multi-process Qemu
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, john.g.johnson@oracle.com,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kanth.ghatraju@oracle.com, Felipe Franciosi <felipe@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 konrad.wilk@oracle.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, thanos.makatos@nutanix.com,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 11:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> On Thu, Dec 03, 2020 at 08:40:11PM +0000, Peter Maydell wrote:
> > I would prefer to see this going through the tree of an
> > established QEMU developer who's already sending pullrequests,
> > at least initially.
>
> Once the discussion has completed I can send the patches in a pull
> request.
>
> I don't want to be the bottleneck for all multi-process QEMU patches in
> the future though. That's why I think the authors should be able to send
> pull requests on their own after the initial code is merged. Much of
> this work is isolated an only affects multi-process QEMU and the feature
> is marked experimental. There is little risk of introducing instability
> for non-multi-process QEMU users/developers. Hence why this is a new
> subsystem and has MAINTAINERS files entries.

My reasoning is basically that new pull-request senders are more
work for me, because I have to make sure they have a GPG key set
up, and then examine pull requests pretty carefully to check they're
well-formed, all the sign-offs are correct, the changes aren't
touching areas of the codebase that they shouldn't, and so on.
That's particularly painful if the first pull request that comes
through is a massive one rather than "here's a small number of
patches with some bug fixes".

thanks
-- PMM

