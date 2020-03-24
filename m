Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5E191254
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 15:01:41 +0100 (CET)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGk7g-0006i5-9q
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 10:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jGk6D-0005H1-Pq
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:00:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jGk6C-00026G-NM
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:00:09 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:28781)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jGk6C-00020g-Ei
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:00:08 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 70635418B4;
 Tue, 24 Mar 2020 15:00:04 +0100 (CET)
Date: Tue, 24 Mar 2020 15:00:02 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: John Snow <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Message-ID: <540921286.62.1585058402983@webmail.proxmox.com>
In-Reply-To: <446da3ef-3141-4c77-cb30-352a16a4e9be@redhat.com>
References: <2007060575.48.1585048408879@webmail.proxmox.com>
 <1512602350.59.1585056617632@webmail.proxmox.com>
 <1806708761.60.1585056799652@webmail.proxmox.com>
 <446da3ef-3141-4c77-cb30-352a16a4e9be@redhat.com>
Subject: Re: backup transaction with io-thread core dumps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev22
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> What version of QEMU are you running? Sergio contributed a lot of AIO
> context (and iothread) fixes this release; this looks (at a glance) to
> be similar and related.

I test with latest code from git

commit 09a98dd988c715157c0b80af16fa5baa80101eed 
Merge: f1e748d279 1583794b9b
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Tue Mar 24 09:50:46 2020 +0000

    Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200324' into staging
    
    ppc patch queue for 2020-03-24


