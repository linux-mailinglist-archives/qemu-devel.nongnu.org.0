Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114912D7641
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:10:23 +0100 (CET)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniBh-0000Nr-Kt
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kniAl-0008QA-Vr
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:09:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kniAj-0007je-5Y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607692158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gS+wYwQ38YGkLb7GQYPV2iAE6sxSlpvzK7clMEF5mao=;
 b=cd6PdOaXvRwamaDC2BF0ZtKRGdf6m62p2+iCz19/d/VCpGqvNunBsVzM4T9WL75M48fYJO
 iHOrN/Wuf+O5iylnsnB2wf+iifmiY9XnB7HsP2epxJrgzhNddUcgPJDzm5mjWcPcncEM5Y
 2w0eC0U0eSgKj2AugXhSzmWHoWzy0Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-O6Jk7vAWNeCf5Bppwe7SMw-1; Fri, 11 Dec 2020 08:09:16 -0500
X-MC-Unique: O6Jk7vAWNeCf5Bppwe7SMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 021F6107ACE4;
 Fri, 11 Dec 2020 13:09:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 428695D9CC;
 Fri, 11 Dec 2020 13:09:09 +0000 (UTC)
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: AL Yu-Chen Cho <acho@suse.com>, qemu-devel@nongnu.org
References: <20201116113046.11362-1-acho@suse.com>
 <20201124094535.18082-1-acho@suse.com>
 <d2a307da-d8c4-7ebc-cba0-abcd65e1c580@redhat.com>
 <ec5b267368e6b1936b697b8190aa04325f5aa673.camel@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <926da98d-e885-31b1-3e05-a06d37a24947@redhat.com>
Date: Fri, 11 Dec 2020 14:09:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ec5b267368e6b1936b697b8190aa04325f5aa673.camel@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: fam@euphon.net, lyan@suse.com, philmd@redhat.com, wainersm@redhat.com,
 brogers@suse.com, cfontana@suse.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 10.32, AL Yu-Chen Cho wrote:
> Hi Thomas,
> 
> I try to reproduce this failed in my repo, but it seems works fine.
> Would you please give it a try again? I think you maybe just hit a bad
> point in time...

I just re-tried, but it still fails for me:

 https://gitlab.com/huth/qemu/-/jobs/905376471

Did you also rebase your branch to the latest master version?

 Thomas


