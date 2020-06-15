Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E111F9043
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 09:48:11 +0200 (CEST)
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkjql-00086O-1i
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 03:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jkjpF-00077b-9E
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 03:46:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40822
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jkjpD-00083q-NW
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 03:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592207195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=YTksqmLz2hyIGuCxM0o7pJrO8M7woYo400HpiU8R8w0=;
 b=JgYR7drA6ObFbV2G2C+yRkwviCPm+T7a6z16bANyEzqBN8eD6AbH0lV+JC5oMdWZAjxFBs
 0mNwQMFTrHU/jbYXE5kPswOXfHkG/8XnF8MzTtgI3ZZ0ZP+o94reqBqqQ3vUre8uW6i1ai
 LYyuGaSuTukcnxpgy86sA5bsNd3HASs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-vlEMd_zANrGFaDcgZb_cWA-1; Mon, 15 Jun 2020 03:46:23 -0400
X-MC-Unique: vlEMd_zANrGFaDcgZb_cWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414E6BFCB;
 Mon, 15 Jun 2020 07:46:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-111.ams2.redhat.com [10.36.112.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B42CD1001E91;
 Mon, 15 Jun 2020 07:46:17 +0000 (UTC)
Subject: Re: [PATCH v2] Makefile: Remove generated files when doing
 'distclean' (and 'clean')
To: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191008082815.8267-1-thuth@redhat.com>
 <CAL1e-=gYkhM99Ee0LxZJ5dCjeEdC08G4_Tm3WCZpCSWvJ=b26Q@mail.gmail.com>
 <4bfea125-eb63-f4a2-bca0-bce462f73d89@redhat.com>
 <CAFEAcA_+V7SNsxPSgsd04s8f7PnP3qdyXMp6NvS2inHjE08pJw@mail.gmail.com>
 <CAL1e-=ijjbTG19NHnsDrcJdb7kajBdcndMT8JXymqC6UViiitQ@mail.gmail.com>
 <770c89b9-44d1-0982-34ff-1830911ac413@redhat.com>
 <89c5b73f-2294-b58a-85e0-5ed64926fb0c@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <39b7e711-be6f-d6d3-5cad-49052970d804@redhat.com>
Date: Mon, 15 Jun 2020 09:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <89c5b73f-2294-b58a-85e0-5ed64926fb0c@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/14 22:37:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2020 09.13, Paolo Bonzini wrote:
> On 15/06/20 07:17, Thomas Huth wrote:
>> That depends ... Marc-André, Paolo, what's the status of the meson patch
>> series? Do you think it will be merged for the next release already? If
>> so, it does not make much sense to respin my distclean patch. Otherwise
>> I could do another iteration...
> 
> I prefer to aim for 5.2, making it the very first series merged there
> and forcing everyone else to rebase.

Ok, so I think it's likely really not worth the effort to respin this
rather cosmetic patch just for one single release.

Aleksandar, I won't work on this patch anymore, but if it is still
important for you, feel free to take the patch and send an updated version.

 Thomas


