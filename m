Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0791730F399
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:03:27 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7eIA-0007mz-3K
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7eBn-0002Hc-Ll
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7eBl-0005BB-Pk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612443409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YK49AZNxjYFR5UobFGYIHo0mhUa5QkrUgH/7dOaxz0=;
 b=OW9F2EDQOfRZyLggnBte5VbMn7Im0Yyxsu2A9WkEE+H0Pag/63I3CJBFo8h0nF5y7oREbv
 LHCMoNU9ZYI3tsC/zuyMi6bGJxGAqJo1obkpx5cHUJJi6OXnZ1scXlet17GBAwFzOIlgQN
 3CSMeE5PDS+slR+NiUakBZxxVq76SkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-F5oq-RPtML66WUtf7Q07lg-1; Thu, 04 Feb 2021 07:56:47 -0500
X-MC-Unique: F5oq-RPtML66WUtf7Q07lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F195107ACC7;
 Thu,  4 Feb 2021 12:56:46 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5ABF5D9F4;
 Thu,  4 Feb 2021 12:56:35 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: Fix the location of virtiofsd.rst
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210203211922.1342203-1-wainersm@redhat.com>
 <dc02482e-35b1-e7b1-a871-1c4475cecb7d@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <490372f2-baad-97f7-ecb2-268cca0837b5@redhat.com>
Date: Thu, 4 Feb 2021 09:56:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <dc02482e-35b1-e7b1-a871-1c4475cecb7d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, dgilbert@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/4/21 4:53 AM, Philippe Mathieu-Daudé wrote:
> On 2/3/21 10:19 PM, Wainer dos Santos Moschetta wrote:
>> The virtiofsd.rst file was moved to docs/tools, so this update
>> MAINTAINERS accordingly.
>>
>> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
> Thanks, but why not directly fix all the files changed by that commit?

I realized that a few minutes after I pressed the send button, but it 
was end of day.

I will send a v2.

Thanks!

- Wainer

>
>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> ---
>>   MAINTAINERS | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)


