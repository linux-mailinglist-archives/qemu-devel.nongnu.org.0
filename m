Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9DF36562E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:31:28 +0200 (CEST)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnfD-00029S-OE
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYncI-0000Oc-5X
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:28:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYncG-0007Mk-Fr
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618914503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0unz1fp7nmfMn5RtMUYwVvfAyj6N6AVu1fOoJqmnkaU=;
 b=RwTflyIJ4WSNF+Qn8EUG9qHzME6yzb3JzbmKQ0Lkcvjb3vJfGgb5BzkHK1HutCzb2/68SK
 yPHz+7Hm7gj9qPOLJwGLU9WPCMLeYLy9GSv2QvkX9SYf1Ic8mxeqMm7mY1pExFYAUThSMY
 6Y5X0fErOGTehAgvpgjVJfxePdE84jc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-lqNOP7EPND22izxCSwA9RA-1; Tue, 20 Apr 2021 06:28:21 -0400
X-MC-Unique: lqNOP7EPND22izxCSwA9RA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k1-20020adfd2210000b02901040d1dbcaeso10611775wrh.17
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0unz1fp7nmfMn5RtMUYwVvfAyj6N6AVu1fOoJqmnkaU=;
 b=i9/6UwTJntVZ8OMAXmSsD4ORIJd705x+hcxchIZEXW0oautm/LV3FwO+5hnIFPxwr7
 1zbSh5CNgYAqdfroyNhKxXyedbBbNkHddEHIwojbsd1Mnm+PVOfE+UVYm2O38m0X1PQ+
 hC8o+IXO30gnDdf1OWIHfnF8KWA+ZkW7Y0rXjSi6Thr4gr3/r4WxdzyFf5BQlz7TdprE
 38+1EkJwQ23fyqN9Kn9oipIsBNq+BvTG8cRdpbiBV2Xa7gZh3g+UmzTFHcPGVoOaK7yj
 dMCtvsC3erCB24PbBfO0q9jOXt1DpDaOOPQXjcf+CFmxauJEXyDi47AbbKB81F/bkHHh
 Pb+Q==
X-Gm-Message-State: AOAM5304HCOgJmYyzPIsDtn7bFf0oddpgnQirtObZ3q/tif1k1XsXJUA
 u92htRON377ODpfZoFCUHnoz7NEKgsZhW9h9KbsiZImUSPyACuCnqjbEDO3F5SVO9G997CoZL+e
 Uew1joUK/hWJtcK4=
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr3745286wmh.78.1618914500239; 
 Tue, 20 Apr 2021 03:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyk3qvYFKqVSMiLfe1IfnobqMOZPVn5Qb1FR89mXBeCDVhLAl++QIHpj3joVO/v192PNd/kg==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr3745278wmh.78.1618914500132; 
 Tue, 20 Apr 2021 03:28:20 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i9sm2836140wmg.2.2021.04.20.03.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:28:19 -0700 (PDT)
Subject: Re: [PATCH v5 11/14] qmp: Include "share" property of memory backends
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-12-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c97f5a79-a6a8-dfe4-70af-479956b17d38@redhat.com>
Date: Tue, 20 Apr 2021 12:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-12-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> Let's include the property, which can be helpful when debugging,
> for example, to spot misuse of MAP_PRIVATE which can result in some ugly
> corner cases (e.g., double-memory consumption on shmem).
> 
> Use the same description we also use for describing the property.
> 
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/machine-qmp-cmds.c | 1 +
>  qapi/machine.json          | 3 +++
>  2 files changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


