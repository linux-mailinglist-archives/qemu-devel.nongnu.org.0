Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D70292B14
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 18:06:20 +0200 (CEST)
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUXfu-0002WM-T9
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 12:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kUXX6-0005MT-Pz; Mon, 19 Oct 2020 11:57:12 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:39217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kUXWy-0000Rq-LI; Mon, 19 Oct 2020 11:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=cNLd+JfL2FLsCROt1LaDV4KxuAN33oh5yij5FucIgPg=; 
 b=mdb4YWSnF14WjZ4VCIC7oHl/FKTCN/mVVP97KpqgnixFsmrL40rbYNWoJ/piaJRzcwxwQd1BlSqLrF9HCy7P4N+4/p/06i1NynBOfr3Gl+/4GlqEo5utjX/Tjysv03u2+ePfR2aoLFM/1bcJzTd69ByzUa77uSR7Tjm0vRTqz+Ouhk6ZoqBp5bIGQDNUQVdo3jAUAeZmOup5V5DkJdMVliWpEefMVbGgHnHAkOa7cdUFGEg01snF/yVIr7JGiULHNCSsTdqCCfcXnfGA10+yEaMxAhwcxKsD83ge4xS4JipyXJOo2vsRYXPO5rs9Ns2IjVHZooFgksohod1+7C2H/A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kUXWr-000195-6V; Mon, 19 Oct 2020 17:56:57 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kUXWq-0001RO-Qd; Mon, 19 Oct 2020 17:56:56 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: Plans to bring QMP 'x-blockdev-reopen' out of experimental?
In-Reply-To: <20201006091001.GA64583@paraplu>
References: <20201006091001.GA64583@paraplu>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 19 Oct 2020 17:56:56 +0200
Message-ID: <w51mu0ifbuf.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 11:56:57
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 06 Oct 2020 11:10:01 AM CEST, Kashyap Chamarthy wrote:
> Hi, folks
>
> If this was already discussed on the list, please point me to the
> thread.  I took a quick look at my local archives, I didn't find any,
> besides patches to tests.

I think this is the last time that I was discussed:

   https://lists.gnu.org/archive/html/qemu-block/2020-02/msg00558.html

And this one in particular:

   https://lists.gnu.org/archive/html/qemu-block/2020-02/msg00601.html

But Kevin fixed this one month later:

   https://lists.gnu.org/archive/html/qemu-block/2020-03/msg00266.html

Berto

