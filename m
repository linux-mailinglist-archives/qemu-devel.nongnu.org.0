Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E12F16ED
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:59:44 +0100 (CET)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxjT-0004ow-Ti
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxh6-0003RB-Aa
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:57:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxh3-0001KN-2T
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610373431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHy3Wl+6Mzf7iV9lBXUWZ1sx8ibE/t5IHEeBXLpucvs=;
 b=ZRjfZ/6gZolrte/BXTi8kAg/8xiaOWSU0JG5wDiDtDg+MHYJD7F5Pf/dL/zNEUQnXeWIcW
 RevOf1RjOCxwrJ1Faa5PhxOYydBZcvMhpoLlKQnWimVYkYnNiepP5eDvrxd3hKK5qzjudx
 x2CrTCr4BuSeOUm6W+vXj3wLYECfmmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-EEtwaIS0O4mm0ebQXLENgQ-1; Mon, 11 Jan 2021 08:57:08 -0500
X-MC-Unique: EEtwaIS0O4mm0ebQXLENgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B3EA107ACF9;
 Mon, 11 Jan 2021 13:57:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 317806E510;
 Mon, 11 Jan 2021 13:57:00 +0000 (UTC)
Subject: Re: [PULL 00/15] Testing, CI and bsd-user patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210111134328.157775-1-thuth@redhat.com>
 <CAFEAcA9RRmZd+b3hUzfpWEbUyd3Qaa_WSvyDAuDbPwHzqKixXg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a1081224-a48a-839c-d876-23d29adecf4b@redhat.com>
Date: Mon, 11 Jan 2021 14:56:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9RRmZd+b3hUzfpWEbUyd3Qaa_WSvyDAuDbPwHzqKixXg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 14.46, Peter Maydell wrote:
> On Mon, 11 Jan 2021 at 13:43, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi,
>>
>> the following changes since commit 7b09f127738ae3d0e71716cea086fc8f847a5686:
>>
>>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210108' into staging (2021-01-08 15:37:04 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-11
>>
>> for you to fetch changes up to 2ee8a60bc51af853b2adfb581bf106b0db109dd9:
>>
>>    fuzz: map all BARs and enable PCI devices (2021-01-11 11:38:15 +0100)
>>
>> ----------------------------------------------------------------
>> * Fuzzer improvements
>> * Add OpenSUSE leap to the gitlab-CI
>> * Some fixes to get our CI "green" again
>> * Some initial patches to update bsd-user
>> ----------------------------------------------------------------
> 
> My scripts report:
> 
> [staging f3ea435b40a] Merge remote-tracking branch
> 'remotes/huth-gitlab/tags/pull-request-2021-01-11' into staging
>   Date: Mon Jan 11 13:45:40 2021 +0000
> Cho, Yu-Chen via (1):
>        gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
> ERROR: pull request includes commits attributed to list
> 
> Could you fix up the attribution in that commit and resend the pullreq,
> please?

Oops, sorry. I'll add a check to my pullreq script so that this does not 
happen again.

  Thanks,
   Thomas


