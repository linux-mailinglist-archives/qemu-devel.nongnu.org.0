Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2D330878
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:53:33 +0100 (CET)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9lk-0001eO-I1
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9iI-0006ji-6V
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9iG-0008O0-7l
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615186192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXO9TdXcQ2FJeAwc8lmcD3GJGQnUTEEqU0eoDviLn5g=;
 b=DeH5OaJ1NIZDUTqAckGaogJUVkTmDk+WxJcx9P+9i+6WkNO+4BstXei7uwX/pd31uT1z/2
 ZrHfppJ1uZUzF+XRG/s1LkkgAKYcf7hNvF2fjItUU6SkcvOFF+ryW9J1dfk7tzq2kmDdGx
 k+8v5zCh7CyE/gG7e5lTSQTdJ/Zs7iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-63uE5EV2P4-uZGhTWP__Ow-1; Mon, 08 Mar 2021 01:49:49 -0500
X-MC-Unique: 63uE5EV2P4-uZGhTWP__Ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2761987A831;
 Mon,  8 Mar 2021 06:49:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56193179B3;
 Mon,  8 Mar 2021 06:49:47 +0000 (UTC)
Subject: Re: SubmitAPatch wiki page has broken link to coding style
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <a59a52a2-42da-c6be-ce15-b2b661ff3499@nuviainc.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3c069ff9-7ea8-439b-0bd3-0c0b7b638800@redhat.com>
Date: Mon, 8 Mar 2021 07:49:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a59a52a2-42da-c6be-ce15-b2b661ff3499@nuviainc.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 02.55, Rebecca Cran wrote:
> In commit cbcf09872a936ccefef6a34298046d3b9aefc148 on February 25th 
> CODING_STYLE.rst was moved into the developer manual. So, the "Use the QEMU 
> coding style" section of https://wiki.qemu.org/Contribute/SubmitAPatch 
> should probably be updated to link to:
> 
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/style.rst

Thanks for the hint! I've updated it to point to:

https://qemu-project.gitlab.io/qemu/devel/style.html

  Thomas


