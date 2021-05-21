Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326938C260
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 10:57:36 +0200 (CEST)
Received: from localhost ([::1]:47138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk0yN-0002nG-Ea
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 04:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk0ws-0001S5-S2
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:56:03 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk0wp-0005PM-Es
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:56:02 -0400
Received: by mail-ej1-x62e.google.com with SMTP id z12so27904196ejw.0
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=adBsJ20LrgHddQOGjJRGWFk9Q7y0gbxOaTIlarNJNf4=;
 b=NXxpx9zeQfZhDIkH7tBf/lP+oGxUtjfH0RIP3R0DzFfu+ltaaAqXf/UjTykLfjJSPG
 ZdvgyBJLIztlW41mC1PVdGZxvUZWLnngjjANC2ztcsCvu6rztHQN7CYte68pnCtiOl7y
 Y6TcNE/preSEyavU1+XvXaLZLR31vsQguIbci/0+YQYDI0+gYClJOUhfVuiZWlhpV9Hf
 Kw9E3mLhqaW6LYsejMaxmT1r8izqZ4GpOqSSxo0EdqEEvSpkjcASTlGkfkYCDlPBo9aE
 CDvn8FIo14+kUFRX/7UE44zRZo9ZwSOIAq+OHA6u9tpRRJZK8I9x3lZ3n5VezmfCQCAf
 +rBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=adBsJ20LrgHddQOGjJRGWFk9Q7y0gbxOaTIlarNJNf4=;
 b=SxmbjbtOfWJpTxyX169q45VwC6zFWK/GE6xrfPHLS98cu0ktXurwzcQwxBoKFUc5p3
 h5PWeS1lmkrwmxPEuxajev/7RF/DL7NGsi6zSkx/ccZ13BiAOVT8YdY2S0s7CdrTZQ/D
 8XhCCG8wYyJWHlHBmkVRBZp3qNxz+A9u12ceKKJwUjCfq7uf9gEoFXtFqVWQ0sS/64Wn
 AZTc32xabezzIDajMgVbfO1bRXpgUhBiL/ipHTiUckwKktwjR+3K2tPjPOUBBP5b/1l9
 75N+YjmukV1M0fELVXKg+/DJhOYXZQjf0LhtrMfukYFBKbNoFYkjngTh5G+eubEbdyyH
 +ldw==
X-Gm-Message-State: AOAM530DRRM6JNumW0qT6duT8iBOc7VYa68QM7Tlh0OHVGQt9DKaOzFg
 v4nosRFEglXmhsqAj4Qy+kjMBii34DpWtUQfQRei+Gw7Gsc=
X-Google-Smtp-Source: ABdhPJyPX0GUC86EK2qLiUiu9Y1TwY2gEFAUk8epArDx28RIkOz4vWVMeUYKyXeWH8stZfvtwg3SeOF1NXTIN8F+rr0=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr9296797ejb.56.1621587357823; 
 Fri, 21 May 2021 01:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210511192802.552706-1-eblake@redhat.com>
 <af7caaf7-3067-9ebf-96f4-73e4a3dbc8d9@redhat.com>
In-Reply-To: <af7caaf7-3067-9ebf-96f4-73e4a3dbc8d9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 09:55:38 +0100
Message-ID: <CAFEAcA961ZSimiaQ38z-_UA4K83zC3E3PQ8xcyAwnCToEmtQHQ@mail.gmail.com>
Subject: Re: [PULL 0/1] NBD patches for 2021-05-11
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 04:43, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Eric,
>
> On 5/11/21 9:28 PM, Eric Blake wrote:
> > The following changes since commit f9a576a818044133f8564e0d243ebd97df0b=
3280:
> >
> >   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virti=
ofs-20210506' into staging (2021-05-11 13:03:44 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-05-11
> >
> > for you to fetch changes up to 37179e9ea45d6428b29ae789209c119ac18c1d39=
:
> >
> >   sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog (2021-05-11 =
12:43:26 -0500)
> >
> > ----------------------------------------------------------------
> > nbd patches for 2021-05-11
> >
> > - fix fd passing to qemu-storage-daemon --nbd-server
> >
> > ----------------------------------------------------------------
> > Stefan Hajnoczi (1):
> >       sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
>
> Richard suggested to add the following tag to the commit if possible:
> "Resolves: https://gitlab.com/qemu-project/qemu/-/issues/218"
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03107.html

I left the pullreq unapplied for a while to give Eric the opportunity
to add that tag, but it's been 9 days now, so I'm going to go ahead
and apply it anyway.

-- PMM

