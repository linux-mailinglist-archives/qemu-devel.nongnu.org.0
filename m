Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AB397D38
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:50:49 +0200 (CEST)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loE9o-0005Oe-Rh
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loE8F-0003Rj-1Q
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loE8D-00083S-BE
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622591348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/9L3aRNsAVmLnn71pkzl9mBLzQZsvyWXe3+3wDBLcY=;
 b=HQZalKI8ZY87udBLddrPD9Ky6vMsp9ntqPS44gl66zQ8KuWI/wVGW+umDSp0duYUCqVqUg
 rrQLnHSLYjaDcsmL8ZzsE62S27lbZFAsSmhtbA5U8euy8Q0zOLhOWxIkgWLxjX2NdXZ/Lq
 olHZ8Gzyt3ujCWcIxGKdZcfjxORhlC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464--63Mi_rHPMqL6O0RZAxhRw-1; Tue, 01 Jun 2021 19:49:07 -0400
X-MC-Unique: -63Mi_rHPMqL6O0RZAxhRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB977802690;
 Tue,  1 Jun 2021 23:49:04 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F263760E3A;
 Tue,  1 Jun 2021 23:48:55 +0000 (UTC)
Subject: Re: [PULL 00/44] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210528023220.417057-1-jsnow@redhat.com>
 <CAFEAcA_Kws=q73Yhe-AeuGhtx3V0uQOwaEG9+oRvcaROed8uNg@mail.gmail.com>
 <15baf57f-3372-a617-61f3-66c3bb42a302@redhat.com>
 <CAFEAcA_nv5W=4TL5XAuUCp1KNp8Mj8O+FRpo1OwXRs-YDtTuDQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <30b0285e-2278-e06f-f037-e3b02bffe93a@redhat.com>
Date: Tue, 1 Jun 2021 19:48:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_nv5W=4TL5XAuUCp1KNp8Mj8O+FRpo1OwXRs-YDtTuDQ@mail.gmail.com>
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
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 6:36 AM, Peter Maydell wrote:
> On Sun, 30 May 2021 at 20:22, John Snow <jsnow@redhat.com> wrote:
>>
>> On 5/30/21 3:09 PM, Peter Maydell wrote:
>>> Fails to build on my machine that runs the BSD VMs, apparently
>>> before it gets to the point of launching the VM:
> 
>> When I have seen this error message in the past, it has been because of
>> using a new Python version and it gets confused reading stale cached
>> information generated from an older interpreter.
> 
> This seems like a bug in Python...
> 

Yes. I don't know why it's like that either...

>> Can you do me a favor and delete any __pycache__ folders and/or any
>> *.pyc files that might be hiding in your tree and/or build folders and
>> try running it again?
> 
> I tried that, and it does seem to make more progress. It now
> fails with:
> 

One of the acceptance test patches causes this, I've squashed in a fixup 
and have re-sent the PR.

Thanks,
--js


