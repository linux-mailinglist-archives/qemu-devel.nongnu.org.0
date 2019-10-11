Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF28D3D79
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 12:34:25 +0200 (CEST)
Received: from localhost ([::1]:48274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIsFd-0002Qg-0D
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 06:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iIsDL-00010s-3Y
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 06:32:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iIsDI-0006lH-Un
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 06:32:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37406)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iIsDI-0006l2-P6
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 06:32:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B9024FCC7;
 Fri, 11 Oct 2019 10:31:59 +0000 (UTC)
Received: from redhat.com (ovpn-117-120.ams2.redhat.com [10.36.117.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E48E260BE1;
 Fri, 11 Oct 2019 10:31:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 2/4] migration/multifd: use pages->allocated instead of
 the static max
In-Reply-To: <20191011085050.17622-3-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Fri, 11 Oct 2019 16:50:48 +0800")
References: <20191011085050.17622-1-richardw.yang@linux.intel.com>
 <20191011085050.17622-3-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Fri, 11 Oct 2019 12:31:56 +0200
Message-ID: <874l0fwp2b.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 11 Oct 2019 10:31:59 +0000 (UTC)
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> multifd_send_fill_packet() prepares meta data for following pages to
> transfer. It would be more proper to fill pages->allocated instead of
> static max value, especially we want to support flexible packet size.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

It don't really matters.  We send full packets except the last one or
somesuch extern reason.  Only makes a difference if for that channel
only is sent a partial packet.

