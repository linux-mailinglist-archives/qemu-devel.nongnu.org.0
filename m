Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B092F64AE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:34:22 +0100 (CET)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04dh-0003PK-4N
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l04ZR-0001ce-84
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l04ZP-0004ki-Bc
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610638194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZVS21Y/GNfN1l6Z5s/F5qAcyNGrf9UeD/TLlMPJU9Y=;
 b=cnEOK5nCD6wr/cOX3v+8UbXPcd894Q7YPIQ7/lGZd8+rRnE01pCDLaHA3ZocvOjjeKPFuO
 mFPXBF7/GuGMJcGNlMfzr/0VDFZPepi0+AKXZ7j8VrbyYepy/dhJZhh3rSUFO1Npk9wk94
 kOSZMoymIVwlWSUwP2wHRPFMZfmMnDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-sp9u1xByPU6yx-14ya_n8w-1; Thu, 14 Jan 2021 10:29:49 -0500
X-MC-Unique: sp9u1xByPU6yx-14ya_n8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7661F9CC09;
 Thu, 14 Jan 2021 15:29:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3157650C0A;
 Thu, 14 Jan 2021 15:29:44 +0000 (UTC)
Subject: Re: [qemu-web PATCH v2] Use GitLab repo URLs instead of git.qemu.org
 URLs
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210113185403.276395-1-stefanha@redhat.com>
 <407faef7-934e-2744-2837-590bc192ff12@redhat.com>
 <20210114134050.GB299876@stefanha-x1.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0cd93ff2-cabc-2e4e-449f-34d7bbb9e5c7@redhat.com>
Date: Thu, 14 Jan 2021 16:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210114134050.GB299876@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/2021 14.40, Stefan Hajnoczi wrote:
> On Thu, Jan 14, 2021 at 10:42:59AM +0100, Thomas Huth wrote:
>> On 13/01/2021 19.54, Stefan Hajnoczi wrote:
>>> Switch to GitLab repo URLs to reduce qemu.org bandwidth.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> v2:
>>>    * Added missing URL in _posts/2018-06-28-tcg-testing.md. Mark
>>>      Cave-Ayland <mark.cave-ayland@ilande.co.uk> and Alex Bennée
>>>      <alex.bennee@linaro.org> figured out the issue was that the gitweb
>>>      link referenced a blob object (not a commit) whereas GitLab needs the
>>>      commit object. Therefore the hash hash in the URL has changed.
>>> ---
>>>    _download/source.html                           | 4 ++--
>>>    _posts/2017-02-04-the-new-qemu-website-is-up.md | 8 ++++----
>>>    _posts/2017-10-04-qemu-2-10-1.md                | 4 ++--
>>>    _posts/2018-02-09-understanding-qemu-devices.md | 2 +-
>>>    _posts/2018-06-28-tcg-testing.md                | 4 ++--
>>>    contribute.md                                   | 2 +-
>>>    contribute/security-process.md                  | 4 ++--
>>>    documentation.md                                | 2 +-
>>>    support.md                                      | 2 +-
>>>    9 files changed, 16 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/_download/source.html b/_download/source.html
>>> index 5798633..14fb6dc 100644
>>> --- a/_download/source.html
>>> +++ b/_download/source.html
>>> @@ -9,7 +9,7 @@
>>>    	{% include releases.html %}
>>>    	</div>
>>>    	<p>or stay on the bleeding edge with the
>>> -	   <a href="https://git.qemu.org/?p=qemu.git">git repository!</a></p>
>>> +	   <a href="https://gitlab.com/qemu-project/qemu.git">git repository!</a></p>
>>
>> For "clickable" links (i.e. not the URLs used for cloning), I'd suggest to
>> drop the ".git" suffix, since there will be a redirection to the suffix-less
>> URL otherwise.
>>
>> If you agree, I can fix it up when picking up the patch, no need to resend
>> just because of this.
> 
> I don't have a strong opinion either way. I chose this approach because
> it results in a clean git clone while also working in a web browser
> (with a redirect, as you mentioned).

Ok, I've pushed your patch with some of the .git suffixes removed. I don't 
think that anybody will try to clone from a link where the link text is 
saying "git repository!" like in above source.html, so I removed it there. 
But in the instructions for running "git clone ...", I of course kept the 
suffix.

  Thomas


  Thomas


