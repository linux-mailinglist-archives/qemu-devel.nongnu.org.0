Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39530F217
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:29:10 +0100 (CET)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cov-0004iA-56
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7cnI-0003nN-ST
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:27:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7cnH-0006L1-Be
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612438046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCsTXkZD1/T5w4BCd+1yOOaWXakj5qZ8M+TbWELIfVk=;
 b=EpQ4GFQpLY1M7CeCBD+CBfmdthcjxrxcsxuJl5xgDzbd8U7KeU17ATzf+9lGWaZVpgA93R
 4wcck1X7zLa1KDUkgKo5FytrU6HuNFoG6SkhF3qldpQsnUyMZ0pRwE1aYZZtM9bSEmfW4J
 TyCU93AgZd1kuvcwXeNi7PTjLqiZGio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-gHAKTu_DNpO0J8QKa9wHiQ-1; Thu, 04 Feb 2021 06:27:23 -0500
X-MC-Unique: gHAKTu_DNpO0J8QKa9wHiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA5E8107ACC7;
 Thu,  4 Feb 2021 11:27:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5CE6F968;
 Thu,  4 Feb 2021 11:27:11 +0000 (UTC)
Subject: Re: [PATCH v4 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating
 CI)
To: Cleber Rosa <crosa@redhat.com>
References: <20201019015003.1527746-1-crosa@redhat.com>
 <e253800c-815c-d561-1fd7-ac9b581c5b2b@redhat.com>
 <20210203210603.GB1432466@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <06951c19-f342-91c1-c24f-c48d8e5cc423@redhat.com>
Date: Thu, 4 Feb 2021 12:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203210603.GB1432466@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2021 22.06, Cleber Rosa wrote:
> On Thu, Jan 28, 2021 at 12:51:20PM +0100, Thomas Huth wrote:
[...]
>> Could you elaborate on what's left to do to get the s390x and aarch64
>> runners enabled, and rebase your patches if necessary
> 
> Basically what's needed is to enable the jobs, meaning committing the
> relevant snippets to the "gitlab-ci.{yml,d/*}" files.
> 
> Both ansible playbooks have been run on both machines, so the gitlab-runner
> and tooling to build QEMU are in place.  The gitlab-runners have also
> been registered on the "qemu-project/qemu" GitLab repo.
> 
> I'll send a rebased/updated version of the playbooks, gitlab-ci.yml
> configurations, etc.  In it, I'll propose that we enable the jobs, but
> ignore errors for now (allow_failure: true), because it'll ease the
> review.  Once the jobs prove mature, waiving of failures can be
> removed.
> 
> How does that sound?

Sounds good, please go ahead!

  Thanks,
   Thomas


