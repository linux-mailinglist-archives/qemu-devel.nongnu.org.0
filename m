Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266D5091FE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 23:20:23 +0200 (CEST)
Received: from localhost ([::1]:52872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhHkL-0007QT-QD
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 17:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1nhHio-0006lC-RA
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 17:18:46 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1nhHim-00063Z-NF
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 17:18:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 475975C00D8
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 17:18:43 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute4.internal (MEProxy); Wed, 20 Apr 2022 17:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apitman.com; h=
 cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650489523; x=1650575923; bh=d1ADYTpiyC
 PICco+ukUmJZGTmZjUQ0M4y5zJvkl3fG8=; b=dAAE96fydF7lbQYZcTvVFj0dv7
 eKGZT2Ikj4/SMN4nBEZFKyehnfI+8XS680Ty2VG2qflGFHJNCBORa6vvUO1tYhwZ
 V65As6NBgVtGsYg4SD/p6D1HWOl/3zIsMn63LQJE4FUHxHZErcgyv/M2cJaENSGz
 whWWbvnL1bsdOGFRhbWetAf+qPEqOhR8Kh9k3a7MsM4+XxP0lCPRGN6ul0gc9DHb
 l78Ly/iilSPomldYcJIcb0eeS/cbgDszx2kQV4vCwIvBnu6HRsDnt4DeDNKCAJOh
 MGeOAXHjW0taRbg8z4JdakcvO/E+CB1eMX5uTr39e8K6yBac6E8IA4xIPZmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650489523; x=
 1650575923; bh=d1ADYTpiyCPICco+ukUmJZGTmZjUQ0M4y5zJvkl3fG8=; b=U
 LCscSN7ZfAM67Buc8/cg1RlR06EIrIlLEiEiLJ30t2OpF0PvLBO2kgOcG7DjAEtW
 0JRRg123NRRyjT+9fbvuKzyCuqa9fOfapLxRS32ghfh7kfDSjTTnzbmyoGh89rBm
 C6FiqEH2Dl+BtjltoMw/gRLyDe3RIN8datI10nUCx5Ol4Gzh2uziNeCehSD9Q4oY
 MRAmIUORaA3A9KVCEkD1o7u2AXa2VveXnAYs59Nw4ZmGQqakLTTdiIhXUxH7PqZ1
 EjdtAubMxkVBbXheFHpUGeodqBzKGNOIX3KqxnRqlpXIJVwlBfpu5/0MVSS8S4o9
 b0UivU5uehcuSH8oXFTjg==
X-ME-Sender: <xms:s3hgYnb0MOI2mHjtnqvNkS2HzUyn4HP_8onxiAXtyZEFtzy7y2F0pg>
 <xme:s3hgYmY2OEOgAEnSsjAkh8WYezrceY-Z72ibP4iUQjyy4emdZDJlOlbuwoT-Wn1LT
 xY7U_H-5OHTgPe_IM0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsegrtd
 erreerredtnecuhfhrohhmpedftehnuggvrhhsucfrihhtmhgrnhdfuceorghnuggvrhhs
 segrphhithhmrghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejueejtdetjeejhfeije
 dvffeuvedtjefhtdfghfeiffdvtdehffffhffhheeffeenucffohhmrghinhepghhnuhdr
 ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhguvghrshesrghpihhtmhgrnhdrtghomh
X-ME-Proxy: <xmx:s3hgYp8lN7Eb0uS4p12c0GxSCegxFUszYIz979-45hZeJcJfyuVXbA>
 <xmx:s3hgYtpKv9WV21cXm6JgPmcyMZ-AGDfpjjkzkDuCW5IyjUakKod3EA>
 <xmx:s3hgYip_7ihSgYETUduZuLyOSYhYHqKkAlEljTAHmeIdB54w2PKrMw>
 <xmx:s3hgYv03g7tFT9sYwiBj0xjd3YdmhC78njKWIByHmQ22ejNUdR1-Xw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 186701EE0083; Wed, 20 Apr 2022 17:18:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-568-g521196dd5d-fm-20220414.001-g521196dd
Mime-Version: 1.0
Message-Id: <ac3d61d4-17d0-49d4-8eb2-27e450d51928@www.fastmail.com>
In-Reply-To: <a78fd584-2d40-cbd4-95db-8a6729087a93@gmail.com>
References: <8f5cc095-e5e9-486d-8e52-d22cac6d2379@www.fastmail.com>
 <a78fd584-2d40-cbd4-95db-8a6729087a93@gmail.com>
Date: Wed, 20 Apr 2022 15:18:22 -0600
From: "Anders Pitman" <anders@apitman.com>
To: qemu-devel@nongnu.org
Subject: Re: Future of libslirp in QEMU
Content-Type: multipart/alternative; boundary=b72d3146442f431d8e6ca8bb5161b4d4
Received-SPF: pass client-ip=66.111.4.26; envelope-from=anders@apitman.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--b72d3146442f431d8e6ca8bb5161b4d4
Content-Type: text/plain

Awesome, thanks.

Apparently I'm not properly performing a date-sorted search on the list archives. I started here:

https://lists.gnu.org/archive/html/qemu-devel/

Then entered "slirp" and searched with chronological order, but the latest entry is from 2020. What am I doing wrong?

Thanks,
//anders

On Wed, Apr 20, 2022, at 2:21 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 4/20/22 16:08, Anders Pitman wrote:
> > I noticed in the 7.0 changelog that libslirp might be removed as a submodule in the future. Since user networking is very important for my project, I'm wondering if this is simply an implementation detail, or if there are plans to eventually remove slirp support entirely from QEMU (which would be bad for me)?
> > 
> > Is there somewhere I can read the discussion about this? I searched the mailing list archives but didn't see anything obvious.
> 
> QEMU will still be supporting libslirp. The difference is that now QEMU will be
> using libslirp from the distro instead of packaging it itself.
> 
> The relevant thread is here:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00974.html
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 

--b72d3146442f431d8e6ca8bb5161b4d4
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Awesome, thanks=
.<br></div><div><br></div><div>Apparently I'm not properly performing a =
date-sorted search on the list archives. I started here:<br></div><div><=
br></div><div><a href=3D"https://lists.gnu.org/archive/html/qemu-devel/"=
>https://lists.gnu.org/archive/html/qemu-devel/</a><br></div><div><br></=
div><div>Then entered "slirp" and searched with chronological order, but=
 the latest entry is from 2020. What am I doing wrong?<br></div><div><br=
></div><div>Thanks,<br></div><div>//anders<br></div><div><br></div><div>=
On Wed, Apr 20, 2022, at 2:21 PM, Daniel Henrique Barboza wrote:<br></di=
v><blockquote type=3D"cite" id=3D"qt" style=3D""><div><br></div><div><br=
></div><div>On 4/20/22 16:08, Anders Pitman wrote:<br></div><div>&gt; I =
noticed in the 7.0 changelog that libslirp might be removed as a submodu=
le in the future. Since user networking is very important for my project=
, I'm wondering if this is simply an implementation detail, or if there =
are plans to eventually remove slirp support entirely from QEMU (which w=
ould be bad for me)?<br></div><div>&gt;&nbsp;<br></div><div>&gt; Is ther=
e somewhere I can read the discussion about this? I searched the mailing=
 list archives but didn't see anything obvious.<br></div><div><br></div>=
<div>QEMU will still be supporting libslirp. The difference is that now =
QEMU will be<br></div><div>using libslirp from the distro instead of pac=
kaging it itself.<br></div><div><br></div><div>The relevant thread is he=
re:<br></div><div><br></div><div><a href=3D"https://lists.gnu.org/archiv=
e/html/qemu-devel/2022-04/msg00974.html">https://lists.gnu.org/archive/h=
tml/qemu-devel/2022-04/msg00974.html</a><br></div><div><br></div><div><b=
r></div><div>Thanks,<br></div><div><br></div><div><br></div><div>Daniel<=
br></div><div><br></div><div><br></div></blockquote><div><br></div></bod=
y></html>
--b72d3146442f431d8e6ca8bb5161b4d4--

