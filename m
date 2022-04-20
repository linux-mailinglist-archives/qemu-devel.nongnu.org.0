Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0925090EC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:57:59 +0200 (CEST)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGSb-0004ju-2c
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1nhFh5-0005eS-8G
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:08:54 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1nhFh3-0001t6-7b
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:08:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D3F085C00E6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 15:08:46 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute4.internal (MEProxy); Wed, 20 Apr 2022 15:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apitman.com; h=
 cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1650481726; x=1650568126; bh=QyOL7wzp55ltd1vzVcyo0FUlwhG16pTDV5L
 pfSoJ6O0=; b=sK+HVkc6s4zpBi3MTL1cu4KlplIFXJmTJgFltjHbdb+0LYUwJuF
 Zlp4llBlNo61y8CnwBJSd7IXQ/S2rqUFh/MNRSwEu2+AK4bs2DcpuCrY6TMFxYjO
 Sq1/9E/wBSjbZkNg+XSv/k/Hnsyqg8Cp6t6GNqvg7/+ud7S3+O52LPFy3/tw9iCt
 t0K3jsu4zmsAyBtv97Ogk7feRszha+KnWCki71yFUZ0+75K9ApWr32evqzDJwoIb
 R0XNNdQWucimrxiKotjnYBwcW/C9lRoixb1tzjHXSw/F9ntx9XokZu558Z6/XDGv
 HMMObyqZjjQamAjl46bcDHHdI7jNJOxonYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650481726; x=1650568126; bh=QyOL7wzp55ltd
 1vzVcyo0FUlwhG16pTDV5LpfSoJ6O0=; b=rc0z6kxJ3FSz2cy81pXB6nZgfGYBB
 GzTB+9ZKc7HGrbn0T2QrvcbAW1FPg/7hhOhT1X9fZrUt8P+WI99NpYdRo/AiPFOW
 lrpYXEccR4BUKhMt9MVMu5/Z2QvR7piRbaf6CuPv+TP514e0oR1R/BrDhtw3hDil
 FBB75V8ezFzWLCf1ccstQJXyKOG1oKC32NaoHOfVvMliD+NcDb/LDBrj/e1E+QPm
 /58L2mKtWp+Mhq0m+audWCLi9KZV/xJI/HTsBWB/akq3FnZEWex3Ro0L7qqO24XY
 o0k1zkKk5gAmJx3tmiyy4g5fbwobgHs+8pfjElfrrTBXWkIQEUITrqcfg==
X-ME-Sender: <xms:PlpgYl_e7xe8MVPHaKH0QG2lV-CJ-3C8kqyqYwHJKrqQPQVWThrJPA>
 <xme:PlpgYpskdVx62riEDUW88t_L0pY4wKDlER7AKZ8wG8lwiCX7ROvTav97C7equRwUP
 3lABFdN6c2khIxcB-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsegrtderre
 erredtnecuhfhrohhmpedftehnuggvrhhsucfrihhtmhgrnhdfuceorghnuggvrhhssegr
 phhithhmrghnrdgtohhmqeenucggtffrrghtthgvrhhnpeetveeihfevvefhteduiedtle
 ejvdeuuefhleegffejleejteeukedtgfdvhefghfenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhguvghrshesrghpihhtmhgrnhdrtghomh
X-ME-Proxy: <xmx:PlpgYjAwCL0T_ELzgOkrwBGBpIF6mvNmczIBACO_2h5sRlUIzzN2sA>
 <xmx:PlpgYpcQ6ygCZZxKvTVHqwts2pWyygaIKgf-TUR2-iibRmBkioi9Ww>
 <xmx:PlpgYqN-dRZI_7LDAwnLIg_HjD2MnLhqz10m89c1NxtELoJdW6_q7Q>
 <xmx:PlpgYgYWFMI5wj_m1g6gtdanYodnCYYJ72VQKrBmJZBxc0djM7cEuw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 90CDC1EE0083; Wed, 20 Apr 2022 15:08:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-568-g521196dd5d-fm-20220414.001-g521196dd
Mime-Version: 1.0
Message-Id: <8f5cc095-e5e9-486d-8e52-d22cac6d2379@www.fastmail.com>
Date: Wed, 20 Apr 2022 13:08:26 -0600
From: "Anders Pitman" <anders@apitman.com>
To: qemu-devel@nongnu.org
Subject: Future of libslirp in QEMU
Content-Type: multipart/alternative; boundary=1df37c210cfe48f2abf290678520449e
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
X-Mailman-Approved-At: Wed, 20 Apr 2022 15:37:41 -0400
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

--1df37c210cfe48f2abf290678520449e
Content-Type: text/plain

I noticed in the 7.0 changelog that libslirp might be removed as a submodule in the future. Since user networking is very important for my project, I'm wondering if this is simply an implementation detail, or if there are plans to eventually remove slirp support entirely from QEMU (which would be bad for me)?

Is there somewhere I can read the discussion about this? I searched the mailing list archives but didn't see anything obvious.
--1df37c210cfe48f2abf290678520449e
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>I noticed in the 7.0 changelog that libslirp might be removed as a submodule in the future. Since user networking is very important for my project, I'm wondering if this is simply an implementation detail, or if there are plans to eventually remove slirp support entirely from QEMU (which would be bad for me)?<br></div><div><br></div><div>Is there somewhere I can read the discussion about this? I searched the mailing list archives but didn't see anything obvious.<br></div></body></html>
--1df37c210cfe48f2abf290678520449e--

