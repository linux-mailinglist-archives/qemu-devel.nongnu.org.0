Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE241AE43
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:55:21 +0200 (CEST)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBhg-0005fj-QT
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVBgL-0004st-1j
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:53:57 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVBgJ-00087Y-As
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=yIqA76Apx8RK+WfNTCEiquiIAGEWvkYeVl33VhjFvKo=; b=PuB7/SraUGHEu3E2AQNehUYHfd
 RlFPdpJdUv7P1llKdYIG4b5+3XY5IDb84MAwQQjikXA6EDpjtTkSgVIMj8wEky+ov+FzOXCTuQZ/0
 70dsd/onuYoLbwo3ja5ThLco5VP4kv0DY4c0egmN9t6YyZOtbcA+PFTL9qhxyQqAIES17CCSM7L7D
 J8fKbSIolxabtbaO6MHJvMTgHxzHyA8cSL/NX3AtWx4aS8CqwFXQQimvi4hJhSf56QEaIUpw9j+Hs
 Ds/o19vhhFp/DNopdt8LmMmSMntm/wq2quWP3EwOES3tXpVwKxN5YMAfFfrRnHKWEyOIuWb+QR18P
 9f+FqjpderhIwp0J+J4EyC0I3kShgdX9kdq4+qpxWRhMFnoV/PvNxCaIWxxw5Pe9elAz3Jsij0EqL
 5u6ep/s+1yh2ks4LBubx8AifZ4QQczUMUIGgskGqJfVciYehHHXl9HHvQWgQapO1/bIr0zKQ77c0L
 GgGEW+Eau4qq3v51JfBJK5qG02MDYYRVPVKUolXLQYtL7fLQN8x0Yk2iVSrig+cHiIEZ9uE5lzVXs
 pvAxF91RjbgC6mNCHWzmhIbmY3Ht7AKzT2mNuZamH4rIzCXTfRmGpCitisp6yccluXO3LeWUNZ20h
 ZcenPyQ+B/rCegNu1UOsQsmZIeIwAf+Ftq2kqxPgo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] 9pfs: iounit cleanup
Date: Tue, 28 Sep 2021 13:53:50 +0200
Message-ID: <15120543.8QXPT9IBWO@silver>
In-Reply-To: <cover.1632758315.git.qemu_oss@crudebyte.com>
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 27. September 2021 17:44:59 CEST Christian Schoenebeck wrote:
> Two pure refactoring code cleanup patches regarding iounit calculation, no
> behaviour change.
> 
> Christian Schoenebeck (2):
>   9pfs: deduplicate iounit code
>   9pfs: simplify blksize_to_iounit()
> 
>  hw/9pfs/9p.c | 41 +++++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



