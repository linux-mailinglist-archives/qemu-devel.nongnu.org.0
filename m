Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A1709DA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 21:40:58 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpeB7-0005JE-0n
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 15:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hpeAv-0004v5-Bc
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 15:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hpeAu-0001un-8Z
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 15:40:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56720)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hpeAu-0001uK-3a
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 15:40:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F69B300B916;
 Mon, 22 Jul 2019 19:40:42 +0000 (UTC)
Received: from localhost (ovpn-116-51.gru2.redhat.com [10.97.116.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEC635D9C8;
 Mon, 22 Jul 2019 19:40:41 +0000 (UTC)
Date: Mon, 22 Jul 2019 16:40:38 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Message-ID: <20190722194038.GG26800@habkost.net>
References: <20190718073405.28301-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718073405.28301-1-tao3.xu@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 22 Jul 2019 19:40:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] target/i386: Introduce Denverton CPU
 model
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

On Thu, Jul 18, 2019 at 03:34:05PM +0800, Tao Xu wrote:
> Denverton is the Atom Processor of Intel Harrisonville platform.
> 
> For more information:
> https://ark.intel.com/content/www/us/en/ark/products/\
> codename/63508/denverton.html
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>

Queued for 4.2, thanks.

-- 
Eduardo

