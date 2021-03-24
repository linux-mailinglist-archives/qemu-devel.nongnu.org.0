Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46DF347186
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:19:13 +0100 (CET)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOwrI-0006pI-Mm
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwpB-0006AZ-ML
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwp6-0002AW-Sy
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616566614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=685/wzeWZlYfnfnvDiyBoIrtgTcKYyA9KUAjUhKX7+g=;
 b=apWd5/vc/wmY+ZQWu3IpZYnWgiyFqBjy94RVvBhOMSX9Vdf24hC6Pi31/mn2eKaZ8zA39M
 7Xwc5IzfvKT0/cQe4z5g6BW/hjI+JlbpIso8Z4tJ2DpLln9T3h4qGK/4ULE6ut53TTvG7S
 TBR6iarpAsoQMenYlWwqNkalO/YhilY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-h5JacImHO6u_fgDTZq2Rbg-1; Wed, 24 Mar 2021 02:16:52 -0400
X-MC-Unique: h5JacImHO6u_fgDTZq2Rbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8A6087A826;
 Wed, 24 Mar 2021 06:16:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31E0960C05;
 Wed, 24 Mar 2021 06:16:48 +0000 (UTC)
Subject: Re: [PATCH v2] MAINTAINERS: Fix tests/migration maintainers
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
References: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0b3c39c2-c34e-d4d2-a43d-f932d4128baa@redhat.com>
Date: Wed, 24 Mar 2021 07:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/2021 09.07, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> when executing the following scripts, it throw error message:
> $ ./scripts/get_maintainer.pl -f tests/migration/guestperf.py
> get_maintainer.pl: No maintainers found, printing recent contributors.
> get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
> 
> add the tests/migration to the "Migration" section of MAINTAINERS
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25fc49d1dc..d3f3edb47d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2724,6 +2724,7 @@ F: tests/vmstate-static-checker-data/
>   F: tests/qtest/migration-test.c
>   F: docs/devel/migration.rst
>   F: qapi/migration.json
> +F: tests/migration/
>   
>   D-Bus
>   M: Marc-André Lureau <marcandre.lureau@redhat.com>
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


