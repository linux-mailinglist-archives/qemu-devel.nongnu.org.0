Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17826F7167
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:45:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucwN-000173-Ip; Thu, 04 May 2023 13:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <billow.fun@gmail.com>)
 id 1puRJn-0003Gf-Kz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 01:15:54 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <billow.fun@gmail.com>)
 id 1puRJl-0007CL-02
 for qemu-devel@nongnu.org; Thu, 04 May 2023 01:15:51 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so6985136276.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 22:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683177346; x=1685769346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbR8wVFulJl1MN/uvDvjX2u8EHPVMfqsA3Zyv2J4LeA=;
 b=biX+ygDRbVnT3G6ywCWPEEQx/LEQH7MK0LXCbhVRKPTtteUBjTh8CGViFArgUVrjrV
 no4aQ2XG8Wjz31AH7G7xTDWvRmdXy24TR0YZEOM9ABBAyCos53OPMkLH+ysu/FH4EbmZ
 yReyRwECTEglu5+s7XGqQvcwWrmsM2LYVV4fWgZAzwcqPXUzTE8kKUnZXz8O96heSpH+
 TnHGCHi9DX8fmkN9PIGUbUpg0IoavI4TVxoMTfJlyAdOrnkzswY1ewXd8F/5Iqdd8TQ2
 KWzDp5n/MGLfB70kkdfl1pu+U5RaKKmfYyNqurQ5gEKeVpN86ENX/8n14ozKZun5tM1U
 b96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683177346; x=1685769346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbR8wVFulJl1MN/uvDvjX2u8EHPVMfqsA3Zyv2J4LeA=;
 b=g2URDkpX6aXupXRy7HhkrIj10YNJgW/dAQfQpw816i/ieBw1d1JZGJE8wkukvHe+Ib
 ayNSW7UEQc6W1I4eVULXiC+I1N9gOO2WJXr9zFeS7KcHgPEEqKesm2Hfqvnetlq+Rj53
 vscDwgw1Vxhjo/B44xg0LRWCqOigUHh4P+4nsgz0xOv7thAJWBvuLzfl8D/oAmQRjjMp
 X6wUVxMC3oJAV4pMO9oD2CLL6iWdppPmNWCqPaXUwrdDCO7Er6/mUQ7UTR9AK7FiA/ap
 D9dRG3PMEjvN8HZ1NQjT68Q8mn16Q9bGKWb9gmlrS+oswa8oP9N1rMXI2ZFVpeVtHwqT
 Vxyg==
X-Gm-Message-State: AC+VfDyG/4Q7rKx6WO/rZjgGhVhJodavNJC3aIgVhUFH7ab3OpUxrklm
 L5mrQpO9/L2AkaRQonV+wukRVhC9UXkCB3q3eCo3/uAcIqZThg==
X-Google-Smtp-Source: ACHHUZ4VtLH7llE1qNG2pcN8wm6Hw1m/gKQngpTm/vViz6UsTLAcpnhS4AUlfWFpaeY5nGj6vPA/EaFVozIgJGBs6Ms=
X-Received: by 2002:a81:1e57:0:b0:552:a4af:da with SMTP id
 e84-20020a811e57000000b00552a4af00damr1036520ywe.10.1683177346184; 
 Wed, 03 May 2023 22:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPLqH_6R_mtZr1aWT9PqfBAMesxkNuPYEZMR_RcXKQ0G_S0zag@mail.gmail.com>
 <xvth67djad5y33d7yh2knjqq54ep6p5vhtogsckaumiyq6j4cp@uokkglljkbge>
In-Reply-To: <xvth67djad5y33d7yh2knjqq54ep6p5vhtogsckaumiyq6j4cp@uokkglljkbge>
From: "_ *" <billow.fun@gmail.com>
Date: Thu, 4 May 2023 13:15:24 +0800
Message-ID: <CAPLqH_4u7quXA77=cP8sQDi4VWgxGyjRUGueovd4x00mRBAUEA@mail.gmail.com>
Subject: Re: [Capstone] TriCore support in Capstone
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=billow.fun@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 May 2023 13:40:21 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello bastian,

I'm excited to inform you that the TriCore support in Capstone has
been successfully merged! The pull request can be found here:
https://github.com/capstone-engine/capstone/pull/1973

With this update, you can now utilize Capstone's TriCore disassembly
capabilities in QEMU. I believe this addition will enhance QEMU's
support for the TriCore architecture, providing a more robust
disassembly engine.

To get started, you can integrate the latest version of Capstone in
your QEMU project. If you encounter any issues or require further
assistance, please don't hesitate to reach out. Your feedback is
crucial in ensuring the smooth integration of this feature and
addressing any potential concerns.

Thank you for your support, and I'm looking forward to seeing the
benefits of this collaboration.

Best regards, billow

Bastian Koppelmann <kbastian@mail.uni-paderborn.de> =E4=BA=8E2023=E5=B9=B44=
=E6=9C=8819=E6=97=A5=E5=91=A8=E4=B8=89 17:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi billow,
>
> On Mon, Mar 13, 2023 at 02:02:10PM +0800, _ * wrote:
> > Hi!
> >
> > My name is billow, I currently work on TriCore support in Capstone.
> > Maybe later on it could be used in QEMU
> > as a disassembly engine for that architecture?
> >
> > It's in an early stage, but some feedback would be welcome.
> > Any suggestions or improvements would be greatly appreciated!
> >
> > The draft PR: https://github.com/capstone-engine/capstone/pull/1973
>
> Looks really impressive. Thanks, for doing the work. I'd be happy to use =
it in QEMU.
>
> Cheers,
> Bastian

