Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E167AE33D9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 15:21:55 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNd3q-0002A7-N9
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 09:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iNbMg-0005Df-JQ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iNbMf-0001fh-Kx
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:33:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20000
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iNbMe-0001f1-Aa
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571916791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVRFdyt5/c7IungbTgCjZitZqsxXHb/oUL48kOJcfB8=;
 b=Vl4QB4N7ahnF2jNbQ6QqjAJVVcAnCHL8R3xZ6iMHk6N6SsDtz2IE8fpM6chcBXKhuF49ht
 zCzq8gCK80E3yWObO8JkgZeMmDI2KEex9FJlfrkaWf6VVft6e/SnNzt7mWPoI6UMvxNmZ4
 MRFzvq3qGv6ivb2NmdToNqIoaSrtt/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-OSfj15wGPmiJoOjenoGnjQ-1; Thu, 24 Oct 2019 07:33:09 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08C74800D49;
 Thu, 24 Oct 2019 11:33:09 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2F0360BF3;
 Thu, 24 Oct 2019 11:33:07 +0000 (UTC)
Date: Thu, 24 Oct 2019 13:33:06 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: Re: [RFC PATCH 00/18] Add qemu-storage-daemon
Message-ID: <20191024113306.GD6200@linux.fritz.box>
References: <20191017130204.16131-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191017130204.16131-1-kwolf@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OSfj15wGPmiJoOjenoGnjQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org, pkrempa@redhat.com, armbru@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.10.2019 um 15:01 hat Kevin Wolf geschrieben:
> This series adds a new tool 'qemu-storage-daemon', which can be used to
> export and perform operations on block devices. There is some overlap
> between qemu-img/qemu-nbd and the new qemu-storage-daemon, but there are
> a few important differences:
> [...]

Ping?


