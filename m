Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5472CEFED
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:44:05 +0100 (CET)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klCJY-0003wd-Ku
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klCIZ-0003P8-5D
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:43:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klCIX-0001k7-Gm
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607092980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83zHInYV09m0tLPY6CZbXhK9+nwBPvBDHlv8pvCnZqM=;
 b=cENCoiuRVc48dGto/x0bMRNhMC8O9jsOjTV9sBHNjXhqwJeNGMWZaJIcdqRjdCzLbKavzS
 USDK1E0EvssMH0JJIyTzZ0B+YnPOuJiB7TxBbJ7hEftGCiPObcSnv94ciAHBq0RVxaOOsS
 dgscdbN488RYLOr+reUeW0grdQ5w8IM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-VOogQP2uOFia6pCsu8SsMg-1; Fri, 04 Dec 2020 09:42:59 -0500
X-MC-Unique: VOogQP2uOFia6pCsu8SsMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29536107ACF7;
 Fri,  4 Dec 2020 14:42:58 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C56DA60C6C;
 Fri,  4 Dec 2020 14:42:47 +0000 (UTC)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
 <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <9c56457b-e7b7-f3d9-c2aa-e945b22aa2df@redhat.com>
Date: Fri, 4 Dec 2020 11:42:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 virt-ci-maint-team@redhat.com, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/27/20 3:29 PM, Thomas Huth wrote:
> On 27/11/2020 18.57, Philippe Mathieu-Daudé wrote:
>> On 11/27/20 6:47 PM, Thomas Huth wrote:
>>> On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:
>>>> We lately realized that the Avocado framework was not designed
>>>> to be regularly run on CI environments. Therefore, as of 5.2
>>>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
>>>> current users, it is possible to keep the current behavior by
>>>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
>>>> (see [*]).
>>>>  From now on, using these jobs (or adding new tests to them)
>>>> is strongly discouraged.
>>>>
>>>> Tests based on Avocado will be ported to new job schemes during
>>>> the next releases, with better documentation and templates.
>>> Why should we disable the jobs by default as long as there is no replacement
>>> available yet?
>> Why keep it enabled if it is failing randomly
> We can still disable single jobs if they are not stable, but that's no
> reason to disable all of them by default, is it?
>
>> if images hardcoded
>> in tests are being removed from public servers, etc...?
> That's independent from Avocado, you'll always have that problem if you want
> to test with external images, unless you mirror them into a repository on
> the same server (ie. gitlab), which, however, might not always be possible...

Phil,

on commit 89e076f37d0020bfadb you changed fetch_asset to cancel the test 
if it cannot download a file. Is there anything else that could be done 
to mitigate that problem until we don't have a repository mirror for the 
files?

- Wainer


