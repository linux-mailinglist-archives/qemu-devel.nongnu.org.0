Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E728B5B416C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 23:26:57 +0200 (CEST)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWlWa-0001mZ-Ly
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 17:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1oWlUH-0000AW-4i
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 17:24:33 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1oWlUF-0008G5-0J
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 17:24:32 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9FC273200918
 for <qemu-devel@nongnu.org>; Fri,  9 Sep 2022 17:24:25 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute5.internal (MEProxy); Fri, 09 Sep 2022 17:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verbum.org; h=cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1662758665; x=1662845065; bh=jePfmObYTXKBiBIOkiigrDFoj/z1gM5pxCa
 C0A5onDI=; b=fkAnlAF2D5qIJecZLcunljMi6ztYhKVjNdzeJbjEN4I/xqCGc4L
 yxALu6bRNntF5DfWehb9IvkV9ofkDjFMKxxO+zUcgYLnOHbla6S3hAD6+UcpBHzh
 WehUvA88Tj/mYlGX37QqgErTaViNDb0D8vOzvui/5gye51KkgKYtNQnAVMKpMka5
 9vS65l2lYhF8hhRWBlZpaRhZPIW5RzIA8fFPmpPce1qLoE+Gwn1GlBDvM1YOg4Jg
 yaoiWcgVXfWgXe6P5P42sm2IgO8L25XhvgFuM12PC2SEFXRBl04lowRcVGxtCIkk
 5QmxD5cGi62zSJaEGw/bterjpP7IXNxudMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662758665; x=
 1662845065; bh=jePfmObYTXKBiBIOkiigrDFoj/z1gM5pxCaC0A5onDI=; b=D
 aREDr4x4zL1U0zKTSRZ88iWzbBo+stDccRNdFPHW81t0NuEbOLvqPdPEfO2/jIqq
 UyAzaLLPmPEXzx2l9sTB6HTF8BxPgKvh3E78cwZxc2tVGaU8hWdiLuasScirhYiU
 JJo+w+luwbrAHw0KWDIPWlFV6tgSfxO7KS522k07GWPgjOaTFLv7fq7Cm8mNIhNb
 7qYd1oG2899qQARChJAITmV07RkLRutCmgZd0F9+rV5C+b6BC03W1xIE34z59Sc0
 2w+bQp56AJByRCuuVODnxIDiMCQVl5wYRR+keyUgEHT5fB5B2qTFE6TTO7Py2jrG
 rsTetF/WskBtDt/NuEmXg==
X-ME-Sender: <xms:CK8bYxpCwidKcbkJoYoH9mZRZkyfM44maoeZhGmZrP378t_YC5Zx5w>
 <xme:CK8bYzqdBzmYerENlsbfXSAe2mnEtS0hfxGbemzLlzE0wMNE0Jw7cmnM27WzCcPg2
 yc4b1jR7YwEz0OM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgudeigecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdevohhlihhnucghrghlthgvrhhsfdcuoeifrghlthgvrhhs
 sehvvghrsghumhdrohhrgheqnecuggftrfgrthhtvghrnhepueffgffhgfdutdehteduie
 egudetvdehfeefgfeuledtheejgeelteeljedthfejnecuffhomhgrihhnpehkvghrnhgv
 lhdrohhrghdpghhithhhuhgsrdgtohhmpdhlfihnrdhnvghtnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfigrlhhtvghrshesvhgvrhgsuhhm
 rdhorhhg
X-ME-Proxy: <xmx:CK8bY-NlWFQf77Eh2XXe-2e-RrLGRZjpOS1ngNutSsC2Z-BQvLcmVw>
 <xmx:CK8bY86_VGEnIhp0IgJzERk-QEFAbl6FfUjPP9vWXKu2-2wBuFWh-A>
 <xmx:CK8bYw6DlEf9sIBaAdX-Kk1tMofU1MbGGlrNvO7pqACnfVRXAIPn_A>
 <xmx:Ca8bYyEWKweau1TTDhpjZBwVvtqRhpdtq1WP9wTgj7CGukVrUpnWBA>
Feedback-ID: ibe7c40e9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E60892A20079; Fri,  9 Sep 2022 17:24:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
Date: Fri, 09 Sep 2022 17:24:03 -0400
From: "Colin Walters" <walters@verbum.org>
To: qemu-devel@nongnu.org
Subject: virtiofsd: Any reason why there's not an "openat2" sandbox mode?
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.25; envelope-from=walters@verbum.org;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We previously had a chat here https://lore.kernel.org/all/348d4774-bd5f-4832-bd7e-a21491fdac8d@www.fastmail.com/T/
around virtiofsd and privileges and the case of trying to run virtiofsd inside an unprivileged (Kubernetes) container.

Right now we're still using 9p, and it has bugs (basically it seems like the 9p inode flushing callback tries to allocate memory to send an RPC, and this causes OOM problems)
https://github.com/coreos/coreos-assembler/issues/1812

Coming back to this...as of lately in Linux, there's support for strongly isolated filesystem access via openat2():
https://lwn.net/Articles/796868/

Is there any reason we couldn't do an -o sandbox=openat2 ?  This operates without any privileges at all, and should be usable (and secure enough) in our use case.

I may try a patch if this sounds OK...

