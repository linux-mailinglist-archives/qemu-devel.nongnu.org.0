Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA926FB80
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 13:33:28 +0200 (CEST)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJEdq-0002Dq-MK
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 07:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJEce-0001hA-Tw
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 07:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJEcc-0004A7-Ox
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 07:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600428729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikrSFIB4HXEzBCp026lBHLP66YrI7BjHJIgihn9le/0=;
 b=WR+mMGmweEVyDY8QETJhfGfbi1bnRvqIFYMkz5KNTY6rVQSfoGIA+bSS5kv90yibtYp7ZX
 1GbK51PTCJ8JWqEtnBAOoOwFH+Z191rr3RfPlXjj/JTVONcCPimO2uMhA2p4/skq4qw9tj
 DH/jyLsMCBF8kcp4Ve3UGYrKKy564tI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-BN2BPLEyPwauK04BVbfrEw-1; Fri, 18 Sep 2020 07:32:05 -0400
X-MC-Unique: BN2BPLEyPwauK04BVbfrEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E691008565;
 Fri, 18 Sep 2020 11:32:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92ECA78802;
 Fri, 18 Sep 2020 11:32:03 +0000 (UTC)
Subject: Re: [PULL 00/24] qtests, unit tests and Cirrus-CI fixes / improvements
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200916114731.102080-1-thuth@redhat.com>
 <CAFEAcA8VyUYJnE3aji6zPQGPD-K+iVGwVNbygYypr+NpSzZBPw@mail.gmail.com>
 <7c21af54-342f-2a29-f700-3b1d3bbd5bc6@redhat.com>
 <CAFEAcA_HZZoec6_gE01+WfGXqd2BXrHo6fFcsitAC=ge1uLFjg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3b1a7cea-b000-9029-1420-706ebf628e39@redhat.com>
Date: Fri, 18 Sep 2020 13:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_HZZoec6_gE01+WfGXqd2BXrHo6fFcsitAC=ge1uLFjg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.869, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/09/2020 17.30, Peter Maydell wrote:
> On Thu, 17 Sep 2020 at 16:29, Thomas Huth <thuth@redhat.com> wrote:
>> Ok, sounds like I should respin my patch here:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg04476.html
>>
>> ... and could you install a newer version of bash via homebrew on your
>> system?
> 
> I could in theory, but I don't really want to replace the system bash,
> because this machine is not solely there to run the QEMU tests.

Would it maybe be possible to install it in a different location, and
only use it for your merge tests?

 Thomas


