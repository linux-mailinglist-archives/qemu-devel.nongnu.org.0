Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C6226A459
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 13:46:28 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI9Po-0003sK-04
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 07:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kI9Nw-0002Ow-35
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 07:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kI9Nu-0003pK-H0
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 07:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600170269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzMsUYm9uhwWpQJISt+2gqd+mvnvoN36wLifvZIfttA=;
 b=EuNLnM9gLh3AKVN1eWCdO//rMqw5ptjfVsbed5Wjqo+g4QWBVsfakIE7Tb7p6ln8nPh9fu
 qom2ruIzF/p0yCaWmY463Ig8iHtVEtwEznSl6EP+/q+zeCh1kjMH4q4GK/6DEAmfWpLLBp
 234x6qbHdLMLuFSw9cEygQds5lv5ZgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-j-pjgVICMCmjEuhZn11m2g-1; Tue, 15 Sep 2020 07:44:26 -0400
X-MC-Unique: j-pjgVICMCmjEuhZn11m2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E41F8010EB;
 Tue, 15 Sep 2020 11:44:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8AD05DC17;
 Tue, 15 Sep 2020 11:44:17 +0000 (UTC)
Subject: Re: [PATCH v8 27/27] Revert "configure: add --ninja option"
To: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo
 <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20200912224431.1428-1-luoyonggang@gmail.com>
 <20200912224431.1428-28-luoyonggang@gmail.com>
 <34306ec4-bafb-20dc-f90f-ff320fa4b575@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4b60c854-d11c-28fb-57cf-e6e922e57df1@redhat.com>
Date: Tue, 15 Sep 2020 13:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <34306ec4-bafb-20dc-f90f-ff320fa4b575@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:23:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Max Reitz <mreitz@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2020 16.08, Paolo Bonzini wrote:
> On 13/09/20 00:44, Yonggang Luo wrote:
>> This reverts commit 48328880fddf0145bdccc499160fb24dfabfbd41.
>>
>> The --ninja option doesn't need anymore because of upgrade meson to 0.55.2
>> At that version we can use ninjatool
> 
> We might actually get rid of ninjatool before QEMU 5.2 goes out, if we
> decide to make Ninja a mandatory build dependency.  So we can hold on
> patches 26 and 27.  Thanks for testing though!
> 
> I'm also not sure about patch 16, since that's not my area, but Daniel
> and Ed both reviewed it so that's okay.
> 
> Finally, instead of checking !_WIN32 it's better to check CONFIG_POSIX
> or CONFIG_WIN32.  That can be changed on commit though.
> 
> Everything else seems okay.  I'll wait a couple days and queue the whole
> bunch up to patch 25.

Patch 13 definitely needs a replacement, and I think patch 2 should
likely go through the block tree instead...

But I recently started to experiment with these patches, too, and I
think I got a reasonable subset now which should be OK for getting
merged (e.g. disabling NFS and the crypto test in the CI for now). I'll
take those through my testing tree. The remaining work can then be done
on top later.

 Thomas


