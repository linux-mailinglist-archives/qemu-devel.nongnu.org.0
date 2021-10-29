Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2AD43FB6A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 13:31:33 +0200 (CEST)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQ6e-0002X4-Ng
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 07:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ4j-000179-4B
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ4g-0004pg-3c
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635506969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itjlujWXDC/9birN7wJxOJ1mmUo0CtIFFQfpkYna+xI=;
 b=Hrdj34av7nRGIzT6bL0uT7U9wC0L9FejyBk8rTEfy1G3oX0epEP9kRm2RZzC+FSPzADxAQ
 i5nHgtyl7GXkz5SizUodSl4A+JkOqIdNYbEvZ5Oto9ahMgRl+E7p+VKUNPDkoN0yQHCzF3
 2vU/hJ0ww9GKt849BZRQd1wzw7koX/4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-nECPYvSuODOs34_qlVBtsA-1; Fri, 29 Oct 2021 07:29:28 -0400
X-MC-Unique: nECPYvSuODOs34_qlVBtsA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso3253541wrj.20
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 04:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=itjlujWXDC/9birN7wJxOJ1mmUo0CtIFFQfpkYna+xI=;
 b=hvS/4FNGPijEjlQlhotlHuudZMNQBGgIustdmjwh37jHIVuo1RQxhskoC7miU+JAec
 hYsPDCXnZ6I9bT+YM+VHlrVOlAJvbaAgz9K3JFzOftjA/io9tulBQERk8Rz+6Ew7a0wE
 Bhz7cUomr5EmCtkJimdgbjzaRv0PE3Av6qxWxa9HfmYR9rbQInV00CCuOgqasCz70qTe
 PzdWS+H3uuzxCpLzJV6+VIZDNxwpfQrP9+aY6Q4twrx2hf0lFz1T8nebB4dBRNZO4j3m
 n1TM428IjKV2U8fMT31JUgIy4feLu8eC23EI7F7FlqnmIXEvUTaDncWamXLFbNZWcfyg
 5B1g==
X-Gm-Message-State: AOAM531RqLX6151VR5blLQuJjV3qBfYCq/Y6UQRL+wfuxiYApegFpkxl
 KvyzK/jmoAemeys4vahgV0Lti5kjMfnXAQ62SVNzA4P2msGn23AoygFKSucoT4cSw/1zYqr8Tiv
 DEm6pCWZ9brJVUGg=
X-Received: by 2002:a5d:47ca:: with SMTP id o10mr13402821wrc.360.1635506967116; 
 Fri, 29 Oct 2021 04:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqV9kU/fHcrRRG2z3v6w+HB5SKJd6p1/OvP16lIbXK9lxN7txXlN2mWgbMpeYqXnm61vMgFw==
X-Received: by 2002:a5d:47ca:: with SMTP id o10mr13402804wrc.360.1635506966989; 
 Fri, 29 Oct 2021 04:29:26 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id v4sm5451413wrs.86.2021.10.29.04.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 04:29:26 -0700 (PDT)
Message-ID: <72fa847d-5144-0a7a-c9a7-221c3f27b210@redhat.com>
Date: Fri, 29 Oct 2021 13:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 11/22] qapi: introduce x-query-profile QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-12-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-12-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info profile" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx       |  2 +-
>  monitor/misc.c             | 27 ---------------------------
>  monitor/qmp-cmds.c         | 32 ++++++++++++++++++++++++++++++++
>  qapi/machine.json          | 12 ++++++++++++
>  tests/qtest/qmp-cmd-test.c |  3 +++
>  5 files changed, 48 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


