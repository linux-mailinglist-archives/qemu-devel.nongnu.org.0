Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD71661CE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 17:06:41 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4oLY-0007UU-1T
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 11:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j4oJq-0005vO-N3
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:04:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j4oJp-0002zE-Ft
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:04:54 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:60769)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j4oJn-0002tO-UC; Thu, 20 Feb 2020 11:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=po+HZKIgm/PEQiLCLvf7W1gMpghfTBTsrf/XXN7c5vo=; 
 b=oz0umptXSAmb9800biVRMwjUcRymJcJqJjfJRv/ha3xhJu4YxA4bcS4YTq114wCZpHlsxO6LW1bxoQI7zLXtkkxctuq2evnKi5czzyMCCYELPcUt1q7QyUevTph8l0B+JrbJg09N0qStCHn1Mx7DLWQBJJRyIgreNRArAhTKa0yIVufdVRA5U0V/7+h+7hICqQ7lg9Dcfis/TAl0teeaz/3nVbaS2QmLzFokJRVU03tWOoheeqx/nYtG94L43YMxdUan0mPl2ILSDKvMLKMOpUAd0P9HdWU65cgzkJBK6zPuh7EZlmrNK5Mza0BIsoeUure+vQFmLoYAzp4tYUlttg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j4oJg-0004xj-FB; Thu, 20 Feb 2020 17:04:44 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j4oJg-0004Gv-2j; Thu, 20 Feb 2020 17:04:44 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v3 05/27] qcow2: Document the Extended L2 Entries
 feature
In-Reply-To: <fcaace04-17be-66b2-e0aa-6b1c68b11989@redhat.com>
References: <cover.1577014346.git.berto@igalia.com>
 <0b884ddcd0ac3a3c0b8cdd9d09c74566ac107c9a.1577014346.git.berto@igalia.com>
 <7ff19f65-5148-a40a-9b7a-6a330cf7272e@redhat.com>
 <fcaace04-17be-66b2-e0aa-6b1c68b11989@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 20 Feb 2020 17:04:43 +0100
Message-ID: <w51k14hb5yc.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 20 Feb 2020 05:02:22 PM CET, Eric Blake wrote:
>>> +                    Bits are assigned starting from the most significa=
nt one.
>>> +                    (i.e. bit x is used for subcluster 31 - x)
>>=20
>> I still prefer it the other way round, both personally (e.g. it=E2=80=99=
s the
>> C ordering), and because other places in qcow2 use LSb for bit
>> ordering (the refcount order).
>
> Internal consistency with refcount order using LSb ordering is the
> strongest reason to flip things, and have bit x be subcluster x.

Ok, I think you're both right, I'll change that.

Berto

