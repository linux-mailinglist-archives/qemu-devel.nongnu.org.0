Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17E757E7F6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:08:13 +0200 (CEST)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEywX-0006mP-1Y
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@colorremedies.com>)
 id 1oEytY-0001HK-Nq
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:05:08 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:51967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@colorremedies.com>)
 id 1oEytW-0007mC-6g
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:05:08 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id CE2CA2B05A01
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 16:05:02 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Fri, 22 Jul 2022 16:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 colorremedies.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1658520302; x=1658523902; bh=DFam6rNaCk
 Z5wAte9NIzc0ZO6/YRXI+ptK1kYKDCZPQ=; b=fS9ri/+MDqcMzU+44juyTLEMEb
 zc0WslU1zowgaC1yCE/jOHN4/KSNO2RNXPwM68RzvkcTQojVAuNyuZkYVnTUlNDg
 n0af2kqI/FD4gq7EyqNq/CCI/0nQ+x23Fu+YszaHB1WfDUjVqEgSfrkSRDAD/G5y
 5VqsH6dF9ffya0y11p1bQwgd39MICUK6/nEdpaKoEFlv/VHAzxNL5vvp3ikqGSlZ
 SXBBnVEczNdoL7bzfxVo+9PdNBzriXyr2NRRXP4qpl0xXhCFjsFZVASzSnPdA9vm
 /xV/bOOU7indr6SYCIYUVjrbBsIuc90Q8pQM/PqeeWJHhnwfydCxB4laKnyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i06494636.fm3; t=
 1658520302; x=1658523902; bh=DFam6rNaCkZ5wAte9NIzc0ZO6/YRXI+ptK1
 kYKDCZPQ=; b=tezLn+K/eAqsecWWeDhSY/jAeDT1BI3pMtZPkYAFwt2bmberIIv
 /BHvwRpnY2Foptd/kSmDaXqggizhAaBOqctpkTZhO9E9xHY4vGnwSAsC0mpJVBrj
 S300yw1rVn7e/u6YbVMopYE6viDmQkhPRE3/YC5kMsqjFjSdjWmwc2P8VUKnv+TK
 ApNoCqsKi30Tyxudu3tuQYL1gcr5OFQlD8VLVxmYupc3PjkD6QpbnSFZXc5Aqc/a
 NqWJcJBIMb+UHGYoZzc9xF1S1UUkSbhhlF7DaxDD0tfhCInG/akKSTPV13033PoC
 9rB7+2IboBzA9jaBV241auWk92/Hkj1I9XQ==
X-ME-Sender: <xms:7QLbYhMfR12ueU82zRbWQfx24zvMfWtLm1Eot4_0pbnq7XjXxaZ4jw>
 <xme:7QLbYj9prQRt5rB5Xa18sZjfPAkdHLKKv-FdLt34WV9PdOkeqM7_ZecdHpbqBMtna
 6oOS8trsFvjiJDkOJY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtvddgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesrgdtre
 erreertdenucfhrhhomhepfdevhhhrihhsucfouhhrphhhhidfuceolhhishhtshestgho
 lhhorhhrvghmvgguihgvshdrtghomheqnecuggftrfgrthhtvghrnhepheeiueektdeite
 dtueekgedufeetueeiteevffegveelkefhvedtjeeivdffuefgnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhishhtshestgholhhorhhrvg
 hmvgguihgvshdrtghomh
X-ME-Proxy: <xmx:7QLbYgTC2GnNYf7xdr-48XqyYFzy4_e61v8h-xsryk_O0BeOFPtCGQ>
 <xmx:7QLbYtufLWgwkLLeNjKpa86l_6rgz6moIcYmmUYLXug4d4wFX6u0BA>
 <xmx:7QLbYpeWM92QxilCyxMjoFkjChLQwWcLi-Z9H5a-zOFKoioyWlnk7g>
 <xmx:7gLbYjo5hwkbuAjigjNa_PEJ_mn2GMDxKGPubVzQnrw0vW5UFZQ41zK0z15e4X7J>
Feedback-ID: i06494636:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BE5A7170007E; Fri, 22 Jul 2022 16:05:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <4f9c91b1-719c-443e-a757-042e772d6019@www.fastmail.com>
Date: Fri, 22 Jul 2022 16:03:52 -0400
From: "Chris Murphy" <lists@colorremedies.com>
To: qemu-devel@nongnu.org
Subject: driver type raw-xz supports discard=unmap?
Content-Type: multipart/alternative; boundary=34290c0ee45a44bdaa4e0bf857a9bd4d
Received-SPF: pass client-ip=64.147.123.27;
 envelope-from=lists@colorremedies.com; helo=wnew2-smtp.messagingengine.com
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

--34290c0ee45a44bdaa4e0bf857a9bd4d
Content-Type: text/plain

Is this valid?

`<disk device="disk" type="file">
<target dev="vda" bus="virtio"/>
<source file="Fedora-Workstation-Rawhide-20220721.n.0.aarch64.raw-xz"/>
<driver name="qemu" type="raw-xz" discard="unmap"/>`
`/>
</disk>`

I know type="raw" works fine, I'm wondering if there'd be any problem with type "raw-xz" combined with discards?

Thanks,

Chris Murphy
--34290c0ee45a44bdaa4e0bf857a9bd4d
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>Is this valid?<br></div><div><br></div><pre class="notranslate"><code>&lt;disk device="disk" type="file"&gt;
&lt;target dev="vda" bus="virtio"/&gt;
&lt;source file="Fedora-Workstation-Rawhide-20220721.n.0.aarch64.raw-xz"/&gt;
&lt;driver name="qemu" type="raw-xz" discard="unmap"/&gt;</code><br></pre><pre class="notranslate"><code>/&gt;
&lt;/disk&gt;</code><br></pre><div><br></div><div>I know type="raw" works fine, I'm wondering if there'd be any problem with type "raw-xz" combined with discards?<br></div><div><br></div><div>Thanks,<br></div><div><br></div><div>Chris Murphy<br></div></body></html>
--34290c0ee45a44bdaa4e0bf857a9bd4d--

