Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC0B156C41
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Feb 2020 20:35:35 +0100 (CET)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0sMg-00028u-Ew
	for lists+qemu-devel@lfdr.de; Sun, 09 Feb 2020 14:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j0sLq-0001Pt-0g
 for qemu-devel@nongnu.org; Sun, 09 Feb 2020 14:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j0sLp-0003pl-4q
 for qemu-devel@nongnu.org; Sun, 09 Feb 2020 14:34:41 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:45684)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j0sLo-0003oA-SY; Sun, 09 Feb 2020 14:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=zB5aCYFbKqcZYbRYRWyPOQKnIMPCBS+vH5ODMiX2uZk=; 
 b=ILKIitPdhmarbnbwcAJ4ht593o/NHHK0XtpuyEqeaDG7zQXzbgWysIk7I+NxL7CagIgjkj2klg2TNQ/z+LY3pFNYOxOxZyPk1O157i1hOLJ+0GQu0tSmUWGbXP2qGiLKbG/rqXJrc5z+WKZm0oZ+PfIMFwWQXXTh7ex+VshR0vXLR7ZbEd+k3sedzuVcdUgmPwdzgIE8Nuqe2W5AePGn02GNRBz6z1WMy4qmJoS1ChPkp5xNDkgOEYkS49YHf8mcijlyULhoHudk9aRlU87yuR3d/ggHE8eF33+I4vu97aX0naAZ4zn5B095UEGt1hFDKvkWrMFIEMFmItA3Zyef1g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j0sLm-0003Nl-VV; Sun, 09 Feb 2020 20:34:39 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j0sLm-0007Em-KO; Sun, 09 Feb 2020 20:34:38 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/17] qcow2: Comment typo fixes
In-Reply-To: <20200131174436.2961874-2-eblake@redhat.com>
References: <20200131174436.2961874-1-eblake@redhat.com>
 <20200131174436.2961874-2-eblake@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Sun, 09 Feb 2020 20:34:38 +0100
Message-ID: <w51r1z38shd.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: david.edmondson@oracle.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 31 Jan 2020 06:44:20 PM CET, Eric Blake wrote:
> Various trivial typos noticed while working on this file.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

