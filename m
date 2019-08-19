Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798B94C7E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 20:20:21 +0200 (CEST)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzmGR-0007Wz-PN
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 14:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dan@danny.cz>) id 1hzmFf-00077z-K2
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:19:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dan@danny.cz>) id 1hzmFe-0001Gg-Jq
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:19:31 -0400
Received: from 72.155.broadband6.iol.cz ([88.101.155.72]:59425
 helo=server.danny.cz) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dan@danny.cz>) id 1hzmFe-0001FB-Cy
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:19:30 -0400
Received: from talos.danny.cz (unknown
 [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
 by server.danny.cz (Postfix) with SMTP id 3C36D11A6D4;
 Mon, 19 Aug 2019 20:19:27 +0200 (CEST)
Date: Mon, 19 Aug 2019 20:19:27 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Paolo Bonzini <bonzini@gnu.org>
Message-Id: <20190819201927.c5cf1e8cd423781761d70b2b@danny.cz>
In-Reply-To: <CAHFMJ7teOmtBGrhrh85fr0M-BiStNqpFZ4RXr4LgwYg4sS668A@mail.gmail.com>
References: <CAJSP0QVKV4mv6xJS0Oyx0GZ3QtLM+NhQGhyK24WqpuBFmg129A@mail.gmail.com>
 <20190819105711.ea79a7962ff9efcc7054e396@danny.cz>
 <CAHFMJ7teOmtBGrhrh85fr0M-BiStNqpFZ4RXr4LgwYg4sS668A@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 88.101.155.72
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 20:07:02 +0200
Paolo Bonzini <bonzini@gnu.org> wrote:

> The machine has been reinstalled, I'll leave s390 builds for QEMU
> disabled until I'm back from vacation.

for the record, it has been recovered, but as I learned we lost data
from /var/spool, meaning user cron jobs are gone :-(


		Dan

