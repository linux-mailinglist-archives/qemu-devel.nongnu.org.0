Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E729038C6B8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:44:19 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4Vn-0000oR-0v
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk4UG-00005q-3l
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk4UD-0003Tx-8Z
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621600959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7j8Em2K9BdP1hzxpGTjNb+/7SVGexm+ZKKntisRLj4=;
 b=BhJvj8356WsVH8nQ5hirUXm+f8wvzQCGo20rAwAdaV0gLnwBEv9guKxxJcWqTbUiccP7Hw
 jXZ4wiBkdWokB7sut2T/bnAqyCucfd8zMEspvh2S/+kx6gPDBK8NUSaonwNjZWXm7aMfeC
 ZXw6KviQtD9tmThqVtgiKkE01CCDY6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-uwNTN3WcNV20kTMYVtl_4g-1; Fri, 21 May 2021 08:42:38 -0400
X-MC-Unique: uwNTN3WcNV20kTMYVtl_4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CC19107ACE8;
 Fri, 21 May 2021 12:42:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D10E45D9E3;
 Fri, 21 May 2021 12:42:27 +0000 (UTC)
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
Message-ID: <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
Date: Fri, 21 May 2021 14:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/2021 14.28, Willian Rampazzo wrote:
> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
[...]
>> Alternatively, what about renaming the "acceptance" tests to "validation"
>> instead? That word does not have a duplicated definition in the context of
>> QEMU yet, so I think it would be less confusing.
> 
> While at the beginning of your reply, I started thinking if
> "validation" would cause less confusion for the QEMU project. Although
> validation testing is a broader concept inside the Verification &
> Validation process, encompassing unit testing, functional testing,
> integration testing, system testing, and acceptance testing, it may be
> an option for the QEMU project.
> 
> While system testing would be the correct terminology to use, if it
> causes more confusion, using a less strict terminology, like
> validation testing, is valid, in my opinion.

<semi-homorous-friday-bikeshedding>
Or we could come up with a new, artificial name instead (like "qtests"). It 
certainly need a "q" in the name. For example what about:

- avoqado
- valiqation
- aqueptance
- inteqration

?
</semi-homorous-friday-bikeshedding>

  Thomas


