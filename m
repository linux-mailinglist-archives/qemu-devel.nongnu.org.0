Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76FD1FD1EB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 18:25:02 +0200 (CEST)
Received: from localhost ([::1]:42976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlas1-00007f-Qw
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 12:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trystan@trystan.org>)
 id 1jlaqh-0007gu-Fi
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 12:23:39 -0400
Received: from chocolate.birch.relay.mailchannels.net ([23.83.209.35]:54806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trystan@trystan.org>)
 id 1jlaqe-00025P-OC
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 12:23:39 -0400
X-Sender-Id: a2hosting|x-authuser|trystan@trystan.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id E733148152A;
 Wed, 17 Jun 2020 16:23:31 +0000 (UTC)
Received: from mi3-ss7.a2hosting.com
 (100-96-14-14.trex.outbound.svc.cluster.local [100.96.14.14])
 (Authenticated sender: a2hosting)
 by relay.mailchannels.net (Postfix) with ESMTPA id 98CBA48155F;
 Wed, 17 Jun 2020 16:23:28 +0000 (UTC)
X-Sender-Id: a2hosting|x-authuser|trystan@trystan.org
Received: from mi3-ss7.a2hosting.com (mi3-ss7.a2hosting.com [68.66.200.202])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.8); Wed, 17 Jun 2020 16:23:31 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: a2hosting|x-authuser|trystan@trystan.org
X-MailChannels-Auth-Id: a2hosting
X-Bitter-Fumbling: 7f7f654663ddcb94_1592411011383_245888533
X-MC-Loop-Signature: 1592411011383:1146283653
X-MC-Ingress-Time: 1592411011383
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=trystan.org
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r7dN62I+JWiNYuDdO6Fa9TF2rgSbI30pK3x6+hpubro=; b=fb9j8f/RwoVbI7jz7niMCk2xiA
 JFDnAIQLNjGTHiUGiI4ubAAMQEfSswIqPpbuf/h7lIwJtb6Px3w/wg1ruPPiCNhBTJzZd4OLDLkp+
 9Tu3iQQLvLBNyKYJFndDpqYAfzcythb4B/pJf1vgVNopk+a/0nfWT2DEEuJGcURIAYXZ6rcAeuhqi
 ETUfgkTpIJ4dd+eKWUFE8U8Rhrj/26H7IwgJa4L4qmpY2CSGdrLKzgdpBA40lOUx+z5+jNinrGSoy
 cqxL2hBNEgSCZvpgboC7lnH/6jeKolc8Ord81wsljlecZmz+tYi2QTQmZk9wq8L8yo0HWoZV/DK1i
 UtPqUhgw==;
Received: from 75-172-35-133.tukw.qwest.net ([75.172.35.133]:56676
 helo=[192.168.0.4])
 by mi3-ss7.a2hosting.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <trystan@trystan.org>)
 id 1jlaqU-00057N-Ft; Wed, 17 Jun 2020 12:23:26 -0400
Subject: Re: Accessing the Metal graphics API with OSX as VM client
To: Peter Maydell <peter.maydell@linaro.org>
References: <74a0626c-182c-2a55-2528-9fbcd3085950@trystan.org>
 <CAFEAcA8MXR9wY5MDxxkk62jHVUR8MXeGUMBDB2hwWgo5bs0MfQ@mail.gmail.com>
From: Trystan Larey-Williams <trystan@trystan.org>
Message-ID: <28a290ff-2b2f-0825-8eac-e818678631df@trystan.org>
Date: Wed, 17 Jun 2020 09:23:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8MXR9wY5MDxxkk62jHVUR8MXeGUMBDB2hwWgo5bs0MfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: trystan@trystan.org
Received-SPF: none client-ip=23.83.209.35; envelope-from=trystan@trystan.org;
 helo=chocolate.birch.relay.mailchannels.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 12:23:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the responses on this! That gives me some context to work 
with. I'll likely give 'pass through' a shot (Linux host, OSX guest). I 
folks are curious, I can report the results back.

Cheers,
Trystan

On 6/16/2020 2:08 PM, Peter Maydell wrote:
> On Tue, 16 Jun 2020 at 21:26, Trystan Larey-Williams
> <trystan@trystan.org> wrote:
>> I'm trying to get a sense of where QEMU headed in terms of supporting
>> Apple's Metal API. Apple will likely be removing OpenGL support entirely
>> from OSX, perhaps as early as the next major release of OSX in Sep/Oct.
> QEMU on OSX hosts has somewhere between few and no active developers
> (almost everybody in the upstream community is on a Linux host) so
> the default answer is that we're not headed anywhere. I think that
> this is not going to be a loss of functionality because right now we
> don't support GL acceleration on OSX hosts either (because there's
> no virglrenderer there).
>
> Gerd might know what would be the best approach to virtio-gpu on
> an OSX host if there were developers interested in working on it.
>
>> Information on support for graphics acceleration on an OSX client using
> [side note: not sure what you mean by "client": host, or guest ?]
>
>> Metal instead of OpenGL seems non-existent. From the QEMU documentation
>> I gather there are a few ways to 'pass through' a device natively to the
>> VM. Would this be the only way to currently access Metal on OSX? Has
>> anyone actually tried this?
> Does PCI passthrough work on OSX hosts? My default assumption would be
> "no, it doesn't" -- the way we do passthrough on Linux hosts
> depends on Linux-specific APIs (VFIO). If you meant "device
> passthrough from a Linux host to an OSX guest" there's no reason
> in theory why that shouldn't work, if OSX has drivers for whatever
> the passed-through hardware is. Equally, if there were a
> hypothetical OSX Metal driver for virtio-gpu you could use that.
>
> thanks
> -- PMM

