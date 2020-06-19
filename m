Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451952000A8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 05:20:22 +0200 (CEST)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jm7Zk-0003T9-Ty
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 23:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jm7Ym-00033A-AQ
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 23:19:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23394
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jm7Yj-0005U0-Hz
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 23:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592536755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F98O4Cx8K592qkFZivu8amx2XOMZxG72Ez1xTerjfpk=;
 b=c08v+Ex/A+Yo1tvAcOzcx/SRBYyHkEIuRvpZwDBw/FmiqN2VbIEKkA/12hkrn1R42lIV5M
 FzjSB98uXQjbUbBsDsykLYG1Jevbw05rBi/6lsnduohBKDtc7f7+9xPV2G0sALemdF1Fn7
 MYOYwlQTFbBv5PRlEKaZGtiuXtY6Szk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-XP5ftaEuOYqpIlro7w4WUQ-1; Thu, 18 Jun 2020 23:19:11 -0400
X-MC-Unique: XP5ftaEuOYqpIlro7w4WUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9538E107ACF4;
 Fri, 19 Jun 2020 03:19:10 +0000 (UTC)
Received: from [10.72.13.37] (ovpn-13-37.pek2.redhat.com [10.72.13.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C2CC5C1BB;
 Fri, 19 Jun 2020 03:19:08 +0000 (UTC)
Subject: Re: [PULL V2 00/33] Net patches
To: qemu-devel@nongnu.org
References: <159248913721.23362.5273483564160951801@d1fd068a5071>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <610e9438-1524-5708-7181-7e9801f14ec8@redhat.com>
Date: Fri, 19 Jun 2020 11:19:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159248913721.23362.5273483564160951801@d1fd068a5071>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 23:19:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/6/18 下午10:05, no-reply@patchew.org wrote:
> /tmp/qemu-test/src/tests/qht-bench.c:287:29: error: implicit conversion from 'unsigned long' to 'double' changes value from 18446744073709551615 to 18446744073709551616 [-Werror,-Wimplicit-int-float-conversion]
>          *threshold = rate * UINT64_MAX;
>                            ~ ^~~~~~~~~~
> /usr/include/stdint.h:130:23: note: expanded from macro 'UINT64_MAX'
> ---
> 18446744073709551615UL
> ^~~~~~~~~~~~~~~~~~~~~~


Cc Emilio.

This looks an issue not related to this pull request.

Thanks


