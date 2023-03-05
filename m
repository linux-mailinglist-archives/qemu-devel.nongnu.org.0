Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA26AAE9A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 09:43:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYjwU-0007ZQ-Bh; Sun, 05 Mar 2023 03:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pYjwR-0007Yg-PU; Sun, 05 Mar 2023 03:42:04 -0500
Received: from lounge.grep.be ([2a01:4f8:200:91e8::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pYjwP-0008Sb-JK; Sun, 05 Mar 2023 03:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uch1Db0E384wjqhT0+t9Pq7ufXw2sFMAY+qAv5fFn0A=; b=pm68ZAUfkPLzdzF8liz+a84QzS
 56X7qeWZKrf9yY9x2hT0766ps8lv2cNYcN6HZFMkaSGu1B6oKGolHdd9idbC/5/o9XzJT3MtmJz5n
 UgFeVyla4vLHVTXE9MG6qHbANUMvxeICAZZuVV7v/j0P6BGXtRUf6cHGzgo7ZaAnO9saEI4QOuNsO
 uNAPCv7ocvBZmRiwg3Ega7OmM1CGr//hEE7QoWpEzYozpfxq5Qv+mbW4plQ/PSr2JUGVVmlbrsq5J
 X5MiHgUGcylRCOusFnGbsiF1/LIR23C8f6taER85wjjkCeT5+bs2frmBBpteAmPPlwLD7Quym+xr4
 3Sj438ww==;
Received: from [102.39.141.34] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1pYjw8-0003sk-3M; Sun, 05 Mar 2023 09:41:44 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
 (envelope-from <w@uter.be>) id 1pYjw1-000Rlk-06;
 Sun, 05 Mar 2023 10:41:37 +0200
Date: Sun, 5 Mar 2023 10:41:37 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
 <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
 <20230303221740.pdwc6jtozstntih7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303221740.pdwc6jtozstntih7@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
Received-SPF: pass client-ip=2a01:4f8:200:91e8::2; envelope-from=w@uter.be;
 helo=lounge.grep.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Mar 03, 2023 at 04:17:40PM -0600, Eric Blake wrote:
> On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > s-o-b line missed.
> 
> I'm not sure if the NBD project has a strict policy on including one,
> but I don't mind adding it.

I've never required it, mostly because it's something that I myself
always forget, too, so, *shrug*.

(if there were a way in git to make it add that automatically, that
would help; I've looked but haven't found it)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

