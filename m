Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE2278F30
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 18:55:59 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLr0l-0007IN-7A
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 12:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLqzE-0006Mg-C8
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLqzB-0002vz-N9
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:54:20 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601052856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXZWYqwbP4cKR2yVFYnT084PhtF2jtZUBKi1jaIud5c=;
 b=ap2ueDGRwltXsVc+XYYgPYf11dQEA3xIG5LBn5rVFQwQNleNWlE72EkBBqSzd4qESJ46u1
 X8KVhKLloy9Vjhh79BgeyS7S0TiammWBDukbdX1EY8F7WeRC3AHA5erYhNfJoZbfqklxyu
 jNwOfJ8HJihsFYgItlLoWJk66/BxlgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-w-n03_ffOaiKbBn8f7vx7Q-1; Fri, 25 Sep 2020 12:54:14 -0400
X-MC-Unique: w-n03_ffOaiKbBn8f7vx7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63D7D88CE5B;
 Fri, 25 Sep 2020 16:54:13 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00D241002C07;
 Fri, 25 Sep 2020 16:54:12 +0000 (UTC)
Subject: Re: [PATCH v6 00/21] Convert QAPI doc comments to generate rST
 instead of texinfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200925162316.21205-1-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <5d9726b1-e4f7-f9a3-02ca-9f893925c6ce@redhat.com>
Date: Fri, 25 Sep 2020 12:54:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925162316.21205-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.238, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/20 12:22 PM, Peter Maydell wrote:
>   * although there are HTML anchors on all the command/object/etc
>     headings, they are not stable but just serial-number based
>     tags like '#qapidoc-35', so not suitable for trying to link
>     to from other parts of the docs

I suppose this answers my question if qmp commands were going to be able 
to be cross-referenced yet.

I'd love to get that working so I can make smart references in the 
bitmaps doc.

We could even amend the QMP code parser to insert cross-references to 
the function names, which would be *extremely* slick.

--js


