Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06822F52AE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:49:51 +0100 (CET)
Received: from localhost ([::1]:37332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlDK-0003RQ-N3
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzl8r-0001dR-6m
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzl8o-00008D-Dy
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610563507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IH5B2J118R82PWEVXcBcFKetzhwyK96Q82PZXfFWEr4=;
 b=MGkxzi3G8y1d8zDV6yLfVlZJJeI1ssnKPWnNTzBztrDh0451VlV+eAVlYRYQIxwSv5NsOg
 b+MiGPEzO+ptkCPYoXiLXlTgZ4d/B7YT1qfkVsntDN+p7xk+1044Qg4l0TUT+OyAQyvd0t
 xeFp1QkiIeJ+luxNlCbY7qh9TXIbFAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-CdM8OzolPZegzcbCn5OcDw-1; Wed, 13 Jan 2021 13:45:03 -0500
X-MC-Unique: CdM8OzolPZegzcbCn5OcDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4887815720;
 Wed, 13 Jan 2021 18:45:02 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B39CF60BF1;
 Wed, 13 Jan 2021 18:45:00 +0000 (UTC)
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
To: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <c1e768d9-24fe-f414-f684-1b1c908c09ce@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <9d5478ef-a46c-83e7-0b02-abcf723cb885@redhat.com>
Date: Wed, 13 Jan 2021 13:44:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c1e768d9-24fe-f414-f684-1b1c908c09ce@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 3:20 AM, Paolo Bonzini wrote:
> On 12/01/21 23:37, John Snow wrote:
>> - our configure file suggests bzip2 is an optional dependency (It's 
>> set to 'auto') but meson will error out if it is not present at 
>> configuration time:
>>
>>      ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found
> 
> Yes, the configure option is for libbzip2, not bzip2.
> 
> Perhaps bzip2 could be required only if get_option('install_blobs') is 
> true, I don't know.
> 

Oh, right. Library vs tool. Good point.

Yes, we should make the tool required somewhere in the configure jungle.

>> FROM alpine:latest
>>
>> ENV PACKAGES \
>>      wget \
>>      xz \
>>      python3 \
>>      ninja \
>>      gcc \
>>      musl-dev \
>>      pkgconfig \
>>      glib-dev \
>>      pixman-dev \
>>      make \
>>      bash \
>>      perl
>>
>> ENV QEMU_CONFIGURE_OPTS --disable-linux-user
>>
>> RUN apk add $PACKAGES
>>
>> RUN wget https://download.qemu.org/qemu-5.2.0.tar.xz && \
>>      tar xvJf qemu-5.2.0.tar.xz
>>
>> WORKDIR /qemu-5.2.0
>> RUN ./configure $QEMU_CONFIGURE_OPTS && \
>>      make -j9
> 
> This should be added to the CI!
> 

Apparently someone else is working on an Alpine linux patchset, so I 
suppose something like this will be included there.

If not, feel free to take it:

Signed-off-by: John Snow <jsnow@redhat.com>

However, yes, I would like to include some build smoke tests for CI, 
which just cover "configure && make" with the absolute minimum set of 
dependencies possible. We could rebase our more fully fledged tests on 
top of them to share the common layer.

Not a priority for me, but I'm keeping these little dinky dockerfiles 
around to use as smoke tests against fedora:latest, alpine:latest, etc. 
I should likely expand to CentOS stream, debian, and so on to catch 
early breakages.

>> - diffutils is required for the qapi-schema test, which runs at build 
>> time. 
> 
> This is not required by meson because technically it is not needed 
> except for "make check".
> 

Is that true? I was just running "make". qapi-schema test does run at 
build time to make sure that the schema pre-processing occurred correctly.

> Perhaps we could do
> 
> -if build_docs
> +if build_docs and diff.found()
> 
> in tests/qapi-schema/meson.build.
> 
> Paolo
> 

I wasn't building docs, I don't think. (No sphinx and no --enable-docs.)

--js


