Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5673A2CC298
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 17:42:23 +0100 (CET)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVCv-0000RJ-Nz
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 11:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kkVAx-0007yG-Rr; Wed, 02 Dec 2020 11:40:19 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kkVAv-0007p5-85; Wed, 02 Dec 2020 11:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=jbvQ31MtiR2YaPAoLnp6Xr1mro4pcPMEoec+jonbtDs=; 
 b=mdwtIejjeOU9sehoROhcPOFBbog84kRkNVeBaJLOPdmQKPlxVS/5nzGACUkEivWF1lnFLZq4IW5Wovbc6AxnkVtWXdlnJQNVMyjVSHANr09NVoB7mx5R5XW2yW+cis16AzMlwYLAwZrk3P+sC4M3OjatJLZs8yuPWo+WemMygT8sBvd406bZxCTQ999N1ZtjEQ/Za/lRYNvrpbQsloFvabfnYLlDp1wxulxakILOIh6I/+Fe66r9wqd2nbHIetcNfdPGq5SCCZs9hANyjv/aU2DVSZh3nu5jgXi70v6A4wOi6rIjsIjxSkrHMGraUqxweuWWA89AxE9pNj1PxsWlUw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kkVAq-000556-TF; Wed, 02 Dec 2020 17:40:12 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kkVAq-0000kg-Jo; Wed, 02 Dec 2020 17:40:12 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Plans to bring QMP 'x-blockdev-reopen' out of experimental?
In-Reply-To: <20201202162808.GG16765@merkur.fritz.box>
References: <20201006091001.GA64583@paraplu>
 <w51mu0ifbuf.fsf@maestria.local.igalia.com>
 <w51k0vmf9k3.fsf@maestria.local.igalia.com>
 <20201020082333.GB4452@merkur.fritz.box>
 <w51blfctcfb.fsf@maestria.local.igalia.com>
 <20201202162808.GG16765@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 02 Dec 2020 17:40:12 +0100
Message-ID: <w518sagtb4j.fsf@maestria.local.igalia.com>
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
Cc: mreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 02 Dec 2020 05:28:08 PM CET, Kevin Wolf wrote:

>> So x-blockdev-reopen sees that we want to replace the current
>> bs->file ("hd0-file") with a new one ("throttle0"). The problem here
>> is that throttle0 has hd0-file as its child, so when we check the
>> permissions on throttle0 (and its children) we get that hd0-file
>> refuses because it's already being used (although in in the process
>> of being replaced) by hd0:
>> 
>> "Conflicts with use by hd0 as 'file', which does not allow 'write, resize' on hd0-file"
>> 
> This kind of situation isn't new, I believe some of the existing graph
> changes (iirc in the context of block jobs) can cause the same problem.
>
> This is essentially why some functions in the permission system take a
> GSList *ignore_children. So I believe the right thing to do here is
> telling the permission system that it needs to check the situation
> without the BdrvChild that links hd0 with hd0-file.

I had tried this already and it does work when inserting the filter (we
know that 'hd0-file' is about to be detached from the parent so we can
put it in the list) but I don't think it's so easy if we want to remove
the filter, i.e.

   hd0 -> throttle -> hd0-file     ======>     hd0 -> hd0-file

In this case we get a similar error, we want to make hd0-file a child of
hd0 but it is being used by the throttle filter.

Telling bdrv_check_update_perm() to ignore hd0's current child
(throttle) won't solve the problem.

> I don't know the exact stack trace of your failure, so maybe this
> parameter isn't available yet in the place where you need it, but in
> the core functions it exists.

This is in bdrv_reopen_multiple(), in the same place where we are
currently checking the permissions of the new backing file.

Berto

