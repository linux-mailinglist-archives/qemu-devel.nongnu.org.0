Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9533AB33
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 06:42:09 +0100 (CET)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfzU-0002ro-Jg
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 01:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLfxD-00023I-MS
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLfxA-0005Qd-2v
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615786783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LWU1jubKjQ1ekK38nCq1Bg5evD2cazmNP98JWpEDLk=;
 b=g4lo/GP9jpMrpAxcAOOWl9jq9b5yqi58J7vFNUKsFzdZVIXIykT3WW/ZCx+/ebFqAI8MZy
 XnJ2xwbgLl33iu5uq5e3HPZxh6sCC1o7n3yC9zNs7lZojV47tKFueJHWkrTvzFHWrS1H3h
 c5wVKbVcZaUCWcBERwYWPHXiFEUi3ME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106--T1mN3YlMTqXtWhO7XhbaQ-1; Mon, 15 Mar 2021 01:39:40 -0400
X-MC-Unique: -T1mN3YlMTqXtWhO7XhbaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4150F1940921;
 Mon, 15 Mar 2021 05:39:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F69C1C4;
 Mon, 15 Mar 2021 05:39:32 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
 <CAFEAcA-fMR8yLC6Y=HSYgpSOrffCYSNnf-0sDQ2RrNWrQff6Ng@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/16] Net patches
Message-ID: <113ed7aa-8999-b925-3df3-2a8d7cd2ad84@redhat.com>
Date: Mon, 15 Mar 2021 06:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-fMR8yLC6Y=HSYgpSOrffCYSNnf-0sDQ2RrNWrQff6Ng@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/03/2021 12.37, Peter Maydell wrote:
> On Fri, 12 Mar 2021 at 06:16, Jason Wang <jasowang@redhat.com> wrote:
>>
>> The following changes since commit f4abdf32714d1845b7c01ec136dd2b04c2f7db47:
>>
>>    Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-docs-xen-updates-100321-2' into staging (2021-03-11 16:20:58 +0000)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to 9bdb56367679e68e5e71a1c29a1087bda6414b25:
>>
>>    pvrdma: wean code off pvrdma_ring.h kernel header (2021-03-12 14:08:31 +0800)
>>
>> ----------------------------------------------------------------
>>
> 
> Hi; this has a merge conflict in net/nic.c relating to
> ID generation: it looks like
> "net: unbreak well-form id check for "-nic" (in this pullreq)

Uh, I haven't seen that patch on the list, when did you send it?

Also what about:

  https://patchew.org/QEMU/20210303095910.78277-1-lekiravi@yandex-team.ru/

... that has been on the list since quite a while already and should maybe 
go into v6.0, too?

  Thomas


