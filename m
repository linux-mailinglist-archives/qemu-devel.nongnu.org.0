Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADA26287C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 09:25:56 +0200 (CEST)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFuUN-0004Rz-4m
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 03:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kFuTY-0003xm-Tj
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 03:25:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40675
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kFuTX-0005RG-9z
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 03:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599636302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01LrljbBf7epnnJX0VhRAQcWVMU9bPc59LnjJSft9a0=;
 b=OVtn/U16438qqwtduufD1ZFczvarzr9k6Fz0RC3DxzYIzATJoEEtbED/ubVT7AHo6BtbC+
 4dNeK3zad9K7JysXf4HT/xNADmtjSjeeAdla/QRC7Eyws5/PPVGmyBsMKcGy6KS/oMtKja
 RC1CvC6iGvRrSedsq2WX9fnPiTrM5PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-if_1TCCWMAiRXmzD7vFgbg-1; Wed, 09 Sep 2020 03:25:00 -0400
X-MC-Unique: if_1TCCWMAiRXmzD7vFgbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4132F1005504;
 Wed,  9 Sep 2020 07:24:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10CDD5D9E8;
 Wed,  9 Sep 2020 07:24:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BA8A113865F; Wed,  9 Sep 2020 09:24:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] Simplify the .gitignore file
References: <20200907174255.179652-1-thuth@redhat.com>
 <e6755ee5-5d41-da76-1a34-e4a05fd76663@redhat.com>
 <fac14891-3cff-4a27-8fa5-12ddd286e9db@redhat.com>
Date: Wed, 09 Sep 2020 09:24:57 +0200
In-Reply-To: <fac14891-3cff-4a27-8fa5-12ddd286e9db@redhat.com> (Thomas Huth's
 message of "Tue, 8 Sep 2020 16:41:20 +0200")
Message-ID: <87mu1zza2e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:13:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 07/09/2020 21.43, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 9/7/20 7:42 PM, Thomas Huth wrote:
>>> Now that we always do out-of-tree builds (and the in-tree builds are
>>> faked via a "build" directory), we can simplify out .gitignore file
>>> quite a bit.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  .gitignore | 158 -----------------------------------------------------
>>>  1 file changed, 158 deletions(-)
>>>
>>> diff --git a/.gitignore b/.gitignore
>>> index 4ccb9ed975..bb916594eb 100644
>>> --- a/.gitignore
>>> +++ b/.gitignore
[...]
>>> -*.[1-9]
>>> -*.a
>>> -*.aux
>>> -*.cp
>>> -*.exe
>>> -*.msi
>>> -*.dll
>>> -*.so
>>> -*.fn
>>> -*.ky
>>=20
>> Need to double-check where this come from.
>
> Looking at 0cb3fb1e30a7789881e18 and some other commits, it seems like
> these were once used for the qemu-doc PDF file generation. Should be ok
> to remove them now since we moved to Sphinx.

The move isn't complete, yet: "[PATCH v5 00/20] Convert QAPI doc
comments to generate rST instead of texinfo".

Regardless, formatting documentation should not litter the source tree.

[...]


