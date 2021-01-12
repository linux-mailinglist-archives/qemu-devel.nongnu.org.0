Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C8D2F2942
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:54:23 +0100 (CET)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEVS-0005ZH-1v
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzERV-0002FQ-9A
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzERT-0002tM-As
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610437814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGsdLoAM0a87AYsE7RhudV5R4OEred+sNvtPJlC26hA=;
 b=FZwA7Pk2SprN///GAbMcY5MIiVf7gpEs2cTsXOdUXiJJrzPYo0IsudBofvMUDbZp453mGl
 jKsL5QLGwwob0BcdHqxfbtwEWc+0YdiHdIm8PQeBmsQ9RblevArD/db81NpqXRaDacff4Y
 Dn+z0E++G49/qxbaUiQ/HDCvB1jMGnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-zi8MhvlsOsKJub94PALNPA-1; Tue, 12 Jan 2021 02:50:11 -0500
X-MC-Unique: zi8MhvlsOsKJub94PALNPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 329F6190B2A1;
 Tue, 12 Jan 2021 07:50:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 545E83A47;
 Tue, 12 Jan 2021 07:49:56 +0000 (UTC)
Subject: Re: [PATCH 1/6] .github: point Repo Lockdown bot to GitLab repo
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210111115017.156802-1-stefanha@redhat.com>
 <20210111115017.156802-2-stefanha@redhat.com>
 <20210111115149.GC1172772@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0db7e143-d31b-c067-716c-6a82fad60383@redhat.com>
Date: Tue, 12 Jan 2021 08:49:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111115149.GC1172772@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 12.51, Daniel P. Berrangé wrote:
> On Mon, Jan 11, 2021 at 11:50:12AM +0000, Stefan Hajnoczi wrote:
>> Use the GitLab repo URL as the main repo location in order to reduce
>> load on qemu.org.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   .github/lockdown.yml | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/.github/lockdown.yml b/.github/lockdown.yml
>> index 9acc393f1c..07fc2f31ee 100644
>> --- a/.github/lockdown.yml
>> +++ b/.github/lockdown.yml
>> @@ -10,8 +10,8 @@ issues:
>>     comment: |
>>       Thank you for your interest in the QEMU project.
>>   
>> -    This repository is a read-only mirror of the project's master
>> -    repostories hosted on https://git.qemu.org/git/qemu.git.
>> +    This repository is a read-only mirror of the project's repostories hosted
>> +    at https://gitlab.com/qemu-project/qemu.git.
> 
> NB this URL triggers a redirect to strip the .git suffix
> 
>            https://gitlab.com/qemu-project/qemu

If you try to do:

  git clone https://gitlab.com/qemu-project/qemu

You get this warning message instead:

  warning: redirecting to https://gitlab.com/qemu-project/qemu.git/

So I think the patch is fine.

Reviewed-by: Thomas Huth <thuth@redhat.com>


