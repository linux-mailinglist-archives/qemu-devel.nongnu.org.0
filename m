Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8A6334696
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:21:44 +0100 (CET)
Received: from localhost ([::1]:42734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3Sp-0007Xj-G5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lK3RL-00072p-RC
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:20:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lK3RJ-0007zS-VM
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615400409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sA2mqZf+3WYQGKkltj2/s8QCuX8Oa4ycOsmtK5oSKc=;
 b=X2tTF5SgfSS7hMAkfwvINq3BcTvqxP4teCzxSyuXGJbHzeJ2K50e4N+lkIUJNVfOlCEknx
 OfvFGMFL5rQANIXSNNIIxpw0dDss548WHv/CCEqTNT6+qQWY8OYevr0t31eYQtnSZl2AVN
 6xfHFTeZ0+Q3a+ooimZn6sz7d/ZzClQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-lLa2eE7tOkeG5_7qkyqvIA-1; Wed, 10 Mar 2021 13:20:05 -0500
X-MC-Unique: lLa2eE7tOkeG5_7qkyqvIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A811005D4C;
 Wed, 10 Mar 2021 18:20:04 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 418975D6D7;
 Wed, 10 Mar 2021 18:20:00 +0000 (UTC)
Subject: Re: [PATCH 1/4] usb: remove support for -usbdevice parameters
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210310173323.1422754-2-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ed21ce06-b4ce-45c5-04a4-9d9fb56ed466@redhat.com>
Date: Wed, 10 Mar 2021 12:19:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310173323.1422754-2-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 11:33 AM, Thomas Huth wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> No device needs them anymore and in fact they're undocumented.
> Remove the code.  The only change in behavior is that "-usbdevice
> braille:hello" now reports an error, which is a bugfix.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/bus.c        | 32 +++++++-------------------------
>  hw/usb/dev-serial.c |  2 +-
>  include/hw/usb.h    |  2 +-
>  3 files changed, 9 insertions(+), 27 deletions(-)
> 

> +    if (strchr(driver, ':')) {
> +        error_report("usbdevice parameters are not supported anymore");

Although wiktionary says it is a valid word in the US, 'anymore' feels
colloquial compared to 'any more'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


