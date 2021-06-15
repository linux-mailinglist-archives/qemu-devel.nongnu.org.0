Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9213A7904
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:28:13 +0200 (CEST)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4Qe-0003Ka-NM
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt4PV-0002cy-JN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt4PS-0002jp-52
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623745616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNiv0Xo44YAspZTHcxuXa1cKtlbq68ZhvQaTaPZsbJs=;
 b=GKTwZvrbPI1eeaiiL+14OvkE/+SQet0wEMn/MdUGJ494rB8MPfAu10zQ/C6Yx6abO3SVQP
 HERaQG1fEhDvDgMxFdVY+T9zPQ1SaR1ryXrru4YQejkqOYiEhKkFeMjTUESkSkgHB01aQv
 sAGWumL5LMB5j9Ymi8Z2fsXZaBdNiHY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-ehnkah_5N6CscGPz6QYkcw-1; Tue, 15 Jun 2021 04:26:53 -0400
X-MC-Unique: ehnkah_5N6CscGPz6QYkcw-1
Received: by mail-wm1-f69.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so234899wmj.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 01:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CNiv0Xo44YAspZTHcxuXa1cKtlbq68ZhvQaTaPZsbJs=;
 b=DNv/0IVjxGRE5yqKu+F1yPRp0cjw/w8Sw2SQmzTmo47qezY38rXhgx2LQjelYmlbce
 MTJuM9U+ArC8/kIIjUdmngNqt1hNy9oogJP3eftr75HtwKP6lPrtAUlclQXQ34CeX0Uj
 Z3DgWU/HR61jnZGOvlvwKXgB8I6TY6PLkATY2w04zkKVjD28KtVRynQJqUY2a1eKy4Kw
 GbkeniuuboaUJTi07lCpdC3ezNFmdCofRPDSWHmuh0rdzcmKWYFoAlZogBO/D2hPsu5l
 Kvb+FPYrysBOOApNMP1iTJ15Atv/vnge2JRYqJWgrnvlfKrpsTzgU0onL1jjGTOWlPPA
 sWTQ==
X-Gm-Message-State: AOAM532xKvMUMSNvvz8YVV+khtVryJluQoLRXxEYVrPoh61MiW+gHpOK
 J97wjKCFD4/dLk8L662fERXwdEfGUXGcyc1bwdXRxV59EorMSAY6asoqY/+c1b6XsmgpqyK32BW
 L3I9aPK4i0s6a2EE=
X-Received: by 2002:adf:e944:: with SMTP id m4mr24955165wrn.244.1623745612753; 
 Tue, 15 Jun 2021 01:26:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya33kzj3RWS3942LtRSbzNPN7pTQVDUb9wT/dGmCyXkXIF8sz8LQzBsVqr7FIaRlLQCKHkKQ==
X-Received: by 2002:adf:e944:: with SMTP id m4mr24955144wrn.244.1623745612582; 
 Tue, 15 Jun 2021 01:26:52 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id i9sm22182877wrn.54.2021.06.15.01.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 01:26:52 -0700 (PDT)
Subject: Re: [PATCH v4 0/2] Gitlab: Add issue templates
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210607153155.1760158-1-jsnow@redhat.com>
 <a6195b4c-b40d-ebbd-bc03-b8a347c9230f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8e156869-f17f-a2f5-b3e0-bb188a50c919@redhat.com>
Date: Tue, 15 Jun 2021 10:26:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a6195b4c-b40d-ebbd-bc03-b8a347c9230f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2021 02.03, John Snow wrote:
> On 6/7/21 11:31 AM, John Snow wrote:
>> Add "Bug" and "Feature Request" templates to the Gitlab interface to
>> help improve the quality of newly reported issues.
>>
>> To see what this looks like, I've temporarily allowed my Gitlab fork to
>> diverge with these files merged.  See my fork's "new issue" page to see
>> it in action: https://gitlab.com/jsnow/qemu/-/issues/new?issue
>>
>> (It's outdated a bit for V4, but you get the idea.)
>>
>> These patches do not add a "default" template, the user still has to
>> select one from the list. I recommend that someone with permissions
>> updates the default template:
>>
>> 1. https://gitlab.com/qemu-project/qemu/edit
>> 2. ctrl+f "Default description template for issues"
>> 3. Update the default to the (suggested) below:
>>
>> ```
>> <!-- Select "Type: Issue" and choose one of the Description templates 
>> above. -->
>> ```
>>
>> We can use this cover letter to discuss/review the wording on that
>> default template which exists outside of repository data.
>>
>> V4:
>>   - Change the "build on master" to be more of a nudge than a mandate,
>>     with improved instructions (stefanha, danpb)
>>
>> V3:
>>   - Add pointer to https://www.qemu.org/download/#source
>>   - Add pointer to https://www.qemu.org/contribute/security-process/
>>   - Remove blurb covering tracing instructions.
>>
>> V2:
>> - Updated both templates based on feedback from Peter, Daniel, and
>>    Thomas.
>>
>> John Snow (2):
>>    GitLab: Add "Bug" issue reporting template
>>    GitLab: Add "Feature Request" issue template.
>>
>>   .gitlab/issue_templates/bug.md             | 64 ++++++++++++++++++++++
>>   .gitlab/issue_templates/feature_request.md | 32 +++++++++++
>>   2 files changed, 96 insertions(+)
>>   create mode 100644 .gitlab/issue_templates/bug.md
>>   create mode 100644 .gitlab/issue_templates/feature_request.md
>>
> 
> Gentle ping. I do not know whose jurisdiction this falls under.

I assume this should be merged by someone who has maintainer rights in the 
qemu-project on gitlab (for also updating the default template)?

  Thomas


