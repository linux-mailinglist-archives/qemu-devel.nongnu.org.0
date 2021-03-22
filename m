Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05723444C1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:06:05 +0100 (CET)
Received: from localhost ([::1]:54660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKFw-00046V-TA
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1lOID7-0005CY-8c
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:55:01 -0400
Received: from mail.xenproject.org ([104.130.215.37]:59506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1lOID3-0004o8-Sh
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=uNuIsyIHqsCzcQIGDq4EK6p24dpvznEnAGEfhhC+gf0=; b=GHP8XnHIhi3GQHeAWUt6NOUXeo
 CykpFzDEv0WJyE3e7vGA31DDTs9Z80mVfqNAalH4OsciTThFl6larKNT2C0FTKhgfonV0Y3R7rHKn
 fk7LQq/Gp0neaw5a2UFmXBvYPmdp/G4GCXZzcMaFPvX8MPUtz0w5Lw/kz3HUxayvW390=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOID2-0001ac-4P
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:54:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOID2-00049h-3V
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:54:56 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOICx-00088c-Fw; Mon, 22 Mar 2021 10:54:51 +0000
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24664.30587.324087.508209@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 10:54:51 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/13] misc patches removing deprecated features
In-Reply-To: <CAFEAcA-z2Yw+9wxHSYsq3q_n9fQUgfmoEg4C1u=89cr+BWgOeQ@mail.gmail.com>
References: <20210318092512.250725-1-berrange@redhat.com>
 <CAFEAcA-z2Yw+9wxHSYsq3q_n9fQUgfmoEg4C1u=89cr+BWgOeQ@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Received-SPF: pass client-ip=104.130.215.37; envelope-from=iwj@xenproject.org;
 helo=mail.xenproject.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Mar 2021 09:01:22 -0400
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "Daniel P. =?iso-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell writes ("Re: [PULL v2 00/13] misc patches removing deprecated features"):
> On Thu, 18 Mar 2021 at 09:30, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > ----------------------------------------------------------------
> > Remove many old deprecated features
> >
> > The following features have been deprecated for well over the 2
> > release cycle we promise
> >
> >   ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
> >   ``-vnc acl`` (since 4.0.0)
> >   ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
> >   ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
> >   ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
> >   ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
> >   ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
> >   ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
> >   ``query-cpus`` (since 2.12.0)
> >   ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
> >   ``query-events`` (since 4.0)
> >   chardev client socket with ``wait`` option (since 4.0)
> >   ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
> >   ``ide-drive`` (since 4.2)
> >   ``scsi-disk`` (since 4.2)
> 
> Just FYI, it turns out that removing 'query-cpus' has broken Xen,
> whose libxl control library is still using it:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-03/msg01178.html
> 
> This suggests we should probably try to coordinate a bit better
> with Xen as one of our downstream QMP users.
> 
> Am I right in thinking that QEMU now has an option that Xen
> could turn on in their CI for "make attempts to use deprecated
> features fail" so they could catch them earlier in the
> deprecate-and-delete cycle?

That would be really great for us.

Thanks,
Ian.

