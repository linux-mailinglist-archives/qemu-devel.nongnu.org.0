Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EB363FFC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:58:17 +0200 (CEST)
Received: from localhost ([::1]:55160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRbc-00013z-DG
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYRXU-00056J-Ry
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYRXT-0002OE-7m
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618829638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsBQiSkkg2gQtSBVIMa+d3C944EmKCpM7T4Pwz9FZNo=;
 b=Jyxf+0fXJWSgG+GBDuvMiT9RRii/ka40KZv2FWndkE53NH0qRNJLgrRlGY2lCJgrvxLozI
 4u6x+FLeaOf8veS7CwSvUj2KzMLPrlf2Kvs2RiNESv0pplflJix4ZtSMhXANIWg5t1HHJr
 NzOWha7pphGJ+I5+V+eLVY/AcTlyOxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-pCigovuDMw-SvJj9H3GgtA-1; Mon, 19 Apr 2021 06:53:56 -0400
X-MC-Unique: pCigovuDMw-SvJj9H3GgtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E88E801814;
 Mon, 19 Apr 2021 10:53:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A2B52C15A;
 Mon, 19 Apr 2021 10:53:54 +0000 (UTC)
Subject: Re: [PULL 0/7] queue of proposed rc4 fixes
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210417194205.17057-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <334ee770-65f2-c17a-63b4-40b73de2116d@redhat.com>
Date: Mon, 19 Apr 2021 12:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/04/2021 21.41, Peter Maydell wrote:
> This pullreq contains fixes for the remaining "not fixed yet" issues
> in the 6.0 Planning page:
>   * Fix compile failures of C++ files with new glib headers
>   * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>   * accel/tcg: Fix assertion failure executing from non-RAM with -icount
> 
> None of these are 100% rc4-worthy on their own, but taken all together
> I think they justify rolling another release candidate.

FWIW, I'm in favour of adding them, to make sure that QEMU v6.0 also 
compiles fine on future distros with the new glib headers - this will make 
debugging easier in the future (e.g. when bisecting or when asking people 
whether they can check whether a bug already occurred with v6.0 already 
etc.). Just my 0.02 € of course.

  Thomas


