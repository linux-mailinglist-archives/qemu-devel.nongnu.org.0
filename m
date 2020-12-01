Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD92C98CB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:07:02 +0100 (CET)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk0gf-0007VX-5a
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kk0fh-000742-MX
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:06:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kk0ff-0002HV-Kt
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606809957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmIBdPx94UBrba7a7JThz84dHOvc+77PFkBCc8rSSU4=;
 b=d1fb/Edpqml4itBRk4CoV0G9g/xDoNQdS6P1PnD88jynosOsOM6A9NmSf3TaZd3ZxlOjeM
 VWQefY8KIcP6rMsd3x+rP5ehARnY6y0cjXFWrdZPMRVkHphLInTX3Mjz0pqYMwYze30SX0
 7a7ZtzKLLLRMhfyu+mfMt7HKDF/g4YA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-y3V1D_0KMGSX-WWPtH0psA-1; Tue, 01 Dec 2020 03:05:55 -0500
X-MC-Unique: y3V1D_0KMGSX-WWPtH0psA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABC98184214F;
 Tue,  1 Dec 2020 08:05:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7247C60BE2;
 Tue,  1 Dec 2020 08:05:50 +0000 (UTC)
Subject: Re: Proposal for a regular upstream performance testing
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201130132530.GE422962@stefanha-x1.localdomain>
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Message-ID: <35db4764-22c4-521b-d8ee-27ec39aebd3e@redhat.com>
Date: Tue, 1 Dec 2020 09:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130132530.GE422962@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ldoktor@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dne 30. 11. 20 v 14:25 Stefan Hajnoczi napsal(a):
> On Thu, Nov 26, 2020 at 09:10:14AM +0100, Lukáš Doktor wrote:
>> The problem with those is that we can not simply use travis/gitlab/... machines for running those tests, because we are measuring in-guest actual performance. We can't just stop the time when the machine decides to schedule another container/vm. I briefly checked the public bare-metal offerings like rackspace but these are most probably not sufficient either because (unless I'm wrong) they only give you a machine but it is not guaranteed that it will be the same machine the next time. If we are to compare the results we don't need just the same model, we really need the very same machine. Any change to the machine might lead to a significant difference (disk replacement, even firmware update...).
> 
> Do you have a suggested bare metal setup?
> 
> I think it's more complicated than having a single bare metal host. It
> could involve a network boot server, a network traffic generator machine
> for external network iperf testing, etc.
> 

Yes. At this point I only test host->guest connection, but run-perf is prepared to test multi-host connection as well (tested with uperf, but dedicated traffic generator could be added as well). Another machine is promised but not yet on the way.

> What is the minimal environment needed for bare metal hosts?
> 

Not sure what you mean by that. For provisioning I have a beaker plugin, other plugins can be added if needed. Even without beaker one can also provide an installed machine and skip the provisioning step. Runperf would then only apply the profiles (including fetching the VM images from public sources) and run the tests on them. Note that for certain profiles might need to reboot the machine and in such case the tested machine can not be the one running run-perf, other profiles can use the current machine but it's still not a very good idea as the additional overhead might spoil the results.

Note that for a very simple issue which do not require a special setup I am usually just running a custom VM on my laptop and use a Localhost profile on that VM, which basically results in testing that custom-setup VM's performance. It's dirty but very fast for the first-level check.

> Stefan
> 

Regards,
Lukáš


