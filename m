Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DD42ED0F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:03:35 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJ7m-0005gH-So
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mbIO3-0002x3-Pw
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:16:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mbIO1-0006mk-Lb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:16:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 13E8C1FD4E;
 Fri, 15 Oct 2021 08:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634285776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUlAPJRlIBOIy+sPogf7Is8lKcj/8pgyxfCN9dgKA/Q=;
 b=u5aJxvD2Z6p3jN+iUfSomoU4nRLc0BN/rFdrboGx7MLFR7tbNojn86R5WshUI0NP+9q3FQ
 wGZaOFag4Bo5Sx1DNz3xHwOhpIxQRETxZVlSosg9dE0qj/BpYZvx9INIR4tlBj6ufeGBHh
 G3y2Feir11w7dIXZ5wZ58vt10trwao8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634285776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUlAPJRlIBOIy+sPogf7Is8lKcj/8pgyxfCN9dgKA/Q=;
 b=LbjWIDtd4f9o0W6403w8UTT0Xf9HxWRon2hthsDW90KEOFkQ0zYBuEx3tA1DKdeHgToVmJ
 EFjjQNLyaxi9hDCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07F4313A9C;
 Fri, 15 Oct 2021 08:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5gewAdA4aWEcBAAAMHmgww
 (envelope-from <lma@suse.de>); Fri, 15 Oct 2021 08:16:16 +0000
MIME-Version: 1.0
Date: Fri, 15 Oct 2021 16:16:15 +0800
From: lma <lma@suse.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/3] Postcopy migration: Add userfaultfd- user-mode-only
 capability
In-Reply-To: <YWkb2rrrkMLC8BwM@t490s>
References: <20211014091551.15201-1-lma@suse.com> <YWjAqX13PYhBgbVh@t490s>
 <7c0161fab24b06fa249061780a7f30d4@suse.de> <YWkb2rrrkMLC8BwM@t490s>
User-Agent: Roundcube Webmail
Message-ID: <b17650b7db7bece420f8f1ad2aaa651a@suse.de>
X-Sender: lma@suse.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lma@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021-10-15 14:12，Peter Xu 写道：
> On Fri, Oct 15, 2021 at 01:38:06PM +0800, lma wrote:
>> 在 2021-10-15 07:43，Peter Xu 写道：
>> > On Thu, Oct 14, 2021 at 05:15:48PM +0800, Lin Ma wrote:
>> > > Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE
>> > > capability)
>> > > must pass UFFD_USER_MODE_ONLY to userfaultd in case
>> > > unprivileged_userfaultfd
>> > > sysctl knob is 0.
>> > > Please refer to https://lwn.net/Articles/819834/ and the kernel
>> > > commits:
>> > > 37cd0575 userfaultfd: add UFFD_USER_MODE_ONLY
>> > > d0d4730a userfaultfd: add user-mode only option to
>> > > unprivileged_userfaultfd sysctl knob
>> > >
>> > > This patch set adds a migration capability to pass UFFD_USER_MODE_ONLY
>> > > for postcopy migration.
>> >
>> > Then it's at least no KVM, no vhost, am I right?  Could I ask is there a
>> > real
>> > user behind this?  Thanks,
>> 
>> Well, The "user-mode-only" has nothing to do with qemu's user-mode
>> emulation.
> 
> I didn't follow why you thought my question was about "user-mode 
> emulation"..
Sorry about the misunderstanding.

> To ask in another way: after this new cap set, qemu will get a SIGBUS 
> and VM
> will crash during postcopy migrating as long as either KVM or 
> vhost-kernel
> faulted on any of the missing pages, am I right?

Oops...Yes, you're right. It indeed casues qemu crash on destination due 
to
fault on missing pages.
This patch set and my thought about introducing this cap to qemu are 
wrong.

Thanks,
Lin

