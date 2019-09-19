Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A59B7F46
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 18:40:16 +0200 (CEST)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAzTb-0003yk-Dg
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 12:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iAzS9-000393-79
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iAzS8-00025J-C7
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:38:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1iAzS5-00022u-TM; Thu, 19 Sep 2019 12:38:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 00A0030715F9;
 Thu, 19 Sep 2019 16:38:41 +0000 (UTC)
Received: from localhost (ovpn-116-86.gru2.redhat.com [10.97.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA5846013A;
 Thu, 19 Sep 2019 16:38:35 +0000 (UTC)
Date: Thu, 19 Sep 2019 13:38:33 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/2] iotests: Require Python 3.6 or later
Message-ID: <20190919163833.GN4082@habkost.net>
References: <20190919162905.21830-1-kwolf@redhat.com>
 <20190919162905.21830-2-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919162905.21830-2-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 19 Sep 2019 16:38:41 +0000 (UTC)
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
Cc: thuth@redhat.com, qemu-block@nongnu.org, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 19, 2019 at 06:29:04PM +0200, Kevin Wolf wrote:
> Running iotests is not required to build QEMU, so we can have stricter
> version requirements for Python here and can make use of new features
> and drop compatibility code earlier.
> 
> This makes qemu-iotests skip all Python tests if a Python version before
> 3.6 is used for the build.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

