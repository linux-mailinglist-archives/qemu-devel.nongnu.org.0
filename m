Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F830631
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 03:21:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWWF0-0005RH-0v
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 21:21:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hWWE0-00053t-8E
	for qemu-devel@nongnu.org; Thu, 30 May 2019 21:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hWWDz-0000a6-CK
	for qemu-devel@nongnu.org; Thu, 30 May 2019 21:20:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hWWDz-0000Xp-5T
	for qemu-devel@nongnu.org; Thu, 30 May 2019 21:20:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76EEFC130719;
	Fri, 31 May 2019 01:20:49 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB6A35D6A6;
	Fri, 31 May 2019 01:20:45 +0000 (UTC)
Date: Fri, 31 May 2019 09:20:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
Message-ID: <20190531012043.GF28587@xz-x1>
References: <155913371654.8429.1659082639780315242.stgit@pasha-Precision-3630-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <155913371654.8429.1659082639780315242.stgit@pasha-Precision-3630-Tower>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 31 May 2019 01:20:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] target/i386: save EFER for 32-bit targets
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
Cc: ehabkost@redhat.com, qemu-devel@nongnu.org, dovgaluk@ispras.ru,
	pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 29, 2019 at 03:41:56PM +0300, Pavel Dovgalyuk wrote:
> +static const VMStateDescription vmstate_efer32 = {
> +    .name = "cpu/efer32",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +   .needed = intel_efer32_needed,

Indent might need a touchup.  Other than that:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

