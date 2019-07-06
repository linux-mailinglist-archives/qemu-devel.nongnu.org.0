Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69960EDC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 06:26:45 +0200 (CEST)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjcHc-0004Hk-UP
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 00:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55213)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hjcGM-0003pX-ON
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hjcGL-00013D-SD
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:25:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34856)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hjcGL-00012q-Mm
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:25:25 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DAED3082E0F;
 Sat,  6 Jul 2019 04:25:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E6CA1001B2C;
 Sat,  6 Jul 2019 04:25:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CA1B91132ABF; Sat,  6 Jul 2019 06:25:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
 <1562356239-19391-12-git-send-email-pbonzini@redhat.com>
Date: Sat, 06 Jul 2019 06:25:22 +0200
In-Reply-To: <1562356239-19391-12-git-send-email-pbonzini@redhat.com> (Paolo
 Bonzini's message of "Fri, 5 Jul 2019 21:50:38 +0200")
Message-ID: <87r273g571.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Sat, 06 Jul 2019 04:25:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 11/12] hw/i386: Fix linker error when ISAPC
 is disabled
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
Cc: Julio Montes <julio.montes@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> From: Julio Montes <julio.montes@intel.com>
>
> v2: include config-devices.h to use CONFIG_IDE_ISA
>
> Message-Id: <20190705143554.10295-2-julio.montes@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

You lost Julio's S-o-B due to his ill-advised '---' line.  Also the part
of his commit message that should be committed.  Same for PULL 10/12.

