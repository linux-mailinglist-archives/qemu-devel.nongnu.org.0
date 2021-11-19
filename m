Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A73456CAB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:44:50 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Rt-0002U9-Dr
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:44:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo0Pq-00016R-UN
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:42:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo0Po-0001wX-1u
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637314952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1nupPy3Q9awN3Nf95xMmE1kZgdSFuniXJnNYzu5jss=;
 b=jUonDHB/cchnRz1Pou3m/82YFTj94KD+aCMHZIltyQ+WEzhdWN7VYOu4fdiFAiPj1y3yDb
 P0ZSOUgSxdcVtKsDD5MeCsJWPWqyQSc8/FHvdm//Pt8nUQ5cLAbfIQAlNKz1aGIg7ZlBnx
 tl0S041+S1y1UdXDYS83Zd4DDUfCejk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-DXQ3RuLnP-aCepjKzpcLXA-1; Fri, 19 Nov 2021 04:42:31 -0500
X-MC-Unique: DXQ3RuLnP-aCepjKzpcLXA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so4477585wmr.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p1nupPy3Q9awN3Nf95xMmE1kZgdSFuniXJnNYzu5jss=;
 b=p1VLFZkbpuDYNGN8WmjL1Xi9fcVwvicL1qUwBlp4FXTGXFYhEC2HCONa97hbrxI9Vo
 vIHRoo2vtq91THo8hwRGjkdjJd/fu/ii/4fdo9U+LTtJeQV4yezK2n9uIz1KtDHY2Zk8
 bExcOgVM9LUNbdB+EmN4wLNdK07G0amE71lbhEEr5CTmmB99oNqomc+ECfvpx08S6kaF
 e60sRePIRSuKVaMlxiVCHLPKrioSGarZvSGdssawttC9LlOc9fe8Gv+SvVjoEA/UlQXC
 n4qcJXnHzvMc6m2mFszuSIIKy/USYvA4C+4dE2K7R1lF2bn4nnuWCRqeHFg7yvJhRPNu
 j5iw==
X-Gm-Message-State: AOAM530LlTW1/GaBFjTwkgRd3RvzgUzhF8OjrbeozVnwk2yVGJBsfiAN
 D6bXvZWTZlE3GAlCbN/GddjAWm1bm1CeE8Lb03if3ku9xfYXKWoi3luBNYu0J9Soc6f/7G45TYv
 3sIeFFesny+1wSHw=
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr5585277wrz.282.1637314949838; 
 Fri, 19 Nov 2021 01:42:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTaO4s1KsVv/8MhR8UbRsyxnG7AjEgIz8ZmKxFD5Bp0llh5R6+P3GXY5uOIbuKD6Nu52RHIw==
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr5585245wrz.282.1637314949630; 
 Fri, 19 Nov 2021 01:42:29 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j40sm13634414wms.19.2021.11.19.01.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:42:29 -0800 (PST)
Message-ID: <bc8d523b-ef33-c0fd-d6d2-13a047acda3f@redhat.com>
Date: Fri, 19 Nov 2021 10:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 2/2] hw/display: Do not allow multiple identical
 VGA devices
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
 <20211118192020.61245-3-philmd@redhat.com>
 <b6034e95-2bc7-e720-7b03-4e3a48118226@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <b6034e95-2bc7-e720-7b03-4e3a48118226@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 10:20, Paolo Bonzini wrote:
> On 11/18/21 20:20, Philippe Mathieu-Daudé wrote:
>> +    if (obj) {
>> +        const char *typename = object_get_typename(obj);
>> +
>> +        /*
>> +         * make sure this device is not being added twice,
>> +         * if so exit without crashing qemu
>> +         */
>> +        if (object_resolve_path_type("", typename, NULL)) {
>> +            error_setg(errp, "at most one %s device is permitted",
>> typename);
>> +            return false;
>> +        }
>> +    }
>> +
> 
> Wouldn't it give the same error with one ISA and one PCI VGA?

In that case I'd expect the object path to be different...

Anyhow, the fix from commit 7852a77f598 doesn't seem to work well:

$ qemu-system-x86_64 -M q35 -nodefaults -device isa-vga
qemu-system-x86_64: -device isa-vga: at most one isa-vga device is permitted


