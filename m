Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51122F39F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 17:17:13 +0200 (CEST)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k04sK-0000pY-G3
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 11:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k04qK-0006r7-1m
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:15:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45183
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k04qI-0000U7-4y
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 11:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595862905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=ZjOpt7J5RtsUWFP7gVcN7zDto+W5N/XIH8lRVFsYw1o=;
 b=Y83B79pk21j48azqHMnB7piikp66eXD/2GPUEhbvIw1mBJZILVskFiPNUCZGi6rXmvnZCb
 lKPrxLSDk0ouVvgdXyPsEEm0+wn6EZqwXndje+jsMRa0xz/T5V3YYWD1DM3Xux6f536omN
 uQc2TrGVoX2ZHU4haHYaps7WBZpSMUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-mlCbEVolP0aojD7zG2XzFQ-1; Mon, 27 Jul 2020 11:15:03 -0400
X-MC-Unique: mlCbEVolP0aojD7zG2XzFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1B1F79EC2;
 Mon, 27 Jul 2020 15:15:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-156.ams2.redhat.com [10.36.112.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF9C15C679;
 Mon, 27 Jul 2020 15:14:59 +0000 (UTC)
Subject: Re: [PATCH 2/3] cirrus.yml: Compile macOS and FreeBSD with -Werror
To: Ed Maste <emaste@freebsd.org>
References: <20200724143220.32751-1-thuth@redhat.com>
 <20200724143220.32751-3-thuth@redhat.com>
 <CAPyFy2A-7gLhsCAdAohdnm9BDcHyR2y7EZK2nAKTkp0zYtYC9w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d5b702de-9066-dc9a-6514-2fcfcda9df55@redhat.com>
Date: Mon, 27 Jul 2020 17:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPyFy2A-7gLhsCAdAohdnm9BDcHyR2y7EZK2nAKTkp0zYtYC9w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 01:46:13
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/07/2020 18.14, Ed Maste wrote:
> On Fri, 24 Jul 2020 at 10:32, Thomas Huth <thuth@redhat.com> wrote:
>>
>> Compiler warnings currently go unnoticed in our FreeBSD and macOS builds,
>> since -Werror is only enabled for Linux and MinGW builds by default. So
>> let's enable them here now, too.
> 
> Reviewed-by: Ed Maste <emaste@freebsd.org>
> 
> for the FreeBSD change; I'm indifferent on which method is used to
> address the macos deprecation warnings.

Thanks!

I think I'll split the FreeBSD change from the macOS changes, since
macOS apparently needs some more work... (I'll have a try with Daniel's
suggestion to use libsasl2 from Homebrew there...)

 Thomas


