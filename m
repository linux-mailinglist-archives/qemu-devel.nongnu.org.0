Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F9924EC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 15:25:59 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzhfb-00022S-2n
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 09:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dan@danny.cz>) id 1hzdbA-0004eU-Mn
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 05:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dan@danny.cz>) id 1hzdb9-0006PB-O9
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 05:05:08 -0400
Received: from 72.155.broadband6.iol.cz ([88.101.155.72]:57612
 helo=server.danny.cz) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dan@danny.cz>) id 1hzdb9-0006Lq-IH
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 05:05:07 -0400
Received: from talos.danny.cz (unknown
 [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
 by server.danny.cz (Postfix) with SMTP id 4DA2111A6CD;
 Mon, 19 Aug 2019 10:57:11 +0200 (CEST)
Date: Mon, 19 Aug 2019 10:57:11 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-Id: <20190819105711.ea79a7962ff9efcc7054e396@danny.cz>
In-Reply-To: <CAJSP0QVKV4mv6xJS0Oyx0GZ3QtLM+NhQGhyK24WqpuBFmg129A@mail.gmail.com>
References: <CAJSP0QVKV4mv6xJS0Oyx0GZ3QtLM+NhQGhyK24WqpuBFmg129A@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 88.101.155.72
X-Mailman-Approved-At: Mon, 19 Aug 2019 09:23:44 -0400
Subject: Re: [Qemu-devel] Patchew s390 QEMU build issues
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <bonzini@gnu.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi guys,

On Sun, 18 Aug 2019 12:05:27 +0100
Stefan Hajnoczi <stefanha@gmail.com> wrote:

> Hi,
> Peter messaged me on IRC to say that QEMU Patchew s390 builds seemed
> broken.
> 
> Any chance you could take a look?

I'm looking into it now ...


		Dan

