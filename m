Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D39253CD1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 06:43:38 +0200 (CEST)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB9lB-0001A4-V1
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 00:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kB9kK-0000dY-Jn
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 00:42:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21521
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kB9kI-0002rV-Tc
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 00:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598503361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mWqTRXdd/EAgzq0XIjS7Jj9FfIZBAxlx6NHJGSSato=;
 b=DfzKbDnBCnTehMuIpEEHWonkGHR7kZ5oI614GIrjkNNg1OOqokZ9rjFSRw2BwIxi8s1QF/
 bRKnTfgfFz6ojE3DvL4miC5cumv0Ff1KtxDrdkBi1w2RiXLFgeLo4Buuhs8sJ5gncLEQee
 mtAWdQXoCHG0GamvzvfibcHmitQ7GTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-FcBd72tpPTKXlFjeKlbKIw-1; Thu, 27 Aug 2020 00:42:39 -0400
X-MC-Unique: FcBd72tpPTKXlFjeKlbKIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBE2D8015C5;
 Thu, 27 Aug 2020 04:42:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 210B05D9E8;
 Thu, 27 Aug 2020 04:42:33 +0000 (UTC)
Subject: Re: [PATCH 4/8] sclpconsole: Use TYPE_* constants
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200826184334.4120620-1-ehabkost@redhat.com>
 <20200826184334.4120620-5-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0e627a97-f362-65fb-0683-2a8ff279092b@redhat.com>
Date: Thu, 27 Aug 2020 06:42:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200826184334.4120620-5-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:42:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.239, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2020 20.43, Eduardo Habkost wrote:
> This will make future conversion to use OBJECT_DECLARE* easier.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/char/sclpconsole-lm.c | 2 +-
>  hw/char/sclpconsole.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
> index 2b5f37b6a2..5848b4e9c5 100644
> --- a/hw/char/sclpconsole-lm.c
> +++ b/hw/char/sclpconsole-lm.c
> @@ -355,7 +355,7 @@ static void console_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo sclp_console_info = {
> -    .name          = "sclplmconsole",
> +    .name          = TYPE_SCLPLM_CONSOLE,
>      .parent        = TYPE_SCLP_EVENT,
>      .instance_size = sizeof(SCLPConsoleLM),
>      .class_init    = console_class_init,
> diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
> index 5c7664905e..d6f7da0818 100644
> --- a/hw/char/sclpconsole.c
> +++ b/hw/char/sclpconsole.c
> @@ -271,7 +271,7 @@ static void console_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo sclp_console_info = {
> -    .name          = "sclpconsole",
> +    .name          = TYPE_SCLP_CONSOLE,
>      .parent        = TYPE_SCLP_EVENT,
>      .instance_size = sizeof(SCLPConsole),
>      .class_init    = console_class_init,
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


