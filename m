Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A545A14CC6F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 15:29:02 +0100 (CET)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwoKz-0006Ln-Bb
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 09:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iwoKG-0005qA-6T
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:28:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iwoKF-0001sS-0R
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:28:15 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:42468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iwoKE-0001Bj-EX; Wed, 29 Jan 2020 09:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=atyYmmdG24ywiR20gXcF0ZMLZBRkbYfY212eidNAu2w=; 
 b=RXWCP7kgbLQJtOGc2ahi6RiD2dl3+19jf5wI9tqpR1geOe3HNQIIIzg9AiTp7D9/Yik7Xoy9DU6ElS+vYeNjVJndxZ5JLCYsuUKoO0VAqMisV1RgcmKbxGugP9YrdSOyVZ16h8pC+6JJ1HTOlt9e1NI5fp0slAnSTSSiCSApNHdRiGywvALQ1ylUpkzDF2/l9iIF6kucJHRXZBn4GMuUB9RRI8EdPHd66ty+KDySfjT4BMcq9lGBJYhB7pRrZDDdPTQtEOIdtanmcHQ6aaTz8/4ahKrwQfqnvEGHfHUtzfGT4JHJzLZPKeMgNSyIgswGkESCYr+nYwgel8rDJ+KgiA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iwoJs-0002Un-Hg; Wed, 29 Jan 2020 15:27:52 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iwoJs-0007iQ-7N; Wed, 29 Jan 2020 15:27:52 +0100
From: Alberto Garcia <berto@igalia.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] iotests: Remove the superfluous 2nd check for the
 availability of quorum
In-Reply-To: <20200129141751.32652-1-thuth@redhat.com>
References: <20200129141751.32652-1-thuth@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 29 Jan 2020 15:27:52 +0100
Message-ID: <w5136byxrpz.fsf@maestria.local.igalia.com>
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
Cc: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 29 Jan 2020 03:17:51 PM CET, Thomas Huth wrote:
> Commit d9df28e7b07 ("iotests: check whitelisted formats") added the
> modern @iotests.skip_if_unsupported() to the functions in this test,
> so we don't need the old explicit test here anymore.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

