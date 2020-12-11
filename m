Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394B52D79DC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:51:05 +0100 (CET)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkhE-0006dh-6X
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkdR-0002wK-FG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:47:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkdP-0005AI-PZ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607701626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0Q1n0yHHDwxbXDOfXvK0HJVg/RLE7lDfjjLgx5+wGk=;
 b=JAOW/idX28QlKOGFfmiQpVeqcQdeXbxqgff98hTUFStjH5FGkvSTv/gsjwP+HvNGmEMY+/
 sC/LNxbxRA4ws4WHSQJj9eW+zA9PFrNcO4OrNabvngVfRUPvwxkZ2m2MH4Cg9E4S2ok058
 XSOF6M33nYfPhXp1Bnu2ezVsMyTVAKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-0Dfe0KuFO2qLKsRQ06kNKg-1; Fri, 11 Dec 2020 10:47:02 -0500
X-MC-Unique: 0Dfe0KuFO2qLKsRQ06kNKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24AE6801817;
 Fri, 11 Dec 2020 15:47:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 480595F9A6;
 Fri, 11 Dec 2020 15:46:58 +0000 (UTC)
Subject: Re: [PATCH 04/12] hw/timer/renesas_tmr: silence the compiler warnings
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-5-thuth@redhat.com>
 <CAFEAcA8BAdXL=N-OF8AxUGJMjY0zyDPotAWqT3+xQZgwz6swVA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9e30b7a1-108c-c46e-ffe4-cb1e1fb58084@redhat.com>
Date: Fri, 11 Dec 2020 16:46:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BAdXL=N-OF8AxUGJMjY0zyDPotAWqT3+xQZgwz6swVA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 16.38, Peter Maydell wrote:
> On Fri, 11 Dec 2020 at 15:24, Thomas Huth <thuth@redhat.com> wrote:
>>
>> From: Chen Qun <kuhn.chenqun@huawei.com>
>>
>> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
>> ../hw/timer/renesas_tmr.c: In function ‘tmr_read’:
>> ../hw/timer/renesas_tmr.c:221:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>   221 |         } else if (ch == 0) {i
>>       |                   ^
>> ../hw/timer/renesas_tmr.c:224:5: note: here
>>   224 |     case A_TCORB:
>>       |     ^~~~
>>
>> Add the corresponding "fall through" comment to fix it.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>> Message-Id: <20201028041819.2169003-10-kuhn.chenqun@huawei.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/timer/renesas_tmr.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
>> index 446f2eacdd..e03a8155b2 100644
>> --- a/hw/timer/renesas_tmr.c
>> +++ b/hw/timer/renesas_tmr.c
>> @@ -221,6 +221,7 @@ static uint64_t tmr_read(void *opaque, hwaddr addr, unsigned size)
>>          } else if (ch == 0) {
>>              return concat_reg(tmr->tcora);
>>          }
>> +        /* fall through */
>>      case A_TCORB:
>>          if (size == 1) {
>>              return tmr->tcorb[ch];
> 
> Yes, but maybe we should just get the patch that
> refactors this code in instead ?

I think that patch had a bug in it:

 https://lore.kernel.org/qemu-devel/28b04149-bbd9-12ed-0e40-3c3da9fee672@redhat.com/

So I was hoping that Yoshinori Sato would send a new version or at least a
reply with a clarification, but I've never seen a response... so for the
time being, I'd suggest to go with Chen Qun's patch instead, which certainly
does not hurt.

 Thomas


