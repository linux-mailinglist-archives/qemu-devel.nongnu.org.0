Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5EF2FB653
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:24:26 +0100 (CET)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qzh-0002LG-Ls
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l1qtN-0007K1-7D
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:17:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l1qtI-00009t-AJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611062266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQpFEoTh7XB3BevEq4rulKxR/9MGalimJwNMsp9Za+c=;
 b=RBZJHT7DaQPHLZjV0nugott1OvLzpQTylRjC28klRfkYtNfd4Lu29D1C7KOgaK/e+j9CZo
 PC3P2rzL5wjjYwaVxUELuP8PS4xE/jQFLFhxhJrJOW4tguv9AKG7qvehjxHvMNu6AwLwF5
 7QQkfSQe8zTaoyRu18uQWq2Tt3lxtEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-qzTqL9BmPsC1VOpWENTvuQ-1; Tue, 19 Jan 2021 08:17:42 -0500
X-MC-Unique: qzTqL9BmPsC1VOpWENTvuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 587B2190D341;
 Tue, 19 Jan 2021 13:17:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-176.ams2.redhat.com
 [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66C8C5D6D1;
 Tue, 19 Jan 2021 13:17:40 +0000 (UTC)
Subject: Re: git://git.qemu.org/qemu.git now pulls from gitlab
To: Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <93d438bc-4e41-5d97-9759-bfbf455fcf83@redhat.com>
 <CAEUhbmWrp_GfZbH9fUZw_in2FuxD-Azmaoy7ytP87XvU+zpA-g@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <65034866-20d5-97fd-e5d6-a65f9f47450b@redhat.com>
Date: Tue, 19 Jan 2021 14:17:39 +0100
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWrp_GfZbH9fUZw_in2FuxD-Azmaoy7ytP87XvU+zpA-g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/19/21 13:25, Bin Meng wrote:
> On Tue, Jan 19, 2021 at 8:01 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The qemu.git repository on git.qemu.org is now a mirror of gitlab. The
>> git mirror is updated every 15 minutes.
>>
>> New changes to qemu.git therefore must go through
>> git@gitlab.com:qemu-project/qemu.git.
>>
>> As a result, the "qemu" and "qemu-stable" groups on the qemu.org server
>> do not exist anymore.  The following repositories are now read only (no
>> one can push to them):
>>
>> - qemu-jeos.git (last commit Wed Jan 18 10:22:32 2012 -0600)
>> - qemu-stable-0.10.git (last commit Mon Aug 31 04:58:19 2009 -0400)
>> - qemu-stable-0.14.git (last commit Wed May 4 13:50:56 2011 -0500)
>> - qemu-stable-0.15.git (last commit Thu Nov 22 17:19:35 2012 +0100)
>> - qemu-stable-1.0.git (last commit Sun Feb 19 16:31:27 2012 -0600)
>> - qemu-stable-1.1.git (last commit Wed Sep 5 10:38:39 2012 -0500)
>> - qemu-stable-1.2.git (last commit Tue Dec 11 15:09:44 2012 -0600)
>> - qemu-stable-1.3.git (last commit Mon Jan 28 10:38:28 2013 -0600)
>> - qemu-stable-1.4.git (last commit Thu May 23 17:12:44 2013 -0500)
> 
> I see the following error in a previously cloned repo:
> 
> $ git fetch origin
> fatal: remote error: access denied or repository not exported: /qemu.git
> 
> $ git remote -v
> origin  git://git.qemu.org/qemu.git (fetch)
> origin  git://git.qemu.org/qemu.git (push)
> 
> Is this expected?
> 
> Looks I need to set-url to the new gitlab URL?

No issues on my end, using the same fetch URL.

Laszlo



