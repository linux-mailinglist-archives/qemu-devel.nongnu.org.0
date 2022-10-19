Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEC1604D7D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:34:44 +0200 (CEST)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olC1h-0000b4-Py
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olBu1-000308-Ik
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:26:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olBtz-00058f-Ip
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:26:45 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 a6-20020a17090abe0600b0020d7c0c6650so591965pjs.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpFrCDHUpd27U7ZGkJ2m8MDc+5KBcwbBBFm8+lcmBRM=;
 b=sQge+jxkf8c+d5w6az0gilkcwrK2ikprsZMIJJOU2IuIiIns84Bzf6sdab5DvPJ4RZ
 mu7BJlZ7J8mLYbdPVVd1IIxhgVJLejANL1zonHcwsSwu/udrSrl1zdY9VfAz3gTRf4fV
 18bLWGxkoxbMqGOde5SlgvHFrvWlj6YPjzcyWeMzypfB3GorrtxM7egh0J5501TbrhWt
 xiFboQNRsA9DMZK9aazmeCoKgO134NGSGhZP85aBAa8hySmi5MtX4mcUeElzTWfJvW/N
 r3WZwSGE4lHU0LkvvW+2DP+T8oi3NpPa9AoEU/w0iiwxSbrv5f8+diMuuhkwzVQjZ6i2
 LauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BpFrCDHUpd27U7ZGkJ2m8MDc+5KBcwbBBFm8+lcmBRM=;
 b=f6kjMxDLts8SOs01N7dQtVSd7Z8hWia2UaIGXGT7r0VVCDyUHx6yKxkZovSOJGxNu4
 dxZnoodN4rOuekteJidGWuwa7zSkc8iDPTRLZD1mFAwzh77NlKPSGksj0p6Ux2jetk4x
 CO88gnP4NCoSCcLTOrRnyGinUTPTXPdqmvzhtUG3uAaAyISDlVaeGjs12rKU2N9cAQrj
 5qa+IafslgyFySeFy0Uow7Is38CFy0EzWhVvTbog6gmYXpnHE8NgBQaQLMN7mJAwnf5S
 QOmj2EJH4nP+Wx8Q1OvNRQV/BEv+pauFLUqYxJTBMPH244gWWcct8t6zb7vyNoLJWuQ3
 opSQ==
X-Gm-Message-State: ACrzQf0kGkBpjxMKpOvgRHpWMTwmYfJ0s9zl7rcKxywOagPcPLEswsnr
 NpSqalushdWVFwAAxhYgz4+Jm1PLLuRKF1gyi1oHAw==
X-Google-Smtp-Source: AMsMyM50FnK30VeO4/8+FJH/Q1JkcXke+g6tu24Sw8eJ+j5CldCXxERjotTO3AFGfcSGz3MWtjtUZ6g3jySBzfJTVsI=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr9244815plb.60.1666196801331; Wed, 19
 Oct 2022 09:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9t7ujfVVOdg4m0PBt1DkYY+UpDr2tA_doEb71+r-gfXA@mail.gmail.com>
 <Y078zCODLU5XsJYs@redhat.com>
In-Reply-To: <Y078zCODLU5XsJYs@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Oct 2022 17:26:28 +0100
Message-ID: <CAFEAcA9_fkO2ftjicxp5Ufe3KZE1Br6H=o5GHgLeJ5zchi6Lxw@mail.gmail.com>
Subject: Re: socket chardevs: data loss when other end closes connection?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Oct 2022 at 20:21, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Oct 18, 2022 at 06:55:08PM +0100, Peter Maydell wrote:
> > How is this intended to work? I guess the socket ought to go
> > into some kind of "disconnecting" state, but not actually do
> > a tcp_chr_disconnect() until all the data has been read via
> > tcp_chr_read() and it's finally got an EOF indication back from
> > tcp_chr_recv() ?
>
> Right, this is basically broken by (lack of) design right now.
>
> The main problem here is that we're watching the socket twice.
> One set of callbacks added with io_add_watch_poll, and then
> a second callback added with qio_chanel_create_watch just for
> G_IO_HUP.
>
> We need there to be only 1 callback, and when that callback
> gets  G_IO_IN, it should *ignore* G_IO_HUP until tcp_chr_recv
> returns 0 to indicate EOF. This would cause tcp_chr_read to
> be invoked repeatedly with G_IO_IN | G_IO_HUP, as we read
> "halt\r" one byte at a time.

Makes sense.

I've filed https://gitlab.com/qemu-project/qemu/-/issues/1264 to
track this socket chardev bug.

It did occur to me that there's a potential complication with
the 'server' mode of this chardev: does it need to cope with
a new connection coming into the server socket while the old
fd is still hanging around in this "waiting for the guest to
read it" state? Currently tcp_chr_disconnect_locked() is where
we restart listening for new connections, so QEMU wouldn't
accept any new connection until the guest had got round to
completely draining the data from the old one.

-- PMM

