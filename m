Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252B1155CF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:53:59 +0100 (CET)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGrd-00075S-Pn
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1idF7f-0001zc-8L
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1idF7e-00080h-4w
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:02:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32988
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1idF7W-0007wN-So
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575644531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=v5I2XxKynJXHzkNzlungqK0QoLjvP9xZNGd2WScRMmg=;
 b=UGGlXt4fCyeZpGhhPNE/74EZUwtXkTKRXYrJr+C4BVE48lQW3VQODJW7ILv+AvEUnpeJAI
 NT5pNoMiKRcasmrNVp/T0L20M4Z49XLSwyEOhSszBn1UIp70ceq00NvS3BMNoe0ZGjMNh9
 akNbpvSeOwhdaxHeDiOrf3013Yhshno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-comSJQENNWC0Ur7LW0pgzA-1; Fri, 06 Dec 2019 00:59:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 999D4800EB9;
 Fri,  6 Dec 2019 05:59:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-97.ams2.redhat.com [10.36.116.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC691600D1;
 Fri,  6 Dec 2019 05:59:37 +0000 (UTC)
Subject: Re: [PATCH v2 3/7] iotests: Skip test 079 if it is not possible to
 create large files
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191204154618.23560-1-thuth@redhat.com>
 <20191204154618.23560-4-thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e65160e7-c286-08a4-0311-6a20461e4f28@redhat.com>
Date: Fri, 6 Dec 2019 06:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204154618.23560-4-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: comSJQENNWC0Ur7LW0pgzA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-block@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 Eric Auger <eric.auger@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/12/2019 16.46, Thomas Huth wrote:
> Test 079 fails in the arm64, s390x and ppc64le LXD containers on Travis

For the record: It's working on s390x as noticed by Cleber. It's only
failing on arm64 and ppc64le. After fixing the problem with 060 which
fails on all three architectures, I did not pay enough attention when I
wrote this commit message here and thought that this would be the very
same problem, but apparently it is working on s390x. Thus "s390x" should
be removed from the commit message.

 Thomas


