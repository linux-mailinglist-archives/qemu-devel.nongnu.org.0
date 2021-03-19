Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB96341DB9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:08:02 +0100 (CET)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNErB-0005cy-Tu
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNEpl-0004n0-8B
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNEph-0000Lx-Ul
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616159189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yTgRrINJonAtco3i7NVt6A5XuZqMvkn+D9W3oiGZic=;
 b=ZELxuC9wly/87W1E3Z8hqNhqWmXpGlA7eH2zr6hID9i+CGQDkp83K3XIqR7zjaazpSAzvU
 /imppuBH7A5xKvUOZ486ajTdzls3S2bfUPPG7Q938YjDzetla2IlVnnWxbdgJ/OobjRubV
 GMw1gfmhdM4PdKV3A/dT3Du/fEGr35E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-_CEYbA_9PiCePAM3Av_oBA-1; Fri, 19 Mar 2021 09:06:27 -0400
X-MC-Unique: _CEYbA_9PiCePAM3Av_oBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62382107ACCA;
 Fri, 19 Mar 2021 13:06:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56CBD60C5E;
 Fri, 19 Mar 2021 13:06:21 +0000 (UTC)
Subject: Re: Serious doubts about Gitlab CI
To: Markus Armbruster <armbru@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <87v99nl52n.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <58d0a768-2a59-949a-051e-143e05493601@redhat.com>
Date: Fri, 19 Mar 2021 14:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87v99nl52n.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/2021 13.07, Markus Armbruster wrote:
> Andrew Jones <drjones@redhat.com> writes:
> 
>> On Fri, Mar 19, 2021 at 09:33:43AM +0000, Stefan Hajnoczi wrote:
>>> On Thu, Mar 18, 2021 at 09:30:41PM +0100, Paolo Bonzini wrote:
>>>> On 18/03/21 20:46, Stefan Hajnoczi wrote:
>>>>> The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
>>>>> GitLab Merge Requests so that anyone can submit a merge request and get
>>>>> CI coverage.
>>>>
>>>> Each merge request consumes about 2500.  That won't last long.
>>>
>>> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
>>> on slow machines or if we'll hit the same issue with dedicated runners.
>>> It seems like CI optimization will be necessary...
>>>
>>
>> We need to reduce the amount of CI we do, not only because we can't afford
>> it, but because it's wasteful. I hate to think of all the kWhs spent
>> testing the exact same code in the exact same way, since everyone runs
>> everything with a simple 'git push'.
> 
> I normally refrain from posting +1s, but I feel this message really
> needs "plussing": right you are!  This kind of wastefulness has bothered
> me a lot.

Patches for a more intelligent CI setup are certainly welcome!

  Thomas


