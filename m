Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA873AE522
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:42:56 +0200 (CEST)
Received: from localhost ([::1]:36084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFWB-0003br-Bv
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvFV1-0002tE-Dn
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:41:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvFUz-0007jw-Rd
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624264900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UANw92/opipbzsHWoDwuWTr4o1UmtgSGZleYDe11mSI=;
 b=Gpkb+6+vGxaQfzuf8YEXvPXBertb5+6tNM07h6PVNVyF8WWxoNLTO8wW9HV1SjbRAqL45q
 5k28CcQTnrD9fI+YnPhBohnUTbH8oGm6wNVINAx2NglBxFaMVt8tmMG2apu/Hi6kdiSn9j
 B0BPv3Yl5w2dMYQa+niZWtjbvA5A0NE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-I-GtKgE6OfieB5lYT1KP2w-1; Mon, 21 Jun 2021 04:41:36 -0400
X-MC-Unique: I-GtKgE6OfieB5lYT1KP2w-1
Received: by mail-wm1-f72.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so6739557wmq.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UANw92/opipbzsHWoDwuWTr4o1UmtgSGZleYDe11mSI=;
 b=oTCROK5R4/AdHrId6ArtF0TuBVD6Iw1kKs8+Cm6fQyTONVNxbRai/m1CmZ5Bu27uQF
 pn5qkAP1Faf9UMVpVYTAqCoL+vCCDTVfye1guVCUMHkYWowAwGlRroQ6RizlpWuhlpaJ
 UZQUH1NcOvI1KON4seTnCmBQGfwqkXPRHAw1JI8pgAu2JIO73AZTJ3JNGYKm1/FlsttJ
 h4KcQA79KeMRYpxfnTaYlPg9JcGOpZq+HnAGVjtVNTn+uGr/lZSeTBS6i6vLrdgfJM+u
 5ZCUDJ1ZIhIAFikpfOBL5LaW2vOIl5U63HhLUte4eCi6xnPb+aIv+kYtQx43qJr5fxW5
 1WwQ==
X-Gm-Message-State: AOAM530+v6QPDWstwWTz961gwAq1X5CisTg01BDhSTspCmIf6/svX72D
 jm/pAleWHHBjJufbEp11dmliEF8774EMubmsL+wHADhLzDzs6TD5igBSuLGGPmdzDZHqkpcsGZ8
 bgQENtNDDf19987M=
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr26837641wrq.187.1624264895846; 
 Mon, 21 Jun 2021 01:41:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrckeWVWVWUSW4kZ2at40hG1pPrQ1uJVYXTKPu+bkgme11peHYKG8Jldlmamu+qnCUYAN+6A==
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr26837612wrq.187.1624264895679; 
 Mon, 21 Jun 2021 01:41:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v22sm8699131wmh.40.2021.06.21.01.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:41:35 -0700 (PDT)
Subject: Re: [PATCH v2 19/23] hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-20-philmd@redhat.com>
 <20210618133720.459491bd@redhat.com>
 <a9e25c7f-2cff-229f-49ab-3f18b9cb1e1f@redhat.com>
 <20210619172924-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ee4bfff-ad92-fb77-beca-9d2152a3659c@redhat.com>
Date: Mon, 21 Jun 2021 10:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619172924-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 11:32 PM, Michael S. Tsirkin wrote:
> On Sat, Jun 19, 2021 at 10:45:17AM +0200, Philippe Mathieu-Daudé wrote:
>> On 6/18/21 1:37 PM, Igor Mammedov wrote:
>>> On Wed, 16 Jun 2021 22:43:24 +0200
>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>>> pc_madt_cpu_entry() is specific to QEMU 'PC' machines,
>>>> move it to acpi-pc.c.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  hw/i386/acpi-common.c | 40 ----------------------------------------
>>>>  hw/i386/acpi-pc.c     | 39 +++++++++++++++++++++++++++++++++++++++
>>>
>>> it's used not only by PC machines but also microvm,
>>> which didn't use acpi-build.c (aka acpi-pc.c)
>>> it only links fine by virtue that PC machines
>>> are object files are also included.
>>
>> Is that something new? I can't see this in mainstream,
>> the microvm machine builds fine without this code.
> 
> I think Igor means this:
> 
> hw/i386/generic_event_device_x86.c:    adevc->madt_cpu = pc_madt_cpu_entry;
> 
> and
> 
> hw/i386/microvm.c:        DeviceState *dev = qdev_new(TYPE_ACPI_GED_X86);

Oh I missed that, indeed I didn't runtime test.

Thanks Michael.

> Admittedly given it's not limited to pc the function name is wrong ...
> 


