Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DF6B9882
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 22:35:04 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBPcM-0002nv-He
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 16:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iBPb6-00025q-Jl
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 16:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iBPb4-0003wP-Pz
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 16:33:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49354)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iBPb4-0003wF-Ki
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 16:33:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 93BB110DCC87;
 Fri, 20 Sep 2019 20:33:41 +0000 (UTC)
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77C0F5D9CD;
 Fri, 20 Sep 2019 20:33:36 +0000 (UTC)
Date: Fri, 20 Sep 2019 17:33:35 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH] Acceptance tests: use avocado.utils.ssh for SSH
 interaction
Message-ID: <20190920203335.GP5035@habkost.net>
References: <20190919225905.10829-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919225905.10829-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 20 Sep 2019 20:33:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 19, 2019 at 06:59:05PM -0400, Cleber Rosa wrote:
> This replaces paramiko with avocado.utils.ssh module, which is based
> on a (open)ssh binary, supposedly more ubiquitous.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

