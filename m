Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F933306CE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 05:14:10 +0100 (CET)
Received: from localhost ([::1]:35532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ7HU-0004tO-UO
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 23:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJ7GN-0004RH-5c
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 23:12:59 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJ7GL-0007CZ-Me
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 23:12:58 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id p193so8794009yba.4
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 20:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LmrzTQ9QfRrT5p2KvIZtAd+8KB9wPN/rcBKQ+5QBUmg=;
 b=euzDwNv6BsnW2+78/Dl7bAybiqFMJUbwd4sTZzPJdN7DgHBypAvS4zPxvFNlxPU1rH
 LOeszTxb0628PK94qXDQL8c0IiQ111S13+fV26r/+3dudwNpHTbg/TYzhErxP7sGw3PK
 lptohR4iXWX37CD8jJJDXLMDmhGFjcl9JIXi1gMJr8t48hozEATBUfjBhHCEfUvngtUf
 O2p7IjebBMrPdzuMZt/yNhTkg2Q5g8s9APdbEyCUelR3o1GzeY1xfcrbU1jNge23OoZK
 dqZhcczO077JHZbP/n2kOWugKHfLixlLgQFqNsds1b7FYBrHwvmBamN47N26+cOhA0N7
 ilow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LmrzTQ9QfRrT5p2KvIZtAd+8KB9wPN/rcBKQ+5QBUmg=;
 b=oTOIx6NBjWZ+nGp12af+BqbzaiHKSvFPYTsf2g/frxuWv/Y1IGUZt7rfRMKSyzzs+p
 Cp//jEgFCSz6cRfBbB1aeWrLhaZnLmBpNrDKrFOrhsjwt6KkSzIUZ13qdFRcjZQWveRJ
 m7eUN9/Z9U04IX4D1VmiA0iAofQnKjPs5dULXI87Cq4ZTUl204//7Jaxow9/hbN67K73
 ulV8pD150UWcb3Ls3ru35zVXuQmkWxwU09tnSNH1AeNLRuWhUeJi+bLxOGaL56qNcrzz
 fQ2kOubwkp6j/cpas1stQpLfS+ESdsxxv67Vo0GtUw9QBCOekxdVtk/NL5xYKruWOCQ2
 TG0A==
X-Gm-Message-State: AOAM532Isvpx8PZkkZbuMSUp8ALxzRvkfwteVxrG2yaVzyZwYCYwveI5
 BLSQ3UzOlq6luU2niOqtIse3WMVgjD8U7m0XcSs=
X-Google-Smtp-Source: ABdhPJzxHAo8mO2ugotbIoRRojXWieYRN9zrsUTG4hEUDa7tEKtO7RzCpM7McV84kt4a7JIfHc0bNZaVaZ3QiuevGJk=
X-Received: by 2002:a25:d744:: with SMTP id o65mr33530064ybg.387.1615176776306; 
 Sun, 07 Mar 2021 20:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
In-Reply-To: <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Mar 2021 12:12:44 +0800
Message-ID: <CAEUhbmV3rKLMbptXAGjZ5Qn4ONDmjT7-H18P2Stp=cAuSXUGuA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 8, 2021 at 11:48 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/4 3:11 =E4=B8=8A=E5=8D=88, Philippe Mathieu-Daud=C3=A9 wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The minimum Ethernet frame length is 60 bytes. For short frames with
> > smaller length like ARP packets (only 42 bytes), on a real world NIC
> > it can choose either padding its length to the minimum required 60
> > bytes, or sending it out directly to the wire. Such behavior can be
> > hardcoded or controled by a register bit. Similarly on the receive
> > path, NICs can choose either dropping such short frames directly or
> > handing them over to software to handle.
> >
> > On the other hand, for the network backends SLiRP/TAP, they don't
> > expose a way to control the short frame behavior. As of today they
> > just send/receive data from/to the other end connected to them,
> > which means any sized packet is acceptable. So they can send and
> > receive short frames without any problem. It is observed that ARP
> > packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> > these ARP packets to the other end which might be a NIC model that
> > does not allow short frames to pass through.
>
>
> Do we need to care about other type of networking backends? E.g socket.
>

I am not sure as I never used other backends. If someone who is more
familiar with the network codes better than me can confirm other
backends are also needed, we might do:

if (sender->info->type !=3D NET_CLIENT_DRIVER_NIC)

> Or at least we should keep the padding logic if we can't audit all of
> the backends.

Regards,
Bin

