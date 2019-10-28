Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2AE7C6E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 23:37:55 +0100 (CET)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPDe5-0003jT-SJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 18:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iPDcp-00035u-OS
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 18:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iPDco-0006rl-Mo
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 18:36:35 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:39977)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iPDck-0006iq-FN; Mon, 28 Oct 2019 18:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=bWlB1BWOF52Uqk5+T1CSBZLc8SI9VeUWgKnjpQPlKvk=; 
 b=p/ZigJSux7w9xpxKfphM28fNQzWnu+QMRb5jUJsxzfjK+y3olLOCK9NpbPcV8/A7SMwic+kkqfcywpJyPW6dSuLSBPe/LAAQe7DzjtwUXgTk86zVq4yMnov/O8eLLqhEEYe4P999IMNckPK2PH9DdqvIPrACT6t9baUeHQuWEsMPClAFJkgo5YtF+31JELE/8nSQ3BgVwKnznlx8/IqjC5Ep4Kb3VF5v//Tb/MQEfXZKuqCHkrA//WxtcZ65Mwou8IrNRuj6KuRdNC6w5tHzSjNq2ZUDF8gITh+OIADuGZaNe4hHajEsRd8vFJxM5tcDEfozUrVpKqjcnpE9nGq55g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iPDcS-0003JS-DR; Mon, 28 Oct 2019 23:36:12 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iPDcS-0002SA-Ax; Mon, 28 Oct 2019 23:36:12 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH for-4.2 0/2] qcow2: Fix QCOW2_COMPRESSED_SECTOR_MASK
In-Reply-To: <20191028161841.1198-1-mreitz@redhat.com>
References: <20191028161841.1198-1-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 28 Oct 2019 23:36:12 +0100
Message-ID: <w51a79kijkz.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 28 Oct 2019 05:18:39 PM CET, Max Reitz <mreitz@redhat.com> wrote:
> This fixes a bug reported on
> https://bugs.launchpad.net/qemu/+bug/1850000.  The problem is that
> QCOW2_COMPRESSED_SECTOR_MASK is a 32-bit mask when it really needs to be
> a 64-bit mask.

Ouch!

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

