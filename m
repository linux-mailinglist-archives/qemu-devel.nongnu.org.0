Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75636DB231
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 18:20:54 +0200 (CEST)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL8WD-00014h-2M
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 12:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iL7lE-000750-1L
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iL7lB-0003Zq-Rr
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:32:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50318)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iL7lB-0003ZV-Lm
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:32:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E867C3082A6C;
 Thu, 17 Oct 2019 15:32:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4379A1001B11;
 Thu, 17 Oct 2019 15:32:16 +0000 (UTC)
Date: Thu, 17 Oct 2019 17:32:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gautam Bhat <mindentropy@gmail.com>
Subject: Re: ACPI table modifications
Message-ID: <20191017173214.5e81a0d7@redhat.com>
In-Reply-To: <CAM2a4uzF-mtTEYwQE3+MvvDiQrfC_KQMwX4vqCg_dY9ytjZrjA@mail.gmail.com>
References: <CAM2a4uzF-mtTEYwQE3+MvvDiQrfC_KQMwX4vqCg_dY9ytjZrjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 17 Oct 2019 15:32:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Oct 2019 00:17:10 +0530
Gautam Bhat <mindentropy@gmail.com> wrote:

> Hi,
> 
> I want to add some I2C based temperature sensors to the -M Q35 machine. I
> want to update the ACPI tables to add this device information. How can I go
> about  doing this?

Process is described here:
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg650066.html


> 
> Thanks,
> Gautam.


