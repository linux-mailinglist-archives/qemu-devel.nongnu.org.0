Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9925235F951
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:58:34 +0200 (CEST)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiqX-0007UR-P4
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWioN-0006UN-05
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWioH-0005Cs-U4
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618419372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lcmI0ujzF8xPhBv4MlnsELadC27AQvaz59G8ke+O4o=;
 b=hDSAFp80ktQPEFdVWkALQVVlpjfHbOlXJWpfxjcVOatZ8CQ6EV9L0K9Vw3QZpb6xmnuJzc
 U19d2i4gdilfi/qDgHuui1pI9rTHci1lMkgnTL/OW0ZSN36G8rB8nnPKlZMSvf5wPz9JZt
 wkS/RbEmE1ZE4tPe+YAIL2rSQjpse/Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-y_F4MHw7NymGAakw_0qcQQ-1; Wed, 14 Apr 2021 12:56:08 -0400
X-MC-Unique: y_F4MHw7NymGAakw_0qcQQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 f26-20020a056402069ab02903788b40ed89so3668371edy.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 09:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5lcmI0ujzF8xPhBv4MlnsELadC27AQvaz59G8ke+O4o=;
 b=KCG9fGUb4NOnyho4kmDd1bpmUJgb7hhyWgsv7ZVKzhyq3+yc3mZHNZI0lzYqSqujqj
 epHoiwL/8hjKvd1/VpWyZPg8/glGwBQbSCmDyqdVt2OEe+lBkVy1UdE+Euf/VISKSlnh
 BK/G/gBOXhv+AllLC+dhUL8LnKWNofMqTzZF25bDBLf0T1uJsmnxED4PKbMzvztX+esr
 RszRvQLYWGlJQFCGOmk4TdlRI0zt6F9gF6IQ/0SKsAllrsQpeJ+/381xyWwqeZsD7Hm9
 cmaxT22UkWcm+y5urPg5nTLAJKEK79ta/Ani5HJAmcprQKFhhQbDbHzkCkIQoYl44Yvz
 +LjA==
X-Gm-Message-State: AOAM530yYZCv6kh5fBrJ1nscQFiGtYzZT/UzmuUb51kxDaKkKPn7VDpo
 3mLWUDnsjS/bLe6XOtJLXgODFO0dqxID1J/Q3Chz7OAGJi7XX91otCcGTXRcF5mr8mET/CQ/qZb
 894lSSyvhLVhJfiU=
X-Received: by 2002:a17:906:36ce:: with SMTP id
 b14mr34602429ejc.395.1618419367602; 
 Wed, 14 Apr 2021 09:56:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpbVc7ovNoiRFIipjxr51x7BdNAeLLAQtE2v4OZjogH608Gchsg6wcHlH3+NAZNjm8j5xupQ==
X-Received: by 2002:a17:906:36ce:: with SMTP id
 b14mr34602419ejc.395.1618419367434; 
 Wed, 14 Apr 2021 09:56:07 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m10sm56166ejc.32.2021.04.14.09.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 09:56:06 -0700 (PDT)
Subject: Re: [PATCH for-6.1 1/4] include/sysemu: Poison all accelerator CONFIG
 switches in common code
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac1332dd-8e89-0747-82e8-bf916d8f2119@redhat.com>
Date: Wed, 14 Apr 2021 18:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414112004.943383-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 1:20 PM, Thomas Huth wrote:
> We are already poisoning CONFIG_KVM since this switch is not working
> in common code. Do the same with the other accelerator switches, too
> (except for CONFIG_TCG, which is special, since it is also defined in
> config-host.h).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/exec/poison.h | 4 ++++
>  include/sysemu/hax.h  | 4 ++++
>  include/sysemu/hvf.h  | 4 ++++
>  include/sysemu/whpx.h | 4 ++++
>  4 files changed, 16 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


