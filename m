Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A4160EAF
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 06:23:22 +0200 (CEST)
Received: from localhost ([::1]:57684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjcEL-0002tM-E1
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 00:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54767)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hjcCw-0002T2-G1
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:21:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hjcCu-0006xL-Oe
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:21:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hjcCu-0006uz-Is
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:21:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E7895C049D7C;
 Sat,  6 Jul 2019 04:21:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5538A5141E;
 Sat,  6 Jul 2019 04:21:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A9B4E1132ABF; Sat,  6 Jul 2019 06:21:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Julio Montes <julio.montes@intel.com>
References: <20190703154958.29004-1-julio.montes@intel.com>
 <20190705143554.10295-1-julio.montes@intel.com>
Date: Sat, 06 Jul 2019 06:21:45 +0200
In-Reply-To: <20190705143554.10295-1-julio.montes@intel.com> (Julio Montes's
 message of "Fri, 5 Jul 2019 14:35:53 +0000")
Message-ID: <87v9wfg5d2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Sat, 06 Jul 2019 04:21:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/2] Makefile: generate header file with
 the list of devices enabled
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
Cc: pbonzini@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Advice for your *next* patch submission (this one's already queued):

1. Use a cover letter for submitting multiple patches together.

Julio Montes <julio.montes@intel.com> writes:

> v2: generate config-devices.h which contains the list of devices enabled
> ---
> config-devices.h is an auto-generated header file that will use
> config-devices.mak to define the list of devices enabled.
> Configs that are set to 'n' are ignored.
>
> Signed-off-by: Julio Montes <julio.montes@intel.com>

2. Anything below a '---' line will be thrown away on commit.  The text
describing the patch must go above the '---' line, not below.
Additional notes of no permanent interest, such as changes since prior
revisions, go below the '---' line.

