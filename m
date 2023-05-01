Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27746F3549
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 19:56:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptXkC-0000S2-NB; Mon, 01 May 2023 13:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1ptXkA-0000Qg-JJ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 13:55:22 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1ptXk7-00082W-Ts
 for qemu-devel@nongnu.org; Mon, 01 May 2023 13:55:21 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 34C095C00CD;
 Mon,  1 May 2023 13:55:17 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Mon, 01 May 2023 13:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1682963717; x=1683050117; bh=Cv
 qJqZAxS+zgGflVmmvqb5LBQud8oBtrJpinvi1RCus=; b=gVO8i76U8NwUEtPNHB
 PqTNejcatAuAD0igspSLealES7hb8COlCM0CORaox99HEwT5HAa8zPs/Jxuo6NOX
 KRQ8vOGZXE9yU+2oAbTvvGFihnxcZ6touIL9eiNAfJ1y8w2MeIa+U+aw8dI5BE5p
 SZnTjvzOKDfH3HofJLdbc4hrxvmaGxGWGuX9E3RjW3p4zmH/aCvxMeF2KYfOwyLq
 j4FAqkPzx9QRduZpZexB1TikCTa13sZm3kWsRziMVt/udmqsYu7rDGjTHYa1Q3uV
 gH9elg3tlwf7n9fjieCss7DUT9fjur3xAxCHBHQP3RHGfdKUy6xE8XH7lxz84xIv
 uMHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682963717; x=1683050117; bh=CvqJqZAxS+zgG
 flVmmvqb5LBQud8oBtrJpinvi1RCus=; b=bQqCDRxGDsqrRe0mddNAbviqMc5E4
 HFhYakU/ZmjT4Wi3qKsJ555fGpFFb/ZG1C792rFOrAdpwcrEHmDXlFr99ux1Mja/
 3JsZKFruchEHjckyiAx8ehwSUdzqZyCTHIsiIlVN1oqDaNp8ht5jB63dMereqDH7
 kh54uj1LZQgQ/1M28l6Ve6jXlxz8OsTSXPtlG6j1LzzkZpfQc84Wdnkqqr5xJ+te
 3zv8SSfcGDjzbiVmSXGn2kAO9axM/JjguPUUwkxUA/GD/uXxa8dNVs8SIum1fFfk
 BPXswlSG1l/7PV6hfimin+Wl6+WNpbxaWVP0vtQ82fx9dqr6h0+9W5rtA==
X-ME-Sender: <xms:Bf1PZPXHfZjH9uXiGV9_lGyWLFYQX9PsHVnJX5IRjsUb4g0Myq_25Q>
 <xme:Bf1PZHldBgN-MywOAS_sWaxeYHCGyaQwk4Bufb5Dz7Sinw90Uu4a1qlCKTv05_xv5
 0VAFPk7D5wWfUL3fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepofgfggfkjghffffhvfevufgtsehttder
 tderredtnecuhfhrohhmpedfffgrnhhivghlucgiuhdfuceougiguhesugiguhhuuhdrgi
 ihiieqnecuggftrfgrthhtvghrnheptdduheduhfevudeiieekjeduleejffdutdeiffei
 leejtdduhefhkeehheeuvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:Bf1PZLbanBIc_QDNaiSVL5MbvIzboZ4QIUZUwbsvy06MOH5byqbuRw>
 <xmx:Bf1PZKUP9JGnvvnqPelZX_5_cnxiLDv5sPQLNDU_yXDQbgsghPLaSA>
 <xmx:Bf1PZJmrWCn366MjUCDU1Vtb0Cy-Jn6vt4h3G2mIYMEzaI6pBVTKrw>
 <xmx:Bf1PZOwy6vdh3w7I2_CeOLcp-unm9ZlXRgQlHdpmNMdbw_Z0uDKWHg>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E803EBC007C; Mon,  1 May 2023 13:55:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <fef51adf-70d8-48bc-911b-43d483706bc7@app.fastmail.com>
In-Reply-To: <CAPMcbCrgXv69jtomStPsUcWPWKc8iYRFochh5gUSyjQ8dFTmUA@mail.gmail.com>
References: <cover.1679530587.git.dxu@dxuuu.xyz>
 <9b355e4fe0574022459c0fd94ed30de3b7415011.1679530587.git.dxu@dxuuu.xyz>
 <ZBwbQCxg+aDuofY+@redhat.com>
 <4d1cc7a0-54a6-4a7c-87a9-5bc643a0162f@app.fastmail.com>
 <CAPMcbCrgXv69jtomStPsUcWPWKc8iYRFochh5gUSyjQ8dFTmUA@mail.gmail.com>
Date: Mon, 01 May 2023 11:54:56 -0600
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: "Konstantin Kostiuk" <kkostiuk@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 michael.roth@amd.com,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 2/3] qga: Add `merged` variant to
 GuestExecCaptureOutputMode
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.28; envelope-from=dxu@dxuuu.xyz;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Konstantin,

On Mon, Apr 3, 2023, at 8:56 AM, Konstantin Kostiuk wrote:
> Hi Daniel,
>
> I will merge this series after the 8.0 release.
>
> Best Regards,
> Konstantin Kostiuk.
>

Sorry to bug again, but 8.0 is out now right? Does this need a rebase
or is it good to go?

Thanks,
Daniel

[...]

