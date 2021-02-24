Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B23246FB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:40:13 +0100 (CET)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2pI-0000sU-7G
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1lF2nf-0000J9-0r
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:38:31 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:55302)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1lF2nb-0002Hl-O9
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:38:30 -0500
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id DE4BE4B82E;
 Thu, 25 Feb 2021 09:38:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1614206304;
 bh=ZqV5+kJyC7yKybp2e+43sLeqs220n8flV+NQMbAYmN4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UnBNdusprIzDFdnusxDlOghzODhTbAkSuosxWwUjGP2q2tvR2oCjKJW/z5BUwYSev
 Mym4akQI5WQ0+Q/AL+7QQ0iSnSUE1oGBzc6oLBnbQF+2buYTWNiFApUBMOnvD3qr7w
 sNZCxoikI/TaEFCrQFvykJc+PVaa+IQEbdBqxunU=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id CB26B8C854;
 Thu, 25 Feb 2021 09:38:24 +1100 (AEDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 25 Feb 2021 09:38:24 +1100
From: Geoffrey McRae <geoff@hostfission.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Jos=C3=A9_Pekkarinen?=
 <koalinux@gmail.com>, kraxel@redhat.com
Subject: Re: [PATCH v2] Autoconnect jack ports by default
In-Reply-To: <31652865.Htn8XJslzA@silver>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <3407243.daszWApDLn@silver>
 <5694e258e36c6623aae5465aafeec951@hostfission.com>
 <31652865.Htn8XJslzA@silver>
Message-ID: <ab566e57c5ec57e857834d7a70d4dfde@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.3.15
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

While I get where you're coming from, those using QEMU with Jack are 
already advanced users that are used to reading technical documentation. 
Having our one client do something that is unexpected/different would 
not only confuse existing Jack users but also anyone following any 
guides/documentation on how to use a generic jack client. IMO the better 
solution here is simply better documentation, perhaps even a known 
working sample setup.

On 2021-02-25 09:33, Christian Schoenebeck wrote:
> On Mittwoch, 24. Februar 2021 23:04:47 CET Geoffrey McRae wrote:
>> This goes against how all standard jack clients work, a new jack 
>> client
>> should not auto-connect at all unless explicitly configured to as if
>> there is an existing audio diagram configured (which is 99% of the 
>> time)
>> it will cause unexpected/undesired behavior.
>> 
>> Jack is not supposed to be an 'automatic' system, it's the
>> responsibility of the patch bay software to route connections.
>> 
>> The auto-connect feature exists to allow the jack audiodev to 
>> re-connect
>> a broken connection when the jack device restarts/reconnects.
> 
> Well, that was also my idea first, and I would agree with you in case 
> of a
> regular music app of course, but then I thought QEMU is probably not an
> average JACK client, and it simply lowers the entry level for new users 
> who
> probably just want to output to system out anyway.
> 
> I mean, are you piping QEMU into Ardour or something Geoffrey?
> 
> This could still be overridden by passing a bogus pattern with argument
> "connect-ports" for people who prefer the patchbay approach in the end.

Sorry but this is a kludge to reverse another kludge, I really don't 
think this is a good way to go.

> 
> So I would vote for the "make it easy for newbies" approach in this 
> case, but
> I leave that up to you and Gerd to decide. :)
> 
> Best regards,
> Christian Schoenebeck

