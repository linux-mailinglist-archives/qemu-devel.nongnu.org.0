Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1D4EBD01
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:55:30 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZU6z-0004ma-Mb
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:55:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZTzG-0006Ch-R4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZTzD-0003Ig-IY
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648630046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jndXL7Ce0aZtxyFxwwZ4f36hZC/JGJlJJfuxiTLsM7I=;
 b=ejkTLRqEb09zybdzYKo5sa8PupSYiPfcxREl+Mp4JOYGZCv2jTwQ6IKRKozhs8DhnAhBcm
 rOVDAcMYGb8w9PGMJ4AuzJ7JSPVGgWS43uJJvxQ4DNGkKBoXlfmuCzDgo8xsozxP3JvFTZ
 hbyZcP+/O/s42I6PDZNx979PPyclqvQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-jlbxRfC_ODmi8tp7Hu-puQ-1; Wed, 30 Mar 2022 04:47:23 -0400
X-MC-Unique: jlbxRfC_ODmi8tp7Hu-puQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D388F3C1484C;
 Wed, 30 Mar 2022 08:47:22 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB27AC08F11;
 Wed, 30 Mar 2022 08:47:21 +0000 (UTC)
Message-ID: <de982a67-4cb3-4d12-8665-f5fe92215c22@redhat.com>
Date: Wed, 30 Mar 2022 10:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH for-7.1] tests: Drop perl-Test-Harness from the CI
 containers / VMs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220329102808.423681-1-thuth@redhat.com>
 <YkQSkGLb6F7zB10b@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YkQSkGLb6F7zB10b@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ed Maste <emaste@freebsd.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/2022 10.19, Daniel P. Berrangé wrote:
> On Tue, Mar 29, 2022 at 12:28:08PM +0200, Thomas Huth wrote:
>> The perl test harness is not necessary anymore since commit 3d2f73ef75
>> ("build: use "meson test" as the test harness"). Thus remove it from
>> tests/lcitool/projects/qemu.yml, run "make lcitool-refresh" and manually
>> clean the remaining docker / vm files that are not managed by lcitool yet.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Note: This triggers a rebuild of the Centos-stream 8 container when
>>   pushed to gitlab.com - which is however currently failing due to a
>>   completely unrelated problem in the distro. Thus I've marked this as
>>   "for-7.1" for now to avoid disturbing up our 7.0 freeze phase.
> 
> FYI The centos repo issues appear to be resolved this morning.

Thanks, I've restarted the failed amd64-centos8-container job, and indeed it 
is succeeding now:

  https://gitlab.com/thuth/qemu/-/pipelines/503534214

  Thomas


