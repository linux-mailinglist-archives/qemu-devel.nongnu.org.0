Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E8544BF1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:27:33 +0200 (CEST)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHG8-00022L-Hj
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnout@bzzt.net>)
 id 1nzFBJ-0001bb-5s; Thu, 09 Jun 2022 06:14:25 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnout@bzzt.net>)
 id 1nzFBH-0007rj-AA; Thu, 09 Jun 2022 06:14:24 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C442D5C019B;
 Thu,  9 Jun 2022 06:14:19 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
 by compute3.internal (MEProxy); Thu, 09 Jun 2022 06:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bzzt.net; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1654769659; x=1654856059; bh=GKyoavzm7Y
 uJo1rojdO4tBUcLV+R1eg5wTlo8YMWFXE=; b=h1ZMtDxh7B9K11+LzmoggSmYNb
 DYZuM94pxPqR1RHuUQAkR7TqjWVUB012dJaunJsL947jt1hV2OSao96YwsgwJpzL
 cTMawA7oMovcPNSZ6CoUuenR7K9lDNo01HBphryLxeJ5Whtvd81h8RG/QnOhTWOY
 XODPVe/rqCHwKqG4yxkPDbFuXi4Reic0iYqVTMVwvJRITKtFQkAzVHhXe+veGqaG
 Kf3lLH6IlASZgxHxBuENR8wNGNcbtdE6Sv8HN2g9EoM9HfoeSAH3Bvua1c1on40x
 rNfFk5sYcIupQNsXT5Jl+FW7kBvHXQ8tI3wMy+tX1OJuZMzTUyFuWQd5FPdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654769659; x=1654856059; bh=GKyoavzm7YuJo1rojdO4tBUcLV+R
 1eg5wTlo8YMWFXE=; b=tiYk7WCdr1fZQK7xFxciWykhHwu2ZYQwxZqL5uy4ixp+
 +n34mcvqZKAA9pNiAWT7X5nbe749KEKEYcpeg3ox160z9wRInhvq5SEJYBMzV6s1
 Y9TNawbi90cPmL/fbjSvWwkdcPoG4HrqmQmt+UN4GwCv06oXGHHKhkCXNyomsU26
 bI95fBXAOwxLtfoPsgDeBvN+ApoWwQeGVi6h1UwGOY2tLzHz6JZdhNjoRgqQktTJ
 pM2LIs/lTXo6/1yJ/HE4y5pXKhkpvZEvE9LxLqARaGAqefY3PRMhPuYUhziymyOd
 UOtCBaaAZZjJwMsBEp+H09e6sXpy4CMa14MRxzdyKQ==
X-ME-Sender: <xms:-8ehYjRcAjFD6-J5rMhrcLoOrrRPB09X4FE0lai7o8KRoLiHqNYVHQ>
 <xme:-8ehYkwWvlw-3go2Dv0wj_9NEcARXT1L6i9c2w9spxRzR7z4-SPHQsTbkcFo6vpbm
 gcijMq8ECJM2XUT-ZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesrg
 dtreerreertdenucfhrhhomhepfdetrhhnohhuthcugfhnghgvlhgvnhdfuceorghrnhho
 uhhtsegsiiiithdrnhgvtheqnecuggftrfgrthhtvghrnhepgfefleetffeiieduveetff
 etgffghffhtdetjeevvedutdevudfftdehleehtddunecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhhouhhtsegsiiiithdrnhgvth
X-ME-Proxy: <xmx:-8ehYo0eaLIRf1_AFPTe3n2bVhFovpCnH97wNuqJ0PfGPCkwrWx7TA>
 <xmx:-8ehYjAcpzZ7AKLa2eRHZnUWGavkqzx_RGunknI1L8c9ZcSpfuiWjw>
 <xmx:-8ehYsjk_UDPNlLkzKPQRjDB3QCS6hhk7xMnv6YjeOwbP1V-yUVoHg>
 <xmx:-8ehYkKgE9A95ibFFtQJKI6R63KvtiYV6z3SX1fvAYOAcXxPUmzg-A>
Feedback-ID: i8a1146c4:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 927D4C6008A; Thu,  9 Jun 2022 06:14:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-692-gb287c361f5-fm-20220603.003-gb287c361
Mime-Version: 1.0
Message-Id: <2d63230e-6b0c-4e4f-af9a-632ec00ca19f@www.fastmail.com>
In-Reply-To: <20220609100955.ybq55nbapi2ach47@sirius.home.kraxel.org>
References: <20220430082556.271627-1-arnout@bzzt.net>
 <20220609100955.ybq55nbapi2ach47@sirius.home.kraxel.org>
Date: Thu, 09 Jun 2022 12:13:58 +0200
From: "Arnout Engelen" <arnout@bzzt.net>
To: "Gerd Hoffmann" <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/usb/hcd-ehci.c: print diagnostics when cpage out of
 range
Content-Type: multipart/alternative; boundary=3958f281a626439697693b2c37797d72
Received-SPF: pass client-ip=66.111.4.25; envelope-from=arnout@bzzt.net;
 helo=out1-smtp.messagingengine.com
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

--3958f281a626439697693b2c37797d72
Content-Type: text/plain

On Thu, Jun 9, 2022, at 12:09, Gerd Hoffmann wrote:
>   Hi,
> 
> >          if (cpage > 4) {
> >              fprintf(stderr, "cpage out of range (%u)\n", cpage);
> > +            bytes  = get_field(p->qtd.token, QTD_TOKEN_TBYTES);
> > +            offset = p->qtd.bufptr[0] & ~QTD_BUFPTR_MASK;
> > +            cpage  = get_field(p->qtd.token, QTD_TOKEN_CPAGE);
> > +            fprintf(stderr, "reading %u bytes from offset %u at page %u\n",
> > +                    bytes, offset, cpage);
> 
> I think we should either drop it (you've successfully debugged the
> problem meanwhile, thanks for that), or turn it into a tracepoint.
> Simply printing to stderr is deprecated.

Gotcha, I'm OK with dropping it. Thanks for the feedback & queue-ing the fix!


Kind regards,

Arnout
--3958f281a626439697693b2c37797d72
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Thu, Jun 9, =
2022, at 12:09, Gerd Hoffmann wrote:<br></div><blockquote type=3D"cite" =
id=3D"qt" style=3D""><div>&nbsp; Hi,<br></div><div><br></div><div>&gt;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cpage &gt; 4) {=
<br></div><div>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, "cpage out of range (%u)\n", c=
page);<br></div><div>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bytes&nbsp; =3D get_field(p-&gt;qtd.token, QTD_TOK=
EN_TBYTES);<br></div><div>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D p-&gt;qtd.bufptr[0] &amp; ~QTD_BUF=
PTR_MASK;<br></div><div>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; cpage&nbsp; =3D get_field(p-&gt;qtd.token, QTD_=
TOKEN_CPAGE);<br></div><div>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, "reading %u bytes from offs=
et %u at page %u\n",<br></div><div>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; bytes, offset, cpage);<br></div><div><br></div><div>I think =
we should either drop it (you've successfully debugged the<br></div><div=
>problem meanwhile, thanks for that), or turn it into a tracepoint.<br><=
/div><div>Simply printing to stderr is deprecated.<br></div></blockquote=
><div><br></div><div>Gotcha, I'm OK with dropping it. Thanks for the fee=
dback &amp; queue-ing the fix!<br></div><div><br></div><div><br></div><d=
iv>Kind regards,<br></div><div><br></div><div>Arnout<br></div></body></h=
tml>
--3958f281a626439697693b2c37797d72--

