Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905853311DB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:13:35 +0100 (CET)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHZe-0006oh-Lr
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJHXo-00057t-52
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:11:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJHXg-0003Md-E9
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615216291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OekX8ONpS/gjOz0PsnNXv1lpZoUpcEsCGWTG9otrSA=;
 b=BHt8UmudtOcbh1k3zqmJ3XppD2IBQn+hCV6W3eC1up42bjlu5kBvHzo45Njph+uTQExmbw
 E1fX6q3jIqcXBCqjoFuwZkSznG7QatliCT8ydzcmdn1pZRyV73WViU+TCo0zFGXbMOg6q0
 +gPjSPrA3gRwc2ggBCI6rb6GZsHYzXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-UTCAV9fgN1u4VO925Hy5_w-1; Mon, 08 Mar 2021 10:11:29 -0500
X-MC-Unique: UTCAV9fgN1u4VO925Hy5_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2363C1084D82;
 Mon,  8 Mar 2021 15:11:28 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E042119D9D;
 Mon,  8 Mar 2021 15:11:22 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210307113403.11028-1-thuth@redhat.com>
 <878s6xam83.fsf@linaro.org> <d451b382-c5dc-2346-a463-e95e48f205e4@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Merge the Gitlab-CI section into the generic
 CI section
Message-ID: <3815e29f-6a22-fa6b-0a25-4b354b30b7eb@redhat.com>
Date: Mon, 8 Mar 2021 16:11:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d451b382-c5dc-2346-a463-e95e48f205e4@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 14.34, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> On 3/8/21 12:57 PM, Alex Bennée wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> The status of the gitlab-CI files is currently somewhat confusing, and
>>> it is often not quite clear whether a patch should go via my tree or
>>> via the testing tree of Alex. That situation has grown historically...
>>> Initially, I was the only one using the gitlab-CI, just for my private
>>> repository there. But in the course of time, the gitlab-CI switched to
>>> use the containers from tests/docker/ (which is not part of the gitlab-CI
>>> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
>>> completely for the repository and will soon use it as its gating CI, too.
>>> So it makes way more sense if the gitlab-ci.yml files belong to the people
>>> who are owning the qemu-project on gitlab.com and take care of the gitlab
>>> CI there. Thus let's merge the gitlab-ci section into the common "test and
>>> build automation" section,
>>
>> I have no problem with this, might as well keep it all together.
>>
>>> and change the status of myself to a "reviewer"
>>> there instead.
>>
>> Can we not have multiple maintainers? Considering how important keeping
>> the testing green should be wouldn't it help to keep the bus factor
>> lower (not to mention holidays/breaks and just plain busy with other
>> things periods). It shouldn't be to hard to track as long as we mention
>> when we queue things to our trees?
> 
> I'm OK to be listed as backup maintainer as I do have a genuine
> interest in CI/testing. It will be in my scarcer personal time
> although, so better if another maintainers with more resources
> could pop up along instead.

Well, I guess if Philippe is around for helping at least with the maintainer 
stuff in the qemu-project on gitlab.com, I can also continue as a backup for 
picking up the related CI patches if you like (unless someone else wants to 
volunteer)... I'll send a v2 for this patch accordingly...

  Thomas


