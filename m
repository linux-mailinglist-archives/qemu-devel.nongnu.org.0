Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9642277
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 12:31:27 +0200 (CEST)
Received: from localhost ([::1]:58576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb0XO-0005Wj-Fv
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 06:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54783)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hb0Vo-0004rU-Pb
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:29:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hb0Vn-00054U-Ty
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:29:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hb0Vn-00054M-Ol
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:29:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8E068830E;
 Wed, 12 Jun 2019 10:29:36 +0000 (UTC)
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3731171F7;
 Wed, 12 Jun 2019 10:29:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
In-Reply-To: <20190611175926.GJ2777@work-vm> (David Alan Gilbert's message of
 "Tue, 11 Jun 2019 18:59:26 +0100")
References: <20190610030852.16039-1-richardw.yang@linux.intel.com>
 <20190610030852.16039-3-richardw.yang@linux.intel.com>
 <20190611175926.GJ2777@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 12 Jun 2019 12:29:27 +0200
Message-ID: <87o933m708.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 12 Jun 2019 10:29:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] migration/xbzrle: make
 xbzrle_encode_buffer little easier to read
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
Reply-To: quintela@redhat.com
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Wei Yang (richardw.yang@linux.intel.com) wrote:
>> The encoding process could be described below:
>> 
>>     for [content]
>>         get length of a run
>>         encode this run
>> 
>> By refactoring the code with this logic, it maybe a little easier to
>> understand.
>> 
>
> Are lines like this really making it easier to read?
>
> Juan: Opinion?

Code is easier to understand .....

For values that I understand the code.  I need to take a big breath and
will take a deep look at it and see if it really does the same.

Later, Juan.

