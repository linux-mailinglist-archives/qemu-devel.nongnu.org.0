Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7381D7008
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 07:00:05 +0200 (CEST)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaXsi-0006XA-6F
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 01:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXrw-0005uL-51
 for qemu-devel@nongnu.org; Mon, 18 May 2020 00:59:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42581
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXrv-0002xn-92
 for qemu-devel@nongnu.org; Mon, 18 May 2020 00:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589777954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uBr//4QnTqzgzfasriS59H7Pucuae5VUl8UVsRRASQA=;
 b=XmfOLLKWlNvaJlSwzlag5H6nEE3Y3ljdahwns3l+ua/05TSiQeHurKWAGU4JrDvQH5k25g
 /fRGkGmTilnvmdkH1p9Qu/ayLNlAel9EFfItJdQDwABEQVNurK/xOojRx19UmEzK2NmMq4
 B1Hh06g0/aTZgsgFv3MBy5kaxEp8oB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-t1rg3X-ZNoanbZQKrxJ0tQ-1; Mon, 18 May 2020 00:59:07 -0400
X-MC-Unique: t1rg3X-ZNoanbZQKrxJ0tQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BDF48014D7
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 04:59:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF1A5C1C8;
 Mon, 18 May 2020 04:59:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F37FC11358BC; Mon, 18 May 2020 06:59:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Onboard audio devices and -audiodev none
References: <87pnb5r82b.fsf@dusky.pond.sub.org>
 <20200515083456.vqf4zskk37ycu7te@sirius.home.kraxel.org>
Date: Mon, 18 May 2020 06:59:01 +0200
In-Reply-To: <20200515083456.vqf4zskk37ycu7te@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Fri, 15 May 2020 10:34:56 +0200")
Message-ID: <87y2ppj0tm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 23:32:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Fri, May 15, 2020 at 09:06:20AM +0200, Markus Armbruster wrote:
>> Watch this:
>> 
>>     $ aarch64-softmmu/qemu-system-aarch64 -S -nodefaults -accel qtest -display none -M vexpress-a15 -audiodev none,id=foo
>>     audio: Device lm4549: audiodev default parameter is deprecated, please specify audiodev=foo
>> 
>> I did, didn't I?
>
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20200429110214.29037-13-kraxel@redhat.com/

I don't immediately understand how that addresses my issue, but I trust
it does :)


