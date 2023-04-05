Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DCF6D7296
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 04:46:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjt97-0000rd-C4; Tue, 04 Apr 2023 22:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjt92-0000rH-LE
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 22:45:08 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjt8v-0007Cw-3K
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 22:45:04 -0400
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1F6AB2009F;
 Wed,  5 Apr 2023 10:44:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1680662694;
 bh=xKXc5AFfFHw6LcO/OvseefSHBk944fjVrssackMyQFE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=F20FyoIO2PMi7FSVaMn6InXQ3i+C3Eyv1SeTp1253AGSfhpefczKy2PqVZGtxXRco
 RwA68lekvyDQSgIxVHVDKATtfAMITg2KdCqUenfiBRWjKptWQjQJS4nY+mE/GlXsOR
 DZ37bVMfwxipi08nYWs1TphUVzcLlj5Qc7MLCggyLGzSlKy/Y3hzY2lkzCnBj2sdTo
 OXcyUwFJWyKgZrooFaGEa4YUxNdw4cKn8d4kQcTYX9QsRRMKYaTQTQ2hzDc3mY+qbn
 fK/LPnk4hlcu5524GpCGpZJ04JdcCRlYgpW0JgdrJsyRBsTGCnxzNRNJ/xMUlHNYiW
 Kx7rk4vrg8pog==
Message-ID: <dc3f421cfa0aa9bc2e417ff7872fa68a311548b2.camel@codeconstruct.com.au>
Subject: Re: [PATCH 14/16] hw/i3c: remote_i3c: Add model
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joe Komlodi <komlodi@google.com>
Cc: qemu-devel@nongnu.org, venture@google.com, peter.maydell@linaro.org
Date: Wed, 05 Apr 2023 10:44:53 +0800
In-Reply-To: <CAGDLtxuwJndMS_L1xWz9TWadA_T4SK3Rb6cExJf9+4jJ1ssQQg@mail.gmail.com>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230331010131.1412571-15-komlodi@google.com>
 <3bc0910f6b8078b07f43b3dd6d04686c25829ec1.camel@codeconstruct.com.au>
 <CAGDLtxuwJndMS_L1xWz9TWadA_T4SK3Rb6cExJf9+4jJ1ssQQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Joe,

> > 1) Is this something that qemu upstream would accept? Do we need a
> > formal description of the guest-to-host interface somewhere? Or is ther=
e
> > a more standard way of exposing busses like this?
> >=20
> Not sure! I'm open to ideas.
> I think the most controversial portion of the remote target like this
> might be doing socket transfers in an MMIO context.
> i.e. driver does a write to I3C controller -> triggers a transaction
> to remote target -> remote target sends/reads data over socket.
>=20
> Because of that, we might need to add a way to do these transactions
> asynchronously.

OK, that plus the general concept of having a socket interface to the i3c
bus might need a review from someone above my qemu pay-grade.

but, on the assumption that those are acceptable in general:

> > Assuming we do adopt your approach though, I think the protocol
> > description needs some work. There seems to be other messages not liste=
d
> > in your protocol comments, and the direction of some seems to be
> > reversed. I'm happy to contribute to that documentation if you like.
>=20
> Oops. I'll reread and revise in v2. If you have anything else you want
> to add too, let me know and I'll add them as well.

So I implemented a little daemon for the other side of the socket
interface. I have a few thoughts on the protocol structure:

 * can we change the target -> controller read response messages (data +
   len) into a normal message type (ie, assign an opcode and use that in
   the header)? We may want to use separate opcodes for each response
   type.

 * I would suggest expanding the start behaviour a little: the message
   could contain the target address, and the target responds with an
   ACK/NACK event. The model would need to block on the response in
   order to return the correct ACK/NACK value (and pass to the
   hardware), but this means we can either implement the protocol at the
   bus level, or at the individual-device level.

   (with the current standalone NACK event, I don't see how a model
   could reliably handle that)

 * I'm not clear on why the RemoteI3CRXEvents are defined separately.
   Can these just be normal messages with an opcode (and no payload)?

I've yet to implement IBIs though, that's next on my list. Happy to chat
separately if this gets off-topic for the qemu general discussion.

Overall though, this is great work! Thanks for the contributions.

Cheers,


Jeremy

