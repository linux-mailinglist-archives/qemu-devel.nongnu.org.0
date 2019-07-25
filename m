Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AB74D25
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 13:34:51 +0200 (CEST)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqc1K-0007YY-KT
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 07:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50734)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqc10-0006Rh-D7
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqc0z-0001zr-Fv
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:34:30 -0400
Received: from mail.ispras.ru ([83.149.199.45]:48922)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqc0z-0001yF-7Z
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:34:29 -0400
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id DEF6E54006A;
 Thu, 25 Jul 2019 14:34:26 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Paolo Bonzini'" <pbonzini@redhat.com>,
 "'Pavel Dovgalyuk'" <pavel.dovgaluk@gmail.com>, <qemu-devel@nongnu.org>
References: <156404424989.18669.12696116045723475173.stgit@pasha-Precision-3630-Tower>
 <156404429499.18669.13404064982854123855.stgit@pasha-Precision-3630-Tower>
 <ee05a066-194a-5a5b-7989-cb5690c85ebf@redhat.com>
In-Reply-To: <ee05a066-194a-5a5b-7989-cb5690c85ebf@redhat.com>
Date: Thu, 25 Jul 2019 14:34:29 +0300
Message-ID: <000d01d542dc$ec7a8b30$c56fa190$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: ru
Thread-Index: AdVC3Dsn99wHj9lLRrOKjDQE7NRuvAAAKKog
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: Re: [Qemu-devel] [for-4.2 PATCH v2 8/8] icount: remove unnecessary
 gen_io_end calls
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 quintela@redhat.com, ciro.santilli@gmail.com, jasowang@redhat.com,
 crosthwaite.peter@gmail.com, armbru@redhat.com, mreitz@redhat.com,
 alex.bennee@linaro.org, maria.klimushenkova@ispras.ru, mst@redhat.com,
 kraxel@redhat.com, boost.lists@gmail.com, thomas.dullien@googlemail.com,
 artem.k.pisarenko@gmail.com, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> On 25/07/19 10:44, Pavel Dovgalyuk wrote:
> > Prior patch resets can_do_io flag at the TB entry. Therefore there is no
> > need in resetting this flag at the end of the block.
> > This patch removes redundant gen_io_end calls.
> 
> Nice.  I don't think the comments are particularly useful, I'll move
> them to gen-icount.h if you agree.

Ok, thanks.

Pavel Dovgalyuk


