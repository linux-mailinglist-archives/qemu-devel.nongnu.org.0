Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E423ED41
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 14:22:43 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k41OT-0008MK-TC
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 08:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k41Mw-0007HN-5D
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 08:21:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49942
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k41Ms-00077l-Bk
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 08:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596802860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=S2h1589HJ++cckc43+P93jHpJ6Va1FzM7SyS60POKQ8=;
 b=Y9w4yDZvB2FJBQ+VulogHuL/CHLtcdedRRR5KFYWx78pC0RBWFps38qZ7+E2s/2NlqFIif
 DZPonoq4jUQOD0vZZYQtq6pZicIxpCXknQ2qAAQSHiJfYeiIwuoHLTU8JTo0GFDDd5FZop
 TOgk5WmcWoBdhXy0XW0CheSglCNACRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-qHdkFfqtPb-QK88Qa-oxUQ-1; Fri, 07 Aug 2020 08:20:57 -0400
X-MC-Unique: qHdkFfqtPb-QK88Qa-oxUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 907691DFE;
 Fri,  7 Aug 2020 12:20:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-31.ams2.redhat.com [10.36.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F78387A7D;
 Fri,  7 Aug 2020 12:20:43 +0000 (UTC)
Subject: Re: [DRAFT PATCH 000/143] Meson integration for 5.2
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <761b4058-7a2b-d992-2cc2-6efe654ee62e@redhat.com>
 <9c894412-b156-607e-1ea9-9e9ba14cbf1a@redhat.com>
 <6f6e9c9b-fdf6-951e-9112-3913fe44c455@redhat.com>
 <ac18da61-6f54-b9d4-7591-e1296f9d3a32@redhat.com>
 <353ff6f7-c67f-7665-b631-967512417fa2@redhat.com>
 <fa3570e7-1f2a-c44c-91f2-411c1f51e6ef@redhat.com>
 <d9cc3875-1780-5fcc-5c2a-5408e6aba2e5@redhat.com>
 <cd17b073-57bb-e121-f55e-c89f6e005801@redhat.com>
 <b20db8c2-3201-0172-b6e9-ca1f2c0ef05b@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <80039400-81e7-9c14-60c5-839b0ea5aef4@redhat.com>
Date: Fri, 7 Aug 2020 14:20:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b20db8c2-3201-0172-b6e9-ca1f2c0ef05b@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, philmd@redhat.com,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/2020 13.04, Paolo Bonzini wrote:
> On 07/08/20 12:52, Thomas Huth wrote:
>> Thanks! Now, both, macOS and FreeBSD builds stop with:
>>
>>  ../tests/qtest/meson.build:204:0: ERROR: Unknown variable "dbus_vmstate1".
>>  https://cirrus-ci.com/task/6220295902068736?command=main#L210
> 
> Easy peasy lemon squeezy! :)

Nice, we're getting there, now macOS starts compiling, but then fails here:

 ../contrib/libvhost-user/libvhost-user.c:27:10: fatal error:
'sys/eventfd.h' file not found
../contrib/libvhost-user/libvhost-user.h:21:10: fatal error:
'linux/vhost.h' file not found
 https://cirrus-ci.com/task/5170197348745216?command=main#L810

(and FWIW, there are some weird "file: ... has no symbols" earlier in
the log when running AR on the capstone files)

 Thomas


