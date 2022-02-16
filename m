Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE60E4B8CF6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:55:58 +0100 (CET)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKMer-0001WI-Rt
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kallisti5@unixzen.com>)
 id 1nKMbl-0007l2-Rb
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:52:45 -0500
Received: from mx.dal1.terarocket.io ([108.61.222.170]:51476)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kallisti5@unixzen.com>) id 1nKMbi-000397-O3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:52:45 -0500
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id EF6D95E76E; Wed, 16 Feb 2022 15:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io EF6D95E76E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1645026761;
 bh=T2zXCybo1RiKw2PedWS/lmN5gLK0xGYqwNmC/ligNY0=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=ecvXSkpn5OoBVD2cpPiaVzgIcalaAK61MvFGGTlzWNh5bmY2MReNLI+RPgWv2QQXW
 8hpGN92Hf79bmTgAnrmpLCgCZjkcw+6emyzJ5vA/cseEAJ/Dw6k3NUgkuTOUzd8v68
 SwB4mjSTDAJXfIBkRzg7YHw0vja7LUyUTdd1xUjQ=
Received: from mx.dal1.terarocket.io (localhost [IPv6:::1])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id A137F5E4C8;
 Wed, 16 Feb 2022 15:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io A137F5E4C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1645026752;
 bh=T2zXCybo1RiKw2PedWS/lmN5gLK0xGYqwNmC/ligNY0=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=LNLZuzbThpWDWYngFgPEY4P7WQRNzAV7+1MUEL57q/TTIh5B93G6hx1+GpGtxlG/H
 iM5r5PpC1LtWAAVW39473KXI45eA+R0/I7VYy5AJ+fg0zWq101ppiVatIxWD2raZcX
 OEXwutxN2NOrRTkO5uqOeyjlXNKLyH3kOlnd9Afc=
MIME-Version: 1.0
Date: Wed, 16 Feb 2022 15:52:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.13.0
From: "Alexander von Gluck IV" <kallisti5@unixzen.com>
Message-ID: <777cb005f1c2197ff3fd610f89215b4d@unixzen.com>
Subject: Re: QEMU's Haiku CI image
To: "Thomas Huth" <thuth@redhat.com>, "Richard Zak"
 <richard.j.zak@gmail.com>, "QEMU Developers" <qemu-devel@nongnu.org>
In-Reply-To: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
References: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
Received-SPF: pass client-ip=108.61.222.170;
 envelope-from=kallisti5@unixzen.com; helo=mx.dal1.terarocket.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

February 16, 2022 6:31 AM, "Thomas Huth" <thuth@redhat.com> wrote:=0A>=0A=
> while researching the different "sed" options on our supported build pl=
atform today, I started=0A> "make vm-build-haiku.x86_64" in my QEMU build=
 directory for the first time since many months again.=0A> And I had to d=
iscover that this is completely out of date. The image does not contain a=
ny version=0A> of Python 3 yet which we require for compilation since mor=
e than a year now already, and the Haiku=0A> version in there seems to be=
 too old to do a "pkgman install -y python3" ... so this has been=0A> com=
pletely been bitrotting since more than a year now. Is anybody still inte=
rested in keeping the=0A> Haiku support in QEMU? If so, please help to ge=
t the VM image updated. Thanks!=0A=0AI submitted=0Ahttps://patchwork.kern=
el.org/project/qemu-devel/patch/20220216154208.2985103-1-kallisti5@unixze=
n.com/=0Ato fix this issue.  The build runs as expected after that patchs=
et.=0A=0ALikely cause is us no longer packing a "python" binary, deferrin=
g to "python2" vs "python3"=0A=0AI'm still the most likely maintainer.  A=
re there still plans to automate the tests for Haiku to=0Aprevent this fr=
om happening again in the future?=0A=0AManually running qemu vm tests is =
a drop in huge bucket of tasks, so it's pretty likely to get=0Aforgotten =
until someone runs into an issue. :-)=0A=0A -- Alex

