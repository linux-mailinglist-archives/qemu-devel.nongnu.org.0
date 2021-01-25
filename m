Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FD302653
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:33:35 +0100 (CET)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42vu-0006zb-5Y
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l42uF-0006VF-DO
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:31:51 -0500
Received: from kerio.kamp.de ([195.62.97.192]:54183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l42uD-0004Xv-Hm
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:31:51 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 15:31:43 +0100
Received: (qmail 21075 invoked from network); 25 Jan 2021 14:31:44 -0000
Received: from ac50.vpn.kamp-intra.net (HELO ?172.20.250.50?)
 (pl@kamp.de@::ffff:172.20.250.50)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 25 Jan 2021 14:31:44 -0000
Subject: Re: configure does not detect librados or librbd since the switch to
 meson
From: Peter Lieven <pl@kamp.de>
To: dillaman@redhat.com, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 pbonzini@redhat.com, philmd@redhat.com
References: <23268a39-078d-ed13-6bb4-590ce1292662@kamp.de>
Message-ID: <b8dff207-21d9-ce8f-63b3-f877d29d90c6@kamp.de>
Date: Mon, 25 Jan 2021 15:31:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <23268a39-078d-ed13-6bb4-590ce1292662@kamp.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.21 um 15:13 schrieb Peter Lieven:
> Hi,
>
>
> on Dedian / Ubuntu configure does no longer detect librbd / librados since the switch to meson.
>
> I need to add dirs: ['/usr/lib'] to the cc.find_library for librados and librbd. But I am not familiar with meson
>
> and can't say if thats the appropriate fix.
>
>
> I would be thankful for a hint. I would create a patch to fix this and include it upfront of my rbd driver rewrite
>
> that I would like to respin asap.


Further issue: if I specify configure --enable-rbd and cc.links fails the configure command succeeds and rbd support is disabled.


This seems to be an issue with all cc.links calls in the meson.build script.


Peter



