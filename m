Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDCB008C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 17:51:17 +0200 (CEST)
Received: from localhost ([::1]:52870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i84to-0001We-GK
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 11:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i84ha-0007bj-4B
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i84hZ-0006kt-As
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:38:38 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:59810
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i84hZ-0006ka-4Y
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:38:37 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1i84hY-0003J7-49; Wed, 11 Sep 2019 17:38:36 +0200
Message-ID: <c46b3e33712e6edb4490f2b7695fd160ce614568.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 11 Sep 2019 17:38:35 +0200
In-Reply-To: <45d6dc06b9973aa231f1076a0de279fd5292d2d3.camel@sipsolutions.net>
References: <20190902121233.13382-1-johannes@sipsolutions.net>
 <20190902121233.13382-2-johannes@sipsolutions.net>
 <CAJSP0QXhOQg98FyLzcTnruG7B=b+uUqEd5HvevRKmuP3HhCSmw@mail.gmail.com>
 (sfid-20190911_173128_235736_D9071E83)
 <45d6dc06b9973aa231f1076a0de279fd5292d2d3.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: Re: [Qemu-devel] [RFC] docs: vhost-user: add in-band kick/call
 messages
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
Cc: =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2019-09-11 at 17:36 +0200, Johannes Berg wrote:
> On Wed, 2019-09-11 at 17:31 +0200, Stefan Hajnoczi wrote:
> 
> > > +``VHOST_USER_VQ_CALL``

It should also be VRING, not VQ, but I did indeed fix that in v2 already
along with the CALL<->KICK inversion.

So I guess I just have to include the part about how it's different from
existing methods, and solve the discussion with Michael about polling
(and possibly use another flag there for message-based mode).

johannes


