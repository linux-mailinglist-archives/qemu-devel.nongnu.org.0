Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA082F5301
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:04:23 +0100 (CET)
Received: from localhost ([::1]:47764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlRO-0008ML-Hz
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzlOI-0007MA-HU
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzlOF-0005oj-AE
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610564466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LYlYqZEdIFQw0wvZG1Gt2v8PKmXENQsj4VQZYZZBuw=;
 b=BYbJvcsEBWPqIgo+p7DEQLe6XFDYPQV+nmGh5+2P//p6Kk1/vVzceAXMBwV3qZrDrAg04L
 2gQv3OdG+pGXhwkrBnCfU78Pi8POetFZuTiQpFJh7vAQwipyfB6LTPtuuSPKn7rILWzIsX
 Jh0+LCgpAR2Rv4hv+eueEJZWVtAAHvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-NkdsRJUAPseWNW41kLlFow-1; Wed, 13 Jan 2021 14:01:03 -0500
X-MC-Unique: NkdsRJUAPseWNW41kLlFow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E5D1034B21;
 Wed, 13 Jan 2021 19:01:01 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 827BA6F988;
 Wed, 13 Jan 2021 19:01:01 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-2-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 1/8] iotests/297: Allow checking all Python test files
Message-ID: <b2f9c75d-0753-32f0-a540-58d93aac050d@redhat.com>
Date: Wed, 13 Jan 2021 13:01:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113175752.403022-2-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 11:57 AM, Max Reitz wrote:
> I.e., all Python files in the qemu-iotests/ directory.
> 
> Most files of course do not pass, so there is an extensive skip list for
> now.  (The only files that do pass are 209, 254, 283, and iotests.py.)
> 
> (Alternatively, we could have the opposite, i.e. an explicit list of
> files that we do want to check, but I think it is better to check files
> by default.)

Concur with the choice for default.

> 
> I decided to include the list of files checked in the reference output,
> so we do not accidentally lose coverage of anything.  That means adding
> new Python tests will require a change to 297.out, but that should not
> be a problem.

I'm okay with that.

> 
> On the other hand, I decided to hide mypy's "Success" lines from the
> reference output, because they do not add anything useful.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/297     | 66 ++++++++++++++++++++++++++++++++++----
>  tests/qemu-iotests/297.out |  6 +++-
>  2 files changed, 65 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 5c5420712b..b1a7d6d5e8 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -30,13 +30,67 @@ if ! type -p "mypy" > /dev/null; then
>      _notrun "mypy not found"
>  fi
>  
> -pylint-3 --score=n iotests.py
> +# TODO: Empty this list!

:)


> +file_list=()
> +for file in *; do
> +    # Check files with a .py extension or a Python shebang
> +    # (Unless they are in the skip_files list)
> +    if [ -f "$file" ] && ((echo "$file" | grep -q '\.py$') ||
> +                          (head -n 1 "$file" | grep -q '^#!.*python'))

Bash has an (obsolete) operator (()) (behaves like a mix of $(()) and
'if'); when nesting subshells, POSIX recommends inserting a space to
avoid inadvertent triggering of the alternate semantics of the operator.
 But why do you need nested subshells?  This is equivalent:

if [ -f "$file" ] && (echo  "$file" | grep -q '\.py$' ||
                      head -n 1 "$file" | grep -q '^#!.*python')

> +    then
> +        skip_file=false
> +        for skip in "${skip_files[@]}"; do

bashism, but iotests require bash, so fine.

> +            if [ "$skip" = "$file" ]; then
> +                skip_file=true
> +                break
> +            fi
> +        done
> +
> +        if ! $skip_file; then
> +            file_list+=("$file")

Likewise.

Whether or not you strip the extra (),
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


