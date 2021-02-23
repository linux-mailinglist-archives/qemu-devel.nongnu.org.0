Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B2322E10
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:55:22 +0100 (CET)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEa1w-00076Y-WE
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEa0w-0006PF-9U
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEa0u-0007DS-Oi
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614095655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKhaXr8zCxAOWsLaMWyPmixMlZxqAManxINNbqgeI2w=;
 b=aj0HdlPmunEoBBMHkX/2q7yWgjedjZKBKSbeb/DZy8Ru3Kkl3wbkDIBHId2gt+pClbg+Fj
 9jZEzm7csWvH95UVhsFQr+u6lPXwrOIGv36mJ/HENi0fFVkpgEonhLzWO9fzUwVshZAtXr
 yNFLMxlYU8g7+8NjMPcwcmSV8teN83s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-5jLDqWb3NZu7Nf3aNAe-vw-1; Tue, 23 Feb 2021 10:53:44 -0500
X-MC-Unique: 5jLDqWb3NZu7Nf3aNAe-vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0121106BC91;
 Tue, 23 Feb 2021 15:53:42 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CE5960C04;
 Tue, 23 Feb 2021 15:53:36 +0000 (UTC)
Subject: Re: [PATCH 0/3] gitlab-pipeline-status script: provide more
 information on errors
To: Erik Skultety <eskultet@redhat.com>
References: <20210222193240.921250-1-crosa@redhat.com>
 <c3b6aaa9-9914-fed6-aaa8-ef9e5258c714@redhat.com>
 <YDUdGUDcfcv4no8h@nautilus.local>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <5b6f8bbe-3009-06e0-4e6e-d5d3cad40b32@redhat.com>
Date: Tue, 23 Feb 2021 12:53:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDUdGUDcfcv4no8h@nautilus.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/23/21 12:19 PM, Erik Skultety wrote:
> On Tue, Feb 23, 2021 at 11:52:17AM -0300, Wainer dos Santos Moschetta wrote:
>> Hi Cleber,
>>
>> In case you need to send a v2, mind to add the following patch together?
>>
>> commit 3c4ed8a78e096e4d7df0398c29887a9d468ae120 (HEAD -> gitlab_runners)
>> Author: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Date:   Tue Feb 23 11:26:08 2021 -0300
>>
>>      scripts/ci/gitlab-pipeline-status: Handle ValueError exceptions nicely
>>
>>      With this change, when getting the local branch, it will handle nicely
>>      any threw ValueError exception instead of print the stack trace.
>>
>>      Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>
>> diff --git a/scripts/ci/gitlab-pipeline-status
>> b/scripts/ci/gitlab-pipeline-status
>> index 924db327ff..6177df973a 100755
>> --- a/scripts/ci/gitlab-pipeline-status
>> +++ b/scripts/ci/gitlab-pipeline-status
>> @@ -160,7 +160,11 @@ def main():
>>       args = parser.parse_args()
>>
>>       if not args.commit:
>> -        args.commit = get_local_branch_commit(args.branch)
>> +        try:
>> +            args.commit = get_local_branch_commit(args.branch)
>> +        except ValueError as error:
>> +            print("ERROR: %s" % error)
>> +            sys.exit(1)
> 1 is the default error code, so you should pass the error message to sys.exit
> directly without the print. If you don't want that, at least redirect the
> print to sys.stderr.

There are occurrences of the same pattern on the script, so I better 
send a separate series to change them all. Thanks for pointing it out Erik!

- Wainer

>
> Erik


