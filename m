Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934CE39AABB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 21:13:01 +0200 (CEST)
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1losm4-0007eU-JF
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 15:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loskj-0006vm-HT
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loski-00044b-0f
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622747495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QW4KDCoatJ2cmHhF3ugS+xZTq7+wkziXMwqDOuceWto=;
 b=Qka/7sZf9bDC84+i4dnwWgS6Kxm0CJTleDRXdB9mIe1ulz/atT2AMYUL/5V3hllo2pjWBA
 EGv9r6NcwjF0tSG06aNJKAlQjbb+TKSeHQxDehOqd//Mp84lNSKfBnsjI8pUanvgJNExjS
 ZFbSB2nnk6tzOEJy+QpT07SU2czsHLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-WcAmT1PtOoGpJumPqh3W-A-1; Thu, 03 Jun 2021 15:11:33 -0400
X-MC-Unique: WcAmT1PtOoGpJumPqh3W-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE6E8801B14;
 Thu,  3 Jun 2021 19:11:32 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A71221B528;
 Thu,  3 Jun 2021 19:11:28 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
 <b9166bbc-0201-af02-d54b-af4638525ceb@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ae5c5066-cefc-1a29-9729-d0bafae5c8f5@redhat.com>
Date: Thu, 3 Jun 2021 15:11:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b9166bbc-0201-af02-d54b-af4638525ceb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 3:26 AM, Philippe Mathieu-Daudé wrote:
> I haven't reviewed earlier version, but I wonder about the "build from
> sources" use case (this is not a template for distributions but for the
> mainstream project), so maybe add:
> 
>    ## Build environment (in case you built QEMU from source)
>    - configure script command line: (e.g. ./configure --enable-nettle
> --disable-glusterfs --disable-user)
>    - configure script summary output

Maybe just a little bit too much information. Even though I am pushing 
people to build from source, I actually think more reports are likely 
not to have done so.

We can always ask a follow-up question if we can't reproduce without the 
specific configuration and a good reporter will reply ;)

--js


