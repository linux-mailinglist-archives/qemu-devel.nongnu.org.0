Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607A1234AB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 19:21:23 +0100 (CET)
Received: from localhost ([::1]:44888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihHTG-0004GP-CT
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 13:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihHRz-0003f3-92
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:20:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihHRw-0002ED-OP
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:20:01 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihHRw-00020r-KG
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576606799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=0oCB44ImxGjxysxotT94ZHxQmdyxzOuJT5wCRVNxOdE=;
 b=W6IOTw/R4g5ZI7P0knDeDcbTnN6yJ78g1vyU3tTwadKHic4WWaNVDn8qt5fKMv6eiis+X4
 NYPC2+hnhxNPsj+gbXe1nvPLFcwv7nNGrC16Vkj+hH18VpftHMj4ebpHkdP6pLpceBYtl8
 EstPEFy0Vyh3mwd5wgHxjInz4DOZG7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-aF5SWCLtPvutiEwnGBO-ew-1; Tue, 17 Dec 2019 13:19:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AF05107ACC4;
 Tue, 17 Dec 2019 18:19:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-149.ams2.redhat.com [10.36.116.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EA2319C58;
 Tue, 17 Dec 2019 18:19:50 +0000 (UTC)
Subject: Re: QEMU for Qualcomm Hexagon - KVM Forum talk and code available
To: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <BYAPR02MB48863165DEE32E5C563E93F4DE650@BYAPR02MB4886.namprd02.prod.outlook.com>
 <CAL1e-=jvmJNiZR4iLDL-97qm=v+2s0cwn5YTzJQ=JZ_gwOe4tQ@mail.gmail.com>
 <BYAPR02MB4886C8D82898F1E406C124F8DE7E0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <BYAPR02MB48865884056A88B660B620FCDE770@BYAPR02MB4886.namprd02.prod.outlook.com>
 <87d0dw83uz.fsf@linaro.org>
 <BYAPR02MB48866E2D82D9C76ABBECA842DE760@BYAPR02MB4886.namprd02.prod.outlook.com>
 <ffe58977-f251-df34-4bd0-62e32f78cc1a@linaro.org>
 <SN6PR02MB48953397AA553FA7456E7CFCDE700@SN6PR02MB4895.namprd02.prod.outlook.com>
 <BYAPR02MB488640DD7CC887E5FCC0F167DE500@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2654856b-b4b7-c3c4-0919-104854090d81@redhat.com>
Date: Tue, 17 Dec 2019 19:19:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB488640DD7CC887E5FCC0F167DE500@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: aF5SWCLtPvutiEwnGBO-ew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Alessandro Di Federico <ale@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 =?UTF-8?Q?Niccol=c3=b2_Izzo?= <izzoniccolo@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2019 19.14, Taylor Simpson wrote:
> Hi again,
> 
> Per Aleksandar's feedback, I'm finishing up the rewrite of the code imported from the existing Hexagon simulator.  Once I'm finished with that work, I'll start breaking down the code into a patch series.  I have a couple of questions I hope someone would be kind enough to answer.
> 
> Question 1:
> I see this error from checkpatch.pl
> ERROR: Macros with complex values should be enclosed in parenthesis
> However, there are times when the code will not compile with parenthesis.

checkpatch.pl sometimes reports false positives - or things that do not
make sense in all cases, like the parenthesis here. You can simply
ignore the warnings / errors in that case.

 Thomas


