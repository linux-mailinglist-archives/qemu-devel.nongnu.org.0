Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED142E7D8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 00:12:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW6o9-0006Pi-Ag
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 18:12:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hW6mC-0005IB-SY
	for qemu-devel@nongnu.org; Wed, 29 May 2019 18:10:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hW6m3-0000mB-O0
	for qemu-devel@nongnu.org; Wed, 29 May 2019 18:10:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hW6lt-0000bE-W4; Wed, 29 May 2019 18:10:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CE46308A104;
	Wed, 29 May 2019 22:09:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 107C160C61;
	Wed, 29 May 2019 22:09:46 +0000 (UTC)
Date: Thu, 30 May 2019 00:09:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190529220945.GB3471@localhost.localdomain>
References: <20190517144232.18965-1-kwolf@redhat.com>
	<20190517144232.18965-3-kwolf@redhat.com>
	<87y32w6kws.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y32w6kws.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 29 May 2019 22:09:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/6] tests/qapi-schema: Test for good
 feature lists in structs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pkrempa@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.05.2019 um 15:29 hat Markus Armbruster geschrieben:
> Let's add
> 
>    { 'command': 'test-features',
>      'data': { 'fs0': 'FeatureStruct0',
>                'fs1': 'FeatureStruct1',
>                'fs2': 'FeatureStruct2',
>                'fs3': 'FeatureStruct3',
>                'cfs1': 'CondFeatureStruct1',
>                'cfs2': 'CondFeatureStruct2',
>                'cfs3': 'CondFeatureStruct3' } }
> 
> because without it, the feature test cases won't generate introspection
> code.

Of course, like everything else you requested, I'll just do this to get
the series off my table, but I'm still curious: Where would
introspection code ever be generated for the test cases? I saw neither
test code that generates the source files nor reference output that it
would be compared against.

Kevin

