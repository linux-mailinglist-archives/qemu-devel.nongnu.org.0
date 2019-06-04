Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B210E34C1A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 17:23:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYBHi-0003s6-9W
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 11:23:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1hYBGl-0003a0-G4
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 11:22:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1hYBGk-0002DY-Lw
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 11:22:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>) id 1hYBGi-0001sE-OE
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 11:22:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55B16B2DC5
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 15:22:09 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C01C85B684;
	Tue,  4 Jun 2019 15:22:07 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190604151251.9903-1-armbru@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <3af58a99-b12e-c36f-4832-1c288890b64c@redhat.com>
Date: Tue, 4 Jun 2019 17:22:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604151251.9903-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 04 Jun 2019 15:22:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] vl: Fix -drive / -blockdev persistent
 reservation management
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/19 5:12 PM, Markus Armbruster wrote:
> This is a minimal regression fix.  There's more work to do nearby.
> Left for another day.
> 
> Markus Armbruster (2):
>    vl: Fix -drive / -blockdev persistent reservation management
>    vl: Document why objects are delayed
> 
>   vl.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Thanks for fixing this.

Michal

