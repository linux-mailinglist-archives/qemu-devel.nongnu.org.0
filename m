Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136DB59E7A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 17:11:12 +0200 (CEST)
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgsWs-0005pH-9E
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 11:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49673)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berto@igalia.com>) id 1hgsOJ-0001nC-3B
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:02:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1hgsOI-0004WZ-11
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:02:19 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:60582)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1hgsOH-0004Uo-CV; Fri, 28 Jun 2019 11:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=QvEhwJuuI2ClPajWW3EG/Uw8tFyhpAQIeoNQQCirbSY=; 
 b=gHhTN2bhuIUpy/ej3vE3BkGZdqH9udpV60Ops/hFK4VilRGJqkLmrmDN1LuNASECVHh5GBRX3n/9BaaemigKAXExG9EkQYqpmXusnzpoWo996x6U6qyWtAq1f6+Vnqqs/P2cMcI/Y2tfL3OThQFRZcZB9EljC4eF/XqV5X6WHylaLw8t7jqnq3y467KJ4Xl4KpqpoM5BlAf/GqSgvNyP3ZQK5trLIIOggepaz/ZGYjJEM6RHWFBCP3zqJrFXJ5OgruaPlTkG7H2ukar0AwY2jsE9MzotUxGjAncRhOtsremH4PMcPszMXnC+vCyM7f9XOlWcV17hITs9e8ZeQ+f6rg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1hgsOD-0008K1-8b; Fri, 28 Jun 2019 17:02:13 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1hgsOD-0007hF-5m; Fri, 28 Jun 2019 17:02:13 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <20190628145708.GN5179@dhcp-200-226.str.redhat.com>
References: <20190627135914.xlzohrdwr6mz2aq3@perseus.local>
 <4453cfc4-cff7-c004-1f4c-7cab462e4661@virtuozzo.com>
 <w51a7e3domn.fsf@maestria.local.igalia.com>
 <434b102d-9d8e-ccc2-cb53-7f49a3fbd6fb@virtuozzo.com>
 <w51r27dixcm.fsf@maestria.local.igalia.com>
 <20190628145708.GN5179@dhcp-200-226.str.redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 28 Jun 2019 17:02:13 +0200
Message-ID: <w51o92hiwi2.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [RFC] Re-evaluating subcluster allocation for
 qcow2 images
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
Cc: Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Denis Lunev <den@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 28 Jun 2019 04:57:08 PM CEST, Kevin Wolf wrote:
> Am 28.06.2019 um 16:43 hat Alberto Garcia geschrieben:
>> On Thu 27 Jun 2019 06:05:55 PM CEST, Denis Lunev wrote:
>> > Please note, I am not talking now about your case with COW. Here the
>> > allocation is performed on the sub-cluster basis, i.e. the abscence of
>> > the sub-cluster in the image means hole on that offset. This is
>> > important difference.
>> 
>> I mentioned the possibility that if you have a case like 2MB / 64KB
>> and you write to an empty cluster then you could allocate the
>> necessary subclusters, and additionally fallocate() the space of the
>> whole cluster (2MB) in order to try to keep it contiguous.
>> 
>> With this we would lose the space saving advantage of having
>> subclusters. But perhaps that would work for smaller cluster sizes
>> (it would mitigate the fragmentation problem).
>
> There seem to be use cases for both ways. So does this need to be an
> option?

Probably a runtime option, or a heuristic that decides what to do
depending on the cluster size.

Berto

