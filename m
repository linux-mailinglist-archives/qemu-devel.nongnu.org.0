Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55C53A72C8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 02:04:22 +0200 (CEST)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lswZ3-0007fW-R4
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 20:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lswXz-0006nC-6N
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 20:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lswXu-0001HU-7O
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 20:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623715388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tiOKoAE5oYCFw+VvK9dJ8j/Fd0e1KZWjY/UYECeWBs=;
 b=a44M/DTWvutlYX9I84Au1BtKCtRnLOSTpASq5JJSCKdrkNiF/TL0Q5WfbzehunG/znG5X/
 H8t8mPN0jqChR1w1dqBpUR7vEB0qv2lhGelyWYVa6rCs2zlMyKYHHk30xhS9g5/WCKO+wx
 M/Fx7Mx6hRZaptrdE23d5MnCP065Exs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-VB4ZZGSoOri11zMA29eijg-1; Mon, 14 Jun 2021 20:03:05 -0400
X-MC-Unique: VB4ZZGSoOri11zMA29eijg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3CA1800D55;
 Tue, 15 Jun 2021 00:03:04 +0000 (UTC)
Received: from [10.10.113.126] (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D45D60FC2;
 Tue, 15 Jun 2021 00:03:01 +0000 (UTC)
Subject: Re: [PATCH v4 0/2] Gitlab: Add issue templates
To: qemu-devel@nongnu.org
References: <20210607153155.1760158-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a6195b4c-b40d-ebbd-bc03-b8a347c9230f@redhat.com>
Date: Mon, 14 Jun 2021 20:03:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607153155.1760158-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 11:31 AM, John Snow wrote:
> Add "Bug" and "Feature Request" templates to the Gitlab interface to
> help improve the quality of newly reported issues.
> 
> To see what this looks like, I've temporarily allowed my Gitlab fork to
> diverge with these files merged.  See my fork's "new issue" page to see
> it in action: https://gitlab.com/jsnow/qemu/-/issues/new?issue
> 
> (It's outdated a bit for V4, but you get the idea.)
> 
> These patches do not add a "default" template, the user still has to
> select one from the list. I recommend that someone with permissions
> updates the default template:
> 
> 1. https://gitlab.com/qemu-project/qemu/edit
> 2. ctrl+f "Default description template for issues"
> 3. Update the default to the (suggested) below:
> 
> ```
> <!-- Select "Type: Issue" and choose one of the Description templates above. -->
> ```
> 
> We can use this cover letter to discuss/review the wording on that
> default template which exists outside of repository data.
> 
> V4:
>   - Change the "build on master" to be more of a nudge than a mandate,
>     with improved instructions (stefanha, danpb)
> 
> V3:
>   - Add pointer to https://www.qemu.org/download/#source
>   - Add pointer to https://www.qemu.org/contribute/security-process/
>   - Remove blurb covering tracing instructions.
> 
> V2:
> - Updated both templates based on feedback from Peter, Daniel, and
>    Thomas.
> 
> John Snow (2):
>    GitLab: Add "Bug" issue reporting template
>    GitLab: Add "Feature Request" issue template.
> 
>   .gitlab/issue_templates/bug.md             | 64 ++++++++++++++++++++++
>   .gitlab/issue_templates/feature_request.md | 32 +++++++++++
>   2 files changed, 96 insertions(+)
>   create mode 100644 .gitlab/issue_templates/bug.md
>   create mode 100644 .gitlab/issue_templates/feature_request.md
> 

Gentle ping. I do not know whose jurisdiction this falls under.

--js


