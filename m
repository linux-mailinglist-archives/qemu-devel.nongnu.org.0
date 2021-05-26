Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB2391282
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 10:42:45 +0200 (CEST)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llp7k-0001JN-Gp
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 04:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gbs@canishe.com>) id 1llp6F-0000ZD-H2
 for qemu-devel@nongnu.org; Wed, 26 May 2021 04:41:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gbs@canishe.com>) id 1llp6D-00022s-H5
 for qemu-devel@nongnu.org; Wed, 26 May 2021 04:41:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 281BCA88;
 Wed, 26 May 2021 04:41:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 26 May 2021 04:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canishe.com; h=
 content-type:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to; s=fm2; bh=v
 l3MeHPFdtsy6MbpQQaYGC/toSZiGVt7rGfq7IAjrY0=; b=RqOauv/2RZ43ejsXR
 1PwHpUQNoP0TmVyUlFf/6uRFOcQAokW4xWDvYluuEg/F8F1i25oBHFgqgqpnvliP
 B/Ox8cJiwY59xMJ+d3Y+s8iC1vUuuv69I43Oe+PjSNi8sw0R9O6FZsyvIRdWPi/q
 rHq1nR2Gtd+ai1vTBuPhZpPXfXvJG4Beyzs7hXR7L+j24fJo5McDwTwGV1OaJoMP
 yVVZ0MpOwaTkhz7s7eA9mYFSYRucoj+Kc2HWNVZb5Df7wW1zRACBfSE6AXit7CgK
 XnVX87I3mRs8aT3DjvcEYROZf3kMSobbb7YK9aMrxl7/thlrALQLzWb3DKjT7wbW
 CXmIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=vl3MeHPFdtsy6MbpQQaYGC/toSZiGVt7rGfq7IAjr
 Y0=; b=DNlE2xJ0t3dQQnTqQz95dA0mADDviByAp7AUgp6kd+I4VWp4gzSAg++pw
 Qd4loUqC8lFRyk60/O1h3rV8mxWun+92td6Ck1lCqbnqKghL9ErqZIACBt9A1w9v
 U783gRc8IPrxCQFdkWnIzvwjQ94qIDHpQ3PG9Ed/zjHXpmGGF7WDoab2q90QsjrT
 X9OiYknqQZakw8MDIMgN6ncNDntQDGAKSFjrXph4s5F/hfvdj7YshotnRnKXvrTi
 9A9IRsihHvdl6LahpQlZQGG65E8ZHkVhyAQoXLor5i6zJ1C/z/FCQrIk8SZQ5anD
 KpK39SLCS/iQvz81Hba+lcB8CSF+A==
X-ME-Sender: <xms:oQmuYBhS-WDMkhTmF53jtr6Ts83tZ5FTHwwIVji-tYC2cUe5uyEQFw>
 <xme:oQmuYGCg_w-xPhGSrw3NOMWjzk2LVoK5EXGHc_5yZR_h0AoViT0sacShCqBH0QXuo
 NWT5nFuw_fWK1QHgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekfedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffgffkfhfvofesthejmhdthhdtvdenucfhrhhomhepifgrvghl
 rghnucfuthgvvghlvgcuoehgsghssegtrghnihhshhgvrdgtohhmqeenucggtffrrghtth
 gvrhhnpeevueefleehuddtgeegkeduuedtheevfeduudfgvdeuteeigfegieevteffheek
 ieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeelkedrvdefvddrjedvrd
 ejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
 sghssegtrghnihhshhgvrdgtohhm
X-ME-Proxy: <xmx:oQmuYBHhzYlxktMERqdtUYyT52as2lCn3bEqTqgI79E2LIX1ltfG3w>
 <xmx:oQmuYGSGbSMRA3weN6sUb7E-WnFRTY6S7UlosomDfuiY7c6Ho4_kjw>
 <xmx:oQmuYOzU01Q1kjiL8HOJCiwEtK0BuuZItBH_-BfqEmetd8HJPXgQGQ>
 <xmx:oQmuYDt_MxINVepEUZz7SVBE3r5LNi6GtxEakeni2-GsxDdSF1tDng>
Received: from smtpclient.apple (c-98-232-72-79.hsd1.wa.comcast.net
 [98.232.72.79]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 26 May 2021 04:41:04 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: GSoC introduction: Rust vhost-user-scsi device
From: Gaelan Steele <gbs@canishe.com>
In-Reply-To: <YKTW/JztNA7w1Jup@stefanha-x1.localdomain>
Date: Wed, 26 May 2021 01:41:02 -0700
Content-Transfer-Encoding: 7bit
Message-Id: <D6B4A3A4-197D-43EC-9B61-75F625F78D7C@canishe.com>
References: <250A3378-EA7A-4B8C-8FEA-10AD611F00FA@canishe.com>
 <YKTW/JztNA7w1Jup@stefanha-x1.localdomain>
To: Stefan Hajnoczi <stefanha@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Received-SPF: none client-ip=64.147.123.19; envelope-from=gbs@canishe.com;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 19, 2021, at 2:14 AM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> 
> I'd like to follow your project. Will you and Sergio use #qemu IRC to
> communicate?

Thanks for your interest!

Besides the channels Sergio mentioned, I've also started a daily-ish
progress report for anyone who wants to follow along:

https://github.com/Gaelan/GSoC-2021-Notes/blob/main/log.md

As I mentioned, coding doesn't officially start until June 7, but it
turns out I don't have that kind of patience; so far, I've managed to
write hacky, terrible, but mostly functional code that receives and
responds to a REPORT LUNS command.

Gaelan

