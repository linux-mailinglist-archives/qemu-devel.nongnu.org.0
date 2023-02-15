Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D886985BB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOYj-0007Lf-Ni; Wed, 15 Feb 2023 15:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pSOYZ-0007IK-4c; Wed, 15 Feb 2023 15:39:11 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pSOYX-0002x1-ED; Wed, 15 Feb 2023 15:39:10 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B5F85C019A;
 Wed, 15 Feb 2023 15:39:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 15 Feb 2023 15:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1676493546; x=
 1676579946; bh=m3SUTs9LSKEg4NRNWoSrrfe+2xtgchvIalp/Q38iw20=; b=3
 OVXRDZ9dW73ea8XySSq+ugGc3MEFxA0GJN0QA97axgkDnAuyznhS3vpBLuoUwi7t
 8myqZEUujTTcL/X/7kBaVqdtkt0Zkcqr0iXIbsx0JXZ9ieDn/pPuYfBLWoT1mNGa
 Y9Ufhf5HGUc6JApUwiyJnhRaF9lCC0f7leHJiDBhqotMup1hDl1ZvOx85MwPS54m
 UC0tNoKKQ1QdQTEn9d3ea8/WAzE6Y7eiZtiKHwEzBsQPo3EOb3c8UJi/RAgecdDv
 pB2tUhPPGZ25rU+sKe1/0THpW/O4/qZPCo/6LMtHICyaLFCooHxwnJOT5DiKvB73
 Td1UGxx+v/x/xe08g7CbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676493546; x=
 1676579946; bh=m3SUTs9LSKEg4NRNWoSrrfe+2xtgchvIalp/Q38iw20=; b=B
 ULFG3/eS7vQx1JfoiC6eRic2n1mj20M4BumvBi31kah6xXlo3FYnfJndQUjiIVnW
 NYTtR+RUU4+vb/xmpVlEhan2/wifief4dVo7XbLrnUHJG/Q8cew6FBfWr0YId+RV
 BMdXC/4BMQYDnFHWl9cVkmdkDsqMg2CBDJSwuAkBI/HpOT5AiLs1agoiSuB1m3V/
 pZINimgw9lu/vKjPYOImHXvuTzrv34TvO+l8TSJoQ1DSEGx1P195w4E3JlhdEhq1
 VoFHD73kPnbO0YOyRHhfrN+6TTuA7HCbL0ht4HnS9jQzvzWeyiAatY0GNsmzzgO4
 phGYB98nmT4Oa06QU4iEQ==
X-ME-Sender: <xms:6kLtY0ETbWuXNq7ljCnZylOEZhSbic0clcTMI3t3NaucfBTM2mIKEQ>
 <xme:6kLtY9W0nyIc6vaD7C9gni3pb7wn4Tu31FWzyS6Q9wQb8Fdhpq_jjqYd3FLJ9FBmU
 cF3V0AT3f53R2g68rA>
X-ME-Received: <xmr:6kLtY-K0M5w2dq4NNLH2hF5YVunDfDI9OualfPOTsXq0dAuuqYLeFw4XAkQJg7VElxhZxPl076MK3BU_kfEEUOrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefhgeffvedufeevteegkeetie
 ejhffhudeujedvgedvheffheejveethffhffefueenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:6kLtY2F8wve9Ivx3CpLPA7QA1r7CraTSzROuo9UfkIHyovlr9xSaxQ>
 <xmx:6kLtY6XfPT0mZTKjZud85FsIMc9M-MsFvjDq7WfpaQpRCraA5A7bvQ>
 <xmx:6kLtY5MTSW2TmjQ1hvigLV21XIOojjSJGqnNBaxI16bKAaqxT9CiBg>
 <xmx:6kLtY4yuT8K2gIxtAAISzU8JqH0Rzly0kIisdC0s4oS-YZdo3OGSRA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Feb 2023 15:39:05 -0500 (EST)
Date: Wed, 15 Feb 2023 12:39:03 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: ~ssinprem <ssinprem@celestica.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
Subject: Re: [PATCH qemu 1/2] hw/at24c : modify at24c to support 1 byte
 address mode
Message-ID: <Y+1C53ed7h7IXUu0@pdel-mbp.dhcp.thefacebook.com>
References: <167636845806.2107.2382940753543768501-1@git.sr.ht>
 <a41eaf83-ea64-faad-c001-d53df83452ba@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a41eaf83-ea64-faad-c001-d53df83452ba@kaod.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 14, 2023 at 03:29:33PM +0100, Cédric Le Goater wrote:
> On 2/10/23 07:20, ~ssinprem wrote:
> > From: Sittisak Sinprem <ssinprem@celestca.com>
> 
> 
> 
> You will need to add a Signed-off-by tag
> 
> Thanks,
> 
> C.

Oh, yeah this is a pretty good change: I mean, at first I had no idea what's
going on here, so it would be nice if we could leave a comment or refactor it
to be simpler.

Maybe instead of if-statements for > 256 or <= 256, we could do an address size
attribute and compute the 256 bound from the address size.

Anyways, this is a really small change to fix behavior, we can do a refactoring
like that later (If Cedric is ok with it).

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> 
> > ---
> >   hw/nvram/eeprom_at24c.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index 2d4d8b952f..693212b661 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -87,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
> >       EEPROMState *ee = AT24C_EE(s);
> >       uint8_t ret;
> > -    if (ee->haveaddr == 1) {
> > +    if (ee->rsize > 256 && ee->haveaddr == 1) {
> >           return 0xff;
> >       }
> > @@ -104,11 +104,13 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
> >   {
> >       EEPROMState *ee = AT24C_EE(s);
> > -    if (ee->haveaddr < 2) {
> > +    if ((ee->rsize > 256 && ee->haveaddr < 2) ||
> > +        (ee->rsize <= 256 && ee->haveaddr < 1)) {
> >           ee->cur <<= 8;
> >           ee->cur |= data;
> >           ee->haveaddr++;
> > -        if (ee->haveaddr == 2) {
> > +        if ((ee->rsize > 256 && ee->haveaddr == 2) ||
> > +            (ee->rsize <= 256 && ee->haveaddr == 1)) {
> >               ee->cur %= ee->rsize;
> >               DPRINTK("Set pointer %04x\n", ee->cur);
> >           }
> 

