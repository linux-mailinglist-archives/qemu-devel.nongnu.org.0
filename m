Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BB38CBCE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:17:14 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8ls-0004BH-JZ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk8jR-0002EJ-Fw
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk8jO-00011l-DS
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FoosSDU/lSKeNqty24UCT+ac/QMrro7F8FCHLUQHGY=;
 b=NUNAkK1b1baO81qm3y0ISoEW5GLZ69jP3jacoWur2DBUJ4jVNBxZa0zhu8o84zVWQOvUTn
 qIY2tv6GhqzTayBIzd63DjhCM+iXU7EHo7we8x1kFb2G/zjmBu9iRBWv0sLaN/jziluPdD
 7B8qRPGVVzgqbAL1ewBwe956tzsgtQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-JJoj9VMNMdKtvJCr-YEHig-1; Fri, 21 May 2021 13:14:35 -0400
X-MC-Unique: JJoj9VMNMdKtvJCr-YEHig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E86BBEE6;
 Fri, 21 May 2021 17:14:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DDB92B45C;
 Fri, 21 May 2021 17:14:28 +0000 (UTC)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
Date: Fri, 21 May 2021 19:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/2021 16.29, Peter Maydell wrote:
> On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> If you think these tests belong to tests/tcg/, I am OK to put
>> them they, but I don't think adding the Avocado buildsys
>> machinery to the already-complex tests/tcg/ Makefiles is going
>> to help us...
> 
> This does raise the question of what we're actually trying
> to distinguish. It seems to me somewhat that what tests/acceptance/
> actually contains that makes it interestingly different from other
> tests/ stuff is that it's specifically "tests using the Avocado
> framework". On that theory we might name it tests/avocado/.

I think there are two aspects:

1) These tests are using the avocado framework

2) These tests are downloading other stuff from the internet (unlike the 
other tests that we have)

> Or we could just leave it as it is -- is the current naming
> actually confusing anybody? :-)

Yes, I think "acceptance" is rather confusing. So far they haven't been part 
of your PR acceptance tests (well, now they are part of the gitlab-CI, 
though), and it's also not about tests that have been set up by customers, 
which is what you normally think of when hearing "acceptance tests". So a 
different name would be adequate.

I think I'd vote for either "avocado", "avoqado" or "validation".

  Thomas


