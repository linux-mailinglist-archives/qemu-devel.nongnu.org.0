Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A89126DEF2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 17:00:28 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIvOd-0008K7-Bx
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 11:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kIvEx-0008Dj-JP; Thu, 17 Sep 2020 10:50:27 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kIvEv-0007bN-6j; Thu, 17 Sep 2020 10:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=tL0KuXQh+yRURxxVyWcgqqrm8m0C+PMzf61vC6gHl2E=; 
 b=aagxnWX904IWpe4Ljtj2fzJxe9yUfuxn2cYEsPT+krrq07fhFTEjL/jUzpqS3C+jIvdRp2s8XZsgO8mW04M9/XxBGmLSR3vjDiuLYLjNFzV6UqSYz0zryDMyMKAmpqzipspOODePrvif90Lqd/u9qylGHwqaU3c0Tt0HzMwHmXRtmytvoum2wEhSqKk27O1Qaii+daDr+4q0Rg7fdbwvcGF8aTv6aED3zFs8tjOOy83oxILOEdZnF26PMWVwc4BLkxXLw+Mg6Kcv10yEsXMHFn72jO7k4Ds0nNDAWpaNaazxkr/+O1I399K1jIpWZnKthZ1RyrOABLW+aMyWMfpbiw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kIvEt-0000nw-33; Thu, 17 Sep 2020 16:50:23 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kIvEs-0002SJ-Mq; Thu, 17 Sep 2020 16:50:22 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 11/14] block/qcow2-bitmap: return startus from
 qcow2_store_persistent_dirty_bitmaps
In-Reply-To: <20200909185930.26524-12-vsementsov@virtuozzo.com>
References: <20200909185930.26524-1-vsementsov@virtuozzo.com>
 <20200909185930.26524-12-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 17 Sep 2020 16:50:22 +0200
Message-ID: <w51pn6kxxsh.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 09:56:37
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, groug@kaod.org, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 09 Sep 2020 08:59:27 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> It's better to return status together with setting errp. It makes
> possible to avoid error propagation.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [...]
> -void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
> +bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>                                            bool release_stored, Error **errp)
>  {
> +    ERRP_GUARD();

This needs an explanation.

Berto

