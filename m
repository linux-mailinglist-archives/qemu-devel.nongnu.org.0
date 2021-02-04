Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE13A30F815
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:36:38 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hcT-00037J-GU
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7gvM-00077R-SX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:52:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7gvL-0007rS-9P
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNvGdHDPTel76AXb5y85g56odthbxJcSUXz8brdhti0=;
 b=cp6EhIoelX1jvkf3jhGWgzJawpjlYB0Ri4F3dc/KpDUCtVswAD4I0HhekwVPTcmqU6vAJe
 GEn69L4OCIxoB0xrhpaX61Jnt4AS0U/tXPxH9gGFcnuW9OLc7Tjp6bZSn0PwxueetCfth5
 jiesOACd1X7We+hd21AllJUWa/U/gEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-LoKBGcBVNoia5iLTew12Iw-1; Thu, 04 Feb 2021 10:51:58 -0500
X-MC-Unique: LoKBGcBVNoia5iLTew12Iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA835192FDA0;
 Thu,  4 Feb 2021 15:51:57 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BDDA197FA;
 Thu,  4 Feb 2021 15:51:40 +0000 (UTC)
Subject: Re: [PATCH 4/4] hw/usb/bus: Remove the "full-path" property
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
 <20210203171832.483176-5-thuth@redhat.com>
 <20210204083648.b4tbk5kftdk4j6ez@sirius.home.kraxel.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <491c2cc6-ea07-d281-4dfc-01a81d02da77@redhat.com>
Date: Thu, 4 Feb 2021 16:51:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204083648.b4tbk5kftdk4j6ez@sirius.home.kraxel.org>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2021 09.36, Gerd Hoffmann wrote:
>    Hi,
> 
>>   enum USBDeviceFlags {
>> -    USB_DEV_FLAG_FULL_PATH,
>> +    USB_DEV_FLAG_FULL_PATH,             /* unused since QEMU v6.0 */
> 
> Why not just drop it?  Any remaining users?

I didn't want to change the values of the other members of the enum ... but 
if you prefer, I can also a "= 1" after the next member of the enum and 
remove the USB_DEV_FLAG_FULL_PATH instead.

  Thomas


