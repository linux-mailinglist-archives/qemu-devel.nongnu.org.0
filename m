Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC1138CC87
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:46:17 +0200 (CEST)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9E0-0007xA-K8
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk97P-0000oS-2K
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk97I-0004eq-5m
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621618758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDfxhFhjKiMaZZJ1CqcC9SzJ/uJoXo/SrfK6746esXo=;
 b=jGUR/py/0CQiARAvhBiCGUwG57Mf9x4yy3IVAxuByl0k1lJQdExKoAYdJX46E0JBbj1fOJ
 4ui0mAllvf05WS9hEMhOGEdt4RizxmK9QUkpTgEMtKUXPRK0/SjEn6+425Ikj9qNszOtUD
 g8Nn++gvAAgoLfzsWFw+Mqxs3yHujG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-WCoHKhNpOSqCwFbBbzbEXw-1; Fri, 21 May 2021 13:39:15 -0400
X-MC-Unique: WCoHKhNpOSqCwFbBbzbEXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 244DD802690;
 Fri, 21 May 2021 17:39:14 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D9585DAA5;
 Fri, 21 May 2021 17:39:07 +0000 (UTC)
Subject: Re: [PATCH v6 03/25] python: create utils sub-package
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-4-jsnow@redhat.com>
 <CAKJDGDZX-hwQgcKhOv0ahPu8PRs4p6HBcEmz=gDPnTbE+SfA4Q@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <b0caa39a-c6b6-4dfc-7bef-7df8eab84c33@redhat.com>
Date: Fri, 21 May 2021 13:39:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZX-hwQgcKhOv0ahPu8PRs4p6HBcEmz=gDPnTbE+SfA4Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 1:18 PM, Willian Rampazzo wrote:
> On Wed, May 12, 2021 at 8:13 PM John Snow <jsnow@redhat.com> wrote:
>>
>> Create a space for miscellaneous things that don't belong strictly in
>> "qemu.machine" nor "qemu.qmp" packages.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/qemu/machine/__init__.py           |  8 --------
>>   python/qemu/utils/__init__.py             | 23 +++++++++++++++++++++++
>>   python/qemu/{machine => utils}/accel.py   |  0
>>   tests/acceptance/avocado_qemu/__init__.py |  4 ++--
>>   tests/acceptance/virtio-gpu.py            |  2 +-
>>   tests/vm/aarch64vm.py                     |  2 +-
>>   tests/vm/basevm.py                        |  3 ++-
>>   7 files changed, 29 insertions(+), 13 deletions(-)
>>   create mode 100644 python/qemu/utils/__init__.py
>>   rename python/qemu/{machine => utils}/accel.py (100%)
>>
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 

Thanks :) I've since squashed patches 2/3, so I will add your R-B to 
that combined patch.

--js


