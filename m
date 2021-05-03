Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC5371539
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:25:48 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXdy-000815-In
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldXcD-0007Xd-85
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldXcA-0004bh-6b
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620044632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErsexQrXf9PM6J8wB0j6ppXCiIjc0/yEX3HdxXTrfjg=;
 b=CaQykggK9feMr0368ICbQGdbZ4t7k0aRh0wrczSIdXS4e31DoXmdruaFfrj5AHguJ4oaJU
 GO1Y9W74gxTCE3cCGTw5pzytlMMNhizV2fHRgs4vWesImsxs2T1Ga0By0P2zAgs5mtEnJr
 OoVseOR/yshM6yxKOaaDoiPb63R84Js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-leTqzMPZNAebZfi0hQurOg-1; Mon, 03 May 2021 08:23:49 -0400
X-MC-Unique: leTqzMPZNAebZfi0hQurOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9200A192AB70;
 Mon,  3 May 2021 12:23:48 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-107.ams2.redhat.com
 [10.36.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87CA5610DF;
 Mon,  3 May 2021 12:23:47 +0000 (UTC)
Subject: Re: [PATCH v4 0/5] qemu-iotests: quality of life improvements
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210503110110.476887-1-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <22dbf1a0-1d16-0a1c-d98f-52e679338f06@redhat.com>
Date: Mon, 3 May 2021 14:23:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503110110.476887-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.05.21 13:01, Paolo Bonzini wrote:
> This series adds a few usability improvements to qemu-iotests, mostly
> for Python unittest-based tests.  In particular:
> 
> - the output of the unittest framework is not buffered, which makes it
>    easier to follow the "-d" output of the tests
> 
> - arguments can be passed to Python unittests scripts, for example
>    to run only a subset of the test cases (patches 1-2)
> 
> - it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
>    and specify arbitrary arguments to be passed to a single test script.
>    This is especially useful together with the previous feature and eases
>    the debugging of Python tests.
> 
> Paolo
> 
> v3->v4: output of Python tests regenerated when needed

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Max


