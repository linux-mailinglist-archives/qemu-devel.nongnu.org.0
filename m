Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4313C45AE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 08:44:54 +0200 (CEST)
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2pgT-0003JP-Em
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 02:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m2pfG-0002cF-Va
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 02:43:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m2pfD-0006F9-Um
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 02:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626072214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+SSX419Cjc1rtrghp4m3CIlJOmT6khdkpiU4G2hrIc=;
 b=aHDmEcWJPp8NMbDL1+9LBhpFThvCVF0MWOsiaFZIUl39e4LstYje2+/XRIZ5dsVw49aQ+y
 8GxpsAeGtRuy3gP7fvmfm+5rC2LZLfLbGT+XOetCLt1U2eeEntiiGe0U91rfW2APmcRyhe
 NCxMKRKbBcYe3lMXpXnDujnESs4/cso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-gBvUcaP1ORayhx1-LIg1cQ-1; Mon, 12 Jul 2021 02:43:31 -0400
X-MC-Unique: gBvUcaP1ORayhx1-LIg1cQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F2E910C1ADC;
 Mon, 12 Jul 2021 06:43:30 +0000 (UTC)
Received: from localhost (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4A3010372E4;
 Mon, 12 Jul 2021 06:43:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/17] s390x update for softfreeze
In-Reply-To: <CAFEAcA-LvjTqp2u6Lj31Dy1X_E5rN=giUfo7W3ghU+ayKMsLeQ@mail.gmail.com>
Organization: Red Hat GmbH
References: <20210708151909.907124-1-cohuck@redhat.com>
 <CAFEAcA96yLiVh-gSxZdW1kNvmJHarqNH_p3HXtpp41gQ6eDuZA@mail.gmail.com>
 <87k0lzecjs.fsf@redhat.com>
 <CAFEAcA-LvjTqp2u6Lj31Dy1X_E5rN=giUfo7W3ghU+ayKMsLeQ@mail.gmail.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 12 Jul 2021 08:43:22 +0200
Message-ID: <87h7h0doc5.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 11 2021, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 9 Jul 2021 at 16:23, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Fri, Jul 09 2021, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> > On Thu, 8 Jul 2021 at 16:19, Cornelia Huck <cohuck@redhat.com> wrote:
>> >>
>> >> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>> >>
>> >>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>> >>
>> >> are available in the Git repository at:
>> >>
>> >>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210708
>> >>
>> >> for you to fetch changes up to 7ab3eb42b0d795f7321c4fca0ea06cb76a005b04:
>> >>
>> >>   target/s390x: split sysemu part of cpu models (2021-07-07 14:01:59 +0200)
>> >>
>> >> ----------------------------------------------------------------
>> >> s390x updates:
>> >> - add gen16 cpumodels
>> >> - refactor/cleanup some code
>> >> - bugfixes
>> >>
>> >> ----------------------------------------------------------------
>> >>
>> >
>> > Hi -- this doesn't seem to be signed with the GPG key I have
>> > on record for you. If I need to do an update, could you let me
>> > know which keyserver you've uploaded to, please?
>>
>> Whoops, forgot to upload. Sent out to keys.openpgp.org right now.
>
> I still can't see it -- can you double-check, please?

Hum. Now sent out to pgp.mit.edu and keyserver.ubuntu.com as well, in
case something went wrong.

[This is a new ed25519 subkey.]


