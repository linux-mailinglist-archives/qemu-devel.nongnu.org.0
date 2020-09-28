Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B127B101
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 17:37:17 +0200 (CEST)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMvDI-0002IL-E0
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 11:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kMvAv-0000tF-BG; Mon, 28 Sep 2020 11:34:49 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:56741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kMvAt-00070q-5A; Mon, 28 Sep 2020 11:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=nkFim8yn7gE3rvtOPjoo8fLNIP7Pp6rAfDe41FB0t24=; 
 b=aCbiokRrLA2hQInfHOxGaiNg/FOP0rvMWkkYXQM2dJ9StWKJCDK2vtCpv2ATD+WdPOUaiDNDLwTIF71a+z/Uwmw5t6ofkzK0bTtBbMxKrgzsWmzy+pvZt6vD2+eTrJQzDGpp0B31lXJJTARg//uvOx4HrIm1emXLdZHjo0EAbvWlvzJcoV9+Klzwtwrw8LDcCvSHxYj84jU/RtcpD1miSUIEYB+DLDfJOx+dshVu5Xm5m9OUcJa9vrAtE4yEWYL+iQho0eFI/BL67LXR0hnxid1al/5f3UqBt30nIcl7wa7BT3KnyWLQnRcN5Ekiz2S4xI+r1sPlnN3ORbst//U08A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kMvAT-0005bH-5V; Mon, 28 Sep 2020 17:34:21 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kMvAS-0000Td-SJ; Mon, 28 Sep 2020 17:34:20 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v6 01/15] block: simplify comment to BDRV_REQ_SERIALISING
In-Reply-To: <20200918181951.21752-2-vsementsov@virtuozzo.com>
References: <20200918181951.21752-1-vsementsov@virtuozzo.com>
 <20200918181951.21752-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 28 Sep 2020 17:34:20 +0200
Message-ID: <w51eeml530j.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 11:34:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 18 Sep 2020 08:19:37 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> 1. BDRV_REQ_NO_SERIALISING doesn't exist already, don't mention it.
>
> 2. We are going to add one more user of BDRV_REQ_SERIALISING, so
>    comment about backup becomes a bit confusing here. The use case in
>    backup is documented in block/backup.c, so let's just drop
>    duplication here.
>
> 3. The fact that BDRV_REQ_SERIALISING is only for write requests is
>    omitted. Add a note.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

