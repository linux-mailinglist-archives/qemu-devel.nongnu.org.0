Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DB4C5C7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 05:28:02 +0200 (CEST)
Received: from localhost ([::1]:43374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdnk0-00036n-So
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 23:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35225)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hdnj1-0001z3-7K
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 23:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hdnht-0008OI-I2
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 23:25:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hdnht-0008Nr-CH
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 23:25:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 365AA3680B;
 Thu, 20 Jun 2019 03:25:48 +0000 (UTC)
Received: from localhost (ovpn-116-76.gru2.redhat.com [10.97.116.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1D816013D;
 Thu, 20 Jun 2019 03:25:47 +0000 (UTC)
Date: Thu, 20 Jun 2019 00:25:45 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190620032545.GF3300@habkost.net>
References: <20190620023746.9869-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620023746.9869-1-richardw.yang@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 20 Jun 2019 03:25:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] x86/cpu: use FeatureWordArray to define
 filtered_features
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 20, 2019 at 10:37:46AM +0800, Wei Yang wrote:
> Use the same definition as features/user_features in CPUX86State.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Queued, thanks.

-- 
Eduardo

