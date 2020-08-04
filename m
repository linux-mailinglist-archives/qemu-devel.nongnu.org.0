Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50FF23BEAF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 19:12:15 +0200 (CEST)
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k30U2-0004qX-TK
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 13:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k30NZ-0004Fh-7w
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:05:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28299
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k30NW-00065P-Fq
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596560729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=F+QTjG3S+sqQJNwnn/71NjaYCiJ8pEyMyNC4iNinYwU=;
 b=fhcYIKE9d2pjlrr587YZovoWG1/LTTjs/2WmKXI+7EiOZiD2C9nelfGgqSnMX68dU7d4pn
 tgYYecLIDWz9j0yWZKvSRIlVOJsrMoc9o5l1XW2BJt7ODK2zapvJfYJfver54VjhKB3N0S
 ntzGsnQ/pdnD1cVOFGDxnULat8t/1cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-TgOE6obSODyQPYpHw2Op9A-1; Tue, 04 Aug 2020 13:05:25 -0400
X-MC-Unique: TgOE6obSODyQPYpHw2Op9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82AC98017FB;
 Tue,  4 Aug 2020 17:05:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F7910013D0;
 Tue,  4 Aug 2020 17:05:18 +0000 (UTC)
Subject: Re: [PATCH 00/11] Run cross-compilation build tests in the gitlab-CI
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200804170055.2851-1-thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5641dab1-faf6-7323-65f0-f7185d5169a1@redhat.com>
Date: Tue, 4 Aug 2020 19:05:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200804170055.2851-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/08/2020 19.00, Thomas Huth wrote:
> Now that we can use all our QEMU build containers in the gitlab-CI,
> we can also run the cross-compilation jobs there. Of course, some
> problems have to be fixed first, since apparently nobody was running
> "make check-build" for QEMU for 32-bit big endian targets or MinGW
> recently...
> 
> As a bonus, the last two patches also enable WHPX builds with our
> debian-win64-cross container, so that we can compile-test this accelerator
> code now, too.

I forgot to mention: A test run can be found here:

 https://gitlab.com/huth/qemu/-/pipelines/174203171

 Thomas


