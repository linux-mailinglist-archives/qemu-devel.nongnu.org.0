Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F151653BC96
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:32:45 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwnka-0003Ct-SW
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@apitman.com>) id 1nwnhu-0001MN-Jl
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:29:58 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@apitman.com>) id 1nwnht-0001Hg-0d
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:29:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 733865C0292
 for <qemu-devel@nongnu.org>; Thu,  2 Jun 2022 12:29:55 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute4.internal (MEProxy); Thu, 02 Jun 2022 12:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apitman.com; h=
 cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1654187395; x=1654273795; bh=38QwMGgEol
 Uk5kCcTn5LUaFlMVuHzRltc9YyT0j9RkE=; b=OtOmag85yrr2OiZj/Ka0s35iAA
 l/rpueHC6oB7y7n04GJq1HCdE5i5wgE7SkR0osoXerh4+WztLoc1x0SAHdmdG3Tu
 67hu6iMsIwsmWI0kD8UrOjvWAY0AO2NuIRw88PDEUqzQDLEtRu8xwTYF69EZG/hK
 iQY/Jp+pzcg/T+4YN4DJ9gHBOYJPVAbFIMzkkrbZ890uVugf3F7/OxPhPF5fOucg
 jNlI7V+SCc/r1uS6hNu+UIZhj+Xr8MJ7ma+ss9LOeRxoD4gB0NEnNiXWFHLqA76E
 oYqLC1eKqF6L4ASn2Ec3HIJV+W/URh7HNPTCU1Y78IgQYazbzrhS8IOBboRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654187395; x=1654273795; bh=38QwMGgEolUk5kCcTn5LUaFlMVuH
 zRltc9YyT0j9RkE=; b=NG9oFfoU5KRmuCBivXyK3qeTZE4LxUHYdOpXtNlKLCJ1
 i9MWjf4jaZUjIW/cuvZGCi6Lq5kuNPdqjjX7e/zw6wAuSafL/uvDOtkz7aQv5DS5
 qYNnhLkOxlvwSQuWnc0+IsTFjZ1wzr9r2c1LWQTr5E/nX7jHwwFC3lETd1s3xTq1
 ZZMyTiEVUOoBVKRmWCtX+DuT1h98GeGt27P7ICoMrfTscOSPH+uLpU0Iax8yGeJW
 WjPM3uJbNo0scel8XSQzsog39JBDRq00S7TNQB/oClgNzsxDBboEGetXr8uS6eJ0
 RTofdGtLmf1LbwKQJYtQSQ7DIzXPOxuRufQetdCh9w==
X-ME-Sender: <xms:g-WYYv0mqg9p8zVGsjEnssR1sC2ZFM4_U-fm3DbFqOMkuGOa--zdhg>
 <xme:g-WYYuEDrClf4uGy97NOk0WW0L2HmsCe8GWSlVFXGG9Tqu1g_9htr3tFaywIvZFFS
 T4v-5gYXVDpCd80gZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleefgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrgdtre
 erreertdenucfhrhhomhepfdetnhguvghrshcurfhithhmrghnfdcuoehqvghmuhesrghp
 ihhtmhgrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdeuffefueffudeftdfhueegfe
 duvedtvefhjeffhffgfefggeehuefhvdekhfetnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepqhgvmhhusegrphhithhmrghnrdgtohhm
X-ME-Proxy: <xmx:g-WYYv4khvIkBxQyhc6o0YX9pWZz3L5cIbiEdc9dre-Fo7w0UEO2Zw>
 <xmx:g-WYYk1gZWtSIUp6OFIXleZrUF-QF-LGTewhpynxBa221Jb-h-DI3Q>
 <xmx:g-WYYiHz7pd19H9mvY_RFZVnsf_ihUh08yb4NEDRQy_yGFR2ExFLHg>
 <xmx:g-WYYmSUBwXAvlbZOS8ET9afVYwciFRkhmiwk-we8WjQLOI49KDY2A>
Feedback-ID: i354147db:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3B5EC2A2006C; Thu,  2 Jun 2022 12:29:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <454e6308-5cda-498f-98f2-b5ea877721f8@www.fastmail.com>
In-Reply-To: <5738256e-12f6-4ca6-a551-8815743b4a4b@www.fastmail.com>
References: <5738256e-12f6-4ca6-a551-8815743b4a4b@www.fastmail.com>
Date: Thu, 02 Jun 2022 10:29:35 -0600
From: "Anders Pitman" <qemu@apitman.com>
To: qemu-devel@nongnu.org
Subject: Re: Networking multiple guests
Content-Type: multipart/alternative; boundary=55ae33971c8e4ee08689d53b4b54e3c9
Received-SPF: pass client-ip=66.111.4.27; envelope-from=qemu@apitman.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

--55ae33971c8e4ee08689d53b4b54e3c9
Content-Type: text/plain

Typo. I meant that I've tried -netdev socket, not -device socket

On Thu, Jun 2, 2022, at 10:25 AM, Anders Pitman wrote:
> I'm trying to set up one guest as a SMB file server, and connect to it from several other guests. I tried using -device socket listen/connect, but it appears that only one client can connect at a time to each listener. I don't want to use mcast for security reasons, ie the other guests shouldn't be able to communicate with anyone but the file server. Would I have to set up a separate network interface on the server for each guest, or is there another way to do this?
> 
> Thanks,
> //anders
--55ae33971c8e4ee08689d53b4b54e3c9
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>Typo. I meant that I've tried -netdev socket, not -device socket<br></div><div><br></div><div>On Thu, Jun 2, 2022, at 10:25 AM, Anders Pitman wrote:<br></div><blockquote type="cite" id="qt" style=""><div>I'm trying to set up one guest as a SMB file server, and connect to it from several other guests. I tried using -device socket listen/connect, but it appears that only one client can connect at a time to each listener. I don't want to use mcast for security reasons, ie the other guests shouldn't be able to communicate with anyone but the file server. Would I have to set up a separate network interface on the server for each guest, or is there another way to do this?<br></div><div><br></div><div>Thanks,<br></div><div>//anders<br></div></blockquote></body></html>
--55ae33971c8e4ee08689d53b4b54e3c9--

