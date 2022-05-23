Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390EA531DA3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:23:27 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFWQ-0006xa-BK
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1ntF1j-0006VB-8c
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:51:46 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1ntF1h-0005kG-CS
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:51:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C16555C0170;
 Mon, 23 May 2022 16:51:38 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute4.internal (MEProxy); Mon, 23 May 2022 16:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apitman.com; h=
 cc:cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1653339098; x=1653425498; bh=jF74fjCQp1sSTIL9BmhWt9ZBNyJaMRmgFjh
 vkprFL/M=; b=XIjo9RahGVM1MtI2LU3GiEjiLALaEkiJJ188ncYOCl1rrobDR5u
 pYkhr2MQo/djM93lnUSW2dfbDiMHUF5AJLUAG5yNSTijD6U6Bh2Z0ZdtQf8AYnwl
 SueSbr5OtMZoPDZyaL/YSQsHs84FSBbkL6V1Q/xuoh87RVLfMFCMpjX20AgI3Bev
 rrPzdIRpfJkRl9mIF+JG6kq62iXFUFljowtxnSfevJM1F0YHZ++rcMPcnzv0kM0U
 5pjSBCoY/VMqG6QezC6I1FEvgHY5w1xWUIyb5+IPerfd/uA5I7Bw/LHafljajB49
 dTSWrTJLCASPpn7s4nGchvL16gOdbbhHz+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653339098; x=
 1653425498; bh=jF74fjCQp1sSTIL9BmhWt9ZBNyJaMRmgFjhvkprFL/M=; b=f
 G0F06r3gsOlZ49c7huEOX0fetew1g3+UR6BCGsQ4m31azo4Gbp0AjnEYsrr83xYL
 aKyF45rNKkGojQqFxHVw2eD1N1Gc0pQk9acFDmxF+dYY13tG/QpqHMXc3UaAZ9vJ
 Yh6RgTs7+nSAxN3WuNXqGctRAGimVP4oJqgOVv4Lh5b1ZkMaQvZX86Q2ILTuhh/2
 dZKVqZQWH10C7gBQIKYMG6cBOnJtpbsS9TJF9h2WMdVrv6L7KNFedqGTmEhbzRiV
 szeQ+TxEuAHC64JCe92MxiSVXx70Yc3BfJY3yCRL036VuirJIf6w79G0LuvdAul2
 wBKY07B65dKVMH7Mf/1Zg==
X-ME-Sender: <xms:2vOLYsu_cMT5KSiQytKZGSyyWX1AJ02X6R0dIwiE5-nAiSD7ADS6Xw>
 <xme:2vOLYpcnbBFZq7667JWH3gFwWoIVKZ-i40HtYe5pwZbQmF9WyngY4Qvet9h-NbEDW
 9eydAF6-kYWxqKVNQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjedugdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvvefutgesrgdtre
 erreertdenucfhrhhomhepfdetnhguvghrshcurfhithhmrghnfdcuoegrnhguvghrshes
 rghpihhtmhgrnhdrtghomheqnecuggftrfgrthhtvghrnhepffdvveehudetjeevvdehud
 fhheeugefffedvveduueelleejteetgffgvdeiledvnecuffhomhgrihhnpehvmhhsphhl
 ihgtvgdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhguvghrshesrghpihhtmhgrnhdrtghomh
X-ME-Proxy: <xmx:2vOLYnzdMv8ZHxT8peaq_aICaAsAtb_SaQupB2YJFXoZhila3xakaQ>
 <xmx:2vOLYvMh2VbUhGjM8UMmjybjBWfmrSEb1TSDWJ7XHo5yORNswCSSdw>
 <xmx:2vOLYs-KO1FLipPhi6ghVgyH1WkHJ8wybMxWdKd4dh9YKDJSc19fDA>
 <xmx:2vOLYlIWH12-j1r9m3joR9ZtGLXRNbekah-HndSq93PZjAFv8MP_7Q>
Feedback-ID: i90714442:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 83BBF2A20069; Mon, 23 May 2022 16:51:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <d859a414-ca5a-48a8-ab96-2cb869f8978f@www.fastmail.com>
Date: Mon, 23 May 2022 14:51:17 -0600
From: "Anders Pitman" <anders@apitman.com>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com
Subject: Fast usermode networking with QEMU
Content-Type: multipart/alternative; boundary=ad098eaf00944f6999debf375a5e5c02
Received-SPF: pass client-ip=66.111.4.29; envelope-from=anders@apitman.com;
 helo=out5-smtp.messagingengine.com
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

--ad098eaf00944f6999debf375a5e5c02
Content-Type: text/plain

I came across this blog post[0] concerning passt, which is an alternative usermode networking implementation for QEMU.

I'm working on a project that uses QEMU on Windows hosts running Linux guests. I'm trying to get faster usermode networking than is available with libslirp. My performance target is 200Mbps even on older or less powerful hardware, such as Celeron mini PCs. Currently I'm seeing 15-30MBps with libslirp.

It appears that passt doesn't currently support Windows, correct? Is there a guess as to how difficult that might be to implement? If the speedup is significant, I would be interested in taking a crack at adding Windows support.

Thanks,
//anders

[0]: http://blog.vmsplice.net/2021/10/a-new-approach-to-usermode-networking.html
--ad098eaf00944f6999debf375a5e5c02
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>I came across t=
his blog post[0] concerning passt, which is an alternative usermode netw=
orking implementation for QEMU.<br></div><div><br></div><div>I'm working=
 on a project that uses QEMU on Windows hosts running Linux guests. I'm =
trying to get faster usermode networking than is available with libslirp=
. My performance target is 200Mbps even on older or less powerful hardwa=
re, such as Celeron mini PCs. Currently I'm seeing 15-30MBps with libsli=
rp.<br></div><div><br></div><div>It appears that passt doesn't currently=
 support Windows, correct? Is there a guess as to how difficult that mig=
ht be to implement? If the speedup is significant, I would be interested=
 in taking a crack at adding Windows support.<br></div><div><br></div><d=
iv>Thanks,<br></div><div>//anders<br></div><div><br></div><div>[0]: <a h=
ref=3D"http://blog.vmsplice.net/2021/10/a-new-approach-to-usermode-netwo=
rking.html">http://blog.vmsplice.net/2021/10/a-new-approach-to-usermode-=
networking.html</a><br></div></body></html>
--ad098eaf00944f6999debf375a5e5c02--

