Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84512AA60
	for <lists+qemu-devel@lfdr.de>; Sun, 26 May 2019 17:09:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUulv-00062f-Tq
	for lists+qemu-devel@lfdr.de; Sun, 26 May 2019 11:09:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hUuks-0005gj-6x
	for qemu-devel@nongnu.org; Sun, 26 May 2019 11:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hUukr-0002f0-58
	for qemu-devel@nongnu.org; Sun, 26 May 2019 11:08:10 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:58437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hUuko-0002ch-Hn; Sun, 26 May 2019 11:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=le4ilk4IER0HAR6bx9f2Dy4yEyipr1NtichBeH9t2LU=; 
	b=YNllPSMWE5xK3IapKHktixS+eVBnQjKAgwF5NK55DNW7wIzPg+GFlU2yts8Mrjs5jDz7an6pMpn7D6EP2CdJe9yDHTYJvIf7CQMS0EeI9AqTXwBXoFAztGvarE+6rnq5NdJxSL/jG7fOWb0PGv/+vo9P5VthmB4QoWyeYckiUkDszAY6GHGZTrQqUjzSQrlMI8cS2m9AAvrphqIxL5Yn41bTsQ4K4flKTRwyfMkAuVjKnHpKayxmQ5/J9bSNgm63cwdGUjznOyFKHvyj9Creoek6VWnjaHGKANWtdcAkfnaz+/B8zKcWOAte753jyHmkfhTAL+FpBiPwQFk11w/Rew==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hUukm-00058s-AM; Sun, 26 May 2019 17:08:04 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1hUukm-0005Sf-7b; Sun, 26 May 2019 17:08:04 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
In-Reply-To: <20190524172812.27308-2-mreitz@redhat.com>
References: <20190524172812.27308-1-mreitz@redhat.com>
	<20190524172812.27308-2-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Sun, 26 May 2019 17:08:04 +0200
Message-ID: <w51ef4ljlt7.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [RFC 1/3] block: Add ImageRotationalInfo
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 24 May 2019 07:28:10 PM CEST, Max Reitz <mreitz@redhat.com> wrote:
> +##
> +# @ImageRotationalInfo:
> +#
> +# Indicates whether an image is stored on a rotating disk or not.
> +#
> +# @solid-state: Image is stored on a solid-state drive
> +#
> +# @rotating:    Image is stored on a rotating disk

What happens when you cannot tell? You assume it's solid-state?

Berto

