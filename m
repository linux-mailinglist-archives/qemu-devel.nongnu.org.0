Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23932F58
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 14:16:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXlsm-0007KG-4w
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 08:16:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hXlqL-00066I-O2
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hXlkM-0003Ii-Au
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:07:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>) id 1hXlkM-0003HI-5N
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:07:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F3EB5BA;
	Mon,  3 Jun 2019 12:07:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-13.rdu2.redhat.com
	[10.10.121.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9E567268;
	Mon,  3 Jun 2019 12:07:19 +0000 (UTC)
To: Andrew Randrianasulu <randrianasulu@gmail.com>, qemu-devel@nongnu.org
References: <201906010603.23645.randrianasulu@gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <350e1497-767a-d3eb-6be3-62d213be24d8@redhat.com>
Date: Mon, 3 Jun 2019 14:07:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <201906010603.23645.randrianasulu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 03 Jun 2019 12:07:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] "accel/tcg: demacro cputlb" break
 qemu-system-x86_64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Andrew,

On 06/01/19 05:03, Andrew Randrianasulu wrote:
> Hello!
> 
> I was compiling latest qemu git, and was surprized to find qemu-system-x86_64
> (compiled for 32-bit x86 machine) can't boot any 64-bit kernel anymore.
> 
> 32-bit kernels and kvm were fine.
> So, I run git bisect

> # first bad commit: [eed5664238ea5317689cf32426d9318686b2b75c] accel/tcg: demacro cputlb
> 
> Not sure how many people test qemu-system-x86_64 on 32-bit x86 hosts....

Please consider subscribing to
<https://bugs.launchpad.net/qemu/+bug/1830872>. I think both the symptom
you've reported and the symptom described in LP#1830872 could have the
same root cause.

(I'll try to retest LP#1830872 at eed5664238ea^ later.)

Thanks,
Laszlo

