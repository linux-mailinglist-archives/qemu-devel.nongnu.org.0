Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F830C38A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:22:23 +0100 (CET)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xVW-00028X-Bh
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6x4M-0007uk-Mu
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6x4I-0006Jp-Fv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612277653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5M6dVaFi9PFtleVQA7LMl+e8Bv2Y1lHefIKdYoyHEs=;
 b=f5pYamOvd+WWTc3efPexOjAb6Pc6ZcYWVeg5Q6LId5e3o5FS5fZLqxijoceHuyHlzDCTG8
 KV1Mr4Ajg/hHnK1T4woryJdRY1GtYdeKtZPLnyWaIDmJo9nNQ2rqPGB2EPPXxCDPmYbwyO
 zwe4JESPkjJexR9DmDQD6B54pn7SUZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-kwSc1SVxMgyLR3pXtJh1Nw-1; Tue, 02 Feb 2021 09:54:08 -0500
X-MC-Unique: kwSc1SVxMgyLR3pXtJh1Nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24D979CC05;
 Tue,  2 Feb 2021 14:54:07 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A7F5D9C6;
 Tue,  2 Feb 2021 14:54:06 +0000 (UTC)
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210202142802.119999-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b5af56ce-bbee-6afe-9a74-90f886ee2b08@redhat.com>
Date: Tue, 2 Feb 2021 08:54:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202142802.119999-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 8:28 AM, Kevin Wolf wrote:
> If the qemu-system-{arch} binary for the host architecture can't be
> found, the old 'check' implementation selected the alphabetically first
> system emulator binary that it could find. The new Python implementation
> just uses the first result of glob.iglob(), which has an undefined
> order.
> 
> This is a problem that breaks CI because the iotests aren't actually
> prepared to run on any emulator. They should be, so this is really a bug
> in the failing test cases that should be fixed there, but as a quick
> fix, let's revert to the old behaviour to let CI runs succeed again.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/testenv.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As fixing the tests is indeed more work than sorting the glob results,
this one-liner is worth checking.

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index b31275f518..1fbec854c1 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -135,7 +135,7 @@ class TestEnv(ContextManager['TestEnv']):
>          if not os.path.exists(self.qemu_prog):
>              pattern = root('qemu-system-*')
>              try:
> -                progs = glob.iglob(pattern)
> +                progs = sorted(glob.iglob(pattern))
>                  self.qemu_prog = next(p for p in progs if isxfile(p))
>              except StopIteration:
>                  sys.exit("Not found any Qemu executable binary by pattern "
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


