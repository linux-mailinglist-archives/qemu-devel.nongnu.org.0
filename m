Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDAE44AAC8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:47:38 +0100 (CET)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNj7-0008EN-Rb
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:47:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkNi6-0007XW-27
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkNhq-0004Bd-1n
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636451176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urmnNIRpXCGizDTDHx/0C4jkzHPb1pO0Yz7pJNvwgfg=;
 b=ExEgGYUEPuzEF4WHDsQ8IB7aBPSXo/KFTSN+AZibasaqdS+iguAmZYKbMwTZfVhRVLI2mJ
 sJL7hhuMsIA0faaPcokaGYYDd/SqNZgv//g5ClrN7gkPRLMgz4M2Ogp7W8UhhubH3QPuSP
 SM/k0hf3qjSXOoTwaIQJ7P1b3TugN/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Cgj3-f5WPBK8mcKy6AZDQA-1; Tue, 09 Nov 2021 04:46:13 -0500
X-MC-Unique: Cgj3-f5WPBK8mcKy6AZDQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7672E80415C;
 Tue,  9 Nov 2021 09:46:12 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB321105501E;
 Tue,  9 Nov 2021 09:45:19 +0000 (UTC)
Message-ID: <4e540821-9bc2-77b5-ad70-ebc5df53e039@redhat.com>
Date: Tue, 9 Nov 2021 10:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Cirrus-CI all red
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.364, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/2021 10.39, Philippe Mathieu-Daudé wrote:
> FYI, as of today, the latest merge history is red (last 10 days):
> https://cirrus-ci.com/github/qemu/qemu
> 
> If we want to keep using this, we should somehow plug it to
> GitLab-CI (i.e. Travis-CI is run as an external job there) so
> the project maintainer can notice job failures.

Well, considering that all the cirrus-run based jobs are currently failing 
due to the non-working API token, that does not seem to work very well either.

> Alternatively the windows job could be passed to GitLab:
> https://docs.gitlab.com/ee/ci/runners/runner_cloud/windows_runner_cloud.html

See:

  https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg02474.html

... the problem is again that the shared runners are only single-threaded, 
so it's incredibly slow, especially if you have to re-install MSYS2 each 
time. I once tried to improve the patch by caching the MSYS2 installation, 
but it did not work that well either... (but if somebody wants to continue 
my work, I can rebase and send it out again, just let me know).

  Thomas


