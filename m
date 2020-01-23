Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302A1147080
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 19:11:26 +0100 (CET)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iugwu-0005IW-Do
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 13:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iuf0f-0007Lo-PX
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:07:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iuf0e-0000CJ-Kr
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:07:09 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:44370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iuf0e-0000BP-EE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:07:08 -0500
Received: by mail-ot1-x334.google.com with SMTP id h9so3185169otj.11
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 08:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/YjFI0CtZzo0kATNomTvVMQr19vPgXteDBlslQgbnQ=;
 b=D8ER0gTIxqnrvXra2rTAUwJzp3VPMAKWJ/iuSifSDaPGIaausRk+vkxYQZt5bWzNAB
 BffmOo/k9S3N3MkwLl99/eP5jIKn4Zj4/iGpDEsA5yMnF8nghA3KB60ngvwN8YMsWaUK
 r/U0gxNcGYRty8MulxCQ13y3NP+Y/dywyWNAI1pa4LK7u6QWK88acu/YMcirUwgIdgHi
 QnaDVp6mRsVoGaRIVewANzDkTc39yP9mK3e9ZoOK8a6sWkMukVbap/XBrjy7y/4vHSxK
 mM1lh25U7kNkdsYNlXJfvhcrCr6TRtoK+TcWY4Ijdh/GQPSVwadZZY6/AGy8C1X6GNcj
 b42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/YjFI0CtZzo0kATNomTvVMQr19vPgXteDBlslQgbnQ=;
 b=RAAYcD+BcwtH5AYc21Yl/mfedRCE1mUOLxJ6/yndM5omXHaCRF8OkztMivsP94Q8S7
 UHRixYy6ulradkckMlCvECwXjnMi8kYnB4Hp+bka6yMTFn/G91oPS3U4YPZxCh/pGZiy
 Ep+a6D0OqGmaCrXABrfe0LInTf5/Z5NvZu9z0w6+RGKGiFnOHsV3rhPB3l9w3UyypL7E
 igVAjj0gLKAZp5lNTYqkNaHX6OsvY6JFMMyBp7Jqci8Tk+z70G7p+08mMoeVE5QwD0gl
 GDpIeArBzKvnxNDTm4KFULTidW6Mc15FjA6PAPlxk5fbTaYa7Qt00fMdNEm1UMy93Hrc
 zV2w==
X-Gm-Message-State: APjAAAVrQlGbhOqFyq7y+j7pri8HDPVeuoRy3xTZVCzzzVq/y/uEwBPG
 +SkKCgHplVTLttd2bqdVRvk3Gu/vBlDpCYqn2u4ODw==
X-Google-Smtp-Source: APXvYqxa0j7F0RKmHXDsKDQHbkcNCmQgkeGcWzET5BHsQvL9z2aOfkrdfZ4FSv4blaLQakLBDeD55cc44tMqmCZ91CE=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr5974413otd.91.1579795627485; 
 Thu, 23 Jan 2020 08:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20200123115841.138849-1-dgilbert@redhat.com>
 <CAFEAcA_7T2Yu8fXv7XycSSN=8xoi8aciR5NMh76o8LQxNU6rDw@mail.gmail.com>
 <20200123153052.GA2732@work-vm>
 <CAFEAcA8ufZTy=T_iixbHMN6a7GZxxRkod6y_1Vu_vbsoioDV=g@mail.gmail.com>
 <20200123160202.GB2732@work-vm>
In-Reply-To: <20200123160202.GB2732@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 16:06:56 +0000
Message-ID: <CAFEAcA_GqmeuYZO-SWAiMxjn6LOSpE2y8dJ2N6tvVprYWHZeOQ@mail.gmail.com>
Subject: Re: [PULL 000/111] virtiofs queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jan 2020 at 16:02, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > I think the case would be better if the
> > doc you were adding was the virtiofsd manpage, which doesn't
> > seem to exist yet).
>
> Yes it does, see 'virtiofsd: add man page' (patch 0094),
> tools/virtiofsd/virtiofsd.texi

I would really like to enforce "no new texi documentation".
Otherwise it ends up on my todo list to have to do the
conversion to rST later, and there's already enough
texi that needs converting :-(

thanks
-- PMM

