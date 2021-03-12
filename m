Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D7338B7B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:29:54 +0100 (CET)
Received: from localhost ([::1]:39266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfzN-0006hF-6p
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKfxk-0005Lp-3x
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKfxi-0006ka-My
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615548490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5lMaXbu+qG8FxHXTd2WKCa5R2v9w1aouwf52jyQZx4=;
 b=aYA+vTt7JUwD8HZ1LG63BBzGKjG5OnjwnB5GX7ICk2/wMpsZX04C/J34+/5oSt+qP2xJHq
 Q9k6wGOv3l17P+XJTOOxu+5r+tz7dkx9QHsK1iwWm8a3anmWB3WONqWwXveSbOjuNm+kqT
 uWB/CiPubFAAHKaz2BSV1XB+jkJ4WxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-1l4_OJRsOxmn2LuAAaM4vw-1; Fri, 12 Mar 2021 06:28:06 -0500
X-MC-Unique: 1l4_OJRsOxmn2LuAAaM4vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4F4A800D55;
 Fri, 12 Mar 2021 11:28:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A720310016FC;
 Fri, 12 Mar 2021 11:28:02 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] tests/qtest: Add test for Aspeed HACE
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Laurent Vivier <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-4-joel@jms.id.au>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <954fff32-bedc-ec29-1d71-fe37cbcd093c@redhat.com>
Date: Fri, 12 Mar 2021 12:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312105711.551423-4-joel@jms.id.au>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/2021 11.57, Joel Stanley wrote:
> This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
> the currently implemented behavior of the hash functionality.
> 
> The tests are similar, but are cut/pasted instead of broken out into a
> common function so the assert machinery produces useful output when a
> test fails.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3: Write test without libqtest-single.h

Thanks!

Acked-by: Thomas Huth <thuth@redhat.com>


