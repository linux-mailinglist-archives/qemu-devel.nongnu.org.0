Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B01666C6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 20:03:01 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4r6C-0008Qv-Ag
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 14:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1j4r52-0007Xa-OG
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 14:01:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1j4r51-0003Xq-MP
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 14:01:48 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55741
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1j4r51-0003XR-Hb
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 14:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582225306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkUW03mX3pKmHWyykJx+C8HxuQOVehBXtSV/vvUlrwA=;
 b=TEtiHUImK+Zpf4f7M6MTB3Irxmk9XQ96NTxdD0LC35mPLJ5TKjWjmwJtM1lYy3xT9Cxt+o
 4hM1h2NZ48sa6Eo2RhMwFJxltLbieoJYHEBUORCF2dzsb/MHzV+l+tlKknAezU663bfUNo
 vMwv6sJgcZP06Z7ZgrjOgmUsbAlE9kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-X-Z5kQLtNMG4HV1SlGJyEQ-1; Thu, 20 Feb 2020 13:54:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 535CB800D5F
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 18:54:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-92.gru2.redhat.com
 [10.97.116.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B1711001281;
 Thu, 20 Feb 2020 18:54:33 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] Acceptance test: add address as param
To: Oksana Vohchana <ovoshcha@redhat.com>, qemu-devel@nongnu.org
References: <20200214145235.4378-1-ovoshcha@redhat.com>
 <20200214145235.4378-2-ovoshcha@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <b1a29475-8a7b-a4cf-47e9-d453b5b3fb8a@redhat.com>
Date: Thu, 20 Feb 2020 15:54:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200214145235.4378-2-ovoshcha@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: X-Z5kQLtNMG4HV1SlGJyEQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Oksana,

On 2/14/20 12:52 PM, Oksana Vohchana wrote:
> Provides param address in _get_free_port()
> because by default it takes free port only on the localhost
>
> Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
> ---
>   tests/acceptance/migration.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> index a8367ca023..e4c39b85a1 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -52,8 +52,8 @@ class Migration(Test):
>           source_vm.qmp('migrate', uri=src_uri)
>           self.assert_migration(source_vm, dest_vm)
>   
> -    def _get_free_port(self):
> -        port = network.find_free_port()
> +    def _get_free_port(self, address='localhost'):
> +        port = network.find_free_port(address=address)

Looks good to me, but:

- This patch is out of order, it should be followed by patches 03 and 04.

- You could have described in the cover letter (or in the commit) your 
intention with this change.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Thanks!

- Wainer

>           if port is None:
>               self.cancel('Failed to find a free port')
>           return port


