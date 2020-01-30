Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4AF14DD86
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 16:05:31 +0100 (CET)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixBNq-0001rF-Ps
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 10:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixBMp-0000wC-Lh
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:04:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixBMo-0001H3-Fa
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:04:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38026
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixBMo-0001Ga-CD
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580396666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrZYG2dU+7Yy44Yg9ZBQmtVS8OaS6IWm8G+/XSMFDkE=;
 b=H3kqiepp2WZsPuwxkL7JGYlYWwcl1z8SLaOvDgT99hhjOQyYz0RB2SZtyfVYmc323Ekt5J
 zufzyCjs7SJ32hzKf6lHoqPX8vG65CsmOJzAWcDmXcP2BsUfwRd/nKFS/32/SwO1nVdVoy
 pscmAOASdfyWwVPqOEkl1ujRHR4x7Xw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-au6ystr0MUCnTr9A-7v6TQ-1; Thu, 30 Jan 2020 10:04:08 -0500
Received: by mail-wm1-f70.google.com with SMTP id b133so1127792wmb.2
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 07:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H+pA3NLtlRLp/xXGeaDKzY9dGlJ8lliR+4HjYXaDfcw=;
 b=JlKXUF1hCL/pV4htY1aMO9QwDxUcieevhZTwS2GS2B64A33xQs23Idnpimju1KDV6e
 dldX50GfS5YmMRkmyN2G209wtYK5/X6pgOru+1RSaUnFJ9tPEaAsnJxzOxS5NGY/MGhh
 u+rvO0H0AFzijoGdn/rIVeJzeVesMWdJhTZGm/mMuz/Eewp7oAnRVzVk6Zc7fGLxglwe
 I1KYLGBQgVLOTTPvTiX893MDkdSXH1qxzL9rbIuqcnqUNGLGwCfSK4sNT+v9HUVnTVMg
 ks5fpbE33328W2OKle4F2n5XCMReoJKLfEAiX0p9R2Dndin+193qa3pBo98UNMAGjN1Z
 8nKA==
X-Gm-Message-State: APjAAAVuZpz8S8Drgn320dhqomSk+579Ke2s0qk3ddDT6ZHD836nZT8g
 qCw9FMSblQjEzCFWNNEh3LTvVYFsnNqxxlNi0gUTb4l2qyRqFqssFXDvcRn/6W9dl6F/G/b3Nx2
 ri8D6EAELg3L5T68=
X-Received: by 2002:a5d:610a:: with SMTP id v10mr5959393wrt.267.1580396647549; 
 Thu, 30 Jan 2020 07:04:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKd8yaN6Raqr8KT6xqQ2scRw/p2O+KF9xHnhwrBF0+vxeB4t7HGXk3dHQMXFcRtXNZS03LOw==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr5959349wrt.267.1580396647092; 
 Thu, 30 Jan 2020 07:04:07 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id v14sm7826521wrm.28.2020.01.30.07.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 07:04:06 -0800 (PST)
Subject: Re: [PATCH 00/10] python: Explicit usage of Python 3
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200129231402.23384-1-philmd@redhat.com>
 <0a858225-685d-3ffd-845c-6c1f8a438307@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c90ce40e-428a-ed5e-531f-b2ca99121dfc@redhat.com>
Date: Thu, 30 Jan 2020 16:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0a858225-685d-3ffd-845c-6c1f8a438307@virtuozzo.com>
Content-Language: en-US
X-MC-Unique: au6ystr0MUCnTr9A-7v6TQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/20 3:02 PM, Vladimir Sementsov-Ogievskiy wrote:
> First, thanks for handling this!
>=20
> 30.01.2020 2:13, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hello,
>>
>> These are mechanical sed patches used to convert the
>> code base to Python 3, as suggested on this thread:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg675024.html
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daud=C3=A9 (10):
>> =C2=A0=C2=A0 scripts: Explicit usage of Python 3
>> =C2=A0=C2=A0 tests/qemu-iotests: Explicit usage of Python 3
>> =C2=A0=C2=A0 tests: Explicit usage of Python 3
>> =C2=A0=C2=A0 scripts/minikconf: Explicit usage of Python 3
>> =C2=A0=C2=A0 tests/acceptance: Remove shebang header
>> =C2=A0=C2=A0 scripts/tracetool: Remove shebang header
>> =C2=A0=C2=A0 tests/vm: Remove shebang header
>> =C2=A0=C2=A0 tests/qemu-iotests: Explicit usage of Python 3
>> =C2=A0=C2=A0 scripts: Explicit usage of Python 3
>> =C2=A0=C2=A0 tests/qemu-iotests/check: Update to match Python 3 interpre=
ter
>>
>=20
> Could you please not use same subject for different patches? Such things=
=20
> are hard to manage during patch porting from version to version.

I can change but I'm not understanding what you want.

>=20
> Also, will you update checkpatch.pl, to avoid appearing unversioned=20
> python again?

I'm not sure I can because checkpatch.pl is written in Perl, but I'll try.


