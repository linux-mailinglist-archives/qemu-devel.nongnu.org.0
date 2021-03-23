Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BC345EA8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:56:47 +0100 (CET)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgaU-0004eg-B8
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgYq-00031x-EJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgYn-00048U-JR
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616504100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7lX9vxYrnarPLPh7yoZb2Jnt9xNUsYjqCkCd8C1I1c=;
 b=XNmKCVCtX3Rn9CkV70Y6sbabZaGgpgzQFG97I3eCjFmKBMZ/6Jd0SdDy2vJMu80Pyjrgvf
 2kVqaocyDKQPWlcUiFK6fPprE3fJSD/509C9R+WfRNcxnbgSvaCt9reHkrtVTwvwO9KURy
 R6z9tzwtzg9FKNVaHUABcfvddzHxF94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-Z364NCLtMFeH-iY-cdVw7g-1; Tue, 23 Mar 2021 08:54:59 -0400
X-MC-Unique: Z364NCLtMFeH-iY-cdVw7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E6A8107B7C3;
 Tue, 23 Mar 2021 12:54:58 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C6BA5D6AD;
 Tue, 23 Mar 2021 12:54:54 +0000 (UTC)
Subject: Re: [PATCH 02/28] tests/qapi-schema: Drop redundant flat-union-inline
 test
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-3-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <427756d5-0745-6a1f-4a75-305806a58251@redhat.com>
Date: Tue, 23 Mar 2021 08:54:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-3-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:39 AM, Markus Armbruster wrote:
> flat-union-inline.json covers longhand branch definition with an
> invalid type value.  It's redundant: longhand branch definition is
> covered by flat-union-inline-invalid-dict.json, and invalid type value
> is covered by nested-struct-data.json.  Drop the test.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

If you feel it's redundant, I trust your judge?ment here.

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   tests/qapi-schema/flat-union-inline.err  |  2 --
>   tests/qapi-schema/flat-union-inline.json | 11 -----------
>   tests/qapi-schema/flat-union-inline.out  |  0
>   tests/qapi-schema/meson.build            |  1 -
>   4 files changed, 14 deletions(-)
>   delete mode 100644 tests/qapi-schema/flat-union-inline.err
>   delete mode 100644 tests/qapi-schema/flat-union-inline.json
>   delete mode 100644 tests/qapi-schema/flat-union-inline.out
> 
> diff --git a/tests/qapi-schema/flat-union-inline.err b/tests/qapi-schema/flat-union-inline.err
> deleted file mode 100644
> index 538283f5db..0000000000
> --- a/tests/qapi-schema/flat-union-inline.err
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -flat-union-inline.json: In union 'TestUnion':
> -flat-union-inline.json:7: 'data' member 'value1' should be a type name
> diff --git a/tests/qapi-schema/flat-union-inline.json b/tests/qapi-schema/flat-union-inline.json
> deleted file mode 100644
> index a9b3ce3f0d..0000000000
> --- a/tests/qapi-schema/flat-union-inline.json
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# we require branches to be a struct name
> -# TODO: should we allow anonymous inline branch types?
> -{ 'enum': 'TestEnum',
> -  'data': [ 'value1', 'value2' ] }
> -{ 'struct': 'Base',
> -  'data': { 'enum1': 'TestEnum', 'kind': 'str' } }
> -{ 'union': 'TestUnion',
> -  'base': 'Base',
> -  'discriminator': 'enum1',
> -  'data': { 'value1': { 'type': {} },
> -            'value2': { 'integer': 'int' } } }
> diff --git a/tests/qapi-schema/flat-union-inline.out b/tests/qapi-schema/flat-union-inline.out
> deleted file mode 100644
> index e69de29bb2..0000000000
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
> index 304ef939bd..d5fa035507 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -111,7 +111,6 @@ schemas = [
>     'flat-union-clash-member.json',
>     'flat-union-discriminator-bad-name.json',
>     'flat-union-empty.json',
> -  'flat-union-inline.json',
>     'flat-union-inline-invalid-dict.json',
>     'flat-union-int-branch.json',
>     'flat-union-invalid-branch-key.json',
> 


