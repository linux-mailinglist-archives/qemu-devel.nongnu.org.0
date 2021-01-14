Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3382F5D3A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:25:31 +0100 (CET)
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzysk-0004vL-Jt
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzyrJ-0004Kp-7b
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzyrG-0007W3-5i
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610616237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiZSSrF8Xfy4+Q7fWD/bk1l/FlS9Dw5uVJbhqBGLR2A=;
 b=czMo5EWrGCq4FzRqCqIJs2tgaYsqkCacViLijmgoX88kkyB2qJ9WuWsdHEKdAn4U7kN1EG
 KPs9j1Vd+BFcKh2PROkuUJP4iJUYMngY5pih9VyxnXQzi9/b0mM/GO305IXZBdvbuhnfB2
 mXMOYzst55HWqKAPal73iG9Xn+NJfV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-SGEvLtvdP7yUpX1_5r5H9w-1; Thu, 14 Jan 2021 04:23:53 -0500
X-MC-Unique: SGEvLtvdP7yUpX1_5r5H9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10DA0107ACF9;
 Thu, 14 Jan 2021 09:23:52 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-31.ams2.redhat.com
 [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B73B419814;
 Thu, 14 Jan 2021 09:23:50 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] iotests/297: Allow checking all Python test files
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-2-mreitz@redhat.com>
 <b2f9c75d-0753-32f0-a540-58d93aac050d@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7e1b486b-94f8-a990-7710-d934d8ca7d55@redhat.com>
Date: Thu, 14 Jan 2021 10:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b2f9c75d-0753-32f0-a540-58d93aac050d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 20:01, Eric Blake wrote:
> On 1/13/21 11:57 AM, Max Reitz wrote:
>> I.e., all Python files in the qemu-iotests/ directory.
>>
>> Most files of course do not pass, so there is an extensive skip list for
>> now.  (The only files that do pass are 209, 254, 283, and iotests.py.)
>>
>> (Alternatively, we could have the opposite, i.e. an explicit list of
>> files that we do want to check, but I think it is better to check files
>> by default.)
> 
> Concur with the choice for default.
> 
>>
>> I decided to include the list of files checked in the reference output,
>> so we do not accidentally lose coverage of anything.  That means adding
>> new Python tests will require a change to 297.out, but that should not
>> be a problem.
> 
> I'm okay with that.
> 
>>
>> On the other hand, I decided to hide mypy's "Success" lines from the
>> reference output, because they do not add anything useful.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/297     | 66 ++++++++++++++++++++++++++++++++++----
>>   tests/qemu-iotests/297.out |  6 +++-
>>   2 files changed, 65 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>> index 5c5420712b..b1a7d6d5e8 100755
>> --- a/tests/qemu-iotests/297
>> +++ b/tests/qemu-iotests/297
>> @@ -30,13 +30,67 @@ if ! type -p "mypy" > /dev/null; then
>>       _notrun "mypy not found"
>>   fi
>>   
>> -pylint-3 --score=n iotests.py
>> +# TODO: Empty this list!
> 
> :)
> 
> 
>> +file_list=()
>> +for file in *; do
>> +    # Check files with a .py extension or a Python shebang
>> +    # (Unless they are in the skip_files list)
>> +    if [ -f "$file" ] && ((echo "$file" | grep -q '\.py$') ||
>> +                          (head -n 1 "$file" | grep -q '^#!.*python'))
> 
> Bash has an (obsolete) operator (()) (behaves like a mix of $(()) and
> 'if'); when nesting subshells, POSIX recommends inserting a space to
> avoid inadvertent triggering of the alternate semantics of the operator.
>   But why do you need nested subshells?  This is equivalent:
> 
> if [ -f "$file" ] && (echo  "$file" | grep -q '\.py$' ||
>                        head -n 1 "$file" | grep -q '^#!.*python')

I just wasn’t sure of the order of pipe and ||.  Sure, I can change it 
(depending on whether or not I rewrite it in Python, as suggested by 
Vladimir).

>> +    then
>> +        skip_file=false
>> +        for skip in "${skip_files[@]}"; do
> 
> bashism, but iotests require bash, so fine.
> 
>> +            if [ "$skip" = "$file" ]; then
>> +                skip_file=true
>> +                break
>> +            fi
>> +        done
>> +
>> +        if ! $skip_file; then
>> +            file_list+=("$file")
> 
> Likewise.
> 
> Whether or not you strip the extra (),
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


