Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E342B45EF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:35:36 +0100 (CET)
Received: from localhost ([::1]:46980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kefbU-00057U-1W
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kefZw-0004X0-1A
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:34:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kefZt-0007g7-D1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605537236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMjHWkaUogV8kmId/9AtqVBdQ3z2mMu/a555HUu6U40=;
 b=dfQNvyNhd3HW3x/SUfPc9oU7q8Aq3mqvghFWPATAPFjtF2/Yw9g+U2ov7ygtiMXJmOVv+0
 UwyAlLv29sSppY1g774vMsxYpi8GRbhNbtvCOW3OBrAT8BajPavRJlzinqxhblxvXBO0lD
 yWLR8QlFnDsziXmwBvut5ImX91/iEPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-pSE7KwDhMu2u8wzbdejdZw-1; Mon, 16 Nov 2020 09:33:52 -0500
X-MC-Unique: pSE7KwDhMu2u8wzbdejdZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF609801FDA;
 Mon, 16 Nov 2020 14:33:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-126.ams2.redhat.com [10.36.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDFCC1002D59;
 Mon, 16 Nov 2020 14:33:43 +0000 (UTC)
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <CAFEAcA9nF=RFnjFoC6b3iCN2Cu_QFsWHzouiK4EZ8TFb6cZaeg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9958130f-b6cd-ca91-f0af-9e3a916bfc8b@redhat.com>
Date: Mon, 16 Nov 2020 15:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nF=RFnjFoC6b3iCN2Cu_QFsWHzouiK4EZ8TFb6cZaeg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/2020 14.31, Peter Maydell wrote:
> On Mon, 16 Nov 2020 at 13:28, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Well, this is not an usable device but a part of a bigger device,
>> so here we want the opposite: not list this device in any category.
>>
>> Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
>> types so management apps can filter them out? (And so we are sure
>> all QOM is classified).
>>
>> Thomas, you already dealt with categorizing devices in the past,
>> what do you think about this? Who else could help? Maybe add
>> someone from libvirt in the thread?
> 
> If we could get to the point where we can assert() that
> dc->categories is non-zero in class init, we would be able
> to avoid further "forgot to categorize device" bugs getting
> into the tree in future, which seems like an argument for
> having some way of marking "really just an implementation
> detail" devices I guess?

IMHO we need:

  assert(dc->user_creatable == false ||  categories != 0)

then we don't need something like DEVICE_CATEGORY_COMPOSITE.

 Thomas


