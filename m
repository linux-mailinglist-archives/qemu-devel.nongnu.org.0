Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CA31F995
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:54:22 +0100 (CET)
Received: from localhost ([::1]:32824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5Ib-0000Hr-C2
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lD5A5-0001lS-Vo; Fri, 19 Feb 2021 07:45:35 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lD5A3-00026X-AV; Fri, 19 Feb 2021 07:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=kRa6LCd0eqFl/58S4asQwW2sm8LalNBWsUMX+6VAteo=; 
 b=nlyaDNJHEYn9UmxoOMCKsHt+kkUdmXjW90FGyRgqboGy5iDMGNlTiEYravWjK5hNWGDVHa5Uj/AoB8aJDZF8jDLDEX+XYTw716/BPb0OWAL0s9vFlhw6nbz/J1CA/TVQUM8AXZW8Y3tjoY/dlfzOFX2bXxc3IH9A/j8mUXuZlenBPboHveFcjqARMuW9UAWbqNX+PbkI5jlU1p0MRw4d+cnEjGqXD0pJsxWNb4teKnd6VABymaIIw7ImTHxFiMJI0MvfYU9cxwl7fGrhuBPq44oBmxrekQITVC6ZjMIEcqmhpBXYCzW4ph7z8YjLq/dvcmMrrz1FoQSosmmB/bRIOQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lD59x-0007IV-Tj; Fri, 19 Feb 2021 13:45:25 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lD59x-00072x-Ip; Fri, 19 Feb 2021 13:45:25 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] iotests: Drop deprecated 'props' from object-add
In-Reply-To: <20210219122149.GC5750@merkur.fritz.box>
References: <20210216171653.6543-1-berto@igalia.com>
 <20210219122149.GC5750@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 19 Feb 2021 13:45:25 +0100
Message-ID: <w51pn0wql96.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 19 Feb 2021 01:21:49 PM CET, Kevin Wolf <kwolf@redhat.com> wrote:
>>  log(vm.qmp('object-add', qom_type='throttle-group', id='tg0',
>> -           props={ 'x-bps-total': size }))
>> +           x_bps_total=size))
>
> x-bps-total isn't a stable interface, I'd prefer to use limits.
>
> My patch from November [1] had this:

Do you want me to resend mine, or wait for yours, or what then? :)

Berto

