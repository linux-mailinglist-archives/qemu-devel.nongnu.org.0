Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F953BC7E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:27:14 +0200 (CEST)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwnfF-0007Cf-8G
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1nwndj-0006TN-CR
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:25:39 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1nwndg-0000VR-9W
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:25:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55DF95C0287
 for <qemu-devel@nongnu.org>; Thu,  2 Jun 2022 12:25:33 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute4.internal (MEProxy); Thu, 02 Jun 2022 12:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apitman.com; h=
 cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1654187133; x=1654273533; bh=r3mwoORf0TXyYRJVU1mAvPu8N9++U/BBGMP
 CIAmKHZM=; b=BCgu1GrxeNlQYQlEhsNURoGWx/e6ANJOBqtKiezutbnmzJQX1ln
 N1zTUzOcW3C8l7fwj7Gvrk7+2ZoD8dm54QpQ61kOoIuWBfwcxSQALS332Nn0DKNh
 IhpKC5hsmAj2ZXnbMn18apfKd7z3ZBsyk5haUuvQu7muddmb8WXWQDt1qy1to9ru
 xQJXRgaZmt18PAPTHDQhxQ35shnR1EhzJGM9EIRqjIvRZc3G/Ed7f25jzDvUR71t
 1WoLRAJVP5Jiw5x7O1vtv5ckfT/x+L6lVsn2gFtljoU3012ZKymJ4gabEHNBl3gd
 jy0bldHNamnT+/hfNGCFlDu0J5Pn0b+Jh3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654187133; x=
 1654273533; bh=r3mwoORf0TXyYRJVU1mAvPu8N9++U/BBGMPCIAmKHZM=; b=d
 CsS+Us7BEdooxIdiUlVwZTHAQ8S641XWw2zzv0UspNaDPPQ/96Mowpq6w3IenJOf
 q/WV0umHQh0wYkQlj7wb5qcSij8IqznhNYoyT4OV44fTV/vyceef7jDALFnv4yBG
 0/bFjRrhx404/SOlqoX44DH3jgP7OehF4QGeRwfULOfwfnNF8Q40EZQ5LgG/8B2K
 wH/r7iLSzgC9UZHrJtNwJPgpQlNTTa/DYTcPPFNmeogP8tBVqWkeQptqEIci6bxD
 q+JR3JCwJHxV2T81xTZVx60QcOqMYB4HQB1LTyku9HgQnDar5p6XxDqQc9U0a5u4
 ucTWs6Y9i9k5iWOzRIOcg==
X-ME-Sender: <xms:feSYYh-mzOV2Pup51mBNsWQ6a7U8OmP2WlMV1fuORe0V0uEImtNu9Q>
 <xme:feSYYlux7AMEbZcV5jFpwgQgXjMEmwomSzwoV9ZD776E5o9BEDn14pxjOGCkWMaOs
 wu2Yj_vJDJToFKuDAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleefgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesrgdtreerre
 ertdenucfhrhhomhepfdetnhguvghrshcurfhithhmrghnfdcuoegrnhguvghrshesrghp
 ihhtmhgrnhdrtghomheqnecuggftrfgrthhtvghrnhepteeviefhveevhfetudeitdelje
 dvueeuhfelgeffjeeljeetueektdfgvdehgffhnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghnuggvrhhssegrphhithhmrghnrdgtohhm
X-ME-Proxy: <xmx:feSYYvCdY7Rn6eX0cuaTbFGY3xE1h49VnfRw1b4vBwiIrC-Xvi9ieQ>
 <xmx:feSYYldLc0wdErAzz9Gt12RWr0HVueseRDFcvYmbhbHykMdeNGkBXQ>
 <xmx:feSYYmMCP0W1w3NxzjML8WHmhMPcArGtSoDg6Qc4RRV4h3jFeAo0sg>
 <xmx:feSYYsYVWoqYLKJ5Y1NO2VvJW2U6I6S_aRK-XHjEcGZe2MyLxdfNug>
Feedback-ID: i90714442:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1DCCC2A2006C; Thu,  2 Jun 2022 12:25:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <5738256e-12f6-4ca6-a551-8815743b4a4b@www.fastmail.com>
Date: Thu, 02 Jun 2022 10:25:12 -0600
From: "Anders Pitman" <anders@apitman.com>
To: qemu-devel@nongnu.org
Subject: Networking multiple guests
Content-Type: multipart/alternative; boundary=6603972a6f9843ceb7f5661b5540dd82
Received-SPF: pass client-ip=66.111.4.27; envelope-from=anders@apitman.com;
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

--6603972a6f9843ceb7f5661b5540dd82
Content-Type: text/plain

I'm trying to set up one guest as a SMB file server, and connect to it from several other guests. I tried using -device socket listen/connect, but it appears that only one client can connect at a time to each listener. I don't want to use mcast for security reasons, ie the other guests shouldn't be able to communicate with anyone but the file server. Would I have to set up a separate network interface on the server for each guest, or is there another way to do this?

Thanks,
//anders
--6603972a6f9843ceb7f5661b5540dd82
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>I'm trying to set up one guest as a SMB file server, and connect to it from several other guests. I tried using -device socket listen/connect, but it appears that only one client can connect at a time to each listener. I don't want to use mcast for security reasons, ie the other guests shouldn't be able to communicate with anyone but the file server. Would I have to set up a separate network interface on the server for each guest, or is there another way to do this?<br></div><div><br></div><div>Thanks,<br></div><div>//anders<br></div></body></html>
--6603972a6f9843ceb7f5661b5540dd82--

