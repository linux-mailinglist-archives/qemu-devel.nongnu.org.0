Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5462CEF58
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:05:35 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBiI-0008AQ-A2
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1klBgc-0006vj-6N; Fri, 04 Dec 2020 09:03:50 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1klBgW-00051n-Jg; Fri, 04 Dec 2020 09:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=tTxfBfqvVRhAdkAbmWzuD3N7rjwC85G33Az6tJjcjhE=; 
 b=crBZTSo4e/Ci4tu1tSlNDwMflPiEm4va2LTFteGnIA9ZHsNbL2QGZcSAy13a5MCHDiUmdXxDNh743QqgJxlKalXGh7hTUEH90B6pnS3/J7rvwRzfloXDHk4N0v43yxbIXW0PF12r/vEib5GCBdy+usnn3ad+UBL2GLnUL20N9rjX4Q9jGq9kiRna4ONKF3vr4Z8rhKSnBombTbmln/rPHwrJV/syHb9FYZNljJZiftfWsEkasgHF+P0QQJfwHHDV+HE4Q+sGIMfKKH17yS0Hq5Qo4QyHK7TlySr9tBonYBZc3K/lVxfQi58p+XWl+XZBGUWvOufZRTHphBPGlF2otQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1klBg8-0004zA-EE; Fri, 04 Dec 2020 15:03:20 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1klBg8-0002iC-46; Fri, 04 Dec 2020 15:03:20 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Plans to bring QMP 'x-blockdev-reopen' out of experimental?
In-Reply-To: <20201202175121.GI16765@merkur.fritz.box>
References: <20201006091001.GA64583@paraplu>
 <w51mu0ifbuf.fsf@maestria.local.igalia.com>
 <w51k0vmf9k3.fsf@maestria.local.igalia.com>
 <20201020082333.GB4452@merkur.fritz.box>
 <w51blfctcfb.fsf@maestria.local.igalia.com>
 <20201202162808.GG16765@merkur.fritz.box>
 <w518sagtb4j.fsf@maestria.local.igalia.com>
 <20201202175121.GI16765@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 04 Dec 2020 15:03:20 +0100
Message-ID: <w515z5hr7mf.fsf@maestria.local.igalia.com>
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
Cc: armbru@redhat.com, mreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 02 Dec 2020 06:51:21 PM CET, Kevin Wolf wrote:
>> I had tried this already and it does work when inserting the filter (we
>> know that 'hd0-file' is about to be detached from the parent so we can
>> put it in the list) but I don't think it's so easy if we want to remove
>> the filter, i.e.
>> 
>>    hd0 -> throttle -> hd0-file     ======>     hd0 -> hd0-file
>> 
>> In this case we get a similar error, we want to make hd0-file a child of
>> hd0 but it is being used by the throttle filter.
>> 
>> Telling bdrv_check_update_perm() to ignore hd0's current child
>> (throttle) won't solve the problem.
>
> Isn't this the very same case as removing e.g. a mirror filter from the
> chain? I'm sure we have already solved this somewhere.
>
> Hm, no, it might actually be different in that the throttle node
> survives this, so we do have to check that the resulting graph is
> valid. Do we need a combined operation to remove the throttle node
> from the graph and immediately delete it?

What kind of API are you thinking about?

One basic problem with inserting filter nodes (as opposed to replacing a
node with a different one) is that we have a protocol BDS used twice at
the same time, e.g.

  hd0 -> hd0-file
  throttle -> hd0-file

And then we would reopen hd0 and do the change, but ideally one would
prefer to avoid having hd0-file twice.

There's also the x-blockdev-change function (currently for Quorum only),
I wonder if it could be a better fit for this use case.

Berto

