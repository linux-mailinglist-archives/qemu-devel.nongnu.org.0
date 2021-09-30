Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7641DC58
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:33:16 +0200 (CEST)
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVx7a-0002kj-ED
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mVx3d-0008IM-0O
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:29:09 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mVx3b-0001yu-FO
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:29:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id y5so4154005pll.3
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4nf3uQGV9nm/W7pt4SiejWa4UCkfPb0dEwmqSP5DSA=;
 b=c66tcLI1NvduN0LC6znwdhI2fT/ayZU8N/dj4T5DqqHDqSZoEl1KCa7kCpqLU3gKCv
 d2pQBhuTJVMGAkbSu7K+sf55RwoBd5MESeKWL0mmSA7s0chRmEi8tG3IsKSf+z502g6W
 7UfNc3Hnn7d7yeSbHjA7Zawww/P01pcwDoEBfFUGeE9FDbpCjA6Fhc/AEbbFaM3SCH//
 afEkbzh7foXEHzkuUCE/4l/pryyN9Q6BQYyFn9hRJxTye9H+nMGhVsgePVgR/IST9gQT
 eVJ/kKMNOU/R49YknZT70N/+s4N3o93u2tD6UIai9HFrfuBFO+bAnreRbJeUiweXKsQI
 egGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4nf3uQGV9nm/W7pt4SiejWa4UCkfPb0dEwmqSP5DSA=;
 b=4yhG7XcrWvLM19DTkCct4yCCe0NQu45gGGtIjfWTL4xo9ktS4mlNQSfIYDMmFC7k7B
 vMVhR7/tshMGRAcwTRtvBcTmR9Q5bI1U+ww71JJ06BwsKsD3+hAPDpAE1aHNQwU7vfqp
 vmMFIJFihaIfwrq8GlcJqaJ+SPi+WKctbYy9Zsaq/Pg0TXg1Fxz5FNLMtQr1Lv9FT2Vs
 FUqzg5CJxVX6T9zWD65h3dMADtQrde9RxhtxjctrhKDcyCcNbdU36K3r7Et5ZLhd/67D
 Xg8VWham2RiotqQBC04rq0FfdbdQiEysk5fHO5greEE0kS/58PNPs9nSbTNrC/Gn7rFX
 5yHw==
X-Gm-Message-State: AOAM532H+e1WGYGlGL579U9QJ6XHuNEqcEm1V4VgSHODg9AAbQA7wjdQ
 l4SWNInE15M6TY4m/a2sKmwqYfgjUVbPSkml08g=
X-Google-Smtp-Source: ABdhPJxAkMCfHZLxyP3dWkoej8OHe985t40xMCrod3uXbas5cS/BZuZpg8Sj2XoQgR/73g8hrLrXkAzuFb15vtnZPeA=
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr13645454pjr.83.1633012144834; 
 Thu, 30 Sep 2021 07:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
In-Reply-To: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 30 Sep 2021 15:28:53 +0100
Message-ID: <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=stefanha@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 michael.roth@amd.com, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 3:08 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Hi Mike,
> QEMU downloads are currently hosted on qemu.org's Apache web server.
> Paolo and I were discussing ways to reduce qemu.org network traffic to
> save money and eventually turn off the qemu.org server since there is no
> full-time sysadmin for it. I'd like to discuss moving QEMU downloads to
> GitLab Releases.

Daniel Berrange posted this in another discussion:

"gitlab releases have a per-file size limit that is somewhere on the
order of 10 MB IIRC. Our release tarballs are 100+ MB, so I don't
believe that's going to be viable.

The gitlab package registry doesn't directly support plain file
downloads afaik, and is also size limited to 50 MB per package

I'd love to find a good solution for large release artifact hosting,
since I need a better solution for virt-viewer windows MSI releases
wich are similarly large to QEMUs. For that I'm using pagure.io
provided by Fedora, but I don't have confidence in that service
surviving long term."

So it looks like GitLab Releases won't work for QEMU :(.

Stefan

