Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A3150891
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 15:40:32 +0100 (CET)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyctr-0001Wi-Fb
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 09:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iycst-000154-Mh
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:39:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iycsr-0007Sa-MU
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:39:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52504
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iycsr-0007OL-GB
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580740768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=kY3t97L71xzi8fB7TcPoigQgFTo8MMItePrGk3ptCe4=;
 b=fZC+hkr0QX1P6mJcqzSwRMRE9A/VKrQ5ML24tdruGeqQXYPKcR+G5Fr8UvmCRJ6KsUG/Fi
 5g1HwZV5Q/DQEdVbj4PfsL50FVcHk1WM31BUMEaHr0IwZCE3ZQ7mA0n89XGZHJRrz1Gz1g
 9359Prxa/uVhBNlnce7tFZvqaATeDlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-E8be7v8qPRur-jRDIELQuw-1; Mon, 03 Feb 2020 09:39:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8958E190D374;
 Mon,  3 Feb 2020 14:39:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-129.ams2.redhat.com [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4471560BF1;
 Mon,  3 Feb 2020 14:39:17 +0000 (UTC)
Subject: Re: [qemu-web PATCH v2] Update the documentation links to point to
 our generated docs
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200203141346.11790-1-thuth@redhat.com>
 <CAFEAcA9cy=-AMCOXmz1NnkApuGfyo=qPZj726haaO12ERiu_Cw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <168659ef-62bf-6caa-886a-4134fc1f8de6@redhat.com>
Date: Mon, 3 Feb 2020 15:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9cy=-AMCOXmz1NnkApuGfyo=qPZj726haaO12ERiu_Cw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: E8be7v8qPRur-jRDIELQuw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2020 15.34, Peter Maydell wrote:
> On Mon, 3 Feb 2020 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
>>
>> We are now providing the generated QEMU documentation files directly
>> on our www.qemu.org webserver, so we should link to these files now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v2: Do not link to qemu-doc anymore, use the index page instead
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks, pushed now: https://www.qemu.org/documentation/

 Thomas


