Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A442A813A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 15:46:41 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kagXA-0000RS-1u
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 09:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kagRd-0005u7-9J
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 09:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kagRZ-0000Bi-HZ
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 09:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604587252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46b2Ln5T4yfP7ivtlpaxogrQmmY6KWusok8TKCkzq8Q=;
 b=FM1zdGRJabG2SrqMvAWDQQ7zccEKZ4aUqS2zdkBT1E9mHnauKjd7PYXho8XkAz7KxgZbcJ
 WwPykZa/yRoTTF3EXQLCQ0wcJ8UqBnxkURIPZfJJAnLGvX85uzIZYenYBUBIOpmT/9Xwb5
 kLxX8tuGP4bbK2oaqo+Cwyk7uuzjWXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-N6894LTWMuG2XPI0plPxgQ-1; Thu, 05 Nov 2020 09:40:45 -0500
X-MC-Unique: N6894LTWMuG2XPI0plPxgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 774DA8DF0C4;
 Thu,  5 Nov 2020 14:40:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B6051002C28;
 Thu,  5 Nov 2020 14:40:40 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] block: enable libnfs on msys2/mingw in cirrus.yml
To: luoyonggang@gmail.com
References: <20201013001545.1958-1-luoyonggang@gmail.com>
 <20201013001545.1958-3-luoyonggang@gmail.com>
 <2e501256-001e-a9c4-305c-f178d1b53137@redhat.com>
 <CAE2XoE9datOEr3T391pPmQbD_8bKZgAL_hVoEonojVn-e0Z8PQ@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <77b9c0cd-ddd0-71ef-5480-a61fa2fc039e@redhat.com>
Date: Thu, 5 Nov 2020 15:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9datOEr3T391pPmQbD_8bKZgAL_hVoEonojVn-e0Z8PQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-level <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.11.20 13:32, 罗勇刚(Yonggang Luo) wrote:
> 
> 
> On Thu, Nov 5, 2020 at 7:43 PM Max Reitz <mreitz@redhat.com 
> <mailto:mreitz@redhat.com>> wrote:
>  >
>  > On 13.10.20 02:15, Yonggang Luo wrote:
>  > > At the begging libnfs are not enabled because of compiling error,
>  > > now it's fixed so enable it
>  > >
>  > > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com 
> <mailto:luoyonggang@gmail.com>>
>  > > ---
>  > >   .cirrus.yml | 1 +
>  > >   1 file changed, 1 insertion(+)
>  > >
>  > > diff --git a/.cirrus.yml b/.cirrus.yml
>  > > index f42ccb956a..2c6bf45e6d 100644
>  > > --- a/.cirrus.yml
>  > > +++ b/.cirrus.yml
>  > > @@ -109,6 +109,7 @@ windows_msys2_task:
>  > >             mingw-w64-x86_64-cyrus-sasl \
>  > >             mingw-w64-x86_64-curl \
>  > >             mingw-w64-x86_64-gnutls \
>  > > +          mingw-w64-x86_64-libnfs \
>  > >             "
>  > >           bitsadmin /transfer msys_download /dynamic /download 
> /priority FOREGROUND `
>  > > 
> https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz 
> <https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz> 
> `
>  >
>  > I’d love to test this, unfortunately git.qemu.org 
> <http://git.qemu.org> has some issues now
>  > and so I can’t run Cirrus tests. :/
>  >
>  > I suppose I’ll retry when git.qemu.org <http://git.qemu.org> works again.
>  >
>  > Max
>  >
> Maybe we arealdy switched to gitlab?

I hope not, or it would be really sad that I didn’t notice...

Max


