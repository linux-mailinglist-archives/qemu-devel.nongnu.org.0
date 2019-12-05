Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335A6113F6A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 11:33:40 +0100 (CET)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icoS3-00007k-7k
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 05:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1icoQa-00087T-Ns
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:32:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1icoQZ-0004DL-PC
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:32:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55791
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1icoQZ-000497-Iu
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 05:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575541926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvCyyu9hijmXIqddytYahvYlqV6K45dWCoKSUfD3RiM=;
 b=ha8UYS3qbAv9wmvKWjD5N3+tKkxR6tV2h1/Z5gnuIDbm+zywieAML4bpSFvpydzd/Wyr37
 IbqAIsFYvwTLNE40gvwYqTBFKulW+HE7gp5drJ1De4ClXMp4v63vlsj+ASRRtAXNfctb9h
 zIG2EjG3aobIT3ZmYVULadWEvQOhPGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-f23irBDbPcSfe_YHwtBB8A-1; Thu, 05 Dec 2019 05:32:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E40CDC20;
 Thu,  5 Dec 2019 10:32:02 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA539600F2;
 Thu,  5 Dec 2019 10:32:01 +0000 (UTC)
Date: Thu, 5 Dec 2019 10:31:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lin Ma <LMa@suse.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiDnrZTlpI06IFtRZW11?=
 =?utf-8?Q?-devel=5D_migrate=5Fset=5Fspee?= =?utf-8?Q?d?= has no effect if
 the guest is using hugepages.
Message-ID: <20191205103159.GC2824@work-vm>
References: <BY5PR18MB3313E1E22A22D236D4C2680DC5F30@BY5PR18MB3313.namprd18.prod.outlook.com>
 <20190711102410.GH3971@work-vm>
 <BY5PR18MB331347C441DA068E32BFDE53C5F20@BY5PR18MB3313.namprd18.prod.outlook.com>
 <20190712123400.GJ2730@work-vm>
 <BY5PR18MB3313850D2845C27026891170C5CF0@BY5PR18MB3313.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR18MB3313850D2845C27026891170C5CF0@BY5PR18MB3313.namprd18.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: f23irBDbPcSfe_YHwtBB8A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Lin,
  I've just posted 'migration: Rate limit inside host pages'; please let
me know if it helps for you.

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


