Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B69D6A7085
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:07:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOys-0008MQ-TH; Wed, 01 Mar 2023 11:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOya-0008Iz-NL
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:06:46 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pXOyY-0003YA-LI
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:06:44 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 68F5D320055E;
 Wed,  1 Mar 2023 11:06:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 01 Mar 2023 11:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1677686799; x=1677773199; bh=wId6MHYlUD
 OEja9VNhz+fiGX7jU+eHn4BxFrT9yBMAg=; b=BtWb+mUbAtIJXTyMZq9YTFOq3p
 8uYfICrVCB47WIe4cHM5i5uywClW2kgWL4nWm+q9tQONa2KL7ULgXS9URhXMGDz/
 ziO6nqOKjeGsmTECn0VxS6fV5jUFCb+ILMlnQKSPHwDp5os6+Eh3FqyWCKBTur1U
 6VWHUE2NglNjOOCTNs5fvEvzyPZYIHg0rsynA/e1RZUK8LpL6ITUbroc+WCnD5yF
 FR2vA05FwufStBACZAG6LMNcabkY6BGElnVAqvUIJrJbJZVsfdyVaWOo0tSguJk/
 uFJDM0dOSEDo7Po2yzQTMcWfMMD7UAk8Wf61WIbVBe36MJX/UuNYfqx6JnNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677686799; x=1677773199; bh=wId6MHYlUDOEja9VNhz+fiGX7jU+
 eHn4BxFrT9yBMAg=; b=i6SINPzJrPXGp/WNwlsxdfVKcigIUKM4CpfqCBHTWauD
 Ecd27p2JbBczv1jS8Uu16om5rpIPy7PBbQZfB2jMHzrjvUWkHaFfWMRJmbZ5gGsz
 3rWebixl8rfDeZ322jj+EBGTZNA9ssw8yYHlT7x64ys7rIxo0h0srUDmltk0x+J1
 UorNO47o/OM7v1jZTgnoPsIwUSXrufcTOsFgvBAtIUAH8dlfwdIFVJoKdRpn98CQ
 UOmQABYwhQJPvv3lpIx6fSApx3/7YRqBqxnfhpjOKpaibNsjwFJW4nKrc3W5hQPG
 rZS0zU/ubv3RTWm/IWwmrMKmxO+951VHDM5DoRY2Jw==
X-ME-Sender: <xms:Dnj_YzssWH9IpwWitRzLkYI_Q9SXHwx9gRNEmeN17zIb9A0DjJ4f2w>
 <xme:Dnj_Y0fzoaiYY58_KiBsflU9luM6z3oYJ9fv5yksh8zGKwSq2uUzW9bBVXE61LySB
 vXkq5pC075RcTrE2A>
X-ME-Received: <xmr:Dnj_Y2y3WhyUwIU9e65aPr__2Oz2wsN8eU3S4-1iAV5Dit-dhaCUO1loZ7fGi1SFtTQp1aHg-5QCfYkrpaXxaOdGFpqODIMw9wV9sdadHg8C7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefhvf
 fufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepvddvteehveeutdekfeevte
 duheffledufeeiueekfffhjeehffdvheevffdvvefgnecuffhomhgrihhnpehkvghrnhgv
 lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:Dnj_YyON3pfzVp_HaU_pZJlc8iwrDCJDNYo77EM24i8DKqWxdIASWA>
 <xmx:Dnj_Yz9OF08qjtbedNCgwmWQqqcCMPDHgoSBKiSZk5R0P8cLz4tOeg>
 <xmx:Dnj_YyWHM-Jau4v9PCfw-RLeT3ARv_P1R3vnceLilDqpc-a0KD6OQw>
 <xmx:D3j_Y9n5vgudNMES2xjJ3U_e-W_1CC6GnMT0LnVby6fWe1m0ltirjA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 11:06:38 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com,
	berrange@redhat.com
Subject: [PATCH 0/2] build: Fix --enable-sanitizers build errors
Date: Wed,  1 Mar 2023 09:05:44 -0700
Message-Id: <cover.1677686566.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=dxu@dxuuu.xyz;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I hit two small build errors when building with --enable-sanitizers.
These two fixes are split out from a previous series [0].

[0]: https://lore.kernel.org/qemu-devel/cover.1677617035.git.dxu@dxuuu.xyz/

Daniel Xu (2):
  crypto/luks: Initialize stack variable to silence warning
  qemu-keymap: Fix memory leaks

 crypto/block-luks.c | 2 +-
 qemu-keymap.c       | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.39.1


