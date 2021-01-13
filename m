Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265B2F5273
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:40:04 +0100 (CET)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzl3r-0005Zv-I0
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzkw6-0001Vr-GO
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzkw4-0004MV-HP
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610562719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4BbMg+NNhYK8wxQ5stAgqVAcyLCpqM2rqz7/ONAJ0g=;
 b=hctxTuH1wyl/zPtpE5jV/q0ZWaKfvupdewOoG1iuWhQ+K5fqjyXJghLaaVFkitawOhromL
 Bz1ZbMC0aNfVODnRpt34KEZi51PN7EY8hunrn7WgvlW6UarN5nbV9Lr9BPQK5/PK4DcxgS
 drlqFciNHjokGwS++otI0S1/LVjiQYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-crduaOvIOM2iZaPRvOKfSQ-1; Wed, 13 Jan 2021 13:31:57 -0500
X-MC-Unique: crduaOvIOM2iZaPRvOKfSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF3B25235;
 Wed, 13 Jan 2021 18:31:56 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EC575C3E9;
 Wed, 13 Jan 2021 18:31:53 +0000 (UTC)
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
To: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
 <6a08e9f5-7cd7-c2c8-4b61-5466a4ffb2ec@redhat.com>
 <20210113100956.xuyvmxayh5xytja3@sirius.home.kraxel.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <88f80fb6-62ad-77ca-4047-b1c79fd6a006@redhat.com>
Date: Wed, 13 Jan 2021 13:31:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113100956.xuyvmxayh5xytja3@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 5:09 AM, Gerd Hoffmann wrote:
>    Hi,
> 
>> I don't like Perl really, but there's a chicken-and-egg problem between
>> detecting Python and using it to print the configure help script.  For
>> configure-time tasks, Perl has the advantage that "#! /usr/bin/env perl"
>> just works.
> 
> Assuming perl is actually installed, the world seems to shift to python.
> On a minimal fedora install python is present but perl is not ...
> 
> On the other hand git depends on perl, so it is probably pretty hard to
> find a developer workstation without perl installed, so maybe that
> doesn't matter much for the time being.
> 
> take care,
>    Gerd
> 

I agree that it doesn't matter much right now, Though I don't always 
have git installed in containers when I am doing builds. It will become 
more common to encounter environments that are missing "obvious" 
dependencies.

This was just an "FYI" experiment. :)

--js


