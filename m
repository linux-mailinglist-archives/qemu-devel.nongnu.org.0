Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4127433E97D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:05:24 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPJ5-0006PI-3F
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMPIC-0005zN-Qo
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMPI9-0003VD-KA
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615961064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+EoSoZZDFaIxTq+v2vidBZ/l5zobc0nvz3xgR1jnHk=;
 b=UIp/x+/NMyvUawDhZi7f9TMekGNda9ApIQzSN5lnTpiDshNw8ocBU7Ujr0yCQ77AIobCAo
 CQOsQww6cw+01pU8gFc28tiDFr3Fq92L17RcZt5mcyHuyZ/2gU/DuLKPFczpR5EEUTZJM7
 TnrxDl/0d44CiRSJNzbQCjeim72osds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-6guhK2lhOLytocqxqZzxng-1; Wed, 17 Mar 2021 02:04:22 -0400
X-MC-Unique: 6guhK2lhOLytocqxqZzxng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B3118C89E6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:04:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCF0D5D9D3;
 Wed, 17 Mar 2021 06:04:13 +0000 (UTC)
Subject: Re: [PATCH 5/4] usb: Remove "-usbdevice ccid"
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210311092829.1479051-1-thuth@redhat.com>
Message-ID: <eee1a77f-d44a-d6f9-d706-6c8484a0a45f@redhat.com>
Date: Wed, 17 Mar 2021 07:04:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311092829.1479051-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/2021 10.28, Thomas Huth wrote:
> "-usbdevice ccid" was not documented and -usbdevice itself was marked
> as deprecated before QEMU v6.0. And searching for "-usbdevice ccid"
> in the internet does not show any useful results, so likely nobody
> was using the ccid device via the -usbdevice option. Remove it now.

Any comments on this one? Shall we keep it? Or shall we remove it?

  Thomas


> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/system/removed-features.rst | 6 ++++++
>   hw/usb/dev-smartcard-reader.c    | 1 -
>   qemu-options.hx                  | 3 ---
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index ea28904e5f..335d8a5f2f 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -45,6 +45,12 @@ This option lacked the possibility to specify an audio backend device.
>   Use ``-device usb-audio`` now instead (and specify a corresponding USB
>   host controller or ``-usb`` if necessary).
>   
> +``-usbdevice ccid`` (removed in 6.0)
> +'''''''''''''''''''''''''''''''''''''
> +
> +This option was undocumented and not used in the field.
> +Use `-device usb-ccid`` instead.
> +
>   
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
> diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
> index 80109fa551..bc3d94092a 100644
> --- a/hw/usb/dev-smartcard-reader.c
> +++ b/hw/usb/dev-smartcard-reader.c
> @@ -1492,7 +1492,6 @@ static void ccid_register_types(void)
>       type_register_static(&ccid_bus_info);
>       type_register_static(&ccid_card_type_info);
>       type_register_static(&ccid_info);
> -    usb_legacy_register(TYPE_USB_CCID_DEV, "ccid", NULL);
>   }
>   
>   type_init(ccid_register_types)
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fdecee758a..8f4ede1e11 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1743,9 +1743,6 @@ SRST
>           corresponding ``braille`` chardev automatically beside the
>           ``usb-braille`` USB device).
>   
> -    ``ccid``
> -        Smartcard reader device
> -
>       ``keyboard``
>           Standard USB keyboard. Will override the PS/2 keyboard (if present).
>   
> 


