Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924722FF35B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:42:56 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ev1-0005MT-CM
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2eie-000540-Kc
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:30:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2eiZ-0006FO-PK
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611253803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=al1XAK42PqbcHlGfsm6MRwJnbdk1ouuBdZtUtAfjb9w=;
 b=GqPZHz9kteIpXFHnNFWz2xJ2NTAEun9zDBHXRXf9OHwHFSLKn4pM+yAsKyG+j8srqPWs/r
 zyI9kNlFQm8DSfntkOS3aGcidLWMVuzv7JKmrzEQb+6UuXM2G81EdBn2HTsJbt8ieuefDQ
 8H0LbxSHZo+T9H+HoLcEOLbfVocHj9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-gtTTvaeKP2mzuVtrj8p4Mw-1; Thu, 21 Jan 2021 13:30:01 -0500
X-MC-Unique: gtTTvaeKP2mzuVtrj8p4Mw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C6EA107ACE6;
 Thu, 21 Jan 2021 18:30:00 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB68860BF3;
 Thu, 21 Jan 2021 18:29:55 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] gitlab-ci: Test building linux-user targets on
 CentOS 7
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210121172829.1643620-1-f4bug@amsat.org>
 <20210121172829.1643620-3-f4bug@amsat.org>
 <88c1ddbd-d93d-01e4-abfa-78b395ac4d36@redhat.com>
 <CAAdtpL66OP4WdKT--wzvWswPeeDmJVESU4qxjWrMUpbQWjbeCQ@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ab7ad25a-ea26-0db0-da98-3e328c61464f@redhat.com>
Date: Thu, 21 Jan 2021 15:29:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL66OP4WdKT--wzvWswPeeDmJVESU4qxjWrMUpbQWjbeCQ@mail.gmail.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/21/21 3:20 PM, Philippe Mathieu-Daudé wrote:
> On Thu, Jan 21, 2021 at 6:45 PM Wainer dos Santos Moschetta
> <wainersm@redhat.com> wrote:
>> On 1/21/21 2:28 PM, Philippe Mathieu-Daudé wrote:
>>> Add a configuration tested by Peter Maydell (see [1] and [2])
>>> but not covered in our CI [3]:
>>>
>>>     [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>>>     FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>>>     ../linux-user/strace.c: In function 'do_print_sockopt':
>>>     ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
>>>              case IPV6_ADDR_PREFERENCES:
>> Why the following builder did not catch that issue?
>>
>> build-user:
>>     <<: *native_build_job_definition
>>     variables:
>>       IMAGE: debian-all-test-cross
>>       CONFIGURE_ARGS: --disable-tools --disable-system
>>       MAKE_CHECK_ARGS: check-tcg
> It uses a different base image, debian-all-test-cross, which is based
> on Debian 10.
>
> Packages are more recent than CentOS 7.
> QEMU aims to support the 2 latest releases from major distribs.
> CentOS 7 is likely the oldest.


Oh sorry, my emails filters aren't working fine so I missed Daniel's 
reply on talking about it. Thanks for explaining again. :)

- Wainer

>


