Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D11D64F1D8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6GRU-0001XS-BF; Fri, 16 Dec 2022 14:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6GRQ-0001W4-NC; Fri, 16 Dec 2022 14:32:21 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6GRN-0004Ni-CT; Fri, 16 Dec 2022 14:32:20 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 073B25EA58;
 Fri, 16 Dec 2022 22:32:04 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58d::1:2b] (unknown
 [2a02:6b8:b081:b58d::1:2b])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 1Wn0sG0OFmI1-x5iIeecG; Fri, 16 Dec 2022 22:32:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1671219123; bh=sBH5RyK5jRzzkODuNKwS8cNYpgy5t+IWUUiYeDwX+S0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=v0LjEYJWoV0ykv+nrn6eUTnG2NsFsCguHBteIQS7J9swqNb8sRjfrdzlFuAULpBUM
 cIGpmUWZ+WzWQ5QQIBOi47799KabZ4729QekCn4Q6w5b6vePlk1fc2Wr9J79vmcaXj
 5YQC5+qAbb5LNcbagHkJkc6BCu9AaiyW2aFJzOtY=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
Date: Fri, 16 Dec 2022 22:32:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/6] spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS
 length
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, libguestfs@redhat.com
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221114224655.2186173-2-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/15/22 01:46, Eric Blake wrote:
> The spec was silent on how many extents a server could reply with.
> However, both qemu and nbdkit (the two server implementations known to
> have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
> cap, and will truncate the amount of extents in a reply to avoid
> sending a client a reply so large that the client would treat it as a
> denial of service attack.  Clients currently have no way during
> negotiation to request such a limit of the server, so it is easier to
> just document this as a restriction on viable server implementations
> than to add yet another round of handshaking.  Also, mentioning
> amplification effects is worthwhile.
> 
> When qemu first implemented NBD_CMD_BLOCK_STATUS for the
> base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
> as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
> responded with more than one extent.  Later, when adding its
> qemu:dirty-bitmap:XYZ context extension (qemu commit 3d068aff16, Jun
> 2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
> applied to base:allocation once qemu started sending multiple extents
> for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
> extents are never smaller than 512 bytes (other than an exception at
> the end of a file whose size is not aligned to 512), but even so, a
> request for just under 4G of block status could produce 8M extents,
> resulting in a reply of 64M if it were not capped smaller.
> 
> When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
> Mar 2019), it did not impose any restriction on the number of extents
> in the reply chunk.  But because it allows extents as small as one
> byte, it is easy to write a server that can amplify a client's request
> of status over 1M of the image into a reply over 8M in size, and it
> was very easy to demonstrate that a hard cap was needed to avoid
> crashing clients or otherwise killing the connection (a bad server
> impacting the client negatively).  So nbdkit enforced a bound of 1M
> extents (8M+4 bytes, nbdkit commit 6e0dc839ea, Jun 2019).  [Unrelated
> to this patch, but worth noting for history: nbdkit's situation also
> has to deal with the fact that it is designed for plugin server
> implementations; and not capping the number of extents in a reply also
> posed a problem to nbdkit as the server, where a plugin could exhaust
> memory and kill the server, unrelated to any size constraints enforced
> by a client.]
> 
> Since the limit chosen by these two implementations is different, and
> since nbdkit has versions that were not limited, add this as a SHOULD
> NOT instead of MUST NOT constraint on servers implementing block
> status.  It does not matter that qemu picked a smaller limit that it
> truncates to, since we have already documented that the server may
> truncate for other reasons (such as it being inefficient to collect
> that many extents in the first place).  But documenting the limit now
> becomes even more important in the face of a future addition of 64-bit
> requests, where a client's request is no longer bounded to 4G and
> could thereby produce even more than 8M extents for the corner case
> when every 512 bytes is a new extent, if it were not for this
> recommendation.

s-o-b line missed.


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


