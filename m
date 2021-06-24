Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B63B29C1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:53:30 +0200 (CEST)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKAz-0007sS-VV
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwK9v-0007DQ-8X
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwK9t-00026t-Ml
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624521140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxuZ1zJm9/4VSe+qX/pDTzjLKk6aHWua0ZvcTTsy690=;
 b=W1p5ARQwKxqWF1fTBxfgzIIfQm4pLxM3EI7acX8GX7oS3sPiRC34qQQlhW6zd/FbkOmTHk
 DbyLu4fY+iL4YzFVBCg41hxouSezFEmLlj3frBdfQazYGqaZiOQbv0H7vg3Tc59wUVPpt4
 kZItbCfRQ1ZGLdvJXudAwYjhS+risZA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-flqZ9MjEMd6WPah3z2GF8w-1; Thu, 24 Jun 2021 03:52:19 -0400
X-MC-Unique: flqZ9MjEMd6WPah3z2GF8w-1
Received: by mail-wr1-f70.google.com with SMTP id
 j1-20020adfb3010000b02901232ed22e14so1890054wrd.5
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZxuZ1zJm9/4VSe+qX/pDTzjLKk6aHWua0ZvcTTsy690=;
 b=d2IEkHuN1g1zrwge63jYE+C7+C8pRWL+bu4CJ9+/2Xr27NlJbximTUDEBr6Vl6FYac
 huA667jluF6+ed6v6vGE8gYzqxtxGdikTp+7swz2SfD0FUXDpAKGKRyZvqPKOlRv1uu3
 0+IZPZzHF6m0GzE/5Bttb1J7PZhjgCUclXQH548/r223e4zliQkS3cuasTzCs4KSP6LP
 KUYYR/22DpIqYuba/s6lwzhnakqvVY1I9FH0ODbW9DBGKhGKDjB550TRCOJlir4fdK4+
 SMoILBoX8uvNtD6dHyrgEg3d7Z3VUeOz9qpJxs0tvaIFnV7qwaBk40s8SqyjMLuqRs0J
 HA+g==
X-Gm-Message-State: AOAM532+sLgyR5hEC/1xjlwa8ZyStmNk/MM3uUJ2Nna9a3hG6G8daZCy
 WpEH5iUIwWN9lKvOZX17H1Uk/rOoK5dklhw0VtCd4+I/cZ9LKi8PKC/w4iyTRTiZd/yaS9mhDW9
 yp9FHHLBX8D192EA=
X-Received: by 2002:adf:cd02:: with SMTP id w2mr2861145wrm.258.1624521138041; 
 Thu, 24 Jun 2021 00:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8QZrFlYB43cdlBP6DB5nzovvYHdEEKqZ78okYH13l5w7Lwth8tFExaoWB4IW3ON4jB9xxwg==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr2861110wrm.258.1624521137872; 
 Thu, 24 Jun 2021 00:52:17 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t9sm2183119wmq.14.2021.06.24.00.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:52:17 -0700 (PDT)
Subject: Re: [PATCH v2 03/23] qapi/misc-target: Group SEV QAPI definitions
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-4-philmd@redhat.com>
 <af319b1c-4e27-ac58-a3e6-6dac98484779@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2f178244-e1b6-7f47-9fbb-1307879b33c8@redhat.com>
Date: Thu, 24 Jun 2021 09:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <af319b1c-4e27-ac58-a3e6-6dac98484779@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 8:13 AM, Dov Murik wrote:
> Phil,
> 
> 
> On 16/06/2021 23:43, Philippe Mathieu-Daudé wrote:
>> There is already a section with various SEV commands / types,
>> so move the SEV guest attestation together.
>>
> 
> I have two questions (regarding several qapi patches in this series):
> 
> 1. Should we extract all the SEV commands/types to a separate file?
> Maybe sev.json, or confidential-guest-sev.json -- anticipating the other
> platforms.

Certainly. "confidential-guest" matches QEMU naming, and I agree
having the implementation as extension (here "-sev") will reduce
the noise on other maintainers each time this file is modified.

> 2. I see that some qapi types/commands are conditioned on
> `defined(CONFIG_...)`. For example in qapi/tpm.json we have:
> 
>   { 'command': 'query-tpm-types', 'returns': ['TpmType'],
>     'if': 'defined(CONFIG_TPM)' }
> 
> I wonder if the same applies to SEV.

This part I am not sure so I'll defer to Markus / Paolo / anyone
who knows. My understanding is QAPI is generated at some point
in the buildsys process, so only the configuration features
passed via the ninja invocation can be used (see after NINJA
in ./configure). I hope I'm wrong and buildsys/QAPI works as
you expect, but haven't tried :)

Regards,

Phil.


