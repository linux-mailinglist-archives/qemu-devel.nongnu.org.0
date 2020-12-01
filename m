Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C92CA21D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:08:12 +0100 (CET)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4S4-0001yy-0P
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kk4Qj-00018N-Vw
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1kk4Qg-0002p1-UP
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606824403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nORtoYhbeyOmmMK+jUkiZ1g9+b1JsIUcdc6SAS0RMA=;
 b=Uhu2sefjRTlAiueeJ8tsOVh7hWbVZtIe9dxa490nwW6bosVtNuhlh62HKG0FzsFzI6brIP
 e2q6qIGmEt/ORGsFQsJfOFEuS2m8xB1cC4E+296rwjtF2d/MxLk+hmKFAHGFsCzNY8jREM
 avAOmhW9MWmYpDX5dyePetQuSgTLdlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-gkdbaZRjO62y0g_XhD7OfA-1; Tue, 01 Dec 2020 07:06:41 -0500
X-MC-Unique: gkdbaZRjO62y0g_XhD7OfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54EFB817B8D;
 Tue,  1 Dec 2020 12:06:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ABAF19C48;
 Tue,  1 Dec 2020 12:06:36 +0000 (UTC)
Subject: Re: Proposal for a regular upstream performance testing
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201130132530.GE422962@stefanha-x1.localdomain>
 <35db4764-22c4-521b-d8ee-27ec39aebd3e@redhat.com>
 <20201201102210.GC567514@stefanha-x1.localdomain>
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Message-ID: <d6b002c6-2e64-ac17-a301-9dd351fdb3a5@redhat.com>
Date: Tue, 1 Dec 2020 13:06:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201102210.GC567514@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ldoktor@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dne 01. 12. 20 v 11:22 Stefan Hajnoczi napsal(a):
> On Tue, Dec 01, 2020 at 09:05:49AM +0100, Lukáš Doktor wrote:
>> Dne 30. 11. 20 v 14:25 Stefan Hajnoczi napsal(a):
>>> On Thu, Nov 26, 2020 at 09:10:14AM +0100, Lukáš Doktor wrote:
>>> What is the minimal environment needed for bare metal hosts?
>>>
>>
>> Not sure what you mean by that. For provisioning I have a beaker plugin, other plugins can be added if needed. Even without beaker one can also provide an installed machine and skip the provisioning step. Runperf would then only apply the profiles (including fetching the VM images from public sources) and run the tests on them. Note that for certain profiles might need to reboot the machine and in such case the tested machine can not be the one running run-perf, other profiles can use the current machine but it's still not a very good idea as the additional overhead might spoil the results.
>>
>> Note that for a very simple issue which do not require a special setup I am usually just running a custom VM on my laptop and use a Localhost profile on that VM, which basically results in testing that custom-setup VM's performance. It's dirty but very fast for the first-level check.
> 
> I was thinking about reprovisioning the machine to ensure each run
> starts from the same clean state. This requires reprovisioning.
> 
> Stefan
> 

Sure, I probably shorten it unnecessary too much. In my setup I am using a beaker plugin that reprovisions the machine. As for others they can either use beaker plugin as well or they can just prepare the machine prior to the execution as described in the previous paragraph.

Regards,
Lukáš


